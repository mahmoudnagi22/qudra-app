import 'package:dio/dio.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:qodraapp/core/services/api_services.dart';
import 'package:qodraapp/core/services/shared_perefrences.dart';
import 'package:qodraapp/core/utlis/constants.dart';
import 'package:qodraapp/features/notifications/domain/entites/notification_entity.dart';

abstract class NotificationsRemoteDataSource {
  Future<List<NotificationEntity>> getNotifactions(
      {required int notificationType, required String token});
}

class NotificationsRemoteDataSourceImp
    implements NotificationsRemoteDataSource {
  ApiServices apiServices;
  NotificationsRemoteDataSourceImp(this.apiServices);
  @override
  Future<List<NotificationEntity>> getNotifactions(
      {required int notificationType, required String token}) async {
    Response response = await apiServices.getData(
        endPoint: '/api/Notification/GetAllNotificationsByCustomerToken',
        queryParameters: {
          'lang': SharedPrefs.getString(selectedLanguageType),
          'notificationType': notificationType,
        },
        token: token);
  List<NotificationEntity> notificationList = getNotifactionsList(response.data['data']);
  var box = Hive.box<List<NotificationEntity>>(notificationBox);
   await box.delete(notificationType.toString());
    box.put(notificationType.toString(), notificationList) ;
    return notificationList;
  }
}

List<NotificationEntity> getNotifactionsList(List<dynamic> dataList) {
  List<NotificationEntity> notificationList = [];
  for (int i = 0; i < dataList.length; i++) {
    notificationList.add(NotificationEntity.fromJson(dataList[i]));
  }
  return notificationList;
}
