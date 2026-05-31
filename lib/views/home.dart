import 'dart:developer';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:cosmetics/constants/app_image.dart';

import 'package:cosmetics/models/productModel.dart';
import 'package:cosmetics/service/dio_helper.dart';
import 'package:cosmetics/widget/cart_widget.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../models/sliderModel.dart';
import '../service/api_category.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<Sum> sliders = [];
  List<resultProduct> prod = [];

  bool isLoading = false;
  String? errorMessage;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getSlider();
    getPorduct();
  }

  Future<void> getSlider() async {
    setState(() {
      isLoading = true;
      errorMessage = null;
    });
    try {
      var response = await DioHelper.getData(
        url: 'https://cosmatics.growfet.com/api/Sliders',
      );

      print(response.data);

      List data = response.data;
      setState(() {
        sliders = data.map((e) => Sum.fromJson(e)).toList();
      });
    } on DioException {
      setState(() => errorMessage = "فشل تحميل البيانات ");
    } finally {
      if (mounted) setState(() => isLoading = false);
    }
  }

  Future<void> getPorduct() async {
    setState(() {
      isLoading = true;
      errorMessage = null;
    });
    try {
      final response = await DioHelper.getData(
        url: 'https://cosmatics.growfet.com/api/Products',
      );

      if (response.isSuccess) {
        List data = response.data;

        prod = data.map((e) => resultProduct.fromJson(e)).toList();

        setState(() {});
      }

      print(response.data);
      List data = response.data;
      setState(() {
        prod = data.map((e) => resultProduct.fromJson(e)).toList();
      });
    } on DioException {
      setState(() => errorMessage = "فشل تحميل البيانات ");
    } finally {
      if (mounted) setState(() => isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xffD9D9D9),
        body: isLoading
            ? Center(child: CircularProgressIndicator())
            : Padding(
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

                    Column(
                      children: [
                        Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadiusGeometry.circular(18),

                              child: CarouselSlider.builder(
                                itemCount: sliders.length,

                                itemBuilder: (context, itemIndex, pageViewIndex) {
                                  return SizedBox(
                                    height: 250,
                                    width: double.infinity,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(18),
                                      child: Stack(
                                        fit: StackFit.expand,
                                        children: [
                                          Image.network(
                                            sliders[itemIndex].imageUrl,
                                            fit: BoxFit.cover,
                                          ),

                                          Align(
                                            alignment:
                                                AlignmentDirectional.center,
                                            child: Container(
                                              height: 151,
                                              width: double.infinity,
                                              color: Color(
                                                0xffE9DCD3,
                                              ).withOpacity(0.5),
                                              padding: EdgeInsets.all(12),
                                              child: Column(
                                                children: [
                                                  Row(
                                                    children: [
                                                      Expanded(
                                                        child: Text.rich(
                                                          TextSpan(
                                                            children: [
                                                              TextSpan(
                                                                text:
                                                                    "${sliders[itemIndex].discountPercent} DISCOUNT\n",
                                                              ),
                                                              TextSpan(
                                                                text:
                                                                    "COUPON CODE: ${sliders[itemIndex].couponCode}",
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                      AppImage(
                                                        image: 'offer.png',
                                                        width: 50,
                                                        height: 50,
                                                      ),
                                                    ],
                                                  ),

                                                  SizedBox(height: 12),

                                                  Row(
                                                    children: [
                                                      AppImage(
                                                        image: 'offer.png',
                                                        width: 55.w,
                                                        height: 55.h,
                                                      ),

                                                      Spacer(),

                                                      Text.rich(
                                                        TextSpan(
                                                          children: [
                                                            TextSpan(
                                                              text:
                                                                  "Hurry up!\n",
                                                              style: TextStyle(
                                                                color: Color(
                                                                  0xff434C6D,
                                                                ),
                                                                fontSize: 16,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w700,
                                                              ),
                                                            ),

                                                            TextSpan(
                                                              text:
                                                                  'Skin care only !',

                                                              style: TextStyle(
                                                                color: Color(
                                                                  0xff434C6D,
                                                                ),
                                                                fontSize: 16,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w700,
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
                                        ],
                                      ),
                                    ),
                                  );
                                },

                                options: CarouselOptions(
                                  height: 250,
                                  autoPlay: true,
                                  enlargeCenterPage: true,
                                  viewportFraction: 1,
                                  autoPlayInterval: Duration(seconds: 3),
                                  scrollDirection: Axis.horizontal,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),

                    SizedBox(height: 26),

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

                        itemCount: prod.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                        ),
                        itemBuilder: (context, index) {
                          final item = prod[index];

                          return CartWidget(
                            image: item.imageUrl,

                            title: item.nameEn,

                            price: "${item.price}",

                            productId: item.id,

                            onAdd: () async {
                              final res = await CartService().add(item.id);

                              if (res.isSuccess) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text("Added")),
                                );
                              }
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
