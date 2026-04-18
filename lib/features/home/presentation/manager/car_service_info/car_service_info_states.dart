import 'package:qodraapp/features/home/domain/entities/service_entity.dart';

abstract class LatesServicesInfoStateOfCar {}

class LatesServicesInitialOfCar extends LatesServicesInfoStateOfCar {}

class LatesServicesLoadingOfCar extends LatesServicesInfoStateOfCar {}

class LatesServicesSucsessOfCar extends LatesServicesInfoStateOfCar {
  final List<ServiceEntity> sessionsList;
  LatesServicesSucsessOfCar(this.sessionsList);
}

class LatesServicesErrorOfCar extends LatesServicesInfoStateOfCar {
  final String message;
  LatesServicesErrorOfCar({required this.message});
}
