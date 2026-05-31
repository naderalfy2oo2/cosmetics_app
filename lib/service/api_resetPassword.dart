import 'package:dio/dio.dart';

class resetPasswordApi {
  static final Dio dio = Dio(
    BaseOptions(
      baseUrl: "https://cosmatics.growfet.com",
      headers: {
        "accept": "application/json",
        "Content-Type": "application/json",
      },
    ),
  );

  static Future<bool> resetPassword({
    required String countryCode,
    required String phoneNumber,
    required String newPassword,
    required String confirmPassword,
  }) async {
    try {
      print({
        "countryCode": countryCode,
        "phoneNumber": phoneNumber,
        "newPassword": newPassword,
        "confirmPassword": confirmPassword,
      });

      final response = await dio.post(
        "/api/Auth/reset-password",
        data: {
          "countryCode": countryCode,
          "phoneNumber": phoneNumber,
          "newPassword": newPassword,
          "confirmPassword": confirmPassword,
        },
      );

      print("STATUS => ${response.statusCode}");
      print("DATA => ${response.data}");

      return response.statusCode == 200 || response.statusCode == 201;
    } on DioException catch (e) {
      print("TYPE => ${e.type}");
      print("MESSAGE => ${e.message}");
      print("STATUS => ${e.response?.statusCode}");
      print("DATA => ${e.response?.data}");

      return false;
    }
  }
}
