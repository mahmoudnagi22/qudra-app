import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:qodraapp/core/errors/faluire.dart';
import 'package:qodraapp/core/services/network_info.dart';
import 'package:qodraapp/core/services/secure_prefs.dart';
import 'package:qodraapp/core/services/shared_perefrences.dart';
import 'package:qodraapp/core/utlis/constants.dart';
import 'package:qodraapp/features/Auth/data/data%20sources/remote_data_source.dart';
import 'package:qodraapp/features/Auth/domain/repos/auth_repo.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class AuthRepoImp implements AuthRepo {
  final RemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;
  AuthRepoImp(this.remoteDataSource, this.networkInfo);
  @override
  Future<Either<Failure, String>> signIn(
      {required String phoneNum,
      required String password,
      required String fcmToken,
      required String deviceId}) async {
    try {
      if (!await networkInfo.hasInternet()) {
        return left(ServerFailure(errorMessage: 'No Internet Connection'));
      }
      String token = await remoteDataSource.signIn(
          phoneNum: phoneNum,
          password: password,
          fcmToken: fcmToken,
          deviceId: deviceId);
      await SecurePrefs.setString(tokenSecureKey, token);
      String userId = JwtDecoder.decode(token)[userIdToken];
      await SecurePrefs.setString(userIdSecureKey, userId);
      await SharedPrefs.setBool(isLoggedInKey, true);
      return right(token);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.FromDioError(e));
      }
      return left(ServerFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, Unit>> resetPassword(
      {required String phoneNum, required String newPassword}) async {
    try {
      if (!await networkInfo.hasInternet()) {
        return left(ServerFailure(errorMessage: 'No Internet Connection'));
      }
      await remoteDataSource.resetPassword(
          phoneNum: phoneNum, newPassowrd: newPassword);
      return right(unit);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.FromDioError(e));
      }
      return left(ServerFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, Unit>> sendOtp({required String phoneNum}) async {
    try {
      if (!await networkInfo.hasInternet()) {
        return left(ServerFailure(errorMessage: 'No Internet Connection'));
      }
      await remoteDataSource.sendOtp(phoneNum: phoneNum);
      return right(unit);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.FromDioError(e));
      }
      return left(ServerFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, Unit>> verfiyOtp(
      {required String phone, required String otp}) async {
    try {
      if (!await networkInfo.hasInternet()) {
        return left(ServerFailure(errorMessage: 'No Internet Connection'));
      }
      await remoteDataSource.verfiyOtp(phone: phone, otp: otp);
      return right(unit);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.FromDioError(e));
      }
      return left(ServerFailure(errorMessage: e.toString()));
    }
  }
}
