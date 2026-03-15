import 'package:flutter/material.dart';

class DropdownButtonPhone extends StatefulWidget {
  final String selectedCountryCode;
  final ValueChanged<String> onChanged;

  const DropdownButtonPhone({
    super.key,
    required this.selectedCountryCode,
    required this.onChanged,
  });

  @override
  State<DropdownButtonPhone> createState() => _DropdownButtonPhoneState();
}

class _DropdownButtonPhoneState extends State<DropdownButtonPhone> {
  List<String> phone = ['+20', '+099', '+0123'];
  late String selectedCountrycode;

  @override
  void initState() {
    super.initState();
    selectedCountrycode = phone.first;
    widget.onChanged.call(widget.selectedCountryCode);
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: selectedCountrycode,
      items: phone
          .map((e) => DropdownMenuItem(value: e, child: Text(e)))
          .toList(),
      onChanged: (value) {
        if (value == null) return;
        selectedCountrycode = value;
        widget.onChanged.call(widget.selectedCountryCode);
        setState(() {});
      },
    );
  }
}
