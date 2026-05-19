// import 'dart:developer';
// import 'package:cosmetics/models/cart_model.dart';

// import 'dio_helper.dart';

// class CartService {
//   // GET CART
//   static Future<List<CartItem>> getCart() async {
//     final res = await DioHelper.getData(url: "/api/Cart");

//     if (!res.isSuccess) return [];

//     final List data = res.data["items"] ?? [];

//     return data.map((e) => CartItem.fromJson(e)).toList();
//   }

//   // ADD TO CART
//   Future add(int id) async {
//     print('id $id');
//     final res = await DioHelper.postData(
//       url: '/api/Cart/add',
//       data: {"productId": id, "quantity": 1},
//     );

//     log("ADD RESPONSE: ${res}");
//     return res;
//   }

//   // UPDATE
//   static Future update(int id, int qty) async {
//     return await DioHelper.putData(
//       url: '/api/Cart/update',
//       data: {"productId": id, "quantity": qty},
//     );
//   }

//   // DELETE
//   static Future delete(int id) async {
//     return await DioHelper.deleteData(url: '/api/Cart/remove/$id');
//   }
// }

// class CustomResponse {
//   final bool isSuccess;
//   final dynamic data;

//   CustomResponse(this.isSuccess, {this.data});
// }
//????

import '../models/cart_model.dart';
import 'dio_helper.dart';

class CartService {
  static Future<List<CartItem>> getCart() async {
    final res = await DioHelper.getData(url: "/api/Cart");

    if (!res.isSuccess) {
      return [];
    }

    List data = res.data["items"] ?? [];

    return data.map((e) => CartItem.fromJson(e)).toList();
  }

  Future<CustomResponse> add(int id) async {
    return await DioHelper.postData(
      url: "/api/Cart/add",
      data: {"productId": id, "quantity": 1},
    );
  }

  static Future update(int id, int qty) async {
    return await DioHelper.putData(
      url: "/api/Cart/update",

      data: {"productId": id, "quantity": qty},
    );
  }

  static Future delete(int id) async {
    return await DioHelper.deleteData(url: "/api/Cart/remove/$id");
  }
}
