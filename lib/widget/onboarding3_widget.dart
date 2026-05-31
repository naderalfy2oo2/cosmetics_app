import 'package:cosmetics/auth/login.dart';
import 'package:cosmetics/constants/app_image.dart';
import 'package:cosmetics/helper_methods.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Onboarding3Widget extends StatelessWidget {
  const Onboarding3Widget({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: AppImage(
                  image: 'onboarding3.png',

                  height: 300.h,
                  width: 300.w,
                ),
              ),
              SizedBox(height: 46.h),

              Text(
                "PUCH NOTIFICATIONS ",
                style: TextStyle(
                  color: Color(0xff434C6D),
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),

              SizedBox(height: 10.h),

              Text(
                "Allow notifications for new makeup &\n                cosmetics offers.",
                style: TextStyle(
                  color: Color(0xff434C6D),
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),

              SizedBox(height: 30.h),

              SizedBox(
                height: 65.h,
                width: 268.w,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xff434C6D),
                  ),
                  onPressed: () {
                    goToWithoutback(page: Login());
                  },
                  child: Text(
                    "let’s start!",
                    style: TextStyle(color: Color(0xffD9D9D9)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
