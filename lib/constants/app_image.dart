import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AppImage extends StatelessWidget {
  final String image;
  final double? width, height;
  final Color? color;

  const AppImage({
    super.key,
    required this.image,
    this.width,
    this.height,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    if (image.toLowerCase().endsWith('.svg')) {
      return SvgPicture.asset(
        'assets/icons/$image',
        color: color,
        width: width,
        height: height,
      );
    } else if (image.startsWith('http')) {
      return Image.network(image, width: width, height: height, color: color);
    }
    return Image.asset(
      'assets/images/$image',
      color: color,
      width: width,
      height: height,
    );
  }
}
