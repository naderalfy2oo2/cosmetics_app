import 'package:cosmetics/service/dio_helper.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'views/navigation.dart';

void main() {
  runApp(CosmeticsApp());
  WidgetsFlutterBinding.ensureInitialized();

  //DioHelper.init();
  DioHelper.setToken(
    'eyJhbGciOiJIUzUxMiIsInR5cCI6IkpXVCJ9.eyJuYW1laWQiOiIxMDI2NSIsInVuaXF1ZV9uYW1lIjoibmFkZXIxMiIsImVtYWlsIjoiYWw1MTczOTc3QGdtYWlsLmNvbSIsInJvbGUiOiJDdXN0b21lciIsIm5iZiI6MTc3OTE5NzA0OCwiZXhwIjoxNzc5MTk3NjQ4LCJpYXQiOjE3NzkxOTcwNDgsImlzcyI6IkNvc21hdGljc0FwaSIsImF1ZCI6IkNvc21hdGljc1VzZXJzIn0.B3b3_R1MSGT17H0Gb5_xNi1jLHw1SOyh8fJAoHaoAA9jUE__0SzNtvomKXSwnmz8pCvCX2IoLeo4MufedQzM7Q',
  );
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
