import 'package:qodraapp/features/notifications/domain/entites/notification_entity.dart';

abstract class NotificationState {}

class NotificationInitial extends NotificationState {}

class NotificationLoading extends NotificationState {}

class NotificationSuccess extends NotificationState {
  final List<NotificationEntity> Notifications;
  NotificationSuccess(this.Notifications);
}

class NotificationError extends NotificationState {
  final String message;
  NotificationError({required this.message});
}
