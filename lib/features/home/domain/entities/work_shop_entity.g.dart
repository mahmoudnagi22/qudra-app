// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'work_shop_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class WorkShopEntityAdapter extends TypeAdapter<WorkShopEntity> {
  @override
  final int typeId = 3;

  @override
  WorkShopEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return WorkShopEntity(
      name: fields[0] as String?,
      address: fields[1] as String?,
      phoneNumber: fields[2] as String?,
      whats: fields[3] as String?,
      workingHours: fields[4] as dynamic,
      serviceTypes: (fields[5] as List?)?.cast<dynamic>(),
    );
  }

  @override
  void write(BinaryWriter writer, WorkShopEntity obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.address)
      ..writeByte(2)
      ..write(obj.phoneNumber)
      ..writeByte(3)
      ..write(obj.whats)
      ..writeByte(4)
      ..write(obj.workingHours)
      ..writeByte(5)
      ..write(obj.serviceTypes);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WorkShopEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
