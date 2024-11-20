import 'package:flutter/material.dart';
import 'package:mal3abna/models/player_model.dart';

import '../../player_score_feature/pages/player_score_view.dart';

class GamePlayerWidget extends StatelessWidget {
  final PlayerModel playerModel;

  const GamePlayerWidget({Key? key, required this.playerModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PlayerScoreView(
              playerModel: playerModel,
            ),
          ),
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
                  height: double.infinity,
                  fit: BoxFit.fill,
                  playerModel.playerImage),
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
                  child: !playerModel.isGoalMaster
                      ? Text(
                          playerModel.playerName,
                          textAlign: TextAlign.center,
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(color: Colors.white),
                        )
                      : Text(
                          playerModel.playerName,
                          textAlign: TextAlign.center,
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(color: Colors.green),
                        ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
