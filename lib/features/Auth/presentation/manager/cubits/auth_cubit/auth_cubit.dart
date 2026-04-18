import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qodraapp/features/Auth/domain/repos/auth_repo.dart';
import 'package:qodraapp/features/Auth/presentation/manager/cubits/auth_cubit/auth_sates.dart';

class AuthCubit extends Cubit<AuthStates> {
  AuthCubit(this.authRepo) : super(AuthSateInit());
  final AuthRepo authRepo;
  signIn({required String phoneNum, required String password, required String fcmToken, required String deviceId}) async {
    emit(AuthLoading());
    var result = await authRepo.signIn(phoneNum: phoneNum, password: password, fcmToken: fcmToken, deviceId: deviceId);
    result.fold((faluire) {
      emit(AuthFaluire(errorMessage: faluire.errorMessage));
    }, (token) {
      emit(AuthSucsess(token: token));
    });
  }
  sendOtp({required String phoneNum}) async{
   emit(AuthLoading());
    var result = await authRepo.sendOtp(phoneNum: phoneNum);
    result.fold((faluire) {
      emit(AuthFaluire(errorMessage: faluire.errorMessage));
    }, (token) {
      emit(ResetPasswordSucsess());
    });
  }
  verfiyOtp({required String phone , required String otp}) async {
    emit(AuthLoading());
    var result = await authRepo.verfiyOtp(phone: phone, otp: otp);
    result.fold((faluire) {
      emit(AuthFaluire(errorMessage: faluire.errorMessage));
    }, (token) {
      emit(ResetPasswordSucsess());
    });
  }

  resetPassword({required String phone , required String newPassword}) async {
    emit(AuthLoading());
    var result = await authRepo.resetPassword(phoneNum: phone, newPassword: newPassword);
    result.fold((faluire) {
      emit(AuthFaluire(errorMessage: faluire.errorMessage));
    }, (token) {
      emit(ResetPasswordSucsess());
    });
  }
}

