import 'dart:async';

import 'package:get/get.dart';
import 'package:veggytably_driver/utils/text_format.dart';

import '../models/transaction_model.dart';

class OrderController extends GetxController {
  static OrderController to = Get.find();

  Transaction? receivedOrder;
  RxBool isListening = true.obs;
  RxBool isAccepted = false.obs;
  RxBool rejected = false.obs;

  Timer? timer;
  final RxInt _seconds = 0.obs;
  int get seconds => _seconds.value;
  String get minutes => TextFormatter.secondsToMinutes(_seconds.value);

  Future<void> receiveOrder(Transaction transaction) async {
    try {
      isListening(false);
      setOrder(transaction);

      //  display order for 30 seconds then automatically decline
      // int counter = 30;
      // _seconds.value = counter;

      // timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      //   _seconds.value = counter - timer.tick;

      //   if (rejected.value) {
      //     stopCountDown();
      //     rejectOrder();
      //     rejected.value = false;
      //   }

      //   if (timer.tick == counter) {
      //     stopCountDown();
      //     rejectOrder();
      //   }
      // });

      // await Future.delayed(const Duration(seconds: 30));
      await countDown(30);

      isListening(true);
    } catch (e) {
      print(e);
      isListening(true);
    } finally {
      clearOrder();
      update();
    }
  }

  Future<void> countDown(int time) {
    Completer completer = Completer();

    _seconds.value = time;

    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      _seconds.value = time - timer.tick;

      if (rejected.value || timer.tick == time + 1) {
        stopCountDown();
        rejectOrder();
        rejected.value = false;

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

  void acceptOrder() {
    // send to server
    // receivedOrder.value = null;
  }

  void rejectOrder() {
    rejected.value = true;
    // send to server
    // receivedOrder.value = null;
  }

  void deliverOrder() {
    // send to server
    // receivedOrder.value = null;
  }
}
