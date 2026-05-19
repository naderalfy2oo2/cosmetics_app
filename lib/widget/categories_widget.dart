import 'package:cosmetics/constants/app_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoriesWidget extends StatelessWidget {
  final String image;

  final String title;
  final Icon? icon;

  const CategoriesWidget({
    super.key,
    required this.image,
    required this.title,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(13),
      child: Column(
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadiusGeometry.circular(20),
                child: AppImage(image: image, width: 64.w, height: 69.h),
              ),

              SizedBox(width: 12.w),

              Expanded(
                child: Text(
                  title,
                  style: TextStyle(
                    color: Color(0xff434C6D),
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),

              Spacer(),

              IconButton(onPressed: () {}, icon: Icon(Icons.play_arrow)),
            ],
          ),
        ],
      ),
    );
  }
}
