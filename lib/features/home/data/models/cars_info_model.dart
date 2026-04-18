import 'package:qodraapp/features/home/domain/entities/cars_info_entity.dart';

class CarsInfoModel extends CarsInfoEntity {
  final String customerId;

  CarsInfoModel({
    required super.id,
    required super.carModel,
    required super.make,
    required super.year,
    required super.plateNumber,
    required super.oilType,
    required super.currentKm,
    required this.customerId,
    required super.nextChange,
    required super.lastChange,
  });

  @override
  String toString() {
    return '(id: $id, carModel: $carModel, make: $make, year: $year, plateNumber: $plateNumber, currentKm: $currentKm, oilType: $oilType, customerId: $customerId)';
  }

  factory CarsInfoModel.fromJson(Map<String, dynamic> json) {
    return CarsInfoModel(
      id: json['id'],
      carModel: json['carModel'],
      make: json['make'],
      year: json['year'],
      plateNumber: json['plateNumber'],
      currentKm: json['currentKm'],
      oilType: json['oilType'],
      customerId: json['customerId'],
      nextChange: json['nextChange'],
      lastChange: json['lastChange'],
    );
  }
}
