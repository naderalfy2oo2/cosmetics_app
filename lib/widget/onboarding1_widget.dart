import 'package:cosmetics/constants/app_image.dart';
import 'package:cosmetics/helper_methods.dart';
import 'package:cosmetics/widget/onboarding2_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Onboarding1Widget extends StatelessWidget {
  const Onboarding1Widget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Color(0xffD9D9D9),
            actions: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Skip",
                  style: TextStyle(
                    color: Color(0xff434C6D),
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Center(
                  child: AppImage(
                    image: 'on_boarding1.png',
                    width: 300.w,
                    height: 300.h,
                  ),
                ),

                SizedBox(height: 28.h),

                Text(
                  "SEARCH & PICK",
                  style: TextStyle(
                    color: Color(0xff434C6D),
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 10.h),

                Text(
                  "We have dedicated set of products and\nroutines hand picked for every skin type.",
                  style: TextStyle(color: Color(0xff434C6D)),
                ),

                SizedBox(height: 30.h),

                SizedBox(
                  height: 50.h,
                  width: 50.w,
                  child: IconButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xff434C6D),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadiusGeometry.circular(10),
                      ),
                    ),
                    onPressed: () {
                      goToWithoutback(page: Onboarding2Widget());
                    },
                    icon: Icon(
                      Icons.arrow_forward_ios,
                      color: Color(0xffD9D9D9),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
