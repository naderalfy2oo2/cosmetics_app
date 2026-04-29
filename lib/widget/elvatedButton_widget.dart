import 'package:flutter/material.dart';

class ElvatedbuttonWidget extends StatelessWidget {
  final String title;
  final color;

  const ElvatedbuttonWidget({super.key, required this.title, this.color});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 268,
      height: 65,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(backgroundColor: Color(0xffD75D72)),

        onPressed: () {},
        child: Text(title, style: TextStyle(color: Color(0xffFFFFFF))),
      ),
    );
  }
}
