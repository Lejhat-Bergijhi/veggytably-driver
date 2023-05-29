import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../utils/api.endpoints.dart';

class TransactionApi {
  static final TransactionApi instance = TransactionApi();
  final _storage = const FlutterSecureStorage();

  Future<dynamic> acceptOrder(String transactionId) async {
    String? refreshToken = await _storage.read(key: "refreshToken");

    if (refreshToken == null) {
      throw Exception("Refresh token is null");
    }

    try {
      Response response = await Dio().put(
          ApiEndPoints.baseUrl +
              ApiEndPoints.transactionEndPoints.acceptOrder(transactionId),
          options: Options(headers: <String, String>{
            "authorization": "Bearer $refreshToken",
          }));
      return response;
    } on DioError catch (e) {
      return e.response;
    } catch (e) {
      print(e);
    }
  }
}
