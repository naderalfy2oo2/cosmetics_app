import 'package:cosmetics/constants/app_image.dart';
import 'package:cosmetics/widget/cart_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final List<Map<String, dynamic>> items = [
    {
      "image": "assets/images/grid1.jpg",
      "title": "Face tint / lip tint",

      "price": "44.99",
    },

    {
      "image": "assets/images/grid2.jpg",
      "title": "Athe Red lipstick",

      "price": "44.99",
    },

    {
      "image": "assets/images/grid3.jpg",
      "title": "Mascara for lashes",

      "price": "44.99",
    },

    {
      "image": "assets/images/grid4.jpg",
      "title": "Blemish cover",

      "price": "44.99",
    },
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xffD9D9D9),
        body: Padding(
          padding: const EdgeInsets.all(13),
          child: Column(
            children: [
              SizedBox(height: 12.h),
              TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(18),
                  ),
                  labelText: "Search",
                  labelStyle: TextStyle(
                    color: Color(0xff8E8EA9),
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),

                  suffixIcon: Icon(Icons.search, size: 17),
                  suffixIconColor: Color(0xff8E8EA9),
                ),
              ),

              SizedBox(height: 15.h),

              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadiusGeometry.circular(18),
                    child: Image.asset(
                      "assets/images/home.jpg",
                      width: double.infinity,
                      height: 320.h,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    top: 85,
                    right: 0,
                    left: 0,
                    child: Container(
                      width: double.infinity,
                      height: 151.h,
                      decoration: BoxDecoration(
                        color: Color(0xffE9DCD3).withValues(alpha: 0.5),
                      ),

                      child: Padding(
                        padding: const EdgeInsets.all(13),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,

                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: Text.rich(
                                    TextSpan(
                                      children: [
                                        TextSpan(
                                          text: "50% OFF DISCOUNT \n",
                                          style: TextStyle(
                                            color: Color(0xff62322D),
                                            fontSize: 16,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),

                                        TextSpan(
                                          text: 'CUPON CODE : 125865',

                                          style: TextStyle(
                                            color: Color(0xff62322D),
                                            fontSize: 16,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),

                                SizedBox(width: 12.w),

                                Image.asset(
                                  "assets/images/offer.png",
                                  width: 55.w,
                                  height: 55.h,
                                ),
                              ],
                            ),

                            SizedBox(width: 12.w),

                            Row(
                              children: [
                                Image.asset(
                                  "assets/images/offer.png",
                                  width: 55.w,
                                  height: 55.h,
                                ),

                                SizedBox(width: 129.w),
                                Text.rich(
                                  TextSpan(
                                    children: [
                                      TextSpan(
                                        text: "Hurry up!\n",
                                        style: TextStyle(
                                          color: Color(0xff434C6D),
                                          fontSize: 16,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),

                                      TextSpan(
                                        text: 'Skin care only !',

                                        style: TextStyle(
                                          color: Color(0xff434C6D),
                                          fontSize: 16,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                                SizedBox(width: 10.w),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 26.h),

              Align(
                alignment: AlignmentGeometry.centerLeft,
                child: Text(
                  "Top rated products",
                  style: TextStyle(
                    color: Color(0xff434C6D),
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),

              Expanded(
                child: GridView.builder(
                  shrinkWrap: true,

                  itemCount: items.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  itemBuilder: (context, index) {
                    final item = items[index];
                    return CartWidget(
                      image: item["image"],
                      title: item["title"],
                      price: item["price"],
                    );
                  },
                ),
              ),

              SizedBox(height: 17.h),
            ],
          ),
        ),
      ),
    );
  }
}
