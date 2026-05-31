import 'package:flutter/material.dart';

final navKey = GlobalKey<NavigatorState>();
void goTo({required Widget page}) {
  Navigator.push(
    navKey.currentContext!,
    MaterialPageRoute(builder: (_) => page),
  );
}

void goToWithoutback({required Widget page}) {
  Navigator.pushAndRemoveUntil(
    navKey.currentContext!,
    MaterialPageRoute(builder: (_) => page),
    (route) => false,
  );
}
