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