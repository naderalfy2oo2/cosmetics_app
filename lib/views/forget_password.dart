import 'package:cosmetics/views/create_password.dart';

import 'package:flutter/material.dart';

class ForgetPasswordView extends StatefulWidget {
  const ForgetPasswordView({super.key});

  @override
  State<ForgetPasswordView> createState() => _ForgetPasswordViewState();
}

class _ForgetPasswordViewState extends State<ForgetPasswordView> {
  List<String> Phone = ['+02', '+099', '+0123'];
  String? currentPhone = '+02';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Image.asset(
                    'assets/images/splash.png',
                    height: 62,
                    width: 67,
                  ),

                  SizedBox(height: 40),

                  Text(
                    'Forget Password',
                    style: TextStyle(
                      color: Color(0xff434C6D),
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),

                  Text(
                    'Please enter your phone number below\n             to recovery your password.',
                    style: TextStyle(color: Color(0xff8E8EA9)),
                  ),

                  SizedBox(height: 25),

                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 22),
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            border: BoxBorder.all(
                              style: BorderStyle.solid,
                              color: Color(0xff8E8EA9),
                            ),
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: DropdownButton<String>(
                            value: currentPhone,
                            items: Phone.map((item) {
                              return DropdownMenuItem<String>(
                                value: item,
                                child: Text(item),
                              );
                            }).toList(),
                            onChanged: (value) {
                              setState(() {
                                currentPhone = value;
                              });
                            },
                          ),
                        ),
                      ),

                      SizedBox(width: 6),
                      Flexible(
                        child: SizedBox(
                          height: 46,
                          width: 285,
                          child: TextFormField(
                            decoration: InputDecoration(
                              labelText: 'Phone Number',
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                  style: BorderStyle.solid,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 56),

                  SizedBox(
                    height: 65,
                    width: 265,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll(
                          Color(0xffD75D72),
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CreatePasswordView(),
                          ),
                        );
                      },
                      child: Text(
                        'Next',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
