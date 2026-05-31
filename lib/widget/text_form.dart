import 'package:flutter/material.dart';

class TextFormWidget extends StatelessWidget {
  final String labeltext;
  final String hinttext;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  const TextFormWidget({
    super.key,
    required this.labeltext,
    required this.hinttext,
    required this.controller,
    required this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        validator: validator,
        controller: controller,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: Color(0xff5A669066).withValues(alpha: 0.4),
            ),
          ),

          hintText: hinttext,
          hintStyle: TextStyle(
            color: Color(0xff434C6D),
            fontWeight: FontWeight.w400,
            fontSize: 14,
          ),

          labelText: labeltext,
          labelStyle: TextStyle(
            color: Color(0xff8E8EA9),
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
