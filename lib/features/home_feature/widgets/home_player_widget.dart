import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mal3abna/models/player_model.dart';
import 'package:mal3abna/provider/players_provider.dart';

class GamePlayerWidget extends ConsumerWidget {
  final PlayerModel playerModel;

  const GamePlayerWidget({
    Key? key,
    required this.playerModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<PlayerModel> selectedData = ref.read(selectedPlayersProvider);
    print(selectedData.length);
    return InkWell(
      onTap: () {
        final wasSelected = ref
            .read(selectedPlayersProvider.notifier)
            .togglePlayerSelected(playerModel);
        playerModel.isSelected = wasSelected;
      },
      child: ClipRRect(
        clipBehavior: Clip.antiAlias,
        borderRadius: BorderRadius.circular(25),
        child: Card(
          child: Stack(
            alignment: AlignmentDirectional.topEnd,
            children: [
              Image.asset(
                // fit: BoxFit.fitHeight,
                playerModel.playerImage,
              ),
              Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: Container(
                  clipBehavior: Clip.antiAlias,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(25),
                      bottomRight: Radius.circular(25),
                    ),
                    color: Colors.black54,
                  ),
                  child: Text(
                    playerModel.playerName,
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(color: Colors.white),
                  ),
                ),
              ),
              Icon(
                selectedData.length > 5
                    ? Icons.looks_two
                    : Icons.looks_one_rounded,
                color: playerModel.isSelected == false
                    ? Colors.white
                    : Colors.green,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
