import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ElvatedbuttonWidget extends StatefulWidget {
  final String title;
  final VoidCallback onPressed;

  final color;

  const ElvatedbuttonWidget({
    super.key,
    required this.title,
    this.color,
    required this.onPressed,
  });

  @override
  State<ElvatedbuttonWidget> createState() => _ElvatedbuttonWidgetState();
}

class _ElvatedbuttonWidgetState extends State<ElvatedbuttonWidget> {
  @override
  Widget build(BuildContext context) {
    bool isLoading = false;
    return SizedBox(
      width: 268.w,
      height: 65.h,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(backgroundColor: Color(0xffD75D72)),

        onPressed: widget.onPressed,
        child: isLoading
            ? const CircularProgressIndicator(color: Colors.white)
            : Text(
                widget.title,
                style: const TextStyle(color: Color(0xffFFFFFF)),
              ),
      ),
    );
  }
}
