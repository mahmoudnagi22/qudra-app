import 'package:hive_flutter/hive_flutter.dart';
part 'cars_info_entity.g.dart';

@HiveType(typeId: 1)
class CarsInfoEntity {
  @HiveField(0)
  final int? id;
  @HiveField(1)
  final String? carModel;
  @HiveField(2)
  final String? make;
  @HiveField(3)
  final int? year;
  @HiveField(4)
  final String? plateNumber;
  @HiveField(5)
  final String? oilType;
  @HiveField(6)
  final String? lastChange;
  @HiveField(7)
  final int? currentKm;
  @HiveField(8)
  final int? nextChange;
  CarsInfoEntity({
    required this.nextChange,
    required this.lastChange,
    required this.currentKm,
    required this.id,
    required this.make,
    required this.carModel,
    required this.plateNumber,
    required this.oilType,
    required this.year,
  });
}
//flutter packages pub run build_runner build
