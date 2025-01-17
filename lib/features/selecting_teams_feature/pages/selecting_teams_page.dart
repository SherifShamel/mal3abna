import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../models/player_model.dart';
import '../../home_feature/cubits/get_players_cubit.dart';
import '../../home_feature/cubits/get_players_states.dart';
import '../../home_feature/cubits/selectingPlayersCubit.dart';
import '../../home_feature/widgets/home_player_widget.dart';

class SelectingTeamsPage extends StatelessWidget {
  const SelectingTeamsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => GetPlayersCubit()),
        BlocProvider(create: (context) => SelectingPlayersCubit()),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Selected Players'),
        ),
        body: BlocBuilder<GetPlayersCubit, GetPlayersStates>(
          builder: (context, state) {
            BlocProvider.of<GetPlayersCubit>(context).fetchAllPlayers();
            List<PlayerModel> players =
                BlocProvider.of<GetPlayersCubit>(context)
                        .players
                        ?.where((element) => element.isSelected)
                        .toList() ??
                    [];

            return GridView.builder(
              itemCount: players.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemBuilder: (context, index) => GamePlayerWidget(
                playerModel: players[index],
                isSelected: players[index].isSelected,
              ),
            );
          },
        ),
      ),
    );
  }
}
