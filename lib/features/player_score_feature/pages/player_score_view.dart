import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mal3abna/data/players_data.dart';
import 'package:mal3abna/models/player_model.dart';
import 'package:mal3abna/provider/game_score_provider.dart';

class PlayerScoreView extends ConsumerStatefulWidget {
  final PlayerModel playerModel;

  const PlayerScoreView({Key? key, required this.playerModel})
      : super(key: key);

  @override
  ConsumerState<PlayerScoreView> createState() => _PlayerScoreViewState();
}

class _PlayerScoreViewState extends ConsumerState<PlayerScoreView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.playerModel.playerName),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Image.asset(
              widget.playerModel.playerImage,
              height: MediaQuery.of(context).size.height * 0.4,
              fit: BoxFit.fill,
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              children: [
                Expanded(
                  child: Text(
                    "Goals: ${widget.playerModel.numberOfGoals}",
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    setState(
                      () {
                        if (widget.playerModel.numberOfGoals >= 2) {
                          widget.playerModel.isGoalMaster = true;
                          ScaffoldMessenger.of(context).clearSnackBars();
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text(
                                "Goal Master!!",
                              ),
                            ),
                          );
                        }
                        widget.playerModel.numberOfGoals++;
                        numberOfGoals++;
                        ref.read(gameScoreProvider.notifier).goalFound();
                      },
                    );
                  },
                  icon: const Icon(
                    Icons.add,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      widget.playerModel.numberOfGoals--;
                      numberOfGoals--;
                    });
                  },
                  icon: const Icon(
                    Icons.remove,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              children: [
                Expanded(
                  child: Text(
                    "Assists: ${widget.playerModel.numberOfAssists}",
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    setState(
                      () {
                        if (widget.playerModel.numberOfAssists >= 3) {
                          widget.playerModel.isGoalMaster = true;
                          ScaffoldMessenger.of(context).clearSnackBars();
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text(
                                "Assists Master!!",
                              ),
                            ),
                          );
                        }
                        widget.playerModel.numberOfAssists++;
                      },
                    );
                  },
                  icon: const Icon(
                    Icons.add,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      widget.playerModel.numberOfAssists--;
                      print(widget.playerModel.numberOfGoals);
                    });
                  },
                  icon: const Icon(
                    Icons.remove,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
