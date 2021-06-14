import 'package:flutter/material.dart';

class TextFField extends StatelessWidget {
  final String value;
  final bool enable;
  final String label;

  TextFField({required this.value, required this.enable, required this.label});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: value,
      decoration: InputDecoration(
          labelText: 'Username',
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(25)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25),
              borderSide: BorderSide(color: Colors.amber))),
      enabled: false,
    );
  }
}
