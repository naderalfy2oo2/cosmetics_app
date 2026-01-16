import 'package:cosmetics/components/app_Image.dart';
import 'package:cosmetics/views/login.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class CreatePasswordView extends StatefulWidget {
  const CreatePasswordView({super.key});

  @override
  State<CreatePasswordView> createState() => _CreatePasswordViewState();
}

class _CreatePasswordViewState extends State<CreatePasswordView> {
  bool _isObscure = false;
  bool _isVisiblePassword = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                //Image.asset('assets/images/splash.png', height: 62, width: 67),
                AppImage(image: "splash.png"),

                SizedBox(height: 40),

                Text(
                  'Create Password',

                  style: TextStyle(
                    color: Color(0xff434C6D),
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),

                Center(
                  child: Text(
                    'The password should have at least\n6 characters.',
                  ),
                ),

                SizedBox(height: 25),

                // Padding(
                //   padding: const EdgeInsets.all(8.0),
                //   child: TextFormField(
                //     decoration: InputDecoration(
                //       labelText: 'New Password',
                //       suffixIcon: IconButton(
                //         onPressed: () {},
                //         icon: Icon(Icons.visibility),
                //       ),
                //       border: OutlineInputBorder(
                //         borderRadius: BorderRadius.circular(20),
                //       ),
                //     ),
                //   ),
                // ),
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

                SizedBox(height: 16),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    obscureText: !_isVisiblePassword,
                    decoration: InputDecoration(
                      labelText: 'New Password',
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            _isVisiblePassword = !_isVisiblePassword;
                          });
                        },
                        icon: Icon(
                          _isVisiblePassword
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 72),

                SizedBox(
                  height: 65,
                  width: 268,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(
                        Colors.pinkAccent,
                      ),
                    ),
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return Dialog(
                            child: Column(
                              children: [
                                Lottie.asset(
                                  'assets/lotties/sucess.json',

                                  width: 150,
                                  height: 150,
                                  fit: BoxFit.cover,
                                ),

                                SizedBox(height: 10),

                                Text(
                                  'Account Activated!',
                                  style: TextStyle(
                                    color: Color(0xff434C6D),
                                    fontSize: 15,
                                  ),
                                ),

                                Text(
                                  'Congratulations! Your account\nhas been successfully activated',
                                  style: TextStyle(color: Color(0xff8E8EA9)),
                                ),
                                SizedBox(height: 23),

                                SizedBox(
                                  height: 60,
                                  width: 268,
                                  child: ElevatedButton(
                                    style: ButtonStyle(
                                      backgroundColor: WidgetStatePropertyAll(
                                        Color(0xffD75D72),
                                      ),
                                    ),
                                    onPressed: () {
                                      Navigator.pushAndRemoveUntil(
                                        context,
                                        MaterialPageRoute(
                                          builder: (_) => Loginview(),
                                        ),
                                        (route) => false,
                                      );
                                    },
                                    child: Text(
                                      'Go to home',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    },
                    child: Text(
                      'Confirm',
                      style: TextStyle(color: Colors.white),
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
