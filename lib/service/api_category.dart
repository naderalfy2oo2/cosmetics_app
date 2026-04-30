import 'package:dio/dio.dart';
import 'package:cosmetics/models/productModel.dart';
import 'package:cosmetics/models/sliderModel.dart';

class ApiServices {
  final Dio dio = Dio(BaseOptions(baseUrl: 'https://cosmatics.growfet.com'));

  Future<List<SliderModel>> getSliders() async {
    try {
      final response = await dio.get('/api/Sliders');
      final data = response.data;

      if (data == null) return [];

      if (data is List) {
        return data.map((e) => SliderModel.fromJson(e)).toList();
      }

      if (data is Map && data['data'] is List) {
        return (data['data'] as List)
            .map((e) => SliderModel.fromJson(e))
            .toList();
      }

      return [];
    } catch (e) {
      print("Slider Error: $e");
      return [];
    }
  }

  Future<List<ListProduct>> getProducts() async {
    try {
      final response = await dio.get('/api/Products');
      final data = response.data;

      if (data == null) return [];

      if (data is List) {
        return data.map((e) => ListProduct.fromJson(e)).toList();
      }

      if (data is Map && data['data'] is List) {
        return (data['data'] as List)
            .map((e) => ListProduct.fromJson(e))
            .toList();
      }

      return [];
    } catch (e) {
      print("Product Error: $e");
      return [];
    }
  }

  Future<List<CategoryData>> getCategories() async {
    try {
      final response = await dio.get('/api/Categories');
      final data = response.data;

      if (data == null) return [];

      if (data is List) {
        return data.map((e) => CategoryData.fromJson(e)).toList();
      }

      if (data is Map && data['data'] is List) {
        return (data['data'] as List)
            .map((e) => CategoryData.fromJson(e))
            .toList();
      }

      return [];
    } catch (e) {
      print("Category Error: $e");
      return [];
    }
  }
}

class CategoryData {
  final int id;
  final String name;
  final String image;

  CategoryData({required this.id, required this.name, required this.image});

  factory CategoryData.fromJson(Map<String, dynamic> json) {
    return CategoryData(
      id: json['id'] ?? 0,
      name: json['name'] ?? "",
      image: json['image'] ?? "",
    );
  }
}
