import 'package:qodraapp/features/home/domain/entities/service_entity.dart';

class LatesServicesModel extends ServiceEntity {
  dynamic id;
  String? userName;
  dynamic kmReading;
  dynamic nextChange;
  String? workShopId;

  LatesServicesModel({
    required this.id,
    required this.userName,
    required this.kmReading,
    required this.nextChange,
    required this.workShopId,
    required super.additionalServices,
    required super.date,
    required super.oilType,
    required super.numberOfKilometers,
    required super.carModel,
    required super.cost,
    required super.description,
    required super.oilChanged,
    required super.filterChanged,
  });

  factory LatesServicesModel.fromJson(Map<String, dynamic> data) {
    return LatesServicesModel(
      id: data['id'] as dynamic,
      date: data['date'] as String?,
      userName: data['userName'] as String?,
      kmReading: data['kmReading'] as dynamic,
      numberOfKilometers: data['numberOfKilometers'] as dynamic,
      oilChanged: data['oilChanged'] as bool?,
      filterChanged: data['filterChanged'] as bool?,
      additionalServices:
      List<String>.from(data['additionalServices'] as List<dynamic>? ?? []),
      nextChange: data['nextChange'] as dynamic,
      description: data['description'] as String?,
      cost: data['cost'] as dynamic,
      carModel: data['carModel'] as String?,
      workShopId: data['workShopId'] as String?,
      oilType: data['oilType'] as String?,
    );
  }
}
