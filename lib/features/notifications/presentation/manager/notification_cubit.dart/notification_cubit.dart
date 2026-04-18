import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qodraapp/features/notifications/domain/repos/notifications_repo.dart';
import 'package:qodraapp/features/notifications/presentation/manager/notification_cubit.dart/notification_states.dart';

class NotificationCubit extends Cubit<NotificationState> {
  NotificationCubit(this.notificationsRepo) : super(NotificationInitial());
  NotificationsRepo notificationsRepo;
  Future<void> getNotificationsData(
      {required String token, required, required int notificationType}) async {
    emit(NotificationLoading());
    final result = await notificationsRepo.getNotifactions(
        notificationType: notificationType, token: token);
    result.fold(
      (failure) {
        emit(NotificationError(message: failure.errorMessage));
      },
      (notifications) {
        emit(NotificationSuccess(notifications));
      },
    );
  }
}
