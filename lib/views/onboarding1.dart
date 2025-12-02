import 'package:cosmetics/views/onboarding2.dart';
import 'package:flutter/material.dart';

class OnboardingViwe1 extends StatelessWidget {
  const OnboardingViwe1({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Align(
                alignment: AlignmentGeometry.topRight,
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => OnboardingView2(),
                      ),
                    );
                  },
                  child: Text('Skip'),
                ),
              ),
              Center(
                child: Image.asset(
                  'assets/images/on_boarding1.png',
                  height: 300,
                  width: 300,
                ),
              ),
              SizedBox(height: 27.92),

              Text(
                'SEARCH & PICK',
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
                  'We have dedicated set of products and \nroutines hand picked for every skin type.',
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
                      MaterialPageRoute(
                        builder: (context) => OnboardingView2(),
                      ),
                    );
                  },
                  icon: Icon(Icons.arrow_forward_ios, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
