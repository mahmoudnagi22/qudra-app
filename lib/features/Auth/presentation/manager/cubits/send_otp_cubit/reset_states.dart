abstract class ResetStates {}

class ResetStateInit extends ResetStates {}

class ResetLoading extends ResetStates {}

class ResetFaluire extends ResetStates {
  final String errorMessage;
  ResetFaluire({required this.errorMessage});
}

class ResetSucsess extends ResetStates {
 final String phoneNum ; 
 ResetSucsess(this.phoneNum);
}


