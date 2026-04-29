import 'package:flutter/material.dart';
import 'package:slide_countdown/slide_countdown.dart';
import 'package:verification_code_field/verification_code_field.dart';

import '../widget/elvatedButton_widget.dart';

class VerifyForget extends StatelessWidget {
  const VerifyForget({super.key});

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
              SizedBox(height: 40),

              Center(
                child: Image.asset(
                  "assets/images/splash.png",
                  width: 67,
                  height: 62,
                ),
              ),

              SizedBox(height: 40),

              Text(
                "Verify Code",
                style: TextStyle(
                  color: Color(0xff434C6D),
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                ),
              ),

              SizedBox(height: 40),

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

              SizedBox(height: 40),

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
                    SizedBox(height: 20),
                    SlideCountdownSeparated(
                      duration: Duration(milliseconds: 60),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 113),

              ElvatedbuttonWidget(title: 'Done'),

              SizedBox(height: 129),
            ],
          ),
        ),
      ),
    );
  }
}
