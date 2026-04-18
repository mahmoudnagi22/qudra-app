import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:qodraapp/core/errors/faluire.dart';
import 'package:qodraapp/core/services/network_info.dart';
import 'package:qodraapp/features/home/data/data%20sources/local_data_source.dart';
import 'package:qodraapp/features/home/data/data%20sources/remote_data_source.dart';
import 'package:qodraapp/features/home/domain/entities/cars_info_entity.dart';
import 'package:qodraapp/features/home/domain/entities/service_entity.dart';
import 'package:qodraapp/features/home/domain/entities/user_info_entity.dart';
import 'package:qodraapp/features/home/domain/entities/work_shop_entity.dart';
import 'package:qodraapp/features/home/domain/repos/home_repo.dart';

class HomeRepoImp implements HomeRepo {
  HomeRemoteDataSource remoteDataSource;
  HomeLocalDataSource localDataSource;
  NetworkInfo networkInfo;

  HomeRepoImp({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, UserInfoEntity>> getUserInfo({
    required String id,
    bool? isRefresh,
  }) async {
    try {
      if(!await networkInfo.hasInternet()){
        UserInfoEntity? localResult = localDataSource.fetchUserInfo();
        return localResult != null
            ? Right(localResult)
            : Left(ServerFailure(errorMessage: "No Internet Connection"));
      }
      UserInfoEntity userInfoEntity =
          await remoteDataSource.getUserInfo(id: id);
      return Right(userInfoEntity);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.FromDioError(e));
      }
      return Left(ServerFailure(errorMessage: e.toString()));
    }
  }

  //--------------------------------------------------------
  @override
  Future<Either<Failure, List<CarsInfoEntity>>> getCarsInfo({
    required String customerId,
    required String token,
    bool? isRefresh,
  }) async {
    try {
    if(!await networkInfo.hasInternet()){
      List<CarsInfoEntity>? localResult = localDataSource.fetchCarsInfo();
      return localResult != null && localResult.isNotEmpty
          ? Right(localResult)
          : Left(ServerFailure(errorMessage: "No Internet Connection"));
    }
    List<CarsInfoEntity> carsList =
        await remoteDataSource.getCarsInfo(customerId: customerId, token: token);
    return Right(carsList);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.FromDioError(e));
      }
      return Left(ServerFailure(errorMessage: 'Request failed: ${e.toString()}'));
    }
  }

  //---------------------------------------------------------------

  @override
  Future<Either<Failure, List<ServiceEntity>>> getLatestServicesInfo({
    required String userId,
    bool? isRefresh,
  }) async {
    try {
      if(!await networkInfo.hasInternet()){
        List<ServiceEntity>? localResult = localDataSource.fetchServicesInfo();
        return localResult != null && localResult.isNotEmpty
            ? Right(localResult)
            : Left(ServerFailure(errorMessage: "No Internet Connection"));
      }
      List<ServiceEntity> servicesList =
          await remoteDataSource.getLatestServicesInfo(userId: userId);
      return Right(servicesList);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.FromDioError(e));
      }
      return Left(ServerFailure(errorMessage: e.toString()));
    }
  }

  //-------------------------------------------------------------
  
  @override
  Future<Either<Failure, WorkShopEntity>> getWorkShopInfo({
    required String token,
    bool? isRefresh,
  }) async {
    try {
      if(!await networkInfo.hasInternet()){
        WorkShopEntity? localResult = localDataSource.fetchWorkShopInfo();
        return localResult != null
            ? Right(localResult)
            : Left(ServerFailure(errorMessage: "No Internet Connection"));
      }
      WorkShopEntity workShopEntity =
          await remoteDataSource.getWorkShopInfo(token: token);
      return Right(workShopEntity);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.FromDioError(e));
      }
      return Left(ServerFailure(errorMessage: e.toString()));
    }
  }

  //--------------------------------------------------------

  @override
  Future<Either<Failure, List<ServiceEntity>>> getLatestServicesInfoOfCar({
    required String token,
    required int carId,
  }) async {
    try {
      if(!await networkInfo.hasInternet()){
        return Left(ServerFailure(errorMessage: "No Internet Connection"));
      }
      List<ServiceEntity> sessionsList = await remoteDataSource
          .getLatestServicesInfoOfCar(token: token, carId: carId);
      return Right(sessionsList);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.FromDioError(e));
      }
      return Left(ServerFailure(errorMessage: e.toString()));
    }
  }
}