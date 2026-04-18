
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:qodraapp/core/services/secure_prefs.dart';
import 'package:qodraapp/core/utlis/constants.dart';

Future<String> getDeviceId() async {
  final deviceInfo = DeviceInfoPlugin();
  if (Platform.isAndroid) {
    final androidInfo = await deviceInfo.androidInfo;
    SecurePrefs.setString(deviceIdKey, androidInfo.id);
    return androidInfo.id ;

  } else if (Platform.isIOS) {
    final iosInfo = await deviceInfo.iosInfo;
    SecurePrefs.setString(deviceIdKey, iosInfo.identifierForVendor ?? 'unknown');
    return iosInfo.identifierForVendor ?? 'unknown';
    
  } else {
    return 'unsupported_platform';
  }
}