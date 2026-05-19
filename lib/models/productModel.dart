class ProductsModel {
  ProductsModel({required this.product});
  late final List<resultProduct> product;

  ProductsModel.fromJson(Map<String, dynamic> json) {
    product = List.from(
      json['product'],
    ).map((e) => resultProduct.fromJson(e)).toList();
  }
}

class resultProduct {
  late final int id;
  late final String nameEn;
  late final String nameAr;
  late final String descriptionEn;
  late final String descriptionAr;
  late final double? price;
  late final int stock;
  late final String imageUrl;
  late final int categoryId;

  resultProduct.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nameEn = json['name_en'];
    nameAr = json['name_ar'];
    descriptionEn = json['description_en'];
    descriptionAr = json['description_ar'];
    price = json['price'];
    stock = json['stock'];
    imageUrl = json['image_url'];
    categoryId = json['category_id'];
  }
}
