import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mal3abna/core/config/widgets/custom_text_form_field.dart';
import 'package:mal3abna/features/add_player_feature/cubits/add_players_cubit.dart';
import 'package:mal3abna/main.dart';
import 'package:mal3abna/models/player_model.dart';

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
            ClipRRect(
              borderRadius: BorderRadius.circular(18),
              child: SizedBox(
                width: MediaQuery.sizeOf(context).width * 0.7,
                // height: MediaQuery.sizeOf(context).height * 0.3,
                child: Image.network(
                  fit: BoxFit.cover,
                  "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fstatic.wikia.nocookie.net%2Fnaruto%2Fimages%2Fd%2Fd6%2FNaruto_Part_I.png%2Frevision%2Flatest%2Fscale-to-width-down%2F1200%3Fcb%3D20210223094656&f=1&nofb=1&ipt=8973a1827a8a81d9df262d4b6337690b870f573f1619251010e639ccfc1898b3&ipo=images",
                ),
              ),
            ),
            const Spacer(),
            FloatingActionButton.extended(
              elevation: 36,
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  formKey.currentState!.save();

                  var playerModel = PlayerModel(
                    playerNumber: 1,
                    playerName: playerName!,
                    playerImage: 'playerImage',
                  );
                  BlocProvider.of<AddPlayersCubit>(context)
                      .addPlayer(playerModel);
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
