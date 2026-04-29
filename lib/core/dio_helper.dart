import 'package:dio/dio.dart';

class DioHelper {
  // final widget path;
  static const basURL = "https://cosmatics.growfet.com";

  static Future<CustomResponse> getData({String path = ''}) async {
    try {
      final resp = await Dio(
        BaseOptions(
          baseUrl: basURL,
          headers: {
            "accept": "application/json",
            "contact_type": "application/json",
          },
        ),
      ).get(path);
      print('Nader999');
      print(resp.data);
      return CustomResponse(isSucess: true, data: resp.data);
    } on DioException catch (ex) {
      return CustomResponse(isSucess: false, msg: ex.response?.data["message"]);
    }
  }
}

class CustomResponse {
  final bool isSucess;
  final String? msg;
  final dynamic data;

  CustomResponse({required this.isSucess, this.msg, this.data});
}
