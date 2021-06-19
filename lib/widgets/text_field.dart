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
          labelText: label,
          border: InputBorder.none,
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.amber))),
      enabled: false,
    );
  }
}
