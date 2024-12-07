sealed class AddPlayersStates{}

class AddPlayerLoading extends AddPlayersStates{}
class AddPlayerSuccess extends AddPlayersStates{}
class AddPlayerFailure extends AddPlayersStates{
  final String errorMsg;

  AddPlayerFailure(this.errorMsg);
}
