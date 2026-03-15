// import 'package:dio/dio.dart';

// class LoginApi {
//   static final Dio dio = Dio(
//     BaseOptions(
//       baseUrl: 'http://www.cosmatics.growfet.com',
//       headers: {'Content-Type': 'application/json'},
//     ),
//   );

//   static Future<Map<String, dynamic>?> login({
//     required String countryCode,
//     required String phoneNumber,
//     required String password,
//   }) async {
//     try {
//       final response = await dio.post(
//         '/api/Auth/login',
//         data: {
//           "countryCode": countryCode,
//           "phoneNumber": phoneNumber,
//           "password": password,
//         },
//       );

//       if (response.statusCode == 200) {
//         return response.data;
//       }
//     } on DioException catch (e) {
//       return null;
//     }
//     return null;
//   }
// }

import 'package:dio/dio.dart';

class LoginApi {
  static final Dio dio = Dio(
    BaseOptions(
      baseUrl: 'http://www.cosmatics.growfet.com',
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    ),
  );

  static Future<Map<String, dynamic>?> login({
    required String countryCode,
    required String phoneNumber,
    required String password,
  }) async {
    print('🔥 LOGIN API CALLED'); // للتأكد ان الكود بيتنفذ

    try {
      final response = await dio.post(
        '/api/Auth/login',
        data: {
          "countryCode": countryCode,
          "phoneNumber": phoneNumber,
          "password": password.trim(),
        },
        options: Options(
          validateStatus: (status) => true, // يقبل أي status
        ),
      );

      print('STATUS: ${response.statusCode}');
      print('DATA: ${response.data}');

      if (response.statusCode == 200) {
        return response.data;
      } else {
        return null; // تقدر هنا تطبّع رسالة الخطأ لو عايز
      }
    } on DioException catch (e) {
      print('DIO ERROR STATUS: ${e.response?.statusCode}');
      print('DIO ERROR DATA: ${e.response?.data}');
      return null;
    }
  }
}
