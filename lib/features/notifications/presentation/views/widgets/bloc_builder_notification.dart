import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qodraapp/core/services/secure_prefs.dart';
import 'package:qodraapp/core/utlis/appImages.dart';
import 'package:qodraapp/core/utlis/app_colors.dart';
import 'package:qodraapp/core/utlis/constants.dart';
import 'package:qodraapp/core/widgets/error_widget.dart';
import 'package:qodraapp/features/notifications/domain/entites/notification_entity.dart';
import 'package:qodraapp/features/notifications/presentation/manager/notification_cubit.dart/notification_cubit.dart';
import 'package:qodraapp/features/notifications/presentation/manager/notification_cubit.dart/notification_states.dart';
import 'package:qodraapp/features/notifications/presentation/views/widgets/loading_list_widget.dart';
import 'package:qodraapp/features/notifications/presentation/views/widgets/notification_view_body_ui.dart';
import 'package:qodraapp/features/notifications/presentation/views/widgets/types_notifaction_item.dart';
import 'package:qodraapp/generated/l10n.dart';

class NotificationViewBody extends StatefulWidget {
  const NotificationViewBody({super.key});

  @override
  State<NotificationViewBody> createState() => _NotificationViewBodyState();
}

class _NotificationViewBodyState extends State<NotificationViewBody> {
  int isSelected = 0;
  String? token = '';

  Color get notificationColor {
    switch (isSelected) {
      case 1:
        return AppColors.goldRank;
      case 2:
        return AppColors.green;
      case 3:
        return AppColors.darkGray;
      default:
        return AppColors.main;
    }
  }

  int get notificationType {
    switch (isSelected) {
      case 0:
        return 3;
      case 1:
        return 2;
      case 2:
        return 0;
      case 3:
        return 1;
      default:
        return 3;
    }
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void _retry() {
    if (token != null) {
      context.read<NotificationCubit>().getNotificationsData(
            notificationType: notificationType,
            token: token!,
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TypesNotificationRow(
          isSelected: isSelected,
          onTap: (idx) {
            isSelected = idx;
            setState(() {});
            _retry();
          },
        ),
        BlocBuilder<NotificationCubit, NotificationState>(
          builder: (context, state) {
            List<NotificationEntity> list = [];

            if (state is NotificationLoading || state is NotificationInitial) {
              return LoadingWidgetList(
                color: notificationColor,
              );
            }
            if (state is NotificationSuccess) {
              list = state.Notifications;
              if (list.isEmpty) {
                return Expanded(
                  child: ErrorWidgetUi(
                    txt1: S.of(context).no_notifications_available,
                    txt2: S.of(context).no_notifications_available_retry,
                    photo: Assets.imagesNoDataError,
                    onPressed: _retry,
                  ),
                );
              }
            }

            if (state is NotificationError) {
              if (state.message == 'No Internet Conncetion') {
                return Expanded(
                  child: ErrorWidgetUi(
                    photo: Assets.imagesNoInternet,
                    txt1: S.of(context).NoInternetConnection,
                    txt2: S.of(context).no_internet_retry,
                    onPressed: _retry,
                  ),
                );
              } else {
                return Expanded(
                  child: ErrorWidgetUi(
                    txt1: S.of(context).error_occurred,
                    txt2: S.of(context).error_occurred_retry,
                    photo: Assets.imagesError,
                    onPressed: _retry,
                  ),
                );
              }
            }
            return NotificationBodyUi(
              token: token,
              notificationType: notificationType,
              list: list,
              notificationColor: notificationColor,
            );
          },
        ),
      ],
    );
  }

  Future<void> fetchData() async {
    token = await SecurePrefs.getString(tokenSecureKey);

    if (token != null && token!.isNotEmpty && mounted) {
      context.read<NotificationCubit>().getNotificationsData(
            notificationType: notificationType,
            token: token!,
          );
    }
  }
}
