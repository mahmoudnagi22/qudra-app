abstract class VerifyOtpStates {}

class VerifyOtpInit extends VerifyOtpStates {}

class VerifyOtpLoading extends VerifyOtpStates {}

class VerifyOtpFaluire extends VerifyOtpStates {
  final String errorMessage;
  VerifyOtpFaluire({required this.errorMessage});
}

class VerifyOtpSuccess extends VerifyOtpStates {
 
}
