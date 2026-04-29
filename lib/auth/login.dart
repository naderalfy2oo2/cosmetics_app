import 'package:cosmetics/widget/elvatedButton_widget.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  int? _dropdownValue = 02;

  void dropdownCallback(int? selectedValue) {
    if (selectedValue is int) {
      setState(() {
        _dropdownValue = selectedValue;
      });
    }
  }

  bool isVisible = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          padding: EdgeInsets.all(13),
          child: Column(
            children: [
              SizedBox(height: 40),
              Image.asset("assets/images/login.png", width: 284, height: 227),
              SizedBox(height: 25),

              Text(
                "Login Now",
                style: TextStyle(
                  color: Color(0xff434C6D),
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                ),
              ),

              SizedBox(height: 14),

              Text(
                "Please enter the details below to continue",
                style: TextStyle(
                  color: Color(0xff8E8EA9),
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),

              SizedBox(height: 25),

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
                  SizedBox(width: 5),

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

              TextFormField(
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
                  onPressed: () {},
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

              SizedBox(height: 43),

              ElvatedbuttonWidget(title: 'Login'),

              SizedBox(height: 86),

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

                  //SizedBox(height: 1),
                  TextButton(
                    onPressed: () {},
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
    );
  }
}
