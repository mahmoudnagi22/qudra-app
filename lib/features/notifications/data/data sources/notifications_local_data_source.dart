import 'package:hive/hive.dart';
import 'package:qodraapp/core/utlis/constants.dart';
import 'package:qodraapp/features/notifications/domain/entites/notification_entity.dart';

abstract class NotificationsLocalDataSource {
  List<NotificationEntity>? getLocalNotifications({required String typeId});
}

class NotificationsLocalDataSourceImp implements NotificationsLocalDataSource {
  @override
  List<NotificationEntity>? getLocalNotifications({required String typeId}) {
   final box = Hive.box<List<NotificationEntity>>(notificationBox);

  List<NotificationEntity>? list = box.get(typeId , defaultValue: []);

  return list;
  }

}

