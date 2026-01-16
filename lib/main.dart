import 'package:cosmetics/views/signIn.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(CosmeticsApp());
}

class CosmeticsApp extends StatelessWidget {
  const CosmeticsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(scaffoldBackgroundColor: Color(0xffD9D9D9)),
      debugShowCheckedModeBanner: false,
      home: SignInView(),
    );
  }
}
