// import 'package:dio/dio.dart';

// class DioHelper {
//   static late Dio dio;

//   static void init() {
//     dio = Dio(
//       BaseOptions(
//         baseUrl: 'https://cosmatics.growfet.com/api/Sliders',

//         receiveDataWhenStatusError: true,
//         headers: {'Content_type': "application/json", 'lang': 'ar'},
//       ),
//     );
//   }

//   static Future getData({
//     required String url,
//     Map<String, dynamic>? query,
//   }) async {
//     return await dio.get(url, queryParameters: query);
//   }

//    static void setToken(String token) {
//     dio.options.headers['Authorization'] = token;
//   }

//    static Future postData(String s, {
//     required String url,
//     required Map<String, dynamic> data, required query,
//   }) async {
//     return await dio.post(url, data: data);
//   }

//    static Future putData({
//     required String url,
//     required Map<String, dynamic> data,
//   }) async {
//     return await dio.put(url, data: data);
//   }

//    static Future deleteData({
//     required String url,
//   }) async {
//     return await dio.delete(url);
//   }
// }

//???????

// import 'package:dio/dio.dart';

// class DioHelper {
//   static late Dio dio;

//   static void init() {
//     dio = Dio(
//       BaseOptions(
//         baseUrl: 'https://cosmatics.growfet.com/api',

//         receiveDataWhenStatusError: true,

//         headers: {'Content-Type': 'application/json', 'lang': 'ar'},
//       ),
//     );
//   }

//   static Future getData({
//     required String url,
//     Map<String, dynamic>? query,
//   }) async {
//     return await dio.get(url, queryParameters: query);
//   }

//   static void setToken(String token) {
//     dio.options.headers['Authorization'] = 'Bearer $token';
//   }

//   static Future postData({
//     required String url,
//     required Map<String, dynamic> data,
//   }) async {
//     return await dio.post(url, data: data);
//   }

//   static Future putData({
//     required String url,
//     required Map<String, dynamic> data,
//   }) async {
//     return await dio.put(url, data: data);
//   }

//   static Future deleteData({required String url}) async {
//     return await dio.delete(url);
//   }
// }
//????

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
