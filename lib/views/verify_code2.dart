import 'package:cosmetics/views/create_password.dart';

import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:lottie/lottie.dart';
import 'package:slide_countdown/slide_countdown.dart';

class VerifyCode2View extends StatefulWidget {
  const VerifyCode2View({super.key});

  @override
  State<VerifyCode2View> createState() => _VerifyCode2ViewState();
}

class _VerifyCode2ViewState extends State<VerifyCode2View> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/images/splash.png', height: 62, width: 67),
                SizedBox(height: 40),

                Text(
                  'Verify Code',
                  style: TextStyle(
                    color: Color(0xff434C6D),
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),

                SizedBox(height: 40),

                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: 'We just sent a 4-digit verification code to ',
                        style: TextStyle(color: Color(0xff8E8EA9)),
                      ),

                      TextSpan(
                        text: '\n+20 1022658997. ',
                        style: TextStyle(
                          color: Color(0xff434C6D),
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),

                      TextSpan(
                        text:
                            'Enter the code in the box \n                      below to continue.',

                        style: TextStyle(color: Color(0xff434C6D)),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 40),

                Align(
                  alignment: AlignmentGeometry.centerLeft,
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      'Edit the Number',
                      style: TextStyle(color: Colors.pinkAccent),
                    ),
                  ),
                ),

                OtpTextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(style: BorderStyle.solid),
                    ),
                  ),

                  numberOfFields: 4,
                  borderColor: Colors.pinkAccent,

                  showFieldAsBox: true,

                  onCodeChanged: (String code) {},

                  onSubmit: (String verificationCode) {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text("Verification Code"),
                          content: Text('Code entered is $verificationCode'),
                        );
                      },
                    );
                  },
                ),

                SizedBox(height: 43),

                Align(
                  alignment: AlignmentGeometry.bottomLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text('  Didn’t receive a code?'),
                        TextButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return Dialog(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadiusGeometry.circular(
                                      20,
                                    ),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(20),
                                    child: Column(
                                      children: [
                                        Lottie.asset(
                                          'assets/lotties/sucess.json',
                                          width: 150,
                                          height: 150,
                                          fit: BoxFit.cover,
                                        ),

                                        SizedBox(height: 10),

                                        Text(
                                          'Account Activated!',
                                          style: TextStyle(
                                            color: Color(0xff434C6D),
                                            fontSize: 15,
                                          ),
                                        ),

                                        Text(
                                          'Congratulations! Your account\nhas been successfully activated',
                                          style: TextStyle(
                                            color: Color(0xff8E8EA9),
                                          ),
                                        ),
                                        SizedBox(height: 23),

                                        SizedBox(
                                          height: 60,
                                          width: 268,
                                          child: ElevatedButton(
                                            style: ButtonStyle(
                                              backgroundColor:
                                                  WidgetStatePropertyAll(
                                                    Color(0xffD75D72),
                                                  ),
                                            ),
                                            onPressed: () {},
                                            child: Text(
                                              'Go to home',
                                              style: TextStyle(
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                          child: Text(
                            'Resend',
                            style: TextStyle(color: Colors.pinkAccent),
                          ),
                        ),

                        Spacer(),

                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SlideCountdown(
                            decoration: BoxDecoration(color: Colors.pinkAccent),
                            duration: Duration(minutes: 3, seconds: 3),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                SizedBox(height: 113),

                SizedBox(
                  height: 65,
                  width: 268,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CreatePasswordView(),
                        ),
                      );
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(
                        Colors.pinkAccent,
                      ),
                    ),
                    child: Text(
                      'Done',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
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
