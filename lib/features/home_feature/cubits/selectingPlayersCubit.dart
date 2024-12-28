import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:mal3abna/core/config/constants.dart';
import 'package:mal3abna/features/home_feature/cubits/selectingPlayersStates.dart';

import '../../../models/player_model.dart';

class SelectingPlayersCubit extends Cubit<SelectingPlayersStates> {
  SelectingPlayersCubit() : super(SelectingPlayersInitial());

  addSelectedPlayer(PlayerModel player) async {
    emit(SelectingPlayersLoading());
    try {
      var selectedPlayersBox = Hive.box<PlayerModel>(kPlayersBox);

      player.isSelected = !player.isSelected;

      print("${player.playerName} is ${player.isSelected ? 'selected' : 'not selected'}");
      emit(SelectingPlayersSuccess(playerName: selectedPlayersBox.name));

    } catch (e) {
      emit(SelectingPlayersError(e.toString()));
    }
  }
}
