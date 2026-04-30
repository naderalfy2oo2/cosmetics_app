import 'package:cosmetics/constants/app_image.dart';
import 'package:cosmetics/widget/elvatedButton_widget.dart';
import 'package:cosmetics/widget/text_form.dart';
import 'package:cosmetics/widget/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Signin extends StatefulWidget {
  const Signin({super.key});

  @override
  State<Signin> createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  int? _dropdownValue = 02;

  void dropdownCallback(int? selectedValue) {
    if (selectedValue is int) {
      setState(() {
        _dropdownValue = selectedValue;
      });
    }
  }

  bool isobscuretext = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 40.h),
              Center(
                child: AppImage(image: 'splash.png', width: 67.w, height: 62.h),
              ),

              SizedBox(height: 40.h),

              Text(
                "Create Account",
                style: TextStyle(
                  color: Color(0xff434C6D),
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                ),
              ),

              SizedBox(height: 50.h),
              TextFormWidget(labeltext: 'Your Name', hinttext: 'Sara Samer'),

              SizedBox(height: 38.h),

              TextFormWidget(
                labeltext: 'Email',
                hinttext: 'amramer522@gmail.com',
              ),

              SizedBox(height: 33.h),

              Row(
                children: [
                  DecoratedBox(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Color(0xff434C6D).withValues(alpha: .40),
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: DropdownButton<int>(
                      padding: EdgeInsets.all(10),

                      borderRadius: BorderRadius.circular(10),

                      items: [
                        DropdownMenuItem(child: Text("ِ+02"), value: 02),
                        DropdownMenuItem(child: Text("+099"), value: 099),
                        DropdownMenuItem(child: Text("+0123"), value: 0123),
                      ],
                      value: _dropdownValue,
                      onChanged: dropdownCallback,
                    ),
                  ),
                  SizedBox(width: 5.w),

                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        decoration: InputDecoration(
                          labelText: "Phone Number",
                          hintStyle: TextStyle(
                            color: Color(0xff8E8EA9),
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xff8E8EA9),

                              style: BorderStyle.solid,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 16.h),
              Padding(
                padding: const EdgeInsets.all(13),
                child: TextWidget(hintText: 'Create your password'),
              ),

              SizedBox(height: 16.h),
              Padding(
                padding: const EdgeInsets.all(13),
                child: TextWidget(hintText: 'Confirm password'),
              ),

              SizedBox(height: 16.h),

              ElvatedbuttonWidget(title: 'Next'),
            ],
          ),
        ),
      ),
    );
  }
}
