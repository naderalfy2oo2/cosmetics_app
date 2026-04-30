import 'package:cosmetics/auth/login.dart';
import 'package:cosmetics/auth/verify_code.dart';
import 'package:cosmetics/views/onboarding.dart';
import 'package:cosmetics/views/splash.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(CosmeticsApp());
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
        theme: ThemeData(scaffoldBackgroundColor: Color(0xffD9D9D9)),
        debugShowCheckedModeBanner: false,
        home: Login(),
      ),
    );
  }
}
