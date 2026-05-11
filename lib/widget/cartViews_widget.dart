import 'package:cosmetics/constants/app_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinbox/material.dart';

class CartviewsWidget extends StatelessWidget {
  final String image;
  final String title;
  final String description;
  final String price;
  const CartviewsWidget({
    super.key,
    required this.image,
    required this.title,
    required this.description,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadiusGeometry.circular(15),
                    child: AppImage(image: image, width: 102.w, height: 102.h),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: const EdgeInsets.all(6),
                        child: AppImage(
                          image: 'delete.png',
                          width: 19.w,
                          height: 19.h,
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                          color: Color(0xff3B4569),
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                        ),
                      ),

                      SizedBox(height: 8.h),

                      Text(
                        description,
                        style: TextStyle(
                          color: Color(0xff3B4569),
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),

                      SizedBox(height: 16.h),

                      Text(
                        '$price',
                        style: TextStyle(
                          color: Color(0xff3B4569),
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),

          Align(
            alignment: AlignmentGeometry.bottomRight,
            child: SizedBox(
              width: 142.w,
              height: 42.h,
              child: SpinBox(
                min: 0,
                max: 100,
                value: 0.1,
                onChanged: (value) => print(value),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
