import 'package:cosmetics/auth/login.dart';
import 'package:cosmetics/constants/app_image.dart';
import 'package:cosmetics/widget/elvatedButton_widget.dart';
import 'package:cosmetics/widget/text_form.dart';
import 'package:cosmetics/widget/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../helper_methods.dart';
import '../service/api_register.dart';
import '../service/snackbar.dart';
import 'verify_code.dart';

class Signin extends StatefulWidget {
  const Signin({super.key});

  @override
  State<Signin> createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  String _dropdownValue = "+20";

  void dropdownCallback(String? value) {
    setState(() {
      _dropdownValue = value!;
    });
  }

  bool isobscuretext = false;

  final _formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();

  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: 40.h),
                Center(
                  child: AppImage(
                    image: 'splash.png',
                    width: 67.w,
                    height: 62.h,
                  ),
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
                TextFormWidget(
                  labeltext: 'Your Name',
                  hinttext: 'Sara Samer',
                  controller: nameController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'enter name';
                    }
                    return null;
                  },
                ),

                SizedBox(height: 38.h),

                TextFormWidget(
                  controller: emailController,
                  labeltext: 'Email',
                  hinttext: 'amramer522@gmail.com',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Enter email';
                    }
                    if (value.length < 8) {
                      return 'email inCorrect';
                    }
                    return null;
                  },
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
                      child: DropdownButton<String>(
                        padding: const EdgeInsets.all(10),
                        borderRadius: BorderRadius.circular(10),
                        value: _dropdownValue,
                        onChanged: dropdownCallback,
                        items: const [
                          DropdownMenuItem(value: "+20", child: Text("+20")),
                          DropdownMenuItem(value: "+099", child: Text("+099")),
                          DropdownMenuItem(
                            value: "+0123",
                            child: Text("+0123"),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 5.w),

                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          controller: phoneNumberController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Enter Phone number ';
                            }
                            if (value.length < 6) {
                              return 'short phone number ';
                            }
                            return null;
                          },

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
                  child: TextWidget(
                    Controller: passwordController,

                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Enter password';
                      }
                      if (value.length < 6) {
                        return 'Enter short password';
                      }
                      return null;
                    },
                    hintText: 'Create your password',
                  ),
                ),

                SizedBox(height: 16.h),
                Padding(
                  padding: const EdgeInsets.all(13),
                  child: TextWidget(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Confirm your password';
                      }
                      if (value != passwordController.text) {
                        return 'The password does not match';
                      }
                      return null;
                    },
                    Controller: confirmPasswordController,
                    hintText: 'Confirm password',
                  ),
                ),

                SizedBox(height: 16.h),

                ElvatedbuttonWidget(
                  onPressed: () async {
                    if (isLoading) return;

                    if (!_formKey.currentState!.validate()) return;

                    setState(() {
                      isLoading = true;
                    });

                    final success = await SigninApi.register(
                      name: nameController.text.trim(),
                      email: emailController.text.trim(),
                      countryCode: _dropdownValue,
                      phoneNumber: phoneNumberController.text.trim(),
                      password: passwordController.text.trim(),
                      confirmPassword: confirmPasswordController.text.trim(),
                    );

                    setState(() {
                      isLoading = false;
                    });

                    print("REGISTER RESULT => $success");

                    if (success) {
                      Snack.success(context, "Account Created Successfully");

                      goTo(
                        page: VerifyCode(
                          countryCode: _dropdownValue,
                          phoneNumber: phoneNumberController.text.trim(),
                        ),
                      );
                    } else {
                      Snack.error(context, "Registration Failed");
                    }
                  },
                  title: 'Next',
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don’t have an account?",
                      style: TextStyle(
                        color: Color(0xff434C6D),
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                    ),

                    TextButton(
                      onPressed: () {
                        goTo(page: Login());
                      },
                      child: Text(
                        "Login",
                        style: TextStyle(
                          color: Color(0xffD75D72),
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
