import 'package:cosmetics/views/login.dart';

import 'package:flutter/material.dart';

class OnboardingView2 extends StatelessWidget {
  const OnboardingView2({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Image.asset(
                    'assets/images/on_boarding2.png',
                    height: 300,
                    width: 300,
                  ),
                ),
                SizedBox(height: 27.92),

                Text(
                  'PUCH NOTIFICATIONS',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff434C6D),
                  ),
                ),

                SizedBox(height: 10),

                Align(
                  alignment: AlignmentGeometry.center,
                  child: Text(
                    'Allow notifications for new makeup &\n                  cosmetics offers.',
                  ),
                ),

                SizedBox(height: 30),

                Container(
                  decoration: BoxDecoration(
                    color: Color(0xff434C6D),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  height: 50,
                  width: 50,
                  child: IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Loginview()),
                      );
                    },
                    icon: Icon(Icons.arrow_forward_ios, color: Colors.white),
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
