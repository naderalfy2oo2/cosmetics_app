import 'package:cosmetics/widget/elvatedButton_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:lottie/lottie.dart';
import 'package:slide_countdown/slide_countdown.dart';
import 'package:verification_code_field/verification_code_field.dart';

import '../constants/app_image.dart';

class VerifyCode extends StatelessWidget {
  const VerifyCode({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 40.h),
            Center(
              child: AppImage(image: 'splash.png', width: 67.w, height: 62.h),
            ),

            SizedBox(height: 40.h),

            Text(
              "Verify Code",
              style: TextStyle(
                color: Color(0xff434C6D),
                fontSize: 24,
                fontWeight: FontWeight.w700,
              ),
            ),

            SizedBox(height: 40.h),

            Text(
              "We just sent a 4-digit verification code to\nyour email amramer522@gmail.com. Enter \n   the code in the box below to continue.",
              style: TextStyle(
                color: Color(0xff8E8EA9),
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),

            SizedBox(height: 40.h),

            Padding(
              padding: const EdgeInsets.all(13),
              child: Align(
                alignment: AlignmentGeometry.centerLeft,
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    "Edit the number",
                    style: TextStyle(
                      color: Color(0xffD75D72),
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
            VerificationCodeField(
              codeDigit: CodeDigit.four,
              onSubmit: (value) {},
              enabled: true,
              showCursor: true,
              filled: true,

              cursorColor: Color(0xff10101038).withValues(alpha: 0.22),

              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xffD75D72)),
              ),
              textStyle: TextStyle(color: Color(0xff434C6D)),
            ),
            Padding(
              padding: const EdgeInsets.all(13),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Didn’t receive a code? ",
                    style: TextStyle(
                      color: Color(0xff434C6D),
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),

                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "Resend",
                      style: TextStyle(
                        color: Color(0xffD75D72).withValues(alpha: 54),
                      ),
                    ),
                  ),

                  Spacer(),
                  SlideCountdown(
                    padding: EdgeInsets.all(13),

                    duration: Duration(minutes: 1, seconds: 60),
                    style: TextStyle(color: Color(0xff8E8EA9)),
                    separatorStyle: TextStyle(color: Color(0xff8E8EA9)),

                    decoration: BoxDecoration(color: Color(0xffD9D9D9)),
                  ),
                  SizedBox(height: 20.h),
                  SlideCountdownSeparated(duration: Duration(milliseconds: 60)),
                ],
              ),
            ),

            SizedBox(height: 113.h),

            SizedBox(
              width: 268.w,
              height: 65.h,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xffD75D72),
                ),

                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return Dialog(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadiusGeometry.circular(10),
                        ),
                        child: Container(
                          width: 360.w,
                          padding: EdgeInsets.all(46),
                          height: 500.h,

                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                SizedBox(height: 30.h),

                                Lottie.asset("assets/lotties/sucess.json"),

                                SizedBox(height: 26.h),

                                Text(
                                  "Account Activated!",
                                  style: TextStyle(
                                    color: Color(0xff434C6D),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),

                                SizedBox(height: 8.h),
                                Text(
                                  "Congratulations! Your account\nhas been successfully activated",
                                  style: TextStyle(
                                    color: Color(0xff8E8EA9),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),

                                SizedBox(height: 23.h),

                                ElvatedbuttonWidget(title: "Go to home"),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
                child: Text(
                  "Done",
                  style: TextStyle(
                    color: Color(0xffFFFFFF),
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
