import 'package:cosmetics/views/splash.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(CosmeticsApp());
}

class CosmeticsApp extends StatelessWidget {
  const CosmeticsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: SplashView());
  }
}
