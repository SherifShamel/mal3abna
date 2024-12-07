import 'package:flutter/material.dart';
import 'package:mal3abna/core/config/widgets/custom_text_form_field.dart';

class AddPlayerView extends StatelessWidget {
  const AddPlayerView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Player"),
      ),
      body: Form(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              const SizedBox(height: 20),
              const MyCustomTextFormField(hintText: "Enter Player Name"),
              const SizedBox(height: 20),
              Container(
                color: Colors.grey,
                width: 30,
                height: 30,
              )
            ],
          ),
        ),
      ),
    );
  }
}

