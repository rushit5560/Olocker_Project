import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class LocalNotificationService {
  static final FlutterLocalNotificationsPlugin _notificationsPlugin =
      FlutterLocalNotificationsPlugin();

  static void initilize() {
    final InitializationSettings initializationSettings =
        InitializationSettings(
            android: AndroidInitializationSettings("@mipmap/ic_launcher"));
    _notificationsPlugin.initialize(initializationSettings,
        onSelectNotification: (String? payload) {
      print(payload);
    });
  }

  static void showNotificationOnForeground(RemoteMessage message) {
    final notificationDetail = NotificationDetails(
        android: AndroidNotificationDetails(
            "com.example.firebase_push_notification",
            "com.myjeweller.olocker",
            importance: Importance.max,
            priority: Priority.high));

    // _notificationsPlugin.show(
    //     DateTime.now().microsecond,
    //     message.notification!.title,
    //     message.notification!.body,
    //     notificationDetail,
    //     payload: message.data["message"]);

    _notificationsPlugin.show(
            message.notification.hashCode,
            message.notification!.title,
            message.notification!.body,
            
            const NotificationDetails(
              android: AndroidNotificationDetails(
                '1',
                'User Activity',
                channelDescription: "myjeweller",
                importance: Importance.max,
                priority: Priority.high,
                ticker: 'ticker',
                icon: 'ic_launcher',
              ),
            ),
            
            payload: message.notification!.android!.smallIcon,
          );
  }
}
