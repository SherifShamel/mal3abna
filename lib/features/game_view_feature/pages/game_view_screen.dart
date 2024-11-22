import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mal3abna/data/players_data.dart';
import 'package:mal3abna/provider/game_score_provider.dart';
import 'package:mal3abna/provider/players_provider.dart';

import '../widgets/game_player_widget.dart';

class GameViewScreen extends ConsumerStatefulWidget {
  const GameViewScreen({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState<GameViewScreen> createState() => _GameViewScreenState();
}

class _GameViewScreenState extends ConsumerState<GameViewScreen> {
  int score = numberOfGoals;

  @override
  Widget build(BuildContext context) {
    final playingPlayers = ref.watch(selectedPlayersProvider);
    final score = ref.watch(gameScoreProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text("Score: $score - 0"),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.settings,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: GridView.builder(
              itemCount: playingPlayers.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2),
              itemBuilder: (context, index) => GamePlayerWidget(
                playerModel: playingPlayers[index],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
