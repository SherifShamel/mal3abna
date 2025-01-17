import 'package:hive/hive.dart';
import 'package:mal3abna/models/team_model.dart';

part 'game_model.g.dart';

@HiveType(typeId: 2)
class GameModel extends HiveObject{
  
  @HiveField(0)
  final List<TeamModel> teamModel;

  @HiveField(1)
  final DateTime dateTime;

  GameModel({required this.teamModel, required this.dateTime});
}