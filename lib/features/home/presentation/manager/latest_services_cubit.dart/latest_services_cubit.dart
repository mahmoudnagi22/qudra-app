import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qodraapp/features/home/domain/repos/home_repo.dart';
import 'package:qodraapp/features/home/presentation/manager/latest_services_cubit.dart/latest_servises_states.dart';

class LatestServicesCubit extends Cubit<LatesServicesInfoState> {
  LatestServicesCubit(this.homeRepo) : super(LatesServicesInitial());
  HomeRepo homeRepo;

  Future<void> getLatestServicesInfo(
      {required String userId, bool? isRefresh}) async {
    if (isClosed) return;
    emit(LatesServicesLoading());
    final result = await homeRepo.getLatestServicesInfo(
        userId: userId, isRefresh: isRefresh);
    result.fold(
      (failure) {
        if (isClosed) return;
        emit(LatesServicesError(message: failure.errorMessage));
      },
      (sessionsData) {
        if (isClosed) return;
        emit(LatesServicesSucsess(sessionsData));
      },
    );
  }
}
