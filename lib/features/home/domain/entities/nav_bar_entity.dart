import 'package:flutter/material.dart';
import 'package:qodraapp/core/utlis/appImages.dart';
import 'package:qodraapp/generated/l10n.dart';

class NavBarEntity {
  final String title;
  final String activeIcon;
  final String inactiveIcon;
  NavBarEntity(
      {required this.title,
      required this.activeIcon,
      required this.inactiveIcon});
}

List<NavBarEntity> getNavBarItems(BuildContext context) {
  return [
    NavBarEntity(
      title: S.of(context).home,
      activeIcon: Assets.imagesHomeActive,
      inactiveIcon: Assets.imagesHomeInactive,
    ),
    NavBarEntity(
      title: S.of(context).notifications,
      activeIcon: Assets.imagesNotificationsActive,
      inactiveIcon: Assets.imagesNotificationsInactive,
    ),
    NavBarEntity(
      title: S.of(context).smartAssistant,
      activeIcon: Assets.imagesChatActive,
      inactiveIcon: Assets.imagesChatInactive,
    ),
    NavBarEntity(
      title: S.of(context).settings,
      activeIcon: Assets.imagesSettingsActive,
      inactiveIcon: Assets.imagesSettingsInactive,
    ),
  ];
}
