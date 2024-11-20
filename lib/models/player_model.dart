class PlayerModel {
  final int playerNumber;
  final String playerName;
  final String playerImage;
  bool isSelected;
  int numberOfGoals;
  int numberOfAssists;
  bool isGoalMaster;

  PlayerModel({
    required this.playerNumber,
    required this.playerName,
    this.isSelected = false,
    required this.playerImage,
    this.numberOfGoals = 0,
    this.numberOfAssists = 0,
    this.isGoalMaster = false,
  });
}
