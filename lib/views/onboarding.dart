import 'package:cosmetics/widget/onboarding1_widget.dart';
import 'package:cosmetics/widget/onboarding2_widget.dart';
import 'package:cosmetics/widget/onboarding3_widget.dart';
import 'package:flutter/material.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              child: PageView(
                children: [
                  Onboarding1Widget(),

                  Onboarding2Widget(),
                  Onboarding3Widget(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
