import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mal3abna/core/config/constants.dart';
import 'package:mal3abna/models/player_model.dart';

import 'add_players_states.dart';

class AddPlayersCubit extends Cubit<AddPlayersStates> {
  AddPlayersCubit() : super(AddPlayerLoading());

  addPlayer(PlayerModel playerModel) async {
    emit(AddPlayerLoading());
    try {
      var playersBox = Hive.box<PlayerModel>(kPlayersBox);

      emit(AddPlayerSuccess());
      await playersBox.add(playerModel);
    } catch (e) {
      AddPlayerFailure(e.toString());
    }
  }
}
