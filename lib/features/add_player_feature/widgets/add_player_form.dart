import 'package:flutter/material.dart';
import 'package:mal3abna/core/config/widgets/custom_text_form_field.dart';
import 'package:mal3abna/main.dart';

class AddPlayerForm extends StatefulWidget {
  const AddPlayerForm({super.key});

  @override
  State<AddPlayerForm> createState() => _AddPlayerFormState();
}

class _AddPlayerFormState extends State<AddPlayerForm> {
  final GlobalKey<FormState> formKey = GlobalKey();

  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;

  String? playerName, playerImage;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autoValidateMode,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            const SizedBox(height: 20),
            MyCustomTextFormField(
              hintText: "Enter Player Name",
              onSaved: (value) {
                playerName = value;
              },
            ),
            const SizedBox(height: 20),
            Container(
              color: Colors.grey,
              width: 30,
              height: 30,
            ),
            const Spacer(),
            FloatingActionButton.extended(
              elevation: 36,
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  formKey.currentState!.save();
                  navigatorKey.currentState!.pop();
                } else {
                  autoValidateMode = AutovalidateMode.always;
                  setState(() {});
                }
              },
              label: const Text("Add"),
              icon: const Icon(Icons.add),
            )
          ],
        ),
      ),
    );
  }
}
