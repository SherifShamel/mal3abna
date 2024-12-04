// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'player_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PlayerModelAdapter extends TypeAdapter<PlayerModel> {
  @override
  final int typeId = 0;

  @override
  PlayerModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PlayerModel(
      playerNumber: fields[0] as int,
      playerName: fields[1] as String,
      isSelected: fields[3] as bool,
      playerImage: fields[2] as String,
      numberOfGoals: fields[4] as int,
      numberOfAssists: fields[5] as int,
      isGoalMaster: fields[6] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, PlayerModel obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.playerNumber)
      ..writeByte(1)
      ..write(obj.playerName)
      ..writeByte(2)
      ..write(obj.playerImage)
      ..writeByte(3)
      ..write(obj.isSelected)
      ..writeByte(4)
      ..write(obj.numberOfGoals)
      ..writeByte(5)
      ..write(obj.numberOfAssists)
      ..writeByte(6)
      ..write(obj.isGoalMaster);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PlayerModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
