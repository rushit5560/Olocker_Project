import 'dart:developer';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:olocker/controllers/splash_screen_controller.dart';
import 'package:olocker/main.dart';
import 'package:olocker/screens/service/local_notification.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final splashScreenController = Get.put(SplashScreenController());
  // final notifications = FlutterLocalNotificationsPlugin();
  @override
  void initState() {
    LocalNotificationService.initilize();
    // trminated state
    FirebaseMessaging.instance.getInitialMessage().then((message) {
      if (message != null) {
        setState(() {
          message.notification!.hashCode;
          message.notification!.title;
          message.notification!.body;
        });
      }
    });
//forground state
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      LocalNotificationService.showNotificationOnForeground(message);

      // setState(() {
      //   message.notification!.hashCode;
      //   message.notification!.title;
      //   message.notification!.body;
      // });
    });

    //background state
    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      // setState(() {
      //   message.notification!.hashCode;
      //   message.notification!.title;
      //   message.notification!.body;
      // });
    });

    super.initState();
  }
  // @override
  // void initState() {
  //   var initializationSettingsAndroid =
  //       const AndroidInitializationSettings('@mipmap/ic_launcher');
  //   var initializationSetting =
  //       InitializationSettings(android: initializationSettingsAndroid);
  //   flutterLocalNotificationsPlugin.initialize(initializationSetting);
  //   FirebaseMessaging.onMessage.listen(
  //     (RemoteMessage message) async {
  //       log("RemoteNotification.listen");
  //       RemoteNotification? notification = message.notification;
  //       log("notification?.body: ${notification?.body}");
  //       AndroidNotification? android = message.notification?.android;
  //       if (notification != null && android != null) {
  //         log("myjeweller notification.body 111: ${notification.body}");
  //         notifications.show(
  //           notification.hashCode,
  //           notification.title,
  //           notification.body,
  //           const NotificationDetails(
  //             android: AndroidNotificationDetails(
  //               '1',
  //               'User Activity',
  //               channelDescription: "myjeweller",
  //               importance: Importance.max,
  //               priority: Priority.high,
  //               ticker: 'ticker',
  //               icon: 'ic_launcher',
  //             ),
  //           ),
  //           payload: notification.android!.smallIcon,
  //         );
  //         log("NOTIFICATION DATA");
  //         log("message.data : ${message.data}");
  //         log("notification.title : ${notification.title}");
  //         log("notification?.body : ${notification.body}");
  //         log('NOTIFICATION INIT ANDROID');
  //       }
  //     },
  //   );
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Center(
          child: Text('Splash Screen'),
        ),
      ),
    );
  }
}
