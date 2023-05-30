import 'dart:async';

import 'package:dio/dio.dart';
import 'package:get/get.dart' hide Response;
import 'package:veggytably_driver/utils/text_format.dart';

import '../api/transaction_api.dart';
import '../models/transaction_model.dart';

class OrderController extends GetxController {
  static OrderController to = Get.find();

  Transaction? receivedOrder;
  RxBool isLoading = false.obs;
  RxBool isListening = true.obs;
  RxBool isAccepted = false.obs;
  RxBool stopTimer = false.obs;
  RxString status = ''.obs;

  Timer? timer;
  final RxInt _seconds = 0.obs;
  int get seconds => _seconds.value;
  String get minutes => TextFormatter.secondsToMinutes(_seconds.value);

  Future<void> receiveOrder(Transaction transaction) async {
    try {
      isListening(false);
      setOrder(transaction);

      await countDown(30 * 60);

      isListening(true);
    } catch (e) {
      print(e);
      isListening(true);
    } finally {
      update();
    }
  }

  Future<void> countDown(int time) {
    Completer completer = Completer();

    _seconds.value = time;

    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      _seconds.value = time - timer.tick;

      if (stopTimer.value || timer.tick == time + 1) {
        stopCountDown();
        rejectOrder();
        stopTimer.value = false;

        completer.complete();
      }
    });

    return completer.future;
  }

  void stopCountDown() {
    timer?.cancel();
    _seconds.value = 0;
  }

  void setOrder(Transaction transaction) {
    receivedOrder = transaction;
    update();
  }

  void clearOrder() {
    receivedOrder = null;
  }

  Future<void> acceptOrder() async {
    // send to server
    try {
      isLoading(true);
      update();
      Response response = await TransactionApi.instance
          .acceptOrder(receivedOrder!.transactionId);

      if (response.statusCode != 200) {
        throw Exception("Failed to accept order");
      }

      isAccepted(true);
    } catch (e) {
      print(e);
    } finally {
      isLoading(false);
      update();
    }
  }

  Future<void> updateTransactionStatus(String status) async {
    try {
      isLoading(true);
      update();

      if (status != "RECEIVED" &&
          status != "PROCESSING" &&
          status != "ON_DELIVERY" &&
          status != "FINISHED") {
        throw Exception("Invalid status input");
      }
      Response response = await TransactionApi.instance
          .updateTransactionStatus(receivedOrder!.transactionId, status);

      if (response.statusCode != 200) {
        throw Exception("Failed to update transaction status");
      }
    } catch (e) {
      print(e);
      Get.snackbar("Failed to update transaction status", e.toString());
    } finally {
      isLoading(false);
      update();
    }
  }

  void rejectOrder() {
    stopTimer.value = true;
    clearOrder();
    // send to server
    // receivedOrder.value = null;
  }

  void deliverOrder() {
    status.value = "ON_DELIVERY";
    updateTransactionStatus("ON_DELIVERY");
  }

  void finishOrder() {
    status.value = "FINISHED";
    updateTransactionStatus("FINISHED");
    Get.snackbar("Order finished", "You have finished the order!");
    clearOrder();
  }
}
