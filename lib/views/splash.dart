import 'package:cosmetics/constants/app_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xffD9D9D9),

        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,

            children: [
              // Image.asset(
              //   "assets/images/splash.png",
              //   width: 200.w,
              //   height: 200.h,
              // ),
              AppImage(image: 'splash.png', width: 200.w, height: 200.h),

              SizedBox(height: 0.h),
              Text(
                "COSMATICS",
                style: TextStyle(
                  color: Color(0xff434C6D),
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                ),
              ),

              // Image.asset("assets/images/splash2.png"),
              AppImage(image: 'splash2.png'),
            ],
          ),
        ),
      ),
    );
  }
}
