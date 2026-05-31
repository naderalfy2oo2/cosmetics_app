import 'package:cosmetics/auth/signIn.dart';
import 'package:cosmetics/constants/app_image.dart';
import 'package:cosmetics/forget_Password/forget.dart';
import 'package:cosmetics/helper_methods.dart';

import 'package:cosmetics/widget/elvatedButton_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../service/api_login.dart';
import '../service/dio_helper.dart';
import '../service/snackbar.dart';
import '../views/navigation.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  int? _dropdownValue = 20;

  void dropdownCallback(int? selectedValue) {
    if (selectedValue is int) {
      setState(() {
        _dropdownValue = selectedValue;
      });
    }
  }

  bool isVisible = true;
  final _formKey = GlobalKey<FormState>();

  final TextEditingController countryCodeController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Form(
          key: _formKey,
          child: SingleChildScrollView(
            padding: EdgeInsets.all(13),
            child: Column(
              children: [
                SizedBox(height: 40.h),

                AppImage(image: 'login.png', width: 284.w, height: 227.h),
                SizedBox(height: 25.h),

                Text(
                  "Login Now",
                  style: TextStyle(
                    color: Color(0xff434C6D),
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                  ),
                ),

                SizedBox(height: 14.h),

                Text(
                  "Please enter the details below to continue",
                  style: TextStyle(
                    color: Color(0xff8E8EA9),
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),

                SizedBox(height: 25.h),

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
                          DropdownMenuItem(child: Text("ِ+20"), value: 20),
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
                          controller: phoneController,
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

                TextFormField(
                  controller: passwordController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Enter password';
                    }
                    if (value.length < 6) {
                      return 'Password is short';
                    }
                    return null;
                  },

                  obscureText: isVisible,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),

                    hintText: "Your Password",

                    hintStyle: TextStyle(
                      color: Color(0xff8E8EA9),
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          isVisible = !isVisible;
                        });
                      },
                      icon: Icon(
                        isVisible ? Icons.visibility_off : Icons.visibility,
                      ),
                    ),
                  ),
                ),

                Align(
                  alignment: AlignmentGeometry.centerRight,
                  child: TextButton(
                    onPressed: () {
                      goTo(page: ForgetView());
                    },
                    child: Text(
                      "Forget Password?",
                      style: TextStyle(
                        color: Color(0xffD75D72),
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 43.h),

                ElvatedbuttonWidget(
                  title: 'Login',
                  onPressed: () async {
                    if (!_formKey.currentState!.validate()) return;

                    setState(() {
                      isLoading = true;
                    });

                    final result = await LoginApi.login(
                      password: passwordController.text.trim(),
                      countryCode: "+$_dropdownValue",
                      phoneNumber: phoneController.text.trim(),
                    );

                    setState(() {
                      isLoading = false;
                    });

                    print("LOGIN RESULT => $result");

                    if (result == null) {
                      Snack.error(context, "Login failed");
                      return;
                    }

                    // token
                    final token = result["token"];

                    if (token != null) {
                      DioHelper.setToken(token);
                      Snack.success(context, "Login Success ");
                    } else {
                      Snack.error(context, "Token missing ");
                      return;
                    }

                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const NavigationHomeView(),
                      ),
                    );
                  },
                ),

                SizedBox(height: 86.h),

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
                        goTo(page: Signin());
                      },
                      child: Text(
                        "Register",
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
