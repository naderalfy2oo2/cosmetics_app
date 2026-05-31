import 'package:cosmetics/forget_Password/verify_forget.dart';
import 'package:cosmetics/service/api_forgetPassword.dart';
import 'package:cosmetics/widget/elvatedButton_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../auth/verify_code.dart';
import '../constants/app_image.dart';
import '../helper_methods.dart';
import '../service/snackbar.dart';

class ForgetView extends StatefulWidget {
  const ForgetView({super.key});

  @override
  State<ForgetView> createState() => _ForgetViewState();
}

class _ForgetViewState extends State<ForgetView> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController countryCodeController = TextEditingController();

  final TextEditingController phoneNumberController = TextEditingController();

  bool isLoading = false;

  String _dropdownValue = '+20';

  void dropdownCallback(String? value) {
    setState(() {
      _dropdownValue = value!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xffD9D9D9),
          leading: Container(
            decoration: BoxDecoration(
              color: Color(0xffD9D9D9),
              shape: BoxShape.circle,
            ),
            child: IconButton(
              onPressed: () {},
              icon: Icon(Icons.arrow_back_ios),
            ),
          ),
        ),

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
                  "Forget Password",
                  style: TextStyle(
                    color: Color(0xff434C6D),
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                  ),
                ),

                SizedBox(height: 40),

                Text(
                  "Please enter your phone number below\n             to recovery your password.",
                  style: TextStyle(
                    color: Color(0xff8E8EA9),
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),

                SizedBox(height: 45.h),

                Padding(
                  padding: const EdgeInsets.all(13),
                  child: Row(
                    children: [
                      DecoratedBox(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Color(0xff434C6D).withValues(alpha: .40),
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),

                        // child: DropdownButton<String>(
                        //   padding: EdgeInsets.all(10),

                        //   borderRadius: BorderRadius.circular(10),

                        //   items: [
                        //     DropdownMenuItem(child: Text("ِ+20"), value: '20'),
                        //     DropdownMenuItem(child: Text("+099"), value: '099'),
                        //     DropdownMenuItem(
                        //       child: Text("+0123"),
                        //       value: '0123',
                        //     ),
                        //   ],
                        //   value: _dropdownValue,
                        //   onChanged: dropdownCallback,
                        // ),
                        child: DropdownButton<String>(
                          value: _dropdownValue,

                          padding: EdgeInsets.all(10),
                          borderRadius: BorderRadius.circular(10),

                          items: const [
                            DropdownMenuItem(value: '+20', child: Text('+20')),

                            DropdownMenuItem(
                              value: '+099',
                              child: Text('+099'),
                            ),

                            DropdownMenuItem(
                              value: '+0123',
                              child: Text('+0123'),
                            ),
                          ],

                          onChanged: (value) {
                            setState(() {
                              _dropdownValue = value!;
                            });
                          },
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
                ),

                SizedBox(height: 56.h),

                ElvatedbuttonWidget(
                  title: 'Next',
                  onPressed: () async {
                    if (isLoading) return;

                    if (!_formKey.currentState!.validate()) return;

                    setState(() {
                      isLoading = true;
                    });

                    final success = await forgetPasswordApi.forgetPassword(
                      countryCode: _dropdownValue,
                      phoneNumber: phoneNumberController.text.trim(),
                    );

                    setState(() {
                      isLoading = false;
                    });

                    print("verify result => $success");

                    if (success != null) {
                      Snack.success(context, " verify Successfully");

                      goTo(
                        page: VerifyForget(
                          countryCode: _dropdownValue,
                          phoneNumber: phoneNumberController.text.trim(),
                        ),
                      );
                    } else {
                      Snack.error(context, " verify Failed");
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
