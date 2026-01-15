// import 'package:dio/dio.dart';

// class ApiService {
//   late final Dio dio;
//   ApiService() {
//     dio = Dio(
//       BaseOptions(
//         baseUrl:
//             "https://cosmatics-302b5-default-rtdb.europe-west1.firebasedatabase.app/",
//       ),
//     );
//     Future<List<CategoyData>> getCategories() async {
//       final response = await dio.get('categories.json');
//       List<dynamic> CategoriesList = response.data["result"];
//       List<CategoyData> CategriesList = [];

//       for(var categoryItem in CategriesList){
//         CategriesList.add(categoryItem);

//     }

//   }
// }

// import 'package:dio/dio.dart';

// class ApiServices {
//   late final Dio dio;
//   ApiServices() {
//     dio = Dio(
//       BaseOptions(
//         baseUrl:
//             'https://cosmatics-302b5-default-rtdb.europe-west1.firebasedatabase.app/',
//       ),
//     );
//   }

//   Future<List<CategoryData>> getCategories() async {
//     final response = await dio.get(
//       'categories.json',
//       queryParameters: {'api_key': '2001486a0f63e9e4ef9c4da157ef37cd'},
//     );

//     final List categoryList = response.data;
//     List<CategoryData> categoriesList = [];

//     for (var categoryItem in categoryList) {
//       categoriesList.add(CategoryData.fromJson(categoryItem));
//     }
//     return categoriesList;
//   }
// }

import 'package:dio/dio.dart';

class ApiServices {
  final Dio dio = Dio(
    BaseOptions(
      baseUrl:
          'https://cosmatics-302b5-default-rtdb.europe-west1.firebasedatabase.app/',
    ),
  );

  Future<List<CategoryData>> getCategories() async {
    final response = await dio.get('categories.json');

    final List data = response.data;

    return data.map((e) => CategoryData.fromJson(e)).toList();
  }
}

class CategoryData {
  final int id;
  final String name;
  final String image;

  CategoryData({required this.id, required this.name, required this.image});

  factory CategoryData.fromJson(Map<String, dynamic> json) {
    return CategoryData(
      id: json['id'],
      name: json['name'],
      image: json['image'],
    );
  }
}

// class CategoryData {
//   CategoryData({required this.result});
//   late final List<Result> result;

//   CategoryData.fromJson(Map<String, dynamic> json) {
//     result = List.from(json['result']).map((e) => Result.fromJson(e)).toList();
//   }

//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['result'] = result.map((e) => e.toJson()).toList();
//     return _data;
//   }
// }

// class Result {
//   Result({required this.id, required this.image, required this.name});
//   late final int id;
//   late final String image;
//   late final String name;

//   Result.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     image = json['image'];
//     name = json['name'];
//   }

//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['id'] = id;
//     _data['image'] = image;
//     _data['name'] = name;
//     return _data;
//   }
// }
