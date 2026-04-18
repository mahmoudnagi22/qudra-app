import 'package:dartz/dartz.dart';
import 'package:qodraapp/core/errors/faluire.dart';
import 'package:qodraapp/features/notifications/domain/entites/notification_entity.dart';

abstract class NotificationsRepo {
  Future<Either<Failure , List<NotificationEntity>>> getNotifactions(
      {required int notificationType, required String token});
}
