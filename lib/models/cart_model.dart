class CartItem {
  final int productId;
  final String name;
  final String image;
  final num price;
  final int quantity;

  CartItem({
    required this.productId,
    required this.name,
    required this.image,
    required this.price,
    required this.quantity,
  });

  factory CartItem.fromJson(Map<String, dynamic> json) {
    return CartItem(
      productId: json['product_id'] ?? 0,
      name: json['product_name_en'] ?? "",
      image: json['image_url'] ?? "",
      price: json['price'] ?? 0,
      quantity: json['quantity'] ?? 1,
    );
  }
}
