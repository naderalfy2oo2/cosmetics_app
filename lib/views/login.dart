import 'package:cosmetics/views/signIn.dart';
import 'package:flutter/material.dart';

class Loginview extends StatefulWidget {
  const Loginview({super.key});

  @override
  State<Loginview> createState() => _LoginviewState();
}

class _LoginviewState extends State<Loginview> {
  List<String> Phone = ['+02', '+099', '+0123'];
  String? currentPhone = '+02';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/images/login.png'),

                SizedBox(height: 25),
                Text(
                  'Login Now',
                  style: TextStyle(
                    color: Color(0xff434C6D),
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                SizedBox(height: 14),

                Text(
                  'Please enter the details below to continue',
                  style: TextStyle(color: Color(0xff8E8EA9)),
                ),

                SizedBox(height: 41),

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
                              borderSide: BorderSide(style: BorderStyle.solid),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 8),

                Center(
                  child: SizedBox(
                    width: 364,
                    height: 47,
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Your Password',

                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6),
                          borderSide: BorderSide(style: BorderStyle.solid),
                        ),
                        suffixIcon: IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.visibility_off),
                        ),
                      ),
                    ),
                  ),
                ),

                Align(
                  alignment: AlignmentGeometry.centerRight,
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      'Forget Password?',
                      style: TextStyle(color: Colors.pinkAccent),
                    ),
                  ),
                ),

                SizedBox(height: 43),

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
                        MaterialPageRoute(builder: (context) => SignInView()),
                      );
                    },
                    child: Text('Login', style: TextStyle(color: Colors.white)),
                  ),
                ),

                SizedBox(height: 86),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Don’t have an account?'),

                    TextButton(
                      onPressed: () {},
                      child: Text(
                        'Register',
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
    );
  }
}
