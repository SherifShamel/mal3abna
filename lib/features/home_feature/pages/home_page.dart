import 'package:flutter/material.dart';
import 'package:mal3abna/core/config/page_route_names.dart';
import 'package:mal3abna/data/players_data.dart';
import 'package:mal3abna/features/home_feature/widgets/home_player_widget.dart';
import 'package:mal3abna/main.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Available Players",
        ),
        actions: [
          IconButton(
            onPressed: () {
              navigatorKey.currentState!.pushNamed(PagesRouteName.addPlayerView);
            },
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
    );
  }
}
