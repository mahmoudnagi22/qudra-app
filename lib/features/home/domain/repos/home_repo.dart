import 'package:dartz/dartz.dart';
import 'package:qodraapp/core/errors/faluire.dart';
import 'package:qodraapp/features/home/domain/entities/cars_info_entity.dart';
import 'package:qodraapp/features/home/domain/entities/service_entity.dart';
import 'package:qodraapp/features/home/domain/entities/user_info_entity.dart';
import 'package:qodraapp/features/home/domain/entities/work_shop_entity.dart';

abstract class HomeRepo {
  Future<Either<Failure, UserInfoEntity>> getUserInfo({required String id , bool? isRefresh });

  Future<Either<Failure, List<CarsInfoEntity>>> getCarsInfo(
      {required String customerId, required String token , bool? isRefresh});

  Future<Either<Failure, List<ServiceEntity>>> getLatestServicesInfo(
      {required String userId , bool? isRefresh});

  Future<Either<Failure, WorkShopEntity>> getWorkShopInfo(
      {required String token, bool? isRefresh});

  Future<Either<Failure, List<ServiceEntity>>> getLatestServicesInfoOfCar(
      {required String token, required int carId});
}
