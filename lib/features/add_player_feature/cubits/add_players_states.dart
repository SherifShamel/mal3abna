sealed class AddPlayersStates{}

class AddPlayerLoading extends AddPlayersStates{}
class AddPlayerSuccess extends AddPlayersStates{
  String playerName;
  AddPlayerSuccess(this.playerName);
}
class AddPlayerError extends AddPlayersStates{
  final String errorMsg;

  AddPlayerError(this.errorMsg);
}