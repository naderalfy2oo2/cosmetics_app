import 'package:cosmetics/constants/app_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../views/cart_view.dart';

class CartWidget extends StatelessWidget {
  final String image;
  final String title;
  final String price;
  final int productId;
  final VoidCallback onAdd;

  const CartWidget({
    super.key,
    required this.image,
    required this.title,
    required this.price,
    required this.productId,
    required this.onAdd,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(color: Color(0xffD9D9D9).withValues(alpha: 0.25)),
        ],
        borderRadius: BorderRadius.circular(12),
        color: Color(0xffD9D9D9).withValues(alpha: 0.25),
      ),

      width: 176..w,
      height: 237.h,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                ClipRRect(
                  borderRadius: BorderRadiusGeometry.circular(12),

                  child: Image.network(
                    image,
                    width: 161.w,

                    fit: BoxFit.fill,
                    height: 169.h,
                  ),
                ),

                Align(
                  alignment: AlignmentGeometry.topRight,

                  child: GestureDetector(
                    // onTap: () {
                    //   Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //       builder: (context) => const CartView(),
                    //     ),
                    //   );
                    // },
                    child: Padding(
                      padding: const EdgeInsets.all(12),

                      child: GestureDetector(
                        onTap: onAdd,
                        child: Container(
                          margin: EdgeInsets.all(12),

                          width: 32.w,
                          height: 32.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Color(0xffFFFAFA),
                          ),

                          child: AppImage(
                            image: 'basket.png',
                            width: 16.w,
                            height: 16.h,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: 5.h),

          Text(
            title,
            style: TextStyle(
              color: Color(0xff434C6D),
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),

          SizedBox(height: 2.h),

          Text(
            '\$$price',
            style: TextStyle(
              color: Color(0xff70839C),

              fontSize: 12,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}
