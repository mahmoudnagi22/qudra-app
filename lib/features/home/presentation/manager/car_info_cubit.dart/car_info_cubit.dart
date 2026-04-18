import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qodraapp/features/home/domain/repos/home_repo.dart';
import 'package:qodraapp/features/home/presentation/manager/car_info_cubit.dart/car_info_states.dart';

class CarInfoCubit extends Cubit<CarInfoState> {
  CarInfoCubit(this.homeRepo) : super(CarInfoInitial());
  HomeRepo homeRepo;

  Future<void> getCarsInfo(
      {required String token, required String id, bool? isRefresh}) async {
    emit(CarInfoLoading());
    final result = await homeRepo.getCarsInfo(
        customerId: id, token: token, isRefresh: isRefresh);
    result.fold(
      (failure) {
        emit(CarInfoError(message: failure.errorMessage));
      },
      (carsData) {
        emit(CarInfoSucsess(carsData));
      },
    );
  }
}
