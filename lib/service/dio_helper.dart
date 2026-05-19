import 'dart:developer';
import 'package:dio/dio.dart';

class DioHelper {
  static final Dio dio = Dio(
    BaseOptions(
      baseUrl: "https://cosmatics.growfet.com",
      headers: {
        "accept": "application/json",
        "Content-Type": "application/json",
      },
    ),
  );

  static String token = "";

  static void setToken(String t) {
    token = t;

    dio.options.headers["Authorization"] = "Bearer $token";
  }

  // GET
  static Future<CustomResponse> getData({required String url}) async {
    try {
      final res = await dio.get(url);

      return CustomResponse(true, data: res.data);
    } catch (e) {
      log(e.toString());

      return CustomResponse(false);
    }
  }

  // POST
  static Future<CustomResponse> postData({
    required String url,
    required Map<String, dynamic> data,
  }) async {
    try {
      final res = await dio.post(url, queryParameters: data);

      return CustomResponse(true, data: res.data);
    } catch (e) {
      log(e.toString());

      return CustomResponse(false);
    }
  }

  // PUT
  static Future<CustomResponse> putData({
    required String url,
    required Map<String, dynamic> data,
  }) async {
    try {
      final res = await dio.put(url, queryParameters: data);

      return CustomResponse(true, data: res.data);
    } catch (e) {
      log(e.toString());

      return CustomResponse(false);
    }
  }

  // DELETE
  static Future<CustomResponse> deleteData({required String url}) async {
    try {
      final res = await dio.delete(url);

      return CustomResponse(true, data: res.data);
    } catch (e) {
      return CustomResponse(false);
    }
  }
}

class CustomResponse {
  bool isSuccess;

  dynamic data;

  CustomResponse(this.isSuccess, {this.data});
}
