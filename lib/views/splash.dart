import 'package:flutter/material.dart';

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
              Image.asset("assets/images/splash.png", width: 200, height: 200),

              SizedBox(height: 0),
              Text(
                "COSMATICS",
                style: TextStyle(
                  color: Color(0xff434C6D),
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                ),
              ),

              Image.asset("assets/images/splash2.png"),
            ],
          ),
        ),
      ),
    );
  }
}
