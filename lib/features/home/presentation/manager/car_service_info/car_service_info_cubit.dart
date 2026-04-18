import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qodraapp/features/home/domain/repos/home_repo.dart';
import 'package:qodraapp/features/home/presentation/manager/car_service_info/car_service_info_states.dart';

class LatestServicesCubitOfCar extends Cubit<LatesServicesInfoStateOfCar> {
  LatestServicesCubitOfCar(this.homeRepo) : super(LatesServicesInitialOfCar());
  HomeRepo homeRepo;

  Future<void> getLatestServicesInfoOfCar(
      {required String token, required int carId}) async {
    emit(LatesServicesLoadingOfCar());
    final result =
        await homeRepo.getLatestServicesInfoOfCar(token: token, carId: carId);
    result.fold((failure) {
      emit(LatesServicesErrorOfCar(message: failure.errorMessage));
    }, (sessionsData) {
      emit(LatesServicesSucsessOfCar(sessionsData));
    });
  }
}
