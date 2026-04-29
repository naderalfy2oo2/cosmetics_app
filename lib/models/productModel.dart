class ListProduct {
  final int id;
  final String name;
  final String description;
  final double price;
  final int stock;
  final String imageUrl;
  final int? categoryId;

  ListProduct({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.stock,
    required this.imageUrl,
    this.categoryId,
  });

  factory ListProduct.fromJson(Map<String, dynamic> json) {
    String img = json['imageUrl'] ?? "";

    // 🔥 لو اللينك مش كامل
    if (img.isNotEmpty && !img.startsWith("http")) {
      img = "https://cosmatics.growfet.com$img";
    }

    return ListProduct(
      id: json['id'] ?? 0,
      name: json['name'] ?? "",
      description: json['description'] ?? "",
      price: (json['price'] ?? 0).toDouble(),
      stock: json['stock'] ?? 0,
      imageUrl: img,
      categoryId: json['categoryId'],
    );
  }
}
