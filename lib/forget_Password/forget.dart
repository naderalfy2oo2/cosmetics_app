import 'package:cosmetics/widget/elvatedButton_widget.dart';
import 'package:flutter/material.dart';

class ForgetView extends StatefulWidget {
  const ForgetView({super.key});

  @override
  State<ForgetView> createState() => _ForgetViewState();
}

class _ForgetViewState extends State<ForgetView> {
  int? _dropdownValue = 02;

  void dropdownCallback(int? selectedValue) {
    if (selectedValue is int) {
      setState(() {
        _dropdownValue = selectedValue;
      });
    }
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

        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 40),

            Center(
              child: Image.asset(
                "assets/images/splash.png",
                width: 67,
                height: 62,
              ),
            ),

            SizedBox(height: 40),

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

            SizedBox(height: 45),

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

            SizedBox(height: 56),

            ElvatedbuttonWidget(title: 'Next'),
          ],
        ),
      ),
    );
  }
}
