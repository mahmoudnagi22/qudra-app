import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qodraapp/features/Auth/domain/repos/auth_repo.dart';
import 'package:qodraapp/features/Auth/presentation/manager/cubits/reset_password_cubit/reset_states.dart';

class ResetPasswordCubit extends Cubit<ResetPasswordStates> {
  ResetPasswordCubit(this.authRepo) : super(ResetPasswordInit());

  final AuthRepo authRepo;

  resetPassword({required String phone, required String newPassword }) async {
    emit(ResetPasswordLoading());
    var result = await authRepo.resetPassword(
      phoneNum: phone,
      newPassword: newPassword,
    );
    result.fold(
      (faluire) {
        emit(ResetPasswordFaluire(errorMessage: faluire.errorMessage));
      },
      (token) {
        emit(ResetPasswordSuccess());
      },
    );
  }
}
