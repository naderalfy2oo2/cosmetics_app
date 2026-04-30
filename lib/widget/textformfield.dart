import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Textformfield extends StatefulWidget {
  const Textformfield({
    super.key,
    required String label,
    required bool isObscure,
  });

  @override
  State<Textformfield> createState() => _TextformfieldState();
}

class _TextformfieldState extends State<Textformfield> {
  bool _isObscure = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
            obscureText: !_isObscure,
            decoration: InputDecoration(
              labelText: 'New Password',
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    _isObscure = !_isObscure;
                  });
                },
                icon: Icon(
                  _isObscure ? Icons.visibility : Icons.visibility_off,
                ),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
        ),
        SizedBox(height: 16.h),
      ],
    );
  }
}

class textform extends StatefulWidget {
  const textform({
    super.key,
    required String label,
    required bool isVisiblePassword,
  });

  @override
  State<textform> createState() => _textformState();
}

class _textformState extends State<textform> {
  bool _isVisiblePassword = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        obscureText: !_isVisiblePassword,
        decoration: InputDecoration(
          labelText: 'Confirm Password',
          suffixIcon: IconButton(
            onPressed: () {
              setState(() {
                _isVisiblePassword = !_isVisiblePassword;
              });
            },
            icon: Icon(
              _isVisiblePassword ? Icons.visibility : Icons.visibility_off,
            ),
          ),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
        ),
      ),
    );
  }
}
