import 'package:qodraapp/features/home/domain/entities/service_entity.dart';

String getServiceName(
    {required ServiceEntity serviceEntity}) {
  List<String>serviceNameList = [];
  String serviceName;
  if (serviceEntity.oilChanged == true) {
    serviceNameList.add('تغيير زيت المحرك');
  }
  List<String>? additionalServices = serviceEntity.additionalServices;
  if (additionalServices != null) {
    serviceNameList.addAll(serviceEntity.additionalServices!);
  }
  serviceName = serviceNameList.join(' + ');
  return serviceName;
}
