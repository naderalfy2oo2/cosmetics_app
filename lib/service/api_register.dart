import 'package:dio/dio.dart';

class RegisterApi {
  static final Dio dio = Dio(
    BaseOptions(
      baseUrl: 'http://www.cosmatics.growfet.com',
      headers: {'Content-Type': 'application/json'},
    ),
  );

  static Future<bool> register({
    required String name,
    required String countryCode,
    required String phone,
    required String password,
  }) async {
    try {
      final response = await dio.post(
        '/api/Auth/register',
        data: {
          "name": name,
          "countryCode": countryCode,
          "phoneNumber": phone,
          "password": password,
        },
      );

      return response.statusCode == 200;
    } catch (e) {
      return false;
    }
  }
}
