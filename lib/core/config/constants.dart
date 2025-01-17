import 'package:flutter/material.dart';

class Constants {
  static Size getMediaQuery(BuildContext context) =>
      MediaQuery.of(context).size;
}

const kPlayersBox='players_box';
const kSelectedPlayersBox='selected_players_box';
const kSelectedPlayers='selected_players';