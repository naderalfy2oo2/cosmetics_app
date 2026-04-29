import 'package:flutter/material.dart';

class TextWidget extends StatefulWidget {
  final String? hintText;
  const TextWidget({super.key, this.hintText});

  @override
  State<TextWidget> createState() => _TextWidgetState();
}

class _TextWidgetState extends State<TextWidget> {
  bool isobscuretext = true;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: isobscuretext,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        hintText: widget.hintText,
        hintStyle: TextStyle(
          color: Color(0xff8E8EA9),
          fontSize: 12,
          fontWeight: FontWeight.w400,
        ),

        suffixIcon: IconButton(
          onPressed: () {
            setState(() {
              isobscuretext = !isobscuretext;
            });
          },
          icon: Icon(isobscuretext ? Icons.visibility_off : Icons.visibility),
        ),
      ),
    );
  }
}
