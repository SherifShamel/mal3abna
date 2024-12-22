import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:mal3abna/models/player_model.dart';

import '../../../core/config/constants.dart';
import 'get_players_states.dart';

class GetPlayersCubit extends Cubit<GetPlayersStates> {
  GetPlayersCubit() : super(GetPlayersLoading());

  fetchAllPlayers() async {
    try {
      var playersBox = Hive.box<PlayerModel>(kPlayersBox);

      List<PlayerModel> playersList = playersBox.values.toList();
      emit(GetPlayersSuccess(players: playersList));
    } catch (e) {
      emit(
        GetPlayersError(e.toString()),
      );
    }
  }
}
