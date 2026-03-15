class SliderModel {
  late final int id;
  late final String couponCode;
  late final int discountPercent;
  late final String descriptionTitle1;
  late final String descriptionTitle2;
  late final String imageUrl;

  SliderModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    couponCode = json['couponCode'];
    discountPercent = json['discountPercent'];
    descriptionTitle1 = json['descriptionTitle1'];
    descriptionTitle2 = json['descriptionTitle2'];
    imageUrl = json['imageUrl'];
  }
}
