import 'package:flutter/material.dart';

class Onboarding1Widget extends StatelessWidget {
  const Onboarding1Widget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          AppBar(
            backgroundColor: Color(0xffD9D9D9),
            actions: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Skip",
                  style: TextStyle(
                    color: Color(0xff434C6D),
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),

          Column(
            children: [
              Image.asset(
                "assets/images/on_boarding1.png",
                width: 300,
                height: 300,
              ),

              SizedBox(height: 28),

              Text(
                "WELCOME!",
                style: TextStyle(
                  color: Color(0xff434C6D),
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 10),

              Text(
                "Makeup has the power to transform your\nmood and empowers you to be a more\n               confident person.",
                style: TextStyle(color: Color(0xff434C6D)),
              ),

              SizedBox(height: 30),

              SizedBox(
                height: 50,
                width: 50,
                child: IconButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xff434C6D),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusGeometry.circular(10),
                    ),
                  ),
                  onPressed: () {},
                  icon: Icon(Icons.arrow_forward_ios, color: Color(0xffD9D9D9)),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
