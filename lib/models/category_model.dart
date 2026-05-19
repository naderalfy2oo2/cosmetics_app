class CategoryModel {
  CategoryModel({required this.result});
  late final List<resultCategories> result;

  CategoryModel.fromJson(Map<String, dynamic> json) {
    result = List.from(
      json['result'],
    ).map((e) => resultCategories.fromJson(e)).toList();
  }
}

class resultCategories {
  late final int id;
  late final String titleEn;
  late final String titleAr;
  late final String imageUrl;

  resultCategories.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    titleEn = json['title_en'];
    titleAr = json['title_ar'];
    imageUrl = json['image_url'];
  }
}
