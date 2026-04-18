abstract class ResetPasswordStates {}

class ResetPasswordInit extends ResetPasswordStates {}

class ResetPasswordLoading extends ResetPasswordStates {}

class ResetPasswordFaluire extends ResetPasswordStates {
  final String errorMessage;
  ResetPasswordFaluire({required this.errorMessage});
}

class ResetPasswordSuccess extends ResetPasswordStates {}
