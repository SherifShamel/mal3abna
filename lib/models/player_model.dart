import 'package:hive/hive.dart';

part 'player_model.g.dart';

@HiveType(typeId: 0)
class PlayerModel extends HiveObject {
  @HiveField(0)
  final int playerNumber;
  @HiveField(1)
  final String playerName;
  @HiveField(2)
  final String playerImage;
  @HiveField(3)
  bool isSelected;
  @HiveField(4)
  int numberOfGoals;
  @HiveField(5)
  int numberOfAssists;
  @HiveField(6)
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
