import 'package:flutter/material.dart';
import 'package:mal3abna/core/config/page_route_names.dart';
import 'package:mal3abna/models/player_model.dart';


class MyFloatingButton extends StatelessWidget {
  const MyFloatingButton({
    super.key,
    required this.data,
  });

  final List<PlayerModel> data;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      heroTag: "Click To Go!",
      onPressed: () {
        if (data.length != 10) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text(
                "Must Select at least 10 Players!!!",
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
    );
  }
}
