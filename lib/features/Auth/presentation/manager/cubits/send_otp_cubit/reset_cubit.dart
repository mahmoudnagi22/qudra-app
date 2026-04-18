import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qodraapp/features/Auth/domain/repos/auth_repo.dart';
import 'package:qodraapp/features/Auth/presentation/manager/cubits/send_otp_cubit/reset_states.dart';

class SendOtpCubit extends Cubit<ResetStates> {
  SendOtpCubit(this.authRepo) : super(ResetStateInit());
  final AuthRepo authRepo;
  sendOtp({required String phoneNum}) async{
   emit(ResetLoading());
    var result = await authRepo.sendOtp(phoneNum: phoneNum);
    result.fold((faluire) {
      emit(ResetFaluire(errorMessage: faluire.errorMessage));
    }, (token) {
      emit(ResetSucsess(phoneNum));
    });
  }
  /* verfiyOtp({required String phone , required String otp}) async {
    emit(ResetLoading());
    var result = await authRepo.verfiyOtp(phone: phone, otp: otp);
    result.fold((faluire) {
      emit(ResetFaluire(errorMessage: faluire.errorMessage));
    }, (token) {
      emit(ResetSucsess());
    });
  }

  resetPassword({required String phone , required String newPassword}) async {
     emit(ResetLoading());
    var result = await authRepo.resetPassword(phoneNum: phone, newPassword: newPassword);
    result.fold((faluire) {
     emit(ResetFaluire(errorMessage: faluire.errorMessage));
    }, (token) {
       emit(ResetSucsess());
    });
  } */
}

