import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mal3abna/models/player_model.dart';
import 'package:mal3abna/provider/players_provider.dart';

class GamePlayerWidget extends ConsumerWidget {
  final PlayerModel playerModel;
  final PageController pageController;

  const GamePlayerWidget(
      {Key? key, required this.playerModel, required this.pageController})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<PlayerModel> selectedData = ref.read(selectedPlayersProvider);

    return InkWell(
      onTap: () {
        final wasSelected = ref
            .read(selectedPlayersProvider.notifier)
            .togglePlayerSelected(playerModel);
        playerModel.isSelected = wasSelected;

        if (selectedData.length == 4) {
          pageController.nextPage(
              duration: const Duration(seconds: 1), curve: Curves.easeIn);
        }
      },
      child: ClipRRect(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        borderRadius: BorderRadius.circular(25),
        child: Card(
          child: Stack(
            alignment: AlignmentDirectional.topEnd,
            children: [
              Center(
                child: Image.asset(
                  playerModel.playerImage,
                ),
              ),
              Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: Container(
                  color: Colors.black54,
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
