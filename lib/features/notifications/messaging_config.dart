import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:qodraapp/core/services/secure_prefs.dart';
import 'package:qodraapp/core/utlis/constants.dart';
import 'package:qodraapp/features/home/presentation/views/home_view_ui.dart';

final GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey<NavigatorState>();

@pragma('vm:entry-point')
Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  log('[FCM][BG] title=${message.notification?.title} body=${message.notification?.body}');
  log('[FCM][BG] data=${message.data}');
}

class MessagingConfig {
  static final FlutterLocalNotificationsPlugin _local =
      FlutterLocalNotificationsPlugin();

  static const AndroidNotificationChannel _androidChannel =
      AndroidNotificationChannel(
    'high_importance_channel',
    'High Importance Notifications',
    description: 'This channel is used for important notifications.',
    importance: Importance.high,
    playSound: true,
  );

  static Future<void> init() async {
    // 1) Create channel (Android)
    await _local
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(_androidChannel);

    // 2) Local notifications init
    const androidInit = AndroidInitializationSettings('@mipmap/ic_launcher');
    const iosInit = DarwinInitializationSettings(
      requestSoundPermission: true,
      requestBadgePermission: true,
      requestAlertPermission: true,
    );
    const initSettings =
        InitializationSettings(android: androidInit, iOS: iosInit);

    await _local.initialize(
      initSettings,
      onDidReceiveNotificationResponse: (resp) {
        final payload = resp.payload;
        if (payload == null || payload.isEmpty) return;

        try {
          final data = jsonDecode(payload) as Map<String, dynamic>;
          _handleDataNavigation(data);
        } catch (e) {
          log('[LOCAL] payload parse error: $e');
        }
      },
      onDidReceiveBackgroundNotificationResponse:
          _backgroundNotificationTapHandler,
    );

    // 3) Permissions (iOS + Android 13+)
    await FirebaseMessaging.instance.requestPermission(
      alert: true,
      badge: true,
      sound: true,
    );

    // 4) Print FCM Token
    try {
      final token = await FirebaseMessaging.instance.getToken();
      SecurePrefs.setString(fcmTokenKey, token ?? "");
      debugPrint('✅ [FCM TOKEN] $token');
    } catch (e) {
      debugPrint('❌ [FCM TOKEN ERROR] $e');
    }
    FirebaseMessaging.instance.onTokenRefresh.listen((newToken) {
      SecurePrefs.setString(fcmTokenKey, newToken);

      debugPrint('🔁 [FCM TOKEN REFRESHED] $newToken');
    });
    // 5) Foreground messages => show local notification
    FirebaseMessaging.onMessage.listen((msg) async {
      debugPrint('📩 [FCM][FG] data=${msg.data}');
      final n = msg.notification;

      await _local.show(
        DateTime.now().millisecondsSinceEpoch ~/ 1000,
        n?.title,
        n?.body,
        const NotificationDetails(
          android: AndroidNotificationDetails(
            'high_importance_channel',
            'High Importance Notifications',
            channelDescription:
                'This channel is used for important notifications.',
            importance: Importance.high,
            priority: Priority.high,
            icon: '@mipmap/ic_launcher',
          ),
          iOS: DarwinNotificationDetails(
            presentAlert: true,
            presentBadge: true,
            presentSound: true,
          ),
        ),
        payload: jsonEncode(msg.data),
      );
    });

    // 6) App opened from terminated by notification
    final initial = await FirebaseMessaging.instance.getInitialMessage();
    if (initial != null) {
      debugPrint('🚀 [FCM][TERMINATED OPEN] data=${initial.data}');
      _handleDataNavigation(initial.data);
    }

    // 7) App opened from background by notification
    FirebaseMessaging.onMessageOpenedApp.listen((msg) {
      debugPrint('🟠 [FCM][BG OPEN] data=${msg.data}');
      _handleDataNavigation(msg.data);
    });
  }

  @pragma('vm:entry-point')
  static void _backgroundNotificationTapHandler(NotificationResponse resp) {
    log('[LOCAL][BG TAP] payload=${resp.payload}');
  }

  static void _handleDataNavigation(Map<String, dynamic> data) {
    final ctx = rootNavigatorKey.currentContext;
    if (ctx == null) return;

final state = ctx.findAncestorStateOfType<HomeViewUiState>();
    if (state != null) {
      state.setPage(1); 
      debugPrint('➡️ [FCM NAV] Navigated to Notifications, data=$data');
    }
  }
}
