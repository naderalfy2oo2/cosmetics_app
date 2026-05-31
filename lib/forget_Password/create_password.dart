import 'package:cosmetics/auth/login.dart';
import 'package:cosmetics/helper_methods.dart';
import 'package:cosmetics/service/api_resetPassword.dart';
import 'package:cosmetics/widget/elvatedButton_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

import '../constants/app_image.dart';
import '../service/snackbar.dart';
import '../widget/text_widget.dart';

class CreatePassword extends StatefulWidget {
  final String phone;
  const CreatePassword({super.key, required this.phone});

  @override
  State<CreatePassword> createState() => _CreatePasswordState();
}

class _CreatePasswordState extends State<CreatePassword> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  String _dropdownValue = "+20";

  void dropdownCallback(String? value) {
    setState(() {
      _dropdownValue = value!;
    });
  }

  bool loading = false;
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
                SizedBox(height: 46.h),

                Text(
                  "Create Password",
                  style: TextStyle(
                    color: Color(0xff434C6D),
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 40.h),

                Text(
                  "The password should have at least\n                      6 characters",
                  style: TextStyle(
                    color: Color(0xff8E8EA9),
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),

                SizedBox(height: 80.h),

                Padding(
                  padding: const EdgeInsets.all(13),
                  child: TextWidget(
                    hintText: 'New password',
                    Controller: newPasswordController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Enter password';
                      }
                      if (value.length < 6) {
                        return 'Enter short password';
                      }
                      return null;
                    },
                  ),
                ),

                SizedBox(height: 16.h),

                Padding(
                  padding: const EdgeInsets.all(13),
                  child: TextWidget(
                    hintText: 'Confirm password',
                    Controller: confirmPasswordController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Enter confirm  password';
                      }
                      if (value.length < 6) {
                        return 'Enter  short confirm  password';
                      }
                      return null;
                    },
                  ),
                ),

                SizedBox(height: 72.h),

                SizedBox(
                  width: 268.w,
                  height: 65.h,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xffD75D72),
                    ),

                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return Dialog(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadiusGeometry.circular(10),
                            ),
                            child: Container(
                              width: 360.w,
                              padding: EdgeInsets.all(46),
                              height: 500.h,

                              child: SingleChildScrollView(
                                child: Column(
                                  children: [
                                    SizedBox(height: 30.h),

                                    Lottie.asset("assets/lotties/sucess.json"),

                                    SizedBox(height: 26.h),

                                    Text(
                                      "Password Created!",
                                      style: TextStyle(
                                        color: Color(0xff434C6D),
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),

                                    SizedBox(height: 8.h),
                                    Text(
                                      "Congratulations! Your password\nhas been successfully created",
                                      style: TextStyle(
                                        color: Color(0xff8E8EA9),
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),

                                    SizedBox(height: 23.h),

                                    ElvatedbuttonWidget(
                                      title: "Return to login",
                                      onPressed: () async {
                                        if (loading) return;

                                        if (!_formKey.currentState!.validate())
                                          return;

                                        if (newPasswordController.text !=
                                            confirmPasswordController.text) {
                                          Snack.error(
                                            context,
                                            "Passwords do not match",
                                          );
                                          return;
                                        }

                                        setState(() {
                                          loading = true;
                                        });

                                        final success = await resetPasswordApi
                                            .resetPassword(
                                              countryCode: _dropdownValue,
                                              phoneNumber: widget.phone,
                                              newPassword: newPasswordController
                                                  .text
                                                  .trim(),
                                              confirmPassword:
                                                  confirmPasswordController.text
                                                      .trim(),
                                            );

                                        setState(() {
                                          loading = false;
                                        });

                                        print(
                                          "resetPassword result => $success",
                                        );
                                        if (!context.mounted) return;

                                        if (success) {
                                          Snack.success(
                                            context,
                                            "resetPassword Successfully",
                                          );

                                          goTo(page: Login());
                                        }
                                        ;
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    },
                    child: Text(
                      "Confirm",
                      style: TextStyle(
                        color: Color(0xffFFFFFF),
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
