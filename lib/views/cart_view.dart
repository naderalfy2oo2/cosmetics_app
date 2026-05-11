import 'package:cosmetics/constants/app_image.dart';
import 'package:cosmetics/widget/cartViews_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartView extends StatefulWidget {
  const CartView({super.key});

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  final List<Map<String, dynamic>> items = [
    {
      "image": "notecosmetics.png",
      "title": "Note Cosmetics",
      "description": "Ultra rich mascara for lashes",
      "price": "350 EGP",
    },

    {
      "image": "bronzer.png",
      "title": "ARTDECO",
      "description": "Bronzer - 02 ",
      "price": "490 EGP",
    },

    {
      "image": "lespick.jpg",
      "title": "Fendi",
      "description": "Lipstick - shade 9",
      "price": "260 EGP",
    },

    {
      "image": "perfum.jpg",
      "title": "Channel ",
      "description": "L’eau de perfum N5",
      "price": "15.000 EGP",
    },
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(backgroundColor: Color(0xffD9D9D9)),

        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                children: [
                  SizedBox(width: 124.w),
                  Center(
                    child: Text(
                      'My Cart',

                      style: TextStyle(
                        color: Color(0xff434C6D),
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  SizedBox(width: 98.w),

                  IconButton(
                    onPressed: () {},
                    icon: AppImage(
                      image: 'cart.png',
                      width: 24.w,
                      height: 24.h,
                    ),
                  ),
                ],
              ),

              Align(
                alignment: AlignmentGeometry.topLeft,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Text(
                    'You have 4 products in your cart',
                    style: TextStyle(
                      color: Color(0xff434C6D8C).withValues(alpha: 0.55),
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),

              SizedBox(height: 34.h),

              ListView.separated(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  final item = items[index];
                  return CartviewsWidget(
                    image: item['image'],

                    title: item['title'],
                    description: item['description'],
                    price: item['price'],
                  );
                },
                separatorBuilder: (context, index) {
                  return Divider(
                    thickness: 1,
                    color: Color(0xffB3B3C180).withValues(alpha: 0.5),
                  );
                },
                itemCount: items.length,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
