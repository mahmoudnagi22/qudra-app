abstract class TransferState {}
class TransferInitial extends TransferState {}
class TransferLoading extends TransferState {}
class TransferSuccess extends TransferState {}
class TransferFailure extends TransferState {
  final String errorMessage;
  TransferFailure({required this.errorMessage});
}