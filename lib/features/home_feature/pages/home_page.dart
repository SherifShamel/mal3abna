import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mal3abna/core/config/page_route_names.dart';
import 'package:mal3abna/features/home_feature/cubits/get_players_cubit.dart';
import 'package:mal3abna/features/home_feature/cubits/get_players_states.dart';
import 'package:mal3abna/features/home_feature/cubits/selectingPlayersCubit.dart';
import 'package:mal3abna/features/home_feature/widgets/home_player_widget.dart';
import 'package:mal3abna/main.dart';
import 'package:mal3abna/models/player_model.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => SelectingPlayersCubit()),
        BlocProvider(create: (context) => GetPlayersCubit()),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Available Players",
          ),
          actions: [
            IconButton(
              onPressed: () {
                navigatorKey.currentState!
                    .pushNamed(PagesRouteName.addPlayerView);
              },
              icon: const Icon(Icons.add),
            ),
          ],
        ),
        body: BlocBuilder<GetPlayersCubit, GetPlayersStates>(
          builder: (context, state) {
            BlocProvider.of<GetPlayersCubit>(context).fetchAllPlayers();
            List<PlayerModel> players =
                BlocProvider.of<GetPlayersCubit>(context).players?.where((element) => !element.isSelected).toList() ?? [];

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
        floatingActionButton: FloatingActionButton.extended(
          elevation: 20,
          focusElevation: 8,
          extendedIconLabelSpacing: 5,
          onPressed: () {
            navigatorKey.currentState!.pushNamed(PagesRouteName.selectingTeamsView);
          },
          isExtended: true,
          label: const Text("Select Your Team."),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      ),
    );
  }
}
