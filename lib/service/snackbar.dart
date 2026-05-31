import 'package:flutter/material.dart';

class Snack {
  static void success(BuildContext context, String msg) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(backgroundColor: Colors.green, content: Text(msg)));
  }

  static void error(BuildContext context, String msg) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(backgroundColor: Colors.red, content: Text(msg)));
  }
}
