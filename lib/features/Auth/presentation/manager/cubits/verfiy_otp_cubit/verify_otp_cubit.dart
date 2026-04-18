import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qodraapp/features/Auth/domain/repos/auth_repo.dart';
import 'package:qodraapp/features/Auth/presentation/manager/cubits/verfiy_otp_cubit/verify_otp_states.dart';

class VerifyOtpCubit extends Cubit<VerifyOtpStates> {
  VerifyOtpCubit(this.authRepo) : super(VerifyOtpInit());

  final AuthRepo authRepo;

  verfiyOtp({required String phone, required String otp}) async {
    emit(VerifyOtpLoading());
    var result = await authRepo.verfiyOtp(phone: phone, otp: otp);
    result.fold(
      (faluire) {
        emit(VerifyOtpFaluire(errorMessage: faluire.errorMessage));
      },
      (sucsess) {
        emit(VerifyOtpSuccess());
      },
    );
  }
}
