class SliderModel {
  final String imageUrl;

  SliderModel({required this.imageUrl});

  factory SliderModel.fromJson(Map<String, dynamic> json) {
    return SliderModel(imageUrl: json['imageUrl'] ?? "");
  }
}
