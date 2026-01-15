import 'package:dio/dio.dart';

class LoginApi {
  static final Dio dio = Dio(
    BaseOptions(
      baseUrl: 'http://www.cosmatics.growfet.com',
      headers: {'Content-Type': 'application/json'},
    ),
  );

  static Future<Map<String, dynamic>?> login({
    required String countryCode,
    required String phoneNumber,
    required String password,
  }) async {
    try {
      final response = await dio.post(
        '/api/Auth/login',
        data: {
          "countryCode": countryCode,
          "phoneNumber": phoneNumber,
          "password": password,
        },
      );

      if (response.statusCode == 200) {
        return response.data;
      }
    } catch (e) {
      print('Login Error: $e');
    }
    return null;
  }
}
