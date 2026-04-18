import 'package:dartz/dartz.dart';
import 'package:qodraapp/core/errors/faluire.dart';

abstract class AuthRepo {
  Future<Either<Failure, String>> signIn(
      {required String phoneNum, required String password , required String fcmToken , required String deviceId});

  Future<Either<Failure , Unit>> sendOtp({required String phoneNum});

  Future<Either<Failure , Unit>> verfiyOtp({required String phone , required String otp});

  Future<Either<Failure , Unit>> resetPassword({required String phoneNum , required String newPassword});
}
