import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mal3abna/core/config/application_theme_manager.dart';
import 'package:mal3abna/features/game_view_feature/widgets/game_player_widget.dart';
import 'package:mal3abna/generated/assets.dart';
import 'package:mal3abna/models/player_model.dart';
import 'package:mal3abna/provider/players_provider.dart';

class CreatingTeamsView extends ConsumerWidget {
  const CreatingTeamsView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var data = ref.watch(selectedPlayersProvider);
    return Scaffold(
      body: Center(
        child: SizedBox(
          height: MediaQuery.sizeOf(context).height * 0.5,
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (context, index) =>
                      GamePlayerWidget(playerModel: data[index]),
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey,
                  shape: const CircleBorder(),
                  padding: const EdgeInsets.all(20),
                ),
                onPressed: () async {
                  ref.watch(selectedPlayersProvider.notifier).addPlayer(
                        PlayerModel(
                          playerNumber: 1,
                          playerName: "ANAAA",
                          playerImage: Assets.playersFekry,
                        ),
                      );
                },
                child: const Icon(
                  Icons.add,
                  color: ApplicationThemeManager.primaryColor,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Add Players To The App!",
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: ApplicationThemeManager.primaryColor,
                    ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.grey,
          shape: const CircleBorder(),
          padding: const EdgeInsets.all(20),
        ),
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return const AlertDialog(
                content: Text("PlayerName"),
              );
            },
          );
        },
        child: const Icon(
          Icons.add,
          color: ApplicationThemeManager.primaryColor,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
