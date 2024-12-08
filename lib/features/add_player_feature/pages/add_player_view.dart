import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mal3abna/features/add_player_feature/cubits/add_players_cubit.dart';
import 'package:mal3abna/features/add_player_feature/cubits/add_players_states.dart';
import 'package:mal3abna/features/add_player_feature/widgets/add_player_form.dart';
import 'package:mal3abna/main.dart';

class AddPlayerView extends StatelessWidget {
  const AddPlayerView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Add Player"),
          centerTitle: false,
        ),
        body: BlocConsumer<AddPlayersCubit, AddPlayersStates>(
          builder: (context, state) => const AddPlayerForm(),
          listener: (BuildContext context, state) {
            switch (state) {
              case AddPlayerLoading():
                {
                  const CircularProgressIndicator();
                }

              case AddPlayerFailure():
                {
                  Center(child: Text(state.errorMsg));
                }

              case AddPlayerSuccess():
                {
                  navigatorKey.currentState!.pop();
                }
            }
          },
        ));
  }
}
