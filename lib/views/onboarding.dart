import 'package:cosmetics/views/home.dart';
import 'package:flutter/material.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  final list = [
    _model(
      images: "assets/images/on_boarding1.png",
      title: "WELCOME!",
      desc:
          "Makeup has the power to transform your \n mood and empowers you to be a more \n                confident person.",
    ),
    _model(
      images: "assets/images/on_boarding2.png",
      title: "SEARCH & PICK",
      desc:
          "We have dedicated set of products and \nroutines hand picked for every skin type.",
    ),
    _model(
      images: "assets/images/onboarding3.png",
      title: "PUCH NOTIFICATIONS ",
      desc:
          "Allow notifications for new makeup & \n             cosmetics offers.",
    ),
  ];

  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            currentIndex == 2
                ? SizedBox()
                : Align(
                    alignment: AlignmentGeometry.topRight,
                    child: TextButton(onPressed: () {}, child: Text('Skip')),
                  ),

            Center(
              child: Image.asset(
                list[currentIndex].images,
                height: 300,
                width: 300,
              ),
            ),
            SizedBox(height: 27.92),

            Text(
              list[currentIndex].title,
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
                list[currentIndex].desc,
                style: TextStyle(color: Color(0xff434C6D)),
              ),
            ),

            SizedBox(height: 30),

            currentIndex == 2
                ? Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: SizedBox(
                      width: 235,
                      height: 65,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xff434C6D),
                          minimumSize: Size(double.infinity, 50),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute<void>(
                              builder: (context) => const HomeView(),
                            ),
                          );
                        },
                        child: Text(
                          "let’s start!",
                          style: TextStyle(
                            color: Color(0xffD9D9D9),
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  )
                : Container(
                    decoration: BoxDecoration(
                      color: Color(0xff434C6D),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    height: 50,
                    width: 50,
                    child: IconButton(
                      onPressed: () {
                        setState(() {
                          if (currentIndex < list.length - 1) {
                            currentIndex++;
                          }
                        });
                      },
                      icon: Icon(Icons.arrow_forward_ios, color: Colors.white),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}

class _model {
  final String images;
  final String title;
  final String desc;

  _model({required this.images, required this.title, required this.desc});
}
