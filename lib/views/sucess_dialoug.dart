import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SucessDialoug extends StatelessWidget {
  const SucessDialoug({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 200),
          child: Center(
            child: Column(
              children: [
                Lottie.asset('assets/lottie/Untitled file.json'),
                Text(
                  'Account Activated!',
                  style: TextStyle(color: Color(0xff434C6D), fontSize: 15),
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
                    onPressed: () {},
                    child: Text(
                      'Go to home',
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
