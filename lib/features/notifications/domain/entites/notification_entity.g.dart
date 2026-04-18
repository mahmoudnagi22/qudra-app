// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class NotificationEntityAdapter extends TypeAdapter<NotificationEntity> {
  @override
  final int typeId = 5;

  @override
  NotificationEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return NotificationEntity(
      txt: fields[2] as String,
      color: fields[1] as Color?,
      type: fields[0] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, NotificationEntity obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.type)
      ..writeByte(1)
      ..write(obj.color)
      ..writeByte(2)
      ..write(obj.txt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NotificationEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
