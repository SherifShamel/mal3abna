import 'package:mal3abna/models/player_model.dart';

sealed class GetPlayersStates {}

class GetPlayersLoading extends GetPlayersStates {}
class GetPlayersError extends GetPlayersStates {
  final String error;
  GetPlayersError(this.error);
}

class GetPlayersSuccess extends GetPlayersStates {
  final List<PlayerModel> players;

  GetPlayersSuccess({required this.players});
}
