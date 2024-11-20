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
        clipBehavior: Clip.antiAlias,
        borderRadius: BorderRadius.circular(25),
        child: Card(
          child: Stack(
            alignment: AlignmentDirectional.topEnd,
            children: [
              Image.asset(
                // fit: BoxFit.fitHeight,
                widget.playerModel.playerImage,
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
                    widget.playerModel.playerName,
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
