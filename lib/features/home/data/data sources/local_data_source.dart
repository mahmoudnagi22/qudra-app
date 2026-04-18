import 'package:hive/hive.dart';
import 'package:qodraapp/core/utlis/constants.dart';
import 'package:qodraapp/features/home/domain/entities/cars_info_entity.dart';
import 'package:qodraapp/features/home/domain/entities/service_entity.dart';
import 'package:qodraapp/features/home/domain/entities/user_info_entity.dart';
import 'package:qodraapp/features/home/domain/entities/work_shop_entity.dart';

abstract class HomeLocalDataSource {
  UserInfoEntity? fetchUserInfo();
  List<CarsInfoEntity>? fetchCarsInfo();
  List<ServiceEntity>? fetchServicesInfo();
  WorkShopEntity? fetchWorkShopInfo();
  List<ServiceEntity>? fetchServicesInfoOfCar();
}

class HomeLocalDataSourceImpl implements HomeLocalDataSource {
  @override
  UserInfoEntity? fetchUserInfo() {
    var UserInfobox = Hive.box<UserInfoEntity>(userInfoDataKeyBox);
    return UserInfobox.get(userInfoDataKey);
  }

  @override
  List<CarsInfoEntity>? fetchCarsInfo() {
    var CarsInfobox = Hive.box<CarsInfoEntity>(carsInfoDataBox);
    return CarsInfobox.values.toList();
  }

  @override
  List<ServiceEntity>? fetchServicesInfo() {
    var servicesInfoBox = Hive.box<ServiceEntity>(servicesDataBox);
    return servicesInfoBox.values.toList();
  }

  @override
  WorkShopEntity? fetchWorkShopInfo() {
    var workShopInfoBox = Hive.box<WorkShopEntity>(workShopsDataBox);
    return workShopInfoBox.get(workShopsDataKey);
  }

  @override
  List<ServiceEntity>? fetchServicesInfoOfCar() {
    var servicesInfoBoxOfCar = Hive.box<ServiceEntity>(carServicesDataBox);
    return servicesInfoBoxOfCar.values.toList();
  }
}
