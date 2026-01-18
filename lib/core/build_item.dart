import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_spinbox/flutter_spinbox.dart';
import 'package:flutter_svg/svg.dart';

Widget buildCartItem({
  required String image,
  required String title,
  required String subtitle,
  required String price,
}) {
  return Column(
    children: [
      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                width: 100,
                height: 120,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Image.asset(image, fit: BoxFit.cover),
              ),

              Positioned(
                top: 5,
                left: 5,
                child: SizedBox(
                  width: 24,
                  height: 24,
                  child: SvgPicture.asset('assets/icons/delete.svg'),
                ),
              ),
            ],
          ),

          SizedBox(width: 16),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),

                SizedBox(height: 5),

                Text(
                  subtitle,
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),

                SizedBox(height: 10),

                Text(
                  price,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black87,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                SizedBox(height: 10),

                Align(
                  alignment: Alignment.centerRight,
                  child: SizedBox(
                    width: 120,
                    child: SpinBox(
                      min: 1,
                      max: 100,
                      value: 1,
                      textStyle: TextStyle(color: Colors.blueGrey),
                      iconColor: WidgetStatePropertyAll(Colors.blueGrey),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      onChanged: (value) {},
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),

      SizedBox(height: 15),

      Divider(thickness: 1, color: Colors.grey),

      SizedBox(height: 15),
    ],
  );
}
