import 'package:cosmetics/helper_methods.dart';
import 'package:cosmetics/service/dio_helper.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'views/navigation.dart';
import 'views/onboarding.dart';

void main() {
  runApp(CosmeticsApp());
  WidgetsFlutterBinding.ensureInitialized();
}

class CosmeticsApp extends StatelessWidget {
  const CosmeticsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(390, 844),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        navigatorKey: navKey,
        theme: ThemeData(scaffoldBackgroundColor: Color(0xffD9D9D9)),
        debugShowCheckedModeBanner: false,
        home: OnboardingView(),
      ),
    );
  }
}
