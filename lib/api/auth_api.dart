import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../utils/api.endpoints.dart';

class AuthApi {
  static final AuthApi instance = AuthApi();
  final _storage = const FlutterSecureStorage();

  Future<dynamic> postSignUp(Map<String, String> body) async {
    try {
      Response response = await Dio().post(
        ApiEndPoints.baseUrl + ApiEndPoints.authEndpoints.signUp,
        data: body,
      );

      return response;
    } on DioError catch (e) {
      return e.response;
    } catch (e) {
      print(e);
      return e;
    }
  }

  Future<dynamic> postLogin(Map<String, String> body) async {
    try {
      Response response = await Dio().post(
        ApiEndPoints.baseUrl + ApiEndPoints.authEndpoints.login,
        data: body,
      );

      return response;
    } on DioError catch (e) {
      return e.response;
    } catch (e) {
      print(e);
      return e;
    }
  }

  Future<dynamic> postLogout(Map<String, String> headers) async {
    try {
      Response response = await Dio().post(
        ApiEndPoints.baseUrl + ApiEndPoints.authEndpoints.logout,
        options: Options(
          headers: headers,
        ),
      );

      return response;
    } on DioError catch (e) {
      return e.response;
    } catch (e) {
      print(e);
      return e;
    }
  }
}
