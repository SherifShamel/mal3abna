import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mal3abna/features/add_player_feature/cubits/add_players_cubit.dart';
import 'package:mal3abna/features/add_player_feature/cubits/add_players_states.dart';
import 'package:mal3abna/features/add_player_feature/widgets/add_player_form.dart';

class AddPlayerView extends StatelessWidget {
  const AddPlayerView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddPlayersCubit(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Add Player"),
          centerTitle: false,
        ),
        body: BlocConsumer<AddPlayersCubit, AddPlayersStates>(
          listener: (BuildContext context, state) {
            switch (state) {
              case AddPlayerLoading():
                {
                  const CircularProgressIndicator();
                }

              case AddPlayerError():
                {
                  Center(child: Text(state.errorMsg));
                }

              case AddPlayerSuccess():
                {}
            }
          },
          builder: (context, state) => const AddPlayerForm(),
        ),
      ),
    );
  }
}