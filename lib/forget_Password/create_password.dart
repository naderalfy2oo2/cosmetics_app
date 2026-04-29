import 'package:cosmetics/widget/elvatedButton_widget.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../widget/text_form.dart';
import '../widget/text_widget.dart';
import '../widget/textformfield.dart';

class CreatePassword extends StatelessWidget {
  const CreatePassword({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
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
            SizedBox(height: 46),

            Text(
              "Create Password",
              style: TextStyle(
                color: Color(0xff434C6D),
                fontSize: 24,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: 40),

            Text(
              "The password should have at least\n                      6 characters",
              style: TextStyle(
                color: Color(0xff8E8EA9),
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),

            SizedBox(height: 80),

            TextWidget(hintText: 'Confirm password'),

            SizedBox(height: 16),

            TextWidget(hintText: 'New password'),

            SizedBox(height: 72),

            SizedBox(
              width: 268,
              height: 65,
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
                          width: 360,
                          padding: EdgeInsets.all(46),
                          height: 500,

                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                SizedBox(height: 30),

                                Lottie.asset("assets/lotties/sucess.json"),

                                SizedBox(height: 26),

                                Text(
                                  "Password Created!",
                                  style: TextStyle(
                                    color: Color(0xff434C6D),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),

                                SizedBox(height: 8),
                                Text(
                                  "Congratulations! Your password\nhas been successfully created",
                                  style: TextStyle(
                                    color: Color(0xff8E8EA9),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),

                                SizedBox(height: 23),

                                ElvatedbuttonWidget(title: "Return to login"),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
                child: Text(
                  "Confirm",
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
