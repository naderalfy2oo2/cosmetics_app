import 'package:cosmetics/components/app_Image.dart';
import 'package:cosmetics/views/login.dart';
import 'package:cosmetics/widget/textformfield.dart';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class CreatePasswordView extends StatelessWidget {
  const CreatePasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                //Image.asset('assets/images/splash.png', height: 62, width: 67),
                AppImage(image: "splash.png"),

                SizedBox(height: 40),

                Text(
                  'Create Password',

                  style: TextStyle(
                    color: Color(0xff434C6D),
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),

                Align(
                  alignment: AlignmentGeometry.center,
                  child: Text(
                    'The password should have at least\n6 characters.',
                  ),
                ),

                SizedBox(height: 25),

                Textformfield(label: 'New Password', isObscure: true),

                textform(label: 'Confirm Password', isVisiblePassword: true),

                SizedBox(height: 72),

                SizedBox(
                  height: 65,
                  width: 268,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(
                        Colors.pinkAccent,
                      ),
                    ),
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return Dialog(
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
                                  style: TextStyle(color: Color(0xff8E8EA9)),
                                ),
                                SizedBox(height: 23),

                                SizedBox(
                                  height: 60,
                                  width: 268,
                                  child: ElevatedButton(
                                    style: ButtonStyle(
                                      backgroundColor: WidgetStatePropertyAll(
                                        Color(0xffD75D72),
                                      ),
                                    ),
                                    onPressed: () {
                                      Navigator.pushAndRemoveUntil(
                                        context,
                                        MaterialPageRoute(
                                          builder: (_) => Loginview(),
                                        ),
                                        (route) => false,
                                      );
                                    },
                                    child: Text(
                                      'Go to home',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    },
                    child: Text(
                      'Confirm',
                      style: TextStyle(color: Colors.white),
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
