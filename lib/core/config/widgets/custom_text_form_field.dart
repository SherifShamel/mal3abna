import 'package:flutter/material.dart';

class MyCustomTextFormField extends StatelessWidget
{
  final String hintText;

  const MyCustomTextFormField({super.key, required this.hintText});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        hintText: hintText,
      ),
    );
  }
}
