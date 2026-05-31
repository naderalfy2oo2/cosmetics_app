import 'package:dio/dio.dart';

class forgetPasswordApi {
  static final Dio dio = Dio(
    BaseOptions(
      baseUrl: 'https://cosmatics.growfet.com',
      headers: {'Content-Type': 'application/json'},
    ),
  );

  static Future<Map<String, dynamic>?> forgetPassword({
    required String countryCode,
    required dynamic phoneNumber,
  }) async {
    try {
      final response = await dio.post(
        '/api/Auth/forgot-password',
        data: {"countryCode": countryCode, "phoneNumber": phoneNumber},
      );

      if (response.statusCode == 200) {
        print(response.data);
        return response.data;
      }
    } catch (e) {
      return null;
    }
    return null;
  }
}
