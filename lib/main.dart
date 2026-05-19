import 'package:cosmetics/service/dio_helper.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'views/navigation.dart';

void main() {
  runApp(CosmeticsApp());
  WidgetsFlutterBinding.ensureInitialized();

  //DioHelper.init();
  DioHelper.setToken(
    'eyJhbGciOiJIUzUxMiIsInR5cCI6IkpXVCJ9.eyJuYW1laWQiOiIxMDI2NSIsInVuaXF1ZV9uYW1lIjoibmFkZXIxMiIsImVtYWlsIjoiYWw1MTczOTc3QGdtYWlsLmNvbSIsInJvbGUiOiJDdXN0b21lciIsIm5iZiI6MTc3OTE5ODc4OSwiZXhwIjoxNzc5MTk5Mzg5LCJpYXQiOjE3NzkxOTg3ODksImlzcyI6IkNvc21hdGljc0FwaSIsImF1ZCI6IkNvc21hdGljc1VzZXJzIn0.BnBTyvip76lW5KeVqYfvleX63Xq6Rr7638Oc3OlyXXO6clUKw1Vu8HJPRWbpisBHMvZMU3mr3ogkxAHAGAc-0A',
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
