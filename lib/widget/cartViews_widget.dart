import 'package:cosmetics/constants/app_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinbox/material.dart';

class CartviewsWidget extends StatelessWidget {
  final String image;
  final String title;
  final String description;
  final String price;
  final int quantity;

  final VoidCallback onDelete;

  final VoidCallback onPlus;

  final VoidCallback onMinus;

  const CartviewsWidget({
    super.key,
    required this.image,
    required this.title,
    required this.description,
    required this.price,
    required this.quantity,
    required this.onDelete,
    required this.onPlus,
    required this.onMinus,
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
                    onTap: onDelete,
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
                min: 1,
                max: 100,

                value: quantity.toDouble(),

                onChanged: (v) {
                  if (v > quantity) {
                    onPlus();
                  } else {
                    onMinus();
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
