import 'package:hive/hive.dart';
import 'package:mal3abna/models/player_model.dart';

part 'team_model.g.dart';
@HiveType(typeId: 1)
class TeamModel extends HiveObject{

  @HiveField(0)
  final List<PlayerModel> teamPlayers;

  @HiveField(1)
  TeamModel({required this.teamPlayers});
}