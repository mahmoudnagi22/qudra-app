// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ServiceEntityAdapter extends TypeAdapter<ServiceEntity> {
  @override
  final int typeId = 2;

  @override
  ServiceEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ServiceEntity(
      additionalServices: (fields[4] as List?)?.cast<String>(),
      numberOfKilometers: fields[5] as dynamic,
      oilType: fields[2] as String?,
      date: fields[3] as String?,
      carModel: fields[0] as String?,
      cost: fields[1] as dynamic,
      description: fields[6] as String?,
      oilChanged: fields[7] as bool?,
      filterChanged: fields[8] as bool?,
    );
  }

  @override
  void write(BinaryWriter writer, ServiceEntity obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.carModel)
      ..writeByte(1)
      ..write(obj.cost)
      ..writeByte(2)
      ..write(obj.oilType)
      ..writeByte(3)
      ..write(obj.date)
      ..writeByte(4)
      ..write(obj.additionalServices)
      ..writeByte(5)
      ..write(obj.numberOfKilometers)
      ..writeByte(6)
      ..write(obj.description)
      ..writeByte(7)
      ..write(obj.oilChanged)
      ..writeByte(8)
      ..write(obj.filterChanged);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ServiceEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
