import 'package:flutter/material.dart';
import 'package:mal3abna/core/config/page_route_names.dart';
import 'package:mal3abna/data/players_data.dart';
import 'package:mal3abna/features/home_feature/widgets/home_player_widget.dart';
import 'package:mal3abna/models/player_model.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Pick The Players",
        ),
      ),
      body: GridView.builder(
        itemCount: playersList.length,
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (context, index) => GamePlayerWidget(
            index: index,
            playerModel: playersList[index],
            isSelected: playersList[index].isSelected),
      ),
      floatingActionButton: FloatingActionButton(
        heroTag: "Click To Go!",
        onPressed: () {
          if (selectedPlayers.length != 10) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text(
                  "Must Select at least 10 Players!",
                ),
              ),
            );
          } else {
            Navigator.pushNamed(
              context,
              PagesRouteName.gameView,
              arguments: selectedPlayers,
            );
          }
        },
        child: const Icon(
          Icons.place,
        ),
      ),
    );
  }
}
