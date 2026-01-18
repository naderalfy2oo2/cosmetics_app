import 'package:flutter/material.dart';

class DropdownButtonPhone extends StatefulWidget {
  final List<String> phones;
  final String initialValue;
  final ValueChanged<String> onChanged;

  const DropdownButtonPhone({
    super.key,
    required this.phones,
    required this.initialValue,
    required this.onChanged,
  });

  @override
  State<DropdownButtonPhone> createState() => _DropdownButtonPhoneState();
}

class _DropdownButtonPhoneState extends State<DropdownButtonPhone> {
  late String currentPhone;

  @override
  void initState() {
    super.initState();
    currentPhone = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: currentPhone,
      items: widget.phones
          .map((e) => DropdownMenuItem(value: e, child: Text(e)))
          .toList(),
      onChanged: (value) {
        if (value == null) return;
        setState(() {
          currentPhone = value;
        });
        widget.onChanged(value);
      },
    );
  }
}
