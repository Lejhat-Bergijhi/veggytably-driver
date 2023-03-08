import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

import '../utils/api.endpoints.dart';

class DriverApi {
  static final DriverApi instance = DriverApi();
  final _storage = const FlutterSecureStorage();

  Future<dynamic> uploadImageFile(filePath) async {
    String? refreshToken = await _storage.read(key: "refreshToken");

    if (refreshToken == null) {
      throw Exception("Refresh token is null");
    }

    try {
      FormData formData = FormData.fromMap(
          {"profile-picture": await MultipartFile.fromFile(filePath)});

      Response response = await Dio()
          .put(ApiEndPoints.baseUrl + ApiEndPoints.authEndpoints.uploadImage,
              data: formData,
              options: Options(
                headers: <String, String>{
                  "authorization": "Bearer $refreshToken",
                },
                responseType: ResponseType.bytes,
              ));

      print("response");

      return response;
    } on DioError catch (e) {
      return e.response;
    } catch (e) {
      print(e);
    }
  }
}
