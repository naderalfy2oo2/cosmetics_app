import 'package:flutter/material.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  int current = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,

          children: [
            current == 2
                ? SizedBox()
                : Align(
                    alignment: AlignmentGeometry.topRight,
                    child: TextButton(
                      onPressed: () {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) => OnboardingViwe1(),
                        //   ),
                        // );
                      },
                      child: Text('Skip'),
                    ),
                  ),

            Center(
              child: Image.asset(list[current].image, height: 300, width: 300),
            ),
            SizedBox(height: 27.92),

            Text(
              list[current].title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xff434C6D),
              ),
            ),

            SizedBox(height: 10),

            Align(
              alignment: AlignmentGeometry.center,
              child: Text(list[current].subTitle),
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
                  setState(() {
                    if (current < 2) {
                      current++;
                      print(current);
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

class Model {
  final String image;
  final String title;
  final String subTitle;

  Model({required this.image, required this.title, required this.subTitle});
}

final list = [
  Model(
    image: 'assets/images/on_boarding0.png',
    title: 'WELCOME!',
    subTitle: "Allow notifications for new makeup & cosmetics offers.",
  ),
  Model(
    image: 'assets/images/on_boarding1.png',
    title: 'SEARCH & PICK',
    subTitle:
        "We have dedicated set of products and routines hand picked for every skin type.",
  ),
  Model(
    image: 'assets/images/on_boarding2.png',
    title: "PUCH NOTIFICATIONS ",
    subTitle: "Allow notifications for new makeup & cosmetics offers.",
  ),
];
