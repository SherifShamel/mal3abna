import 'package:mal3abna/data/players_data.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GameScoreNotifier extends StateNotifier<int> {
  GameScoreNotifier() : super(0);

  void goalFound() {
    state = numberOfGoals;
  }
}

final gameScoreProvider = StateNotifierProvider<GameScoreNotifier, int>(
  (ref) {
    return GameScoreNotifier();
  },
);
