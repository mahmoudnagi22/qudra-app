import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qodraapp/core/utlis/app_colors.dart';
import 'package:qodraapp/core/utlis/app_shadow.dart';

final EdgeInsets edgeInsets = EdgeInsets.symmetric(horizontal: 16.w);
final BoxDecoration boxDecoration = BoxDecoration(
  borderRadius: BorderRadius.circular(10.r),
  color: AppColors.white,
  boxShadow: const [AppShadows.dropShadow],
);
const baseUrl = 'https://api.qudra.online';
const String tokenSecureKey = 'userToken';
const String userIdSecureKey = 'UserId';
const String userIdToken =
    'http://schemas.xmlsoap.org/ws/2005/05/identity/claims/nameidentifier';

//---------------------------------------------------------
const String userInfoDataKeyBox = 'userInfoDataKey';
const String userInfoDataKey = 'userInfoDataKey';
const String carsInfoDataBox = 'carsInfoDataBox';
const String servicesDataBox = 'servicesDataBox';
const String workShopsDataBox = 'WorkShopDataBox';
const String workShopsDataKey = 'WorkShopDataKey';
const String carServicesDataBox = 'carServicesDataBox';

//---------------------------------------------------------

const String isLoggedInKey = 'isLoggedInKey';
const String viewOnboarding = 'viewOnboarding';
const String selectedLang = 'selectedLang';
const String selectedLanguageType = 'selectedLanguageType';
const String workShopNameKey = 'workShopNameKey';
const String lastMotivationalMessageIndexKey = 'lastMotivationalMessageIndex';

//---------------------------------------------------------

const String fcmTokenKey = 'fcmTokenKey';
const String deviceIdKey = 'deviceIdKey';

//---------------------------------------------------------
const String notificationBox = 'notificationBox';
const String notificationAllKey = 'notificationAllKey';
const String notificationAlertsKey = 'notificationAlertsKey';
const String notificationOffersKey = 'notificationOffersKey';
const String notificationTipsKey = 'notificationTipsKey';
