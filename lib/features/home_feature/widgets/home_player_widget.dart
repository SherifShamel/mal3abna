import 'package:flutter/material.dart';
import 'package:mal3abna/data/players_data.dart';
import 'package:mal3abna/models/player_model.dart';

class GamePlayerWidget extends StatefulWidget {
  final PlayerModel playerModel;
  bool isSelected;
  int index;

  GamePlayerWidget({
    Key? key,
    required this.playerModel,
    required this.isSelected,
    required this.index,
  }) : super(key: key);

  @override
  State<GamePlayerWidget> createState() => _GamePlayerWidgetState();
}

class _GamePlayerWidgetState extends State<GamePlayerWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(
          () {
            widget.isSelected = !widget.isSelected;
            widget.isSelected == true
                ? selectedPlayers.add(widget.playerModel)
                : selectedPlayers.remove(widget.playerModel);
          },
        );
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(25),
        child: Card(
          child: Stack(
            alignment: AlignmentDirectional.topEnd,
            children: [
              Image.network(
                // fit: BoxFit.fitHeight,
                "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fstatic.wikia.nocookie.net%2Fnaruto%2Fimages%2Fd%2Fd6%2FNaruto_Part_I.png%2Frevision%2Flatest%2Fscale-to-width-down%2F1200%3Fcb%3D20210223094656&f=1&nofb=1&ipt=8973a1827a8a81d9df262d4b6337690b870f573f1619251010e639ccfc1898b3&ipo=images",
              ),
              Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.black54,
                  ),
                  child: Text(
                    "Shero",
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(color: Colors.white),
                  ),
                ),
              ),
              Icon(
                selectedPlayers.length > 5
                    ? Icons.looks_two
                    : Icons.looks_one_rounded,
                color: widget.isSelected == false ? Colors.white : Colors.green,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
