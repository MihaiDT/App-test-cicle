import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_app_badger/flutter_app_badger.dart';
import 'package:lines/core/utils/helpers.dart';

class PushNotification {
  static void cleanupAppBadge() async {
    if (await FlutterAppBadger.isAppBadgeSupported()) {
      FlutterAppBadger.removeBadge();
    }
  }

  static void updateAppBadge(int counter) async {
    if (await FlutterAppBadger.isAppBadgeSupported()) {
      FlutterAppBadger.updateBadgeCount(counter);
    }
  }

  static Future<String?> getToken() async {
    const token = '';
    // FIXME: PUSH await FirebaseMessaging.instance.getToken();

    logDebug(
      "Token: $token",
      tag: "PUSH",
    );

    return token;
  }

  static Future<bool> isPushPermissionEnabled() async {
    final notificationSettings = await requestPushPermission();

    return notificationSettings.authorizationStatus ==
        AuthorizationStatus.authorized;
  }

  static Future<NotificationSettings> requestPushPermission() async {
    // Chiedo i permessi per ricevere notifiche push
    return await FirebaseMessaging.instance.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );
  }

  static void listeningNewNotifications() {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      logDebug(
        'Got a message whilst in the foreground!',
        tag: "PUSH",
      );
      logDebug(
        'Message data: ${message.notification?.title} - ${message.notification?.body}',
        tag: "PUSH",
      );

      if (message.notification != null) {
        logDebug(
          'Message also contained a notification: ${message.notification}',
          tag: "PUSH",
        );
      }
    });
  }

  static void onTapOnMesage() {
    /// App completamente chiusa
    FirebaseMessaging.instance
        .getInitialMessage()
        .then((RemoteMessage? message) {
      if (message != null) {
        logDebug(
          "Tap sulla notifica del OS: ${message.notification?.title ?? ''} - ${message.notification?.body ?? ''}",
          tag: "PUSH",
        );
      }
    });

    /// App aperta in background
    Stream<RemoteMessage> stream = FirebaseMessaging.onMessageOpenedApp;
    stream.listen((RemoteMessage message) async {
      logDebug(
        "Tap sulla notifica del OS: ${message.notification?.title ?? ''} - ${message.notification?.body ?? ''}",
        tag: "PUSH",
      );
    });
  }
}
