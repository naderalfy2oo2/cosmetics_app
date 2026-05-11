import 'package:dio/dio.dart';

class DioHelper {
  static late Dio dio;

  static void init() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://cosmatics.growfet.com/api/Sliders',

        receiveDataWhenStatusError: true,
        headers: {'cotent_type': "application/json", 'lang': 'ar'},
      ),
    );
  }

  static Future getData({
    required String url,
    Map<String, dynamic>? query,
  }) async {
    return await dio.get(url, queryParameters: query);
  }
}
