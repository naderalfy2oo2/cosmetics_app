import 'package:flutter/material.dart';

void goTo(BuildContext context, {required Widget page}) {
  Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(builder: (context) => page),
    (routes) => false,
  );
}
