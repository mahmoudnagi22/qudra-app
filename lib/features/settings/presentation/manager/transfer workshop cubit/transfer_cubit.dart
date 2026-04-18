import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qodraapp/features/settings/domain/repos/setttings_repo.dart';
import 'package:qodraapp/features/settings/presentation/manager/transfer%20workshop%20cubit/transfer_states.dart';
import 'package:qodraapp/features/settings/transfer_constants.dart';

class TransferCubit extends Cubit<TransferState> {
  TransferCubit(this.settingsRepo) : super(TransferInitial());
  final SetttingsRepo settingsRepo;

  Future<void> transferWorkshop(
      {required String token,
      required String fromCode,
      required String toCode}) async {
    emit(TransferLoading());
    final result = await settingsRepo.transferWorkshop(
      token: token,
      fromCode: fromCode,
      toCode: toCode,
      reason: kDefaultTransferReason,
    );
    result.fold((failure) {
      emit(TransferFailure(errorMessage: failure.errorMessage));
    }, (r) {
      emit(TransferSuccess());
    });
  }
}
