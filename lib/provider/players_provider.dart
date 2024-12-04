import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mal3abna/models/player_model.dart';

class PlayersNotifier extends StateNotifier<List<PlayerModel>> {
  PlayersNotifier() : super([]);

  bool togglePlayerSelected(PlayerModel player) {
    final playerIsSelected = state.contains(player);

    if (playerIsSelected) {
      state = state
          .where((element) => element.playerName != player.playerName)
          .toList();
      return false;
    } else {
      state = [...state, player];
      return true;
    }
  }

  void addPlayer(PlayerModel player) {
    state = [...state,player];
    print(state.length);
  }
}

final selectedPlayersProvider =
    StateNotifierProvider<PlayersNotifier, List<PlayerModel>>((ref) {
  return PlayersNotifier();
});
