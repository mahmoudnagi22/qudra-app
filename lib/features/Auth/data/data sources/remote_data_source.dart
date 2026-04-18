import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:qodraapp/core/services/api_services.dart';

abstract class RemoteDataSource {
  Future<String> signIn(
      {required String phoneNum,
      required String password,
      required String fcmToken,
      required String deviceId});
  Future<void> sendOtp({required String phoneNum});

  Future<void> verfiyOtp({required String phone, required String otp});

  Future<void> resetPassword(
      {required String phoneNum, required String newPassowrd});
}

class RemoteDataSourceImp implements RemoteDataSource {
  final ApiServices apiServices;
  RemoteDataSourceImp(this.apiServices);
  @override
  Future<String> signIn(
      {required String phoneNum,
      required String password,
      required String fcmToken,
      required String deviceId}) async {
    Response response = await apiServices.postData(
        endPoint: '/api/User/LoginUser',
        data: {
          'password': password,
          'phone': phoneNum,
          'DeviceId': deviceId,
          'FCMToken': fcmToken,
        },
        isFormData: false);
    return response.data['token'];
  }

  @override
  Future<Unit> resetPassword(
      {required String phoneNum, required String newPassowrd}) async {
    await apiServices.postData(
        endPoint: '/api/Auth/ResetPassword',
        data: {
          'phone': phoneNum,
          'newPassword': newPassowrd,
        },
        isFormData: false);
    return unit ;
  }

  @override
  Future<Unit> sendOtp({required String phoneNum}) async{
    await apiServices.postData(endPoint: '/api/Auth/SendOTP',
    queryParameters: {
      'phoneNumber' : phoneNum ,
    },
     data: {}, isFormData: false);
     return unit ;
  }

  @override
  Future<Unit> verfiyOtp({required String phone, required String otp}) async{
    await apiServices.postData(endPoint: '/api/Auth/VerifyOTP', data: {
      'phone' : phone , 
      'otp' : otp ,
    }, isFormData: false);
    return unit ;
  }
}
