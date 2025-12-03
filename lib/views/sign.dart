import 'package:cosmetics/views/verify_code.dart';
import 'package:flutter/material.dart';

class SignInView extends StatefulWidget {
  const SignInView({super.key});

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
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
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/splash.png',
                    height: 62,
                    width: 67,
                  ),
                  SizedBox(height: 40),
                  Text(
                    'Create Account',
                    style: TextStyle(
                      color: Color(0xff434C6D),
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),

                  SizedBox(height: 72),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Your Name',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide(style: BorderStyle.solid),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: 33),

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
                          height: 47,
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

                  SizedBox(height: 16),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.visibility),
                        ),
                        labelText: 'Create your password',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide(style: BorderStyle.solid),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: 16),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.visibility_off),
                        ),
                        labelText: 'Confirm Password',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide(style: BorderStyle.solid),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: 90),

                  SizedBox(
                    width: 268,
                    height: 65,
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
                            builder: (context) => VerifyCodeView(),
                          ),
                        );
                      },
                      child: Text(
                        'Next',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(' Have an account?'),

                      TextButton(
                        onPressed: () {},
                        child: Text(
                          'Login',
                          style: TextStyle(color: Color(0xffD75D72)),
                        ),
                      ),
                    ],
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
