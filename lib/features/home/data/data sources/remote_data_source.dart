import 'package:dio/dio.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:qodraapp/core/services/api_services.dart';
import 'package:qodraapp/core/utlis/constants.dart';
import 'package:qodraapp/features/home/data/models/cars_info_model.dart';
import 'package:qodraapp/features/home/data/models/lates_services_data.dart';
import 'package:qodraapp/features/home/data/models/user_info_model.dart';
import 'package:qodraapp/features/home/domain/entities/cars_info_entity.dart';
import 'package:qodraapp/features/home/domain/entities/service_entity.dart';
import 'package:qodraapp/features/home/domain/entities/user_info_entity.dart';
import 'package:qodraapp/features/home/domain/entities/work_shop_entity.dart';

abstract class HomeRemoteDataSource {
  Future<UserInfoEntity> getUserInfo({required String id});
  Future<List<CarsInfoEntity>> getCarsInfo(
      {required String customerId, required String token});
  Future<List<ServiceEntity>> getLatestServicesInfo({required String userId});
  Future<WorkShopEntity> getWorkShopInfo({required String token});
  Future<List<ServiceEntity>> getLatestServicesInfoOfCar({required String token , required int carId});

}

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  ApiServices apiServices;
  HomeRemoteDataSourceImpl({required this.apiServices});
  @override
  Future<UserInfoEntity> getUserInfo({required String id}) async {
    Response response = await apiServices.getData(
        queryParameters: {'userId': id}, endPoint: '/api/User/GetUserById');
   var box = Hive.box<UserInfoEntity>(userInfoDataKeyBox);
    Map<String, dynamic> data = response.data['message'];
    UserInfoModel userInfoModel = UserInfoModel.fromJson(data);
    await box.clear();
    box.put(userInfoDataKey, userInfoModel);
    return userInfoModel;
  }

  //--------------------------------------------------------

  @override
  Future<List<CarsInfoEntity>> getCarsInfo(
      {required String customerId, required String token}) async {
    Response response = await apiServices.getData(
        token: token,
        queryParameters: {'UserId': customerId},
        endPoint: '/api/Car/GetAllCarsForUser');
    var box = Hive.box<CarsInfoEntity>(carsInfoDataBox);
    List<dynamic> data = response.data['data'];
    List<CarsInfoEntity> cars = getCarsData(data);
    await box.clear();
    for (var car in cars) {
      box.add(car);
    }
    return cars;
  }

  //--------------------------------------------------------

  @override
  Future<List<ServiceEntity>> getLatestServicesInfo(
      {required String userId}) async {
    Response response = await apiServices
        .getData(endPoint: '/api/Session/GetSessionsforUser', queryParameters: {
      'userId': userId,
    });
    List<dynamic> data = response.data['message'];
    List<ServiceEntity> sessionsList = getLatestServicesList(data);
    var box = Hive.box<ServiceEntity>(servicesDataBox);
    await box.clear();
    for (var service in sessionsList) {
      box.add(service);
    }
    return sessionsList;
  }

//--------------------------------------------------------

  @override
  Future<WorkShopEntity> getWorkShopInfo({required String token}) async {
    Response response =
        await apiServices.getData(endPoint: '/api/User/GetWorkshop' , 
        token: token
        );
    Map<String, dynamic> data = response.data['message'];
    WorkShopEntity workShopEntity = WorkShopEntity.fromJson(data);
    var box = Hive.box<WorkShopEntity>(workShopsDataBox);
    await box.clear();
    box.put(workShopsDataKey, workShopEntity);
    return workShopEntity;
  }
//--------------------------------------------------------

  @override
  Future<List<ServiceEntity>> getLatestServicesInfoOfCar({required String token , required int carId}) async{
    Response response = await apiServices
        .getData(endPoint: '/api/Session/GetSessionsforCar', queryParameters: {
      'carId': carId,
    }  , token: token);
    List<dynamic> data = response.data['message'];
    List<ServiceEntity> sessionsList = getLatestServicesList(data);
    var box = Hive.box<ServiceEntity>(carServicesDataBox);
    await box.clear();
    for (var service in sessionsList) {
      box.add(service);
    } 
    return sessionsList;
  }
}

//--------------------------------------------------------

List<CarsInfoModel> getCarsData(List<dynamic> data) {
  List<CarsInfoModel> cars = [];
  for (int i = 0; i < data.length; i++) {
    cars.add(CarsInfoModel.fromJson(data[i]));
  }
  return cars;
}

List<LatesServicesModel> getLatestServicesList(List<dynamic> data) {
  List<LatesServicesModel> sessions = [];
  for (int i = 0; i < data.length; i++) {
    sessions.add(LatesServicesModel.fromJson(data[i]));
  }
  return sessions;
}
