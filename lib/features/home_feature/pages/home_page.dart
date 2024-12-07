import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mal3abna/data/players_data.dart';
import 'package:mal3abna/features/home_feature/cubits/add_players_cubit.dart';
import 'package:mal3abna/features/home_feature/widgets/home_player_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AddPlayersCubit(),
        )
      ],
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Create Your Team!",
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.add),
            ),
          ],
        ),
        body: GridView.builder(
          itemCount: playersList.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2),
          itemBuilder: (context, index) => GamePlayerWidget(
            index: index,
            playerModel: playersList[index],
            isSelected: playersList[index].isSelected,
          ),
        ),
      ),
    );
  }
}
