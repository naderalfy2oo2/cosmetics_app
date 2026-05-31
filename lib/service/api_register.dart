// import 'package:dio/dio.dart';

// class SigninApi {
//   static final Dio dio = Dio(
//     BaseOptions(
//       baseUrl: 'https://cosmatics.growfet.com',
//       headers: {'Content-Type': 'application/json'},
//     ),
//   );

//   static Future<Map<String, dynamic>?> login({
//     required String password,
//     required String email,
//     required String firstName,
//     required String lastname,
//   }) async {
//     try {
//       final response = await dio.post(
//         '/api/Auth/register',
//         data: {
//           "first name": firstName,
//           "last name": lastname,
//           "email": email,
//           "password": password,
//         },
//       );

//       print("STATUS => ${response.statusCode}");
//       print("DATA => ${response.data}");

//       if (response.statusCode == 200) {
//         return response.data;
//       }
//     } catch (e) {
//       print('Login Error: $e');
//     }
//     return null;
//   }

//   static Future register({
//     required String name,

//     required String email,
//     required String countryCode,
//     required String phoneNumber,
//     required String password,
//     required String confirmPassword,
//   }) async {}
// }
//????????

import 'package:dio/dio.dart';

class SigninApi {
  static final Dio dio = Dio(
    BaseOptions(
      baseUrl: "https://cosmatics.growfet.com",
      headers: {
        "accept": "application/json",
        "Content-Type": "application/json",
      },
    ),
  );

  static Future<bool> register({
    required String name,
    required String email,
    required String countryCode,
    required String phoneNumber,
    required String password,
    required String confirmPassword,
  }) async {
    try {
      print({
        "name": name,
        "email": email,
        "countryCode": countryCode,
        "phoneNumber": phoneNumber,
        "password": password,
        "confirmPassword": confirmPassword,
      });

      final response = await dio.post(
        "/api/Auth/register",
        data: {
          "username": name,
          "email": email,
          "countryCode": countryCode,
          "phoneNumber": phoneNumber,
          "password": password,
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
