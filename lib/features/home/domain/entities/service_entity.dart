import 'package:hive_flutter/hive_flutter.dart';
part 'service_entity.g.dart';

@HiveType(typeId: 2)
class ServiceEntity {
  @HiveField(0)
  final String? carModel;

  @HiveField(1)
  final dynamic cost;

  @HiveField(2)
  final String? oilType;

  @HiveField(3)
  final String? date;

  @HiveField(4)
  List<String>? additionalServices;

  @HiveField(5)
  dynamic numberOfKilometers;

  @HiveField(6)
  final String? description;

  @HiveField(7)
  bool? oilChanged;

  @HiveField(8)
  bool? filterChanged;

  ServiceEntity({
    required this.additionalServices,
    required this.numberOfKilometers,
    required this.oilType,
    required this.date,
    required this.carModel,
    required this.cost,
    required this.description,
    required this.oilChanged,
    required this.filterChanged,
  });
}
