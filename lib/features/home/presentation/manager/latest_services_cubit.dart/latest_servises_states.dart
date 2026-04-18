import 'package:qodraapp/features/home/domain/entities/service_entity.dart';

abstract class LatesServicesInfoState {}

class LatesServicesInitial extends LatesServicesInfoState {}

class LatesServicesLoading extends LatesServicesInfoState {}

class LatesServicesSucsess extends LatesServicesInfoState {
  final List<ServiceEntity> sessionsList;
  LatesServicesSucsess(this.sessionsList);
}

class LatesServicesError extends LatesServicesInfoState {
  final String message;
  LatesServicesError({required this.message});
}
