import 'package:flutter/material.dart';

class MyCustomTextFormField extends StatelessWidget {
  final String hintText;
  final void Function(String?)? onSaved;

  const MyCustomTextFormField(
      {super.key, required this.hintText, this.onSaved});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value?.isEmpty ?? true) {
          return "Add A Player Name!";
        } else {
          return null;
        }
      },
      onSaved: onSaved,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        hintText: hintText,
      ),
    );
  }
}
