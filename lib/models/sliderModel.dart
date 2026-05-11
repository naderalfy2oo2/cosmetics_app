class SliderModel {
  SliderModel({required this.sum});
  late final List<Sum> sum;

  SliderModel.fromJson(Map<String, dynamic> json) {
    sum = List.from(json['sum']).map((e) => Sum.fromJson(e)).toList();
  }
}

class Sum {
  late final int id;
  late final String couponCode;
  late final int discountPercent;
  late final String descriptionTitle1En;
  late final String descriptionTitle1Ar;
  late final String descriptionTitle2En;
  late final String descriptionTitle2Ar;
  late final String imageUrl;

  Sum.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    couponCode = json['coupon_code'];
    discountPercent = json['discount_percent'];
    descriptionTitle1En = json['description_title1_en'];
    descriptionTitle1Ar = json['description_title1_ar'];
    descriptionTitle2En = json['description_title2_en'];
    descriptionTitle2Ar = json['description_title2_ar'];
    imageUrl = json['image_url'];
  }
}
