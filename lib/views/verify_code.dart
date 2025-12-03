import 'package:cosmetics/views/sucess_dialoug.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:slide_countdown/slide_countdown.dart';

class VerifyCodeView extends StatefulWidget {
  const VerifyCodeView({super.key});

  @override
  State<VerifyCodeView> createState() => _VerifyCodeViewState();
}

class _VerifyCodeViewState extends State<VerifyCodeView> {
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
                        style: TextStyle(color: Color(0xff434C6D)),
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
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SucessDialoug(),
                              ),
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
                    onPressed: () {},
                    style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(
                        Colors.pinkAccent,
                      ),
                    ),
                    child: Text(
                      'Verify',
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
