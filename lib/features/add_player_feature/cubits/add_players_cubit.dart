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

      await playersBox.add(playerModel);
      await playersBox.close();
      emit(AddPlayerSuccess());
    } catch (e) {
      emit(
        AddPlayerFailure(e.toString()),
      );
    }
  }
}
