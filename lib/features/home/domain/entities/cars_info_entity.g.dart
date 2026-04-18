// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cars_info_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CarsInfoEntityAdapter extends TypeAdapter<CarsInfoEntity> {
  @override
  final int typeId = 1;

  @override
  CarsInfoEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CarsInfoEntity(
      nextChange: fields[8] as int?,
      lastChange: fields[6] as String?,
      currentKm: fields[7] as int?,
      id: fields[0] as int?,
      make: fields[2] as String?,
      carModel: fields[1] as String?,
      plateNumber: fields[4] as String?,
      oilType: fields[5] as String?,
      year: fields[3] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, CarsInfoEntity obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.carModel)
      ..writeByte(2)
      ..write(obj.make)
      ..writeByte(3)
      ..write(obj.year)
      ..writeByte(4)
      ..write(obj.plateNumber)
      ..writeByte(5)
      ..write(obj.oilType)
      ..writeByte(6)
      ..write(obj.lastChange)
      ..writeByte(7)
      ..write(obj.currentKm)
      ..writeByte(8)
      ..write(obj.nextChange);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CarsInfoEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
