import 'package:hive_flutter/hive_flutter.dart';

part 'work_shop_entity.g.dart';

@HiveType(typeId: 3)
class WorkShopEntity {
  @HiveField(0)
  String? name;

  @HiveField(1)
  String? address;

  @HiveField(2)
  String? phoneNumber;

  @HiveField(3)
  String? whats;

  @HiveField(4)
  dynamic workingHours;

  @HiveField(5)
  List<dynamic>? serviceTypes;

  WorkShopEntity({
    this.name,
    this.address,
    this.phoneNumber,
    this.whats,
    this.workingHours,
    this.serviceTypes,
  });

  factory WorkShopEntity.fromJson(Map<String, dynamic> data) {
    return WorkShopEntity(
      name: data['name'] as String?,
      address: data['address'] as String?,
      phoneNumber: data['phoneNumber'] as String?,
      whats: data['whats'] as String?,
      workingHours: data['workingHours'],
      serviceTypes: data['serviceTypes'] as List<dynamic>?,
    );
  }
}
