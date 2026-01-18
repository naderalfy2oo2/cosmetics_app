import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AppImage extends StatelessWidget {
  final String image;
  final double? height, width;
  final Color? color;

  const AppImage({
    super.key,
    required this.image,
    this.height,
    this.width,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    if (image.toLowerCase().endsWith('svg')) {
      return SvgPicture.asset(
        "assets/images/$image",
        color: color,
        height: height,
        width: width,
      );
    } else if (image.startsWith("http")) {
      return Image.network(image, height: height, width: width, color: color);
    }
    return Image.asset(
      "assets/images/$image",
      color: color,
      height: height,
      width: width,
    );
  }
}
