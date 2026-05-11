import 'package:cosmetics/auth/signIn.dart';
import 'package:cosmetics/auth/verify_code.dart';
import 'package:cosmetics/service/dio_helper.dart';
import 'package:cosmetics/views/cateories.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'auth/login.dart';
import 'views/check_out.dart';
import 'views/home.dart';
import 'views/navigation.dart';

void main() {
  runApp(CosmeticsApp());
  DioHelper.init();
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
        home: NavigationHomeView(),
      ),
    );
  }
}
