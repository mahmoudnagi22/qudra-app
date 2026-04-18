abstract class AuthStates {}

class AuthSateInit extends AuthStates {}

class AuthLoading extends AuthStates {}

class AuthFaluire extends AuthStates {
  final String errorMessage;
  AuthFaluire({required this.errorMessage});
}

class AuthSucsess extends AuthStates {
  final String token;
  AuthSucsess({required this.token});
}

class ResetPasswordSucsess extends AuthStates {
 
}

