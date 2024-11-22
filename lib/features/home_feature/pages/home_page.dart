import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mal3abna/core/config/page_route_names.dart';
import 'package:mal3abna/data/players_data.dart';
import 'package:mal3abna/features/home_feature/widgets/home_player_widget.dart';
import 'package:mal3abna/provider/players_provider.dart';

class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(selectedPlayersProvider);
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
          playerModel: playersList[index],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        heroTag: "Click To Go!",
        onPressed: () {
          if (data.length != 10) {
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
              arguments: data,
            );
          }
        },
        child: const Icon(
          Icons.play_arrow_rounded,
        ),
      ),
    );
  }
}
