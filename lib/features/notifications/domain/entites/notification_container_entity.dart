import 'package:flutter/material.dart';
import 'package:qodraapp/core/utlis/appImages.dart';
import 'package:qodraapp/generated/l10n.dart';

class NotificationContainerEntity {
  final String title;
  final String? icon;

  NotificationContainerEntity({
    required this.title,
    this.icon,
  });
}

List<NotificationContainerEntity> getNotifactionItems(BuildContext context) {
  return [
    NotificationContainerEntity(title: S.of(context).all),
    NotificationContainerEntity(
        title: S.of(context).alerts, icon: Assets.imagesAlert),
    NotificationContainerEntity(
        title: S.of(context).offers, icon: Assets.imagesOffers),
    NotificationContainerEntity(
        title: S.of(context).tips, icon: Assets.imagesTips),
  ];
}
