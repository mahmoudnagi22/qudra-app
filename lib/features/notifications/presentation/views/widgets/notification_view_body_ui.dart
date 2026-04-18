import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qodraapp/core/utlis/app_colors.dart';
import 'package:qodraapp/features/notifications/domain/entites/notification_entity.dart';
import 'package:qodraapp/features/notifications/presentation/manager/notification_cubit.dart/notification_cubit.dart';
import 'package:qodraapp/features/notifications/presentation/views/widgets/notification_item.dart';

class NotificationBodyUi extends StatelessWidget {
  const NotificationBodyUi({
    super.key,
    required this.token,
    required this.notificationType,
    required this.list,
    required this.notificationColor,
  });

  final String? token;
  final int notificationType;
  final List<NotificationEntity> list;
  final Color notificationColor;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: RefreshIndicator(
        color: AppColors.main,
        onRefresh: () async {
          if (token != null) {
            BlocProvider.of<NotificationCubit>(context)
                .getNotificationsData(
              notificationType: notificationType,
              token: token!,
            );
          }
        },
        child: ListView.builder(
          physics: const AlwaysScrollableScrollPhysics(),
          padding: EdgeInsets.zero,
          itemCount: list.length,
          itemBuilder: (context, index) {
            return NotificationItem(
              txt: list[index].txt,
              color: notificationColor,
            );
          },
        ),
      ),
    );
  }
}
