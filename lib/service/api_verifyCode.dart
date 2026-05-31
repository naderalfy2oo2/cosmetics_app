import 'package:dio/dio.dart';

class verifyApi {
  static final Dio dio = Dio(
    BaseOptions(
      baseUrl: 'https://cosmatics.growfet.com',
      headers: {'Content-Type': 'application/json'},
    ),
  );

  static Future<Map<String, dynamic>?> verify({
    required String otpCode,
    required String countryCode,
    required dynamic phoneNumber,
  }) async {
    try {
      final response = await dio.post(
        '/api/Auth/verify-otp',
        data: {
          "countryCode": countryCode,

          "phoneNumber": phoneNumber,
          "otpCode": otpCode,
        },
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
