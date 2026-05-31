import 'package:cosmetics/forget_Password/create_password.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:slide_countdown/slide_countdown.dart';
import 'package:verification_code_field/verification_code_field.dart';

import '../constants/app_image.dart';
import '../helper_methods.dart';
import '../service/api_verifyCode.dart';
import '../service/snackbar.dart';
import '../widget/elvatedButton_widget.dart';

class VerifyForget extends StatefulWidget {
  final String countryCode;
  final String phoneNumber;
  VerifyForget({
    super.key,
    required this.countryCode,
    required this.phoneNumber,
  });

  @override
  State<VerifyForget> createState() => _VerifyForgetState();
}

class _VerifyForgetState extends State<VerifyForget> {
  String otp = "";
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xffD9D9D9),
          leading: Container(
            decoration: BoxDecoration(
              color: Color(0xffD9D9D9),
              shape: BoxShape.circle,
            ),
            child: IconButton(
              onPressed: () {},
              icon: Icon(Icons.arrow_back_ios),
            ),
          ),
        ),

        body: SingleChildScrollView(
          child: Column(
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

              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'We just sent a 4-digit verification code to\n ',
                      style: TextStyle(
                        color: Color(0xff8E8EA9),
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                      ),
                    ),

                    TextSpan(
                      text: '+20 1022658997',
                      style: TextStyle(
                        color: Color(0xff434C6D),
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),

                    TextSpan(
                      text:
                          ' Enter the code in the box\n                        below to continue.',
                      style: TextStyle(
                        color: Color(0xff8E8EA9),
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                      ),
                    ),
                  ],
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
                onSubmit: (value) {
                  otp = value;
                },
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
                    SlideCountdownSeparated(
                      duration: Duration(milliseconds: 60),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 113.h),

              ElvatedbuttonWidget(
                title: 'Done',
                onPressed: () async {
                  if (otp.length != 4) {
                    Snack.error(context, "Enter cmplete verify code");
                    return;
                  }

                  setState(() {
                    loading = true;
                  });

                  final success = await verifyApi.verify(
                    countryCode: widget.countryCode,
                    phoneNumber: widget.phoneNumber,

                    otpCode: otp,
                  );

                  setState(() {
                    loading = false;
                  });

                  print("verify result => $success");

                  if (success != null) {
                    Snack.success(context, " verify Created Successfully");

                    goTo(page: CreatePassword(phone: widget.phoneNumber));
                  } else {
                    Snack.error(context, " verify Failed");
                  }
                },
              ),
              SizedBox(height: 129.h),
            ],
          ),
        ),
      ),
    );
  }
}
