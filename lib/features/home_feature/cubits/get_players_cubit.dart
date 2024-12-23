import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:mal3abna/models/player_model.dart';

import '../../../core/config/constants.dart';
import 'get_players_states.dart';

class GetPlayersCubit extends Cubit<GetPlayersStates> {
  GetPlayersCubit() : super(GetPlayersLoading());

  List<PlayerModel>? players;
  fetchAllPlayers() {
    var playersBox = Hive.box<PlayerModel>(kPlayersBox);

    players = playersBox.values.toList();
  }
}
