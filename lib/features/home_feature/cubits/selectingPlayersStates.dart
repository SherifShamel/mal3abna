import 'package:mal3abna/models/player_model.dart';

abstract class SelectingPlayersStates{}

class SelectingPlayersSuccess extends SelectingPlayersStates{
  final String playerName;
  SelectingPlayersSuccess({required this.playerName});
}

class SelectingPlayersInitial extends SelectingPlayersStates{}

class SelectingPlayersLoading extends SelectingPlayersStates{}

class SelectingPlayersError extends SelectingPlayersStates{
  final String errorMsg;
  SelectingPlayersError(this.errorMsg);
}