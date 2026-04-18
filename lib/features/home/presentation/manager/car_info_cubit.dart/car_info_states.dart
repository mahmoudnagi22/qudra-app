import 'package:qodraapp/features/home/domain/entities/cars_info_entity.dart';

abstract class CarInfoState {}

class CarInfoInitial extends CarInfoState {}

class CarInfoLoading extends CarInfoState {}

class CarInfoSucsess extends CarInfoState {
  final List<CarsInfoEntity> cars;
  CarInfoSucsess(this.cars);
}

class CarInfoError extends CarInfoState {
  final String message;
  CarInfoError({required this.message});
}
