// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_info_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserInfoEntityAdapter extends TypeAdapter<UserInfoEntity> {
  @override
  final int typeId = 0;

  @override
  UserInfoEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserInfoEntity(
      name: fields[0] as String,
      rank: fields[1] as int?,
      numOfSessions: fields[2] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, UserInfoEntity obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.rank)
      ..writeByte(2)
      ..write(obj.numOfSessions);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserInfoEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
