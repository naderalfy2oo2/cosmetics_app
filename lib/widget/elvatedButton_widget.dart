import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ElvatedbuttonWidget extends StatelessWidget {
  final String title;
  final color;

  const ElvatedbuttonWidget({super.key, required this.title, this.color});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 268.w,
      height: 65.h,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(backgroundColor: Color(0xffD75D72)),

        onPressed: () {},
        child: Text(title, style: TextStyle(color: Color(0xffFFFFFF))),
      ),
    );
  }
}
