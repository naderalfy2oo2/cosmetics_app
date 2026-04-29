import 'package:flutter/material.dart';

class Onboarding3Widget extends StatelessWidget {
  const Onboarding3Widget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Image.asset(
            "assets/images/onboarding3.png",
            height: 300,
            width: 300,
          ),
        ),
        SizedBox(height: 46),

        Text(
          "PUCH NOTIFICATIONS ",
          style: TextStyle(
            color: Color(0xff434C6D),
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),

        SizedBox(height: 10),

        Text(
          "Allow notifications for new makeup &\n                cosmetics offers.",
          style: TextStyle(
            color: Color(0xff434C6D),
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),

        SizedBox(height: 30),

        SizedBox(
          height: 65,
          width: 268,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Color(0xff434C6D)),
            onPressed: () {},
            child: Text(
              "let’s start!",
              style: TextStyle(color: Color(0xffD9D9D9)),
            ),
          ),
        ),
      ],
    );
  }
}
