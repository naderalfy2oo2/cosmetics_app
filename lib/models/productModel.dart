class ListProduct {
  late final int id;
  late final String name;
  late final String description;
  late final double price;
  late final int stock;
  late final String imageUrl;
  late final Null categoryId;

  ListProduct.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    price = json['price'];
    stock = json['stock'];
    imageUrl = json['imageUrl'];
    categoryId = null;
  }
}
