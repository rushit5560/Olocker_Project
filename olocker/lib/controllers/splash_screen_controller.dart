import 'dart:async';
import 'dart:developer';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:olocker/constants/user_details.dart';
import 'package:olocker/main.dart';
import 'package:olocker/screens/index_screen/index_screen.dart';
import 'package:olocker/utils/user_prefs_data.dart';
import 'package:rxdart/subjects.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../screens/auth_screen/auth_screen.dart';
// import 'package:http/http.dart' as http;

// import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class SplashScreenController extends GetxController {
  UserPrefsData userPrefsData = UserPrefsData();

  // final notifications = FlutterLocalNotificationsPlugin();
  // // late AndroidNotificationChannel channel;
  // late final NotificationService notificationService;

  FirebaseMessaging messaging = FirebaseMessaging.instance;
  goToNextScreenFunction() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    // Get Prefs Data in Local Variable
    UserDetails.customerLoggedIn =
        prefs.getBool(userPrefsData.customerLoggedInKey) ?? false;

    log(" UserDetails.customerLoggedIn is ::: ${UserDetails.customerLoggedIn}");

    // UserDetails.customerMobileNo =
    //     prefs.getString(userPrefsData.customerMobileNoKey) ?? '';
    // UserDetails.customerId = prefs.getString(userPrefsData.customerIdKey) ?? '';

    if (UserDetails.customerLoggedIn == false) {
      Get.off(() => AuthScreen());
    } else if (UserDetails.customerLoggedIn == true) {
      userPrefsData.getCustomerFromPrefs();
      Get.off(() => IndexScreen());
    }
  }

  @override
  void onInit() async {
    // initMethod();

    requestPermission();
    // await getDeviceTokenToSendNotification();
    // var initializationSettingsAndroid =
    //     const AndroidInitializationSettings('@mipmap/ic_launcher');
    // var initializationSetting =
    //     InitializationSettings(android: initializationSettingsAndroid);
    // flutterLocalNotificationsPlugin.initialize(initializationSetting);
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
    //         log('NOTIFICATION INIT ANDROID');
    //       }
    //     },
    //   );

    Timer(
      const Duration(seconds: 1),
      goToNextScreenFunction,
    );
    super.onInit();
  }

  String deviceTokenToSendPushNotification = "";

  Future<void> getDeviceTokenToSendNotification() async {
    log("getDeviceTokenToSendNotification");
    final FirebaseMessaging fcm = FirebaseMessaging.instance;
    final token = await fcm.getToken();
    deviceTokenToSendPushNotification = token.toString();
    await userPrefsData.setFcmInPrefs(deviceTokenToSendPushNotification);
    log("deviceTokenToSendPushNotification $deviceTokenToSendPushNotification");
  }

  void requestPermission() async {
    FirebaseMessaging messaging = FirebaseMessaging.instance;

    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      log('User Granted Permission');
    } else if (settings.authorizationStatus ==
        AuthorizationStatus.provisional) {
      log('User Granted Provisional Permission');
    } else {
      log('User declined or has not accepted permission');
    }
  }

  Future<void> initMethod() async {
    // Timer(
    //   const Duration(seconds: 2),
    //   goToNextScreenFunction,
    // );
    // requestPermission();
    // await getDeviceTokenToSendNotification();

    // FirebaseMessaging.onMessage.listen(
    //   (RemoteMessage message) async {
    //     RemoteNotification? notification = message.notification;
    //     print(notification?.body);
    //     AppleNotification? ios = message.notification?.apple;
    //     if (notification != null && ios != null) {
    //       NotificationSettings settings = await messaging.requestPermission(
    //           alert: true, badge: true, provisional: true, sound: true);

    //       // Get.snackbar(notification.title!, notification.body!);
    //       notifications.show(
    //         1,
    //         notification.title!,
    //         notification.body!,
    //         const NotificationDetails(),
    //       );

    //       log('NOTIFICATION INIT IOS');
    //       print(message.data);
    //     }
    //     AndroidNotification? android = message.notification?.android;
    //     if (notification != null && android != null) {
    //       print(notification.body);
    //       print("fjiefbjk");
    //       notifications.show(
    //         notification.hashCode,
    //         notification.title,
    //         notification.body,
    //         const NotificationDetails(
    //           android: AndroidNotificationDetails('1', 'User Activity',
    //               channelDescription: "petomate",
    //               importance: Importance.max,
    //               priority: Priority.high,
    //               ticker: 'ticker',
    //               icon: 'ic_launcher'),
    //           // iOS: IOSNotificationDetails(
    //           //     presentAlert: true, presentBadge: true, presentSound: true),
    //         ),
    //         payload: notification.android!.smallIcon,
    //       );
    //       log("NOTIFICATION DATA");
    //       print(message.data);
    //       log('NOTIFICATION INIT ANDROID');
    //     }
    //   },
    // );
  }
}

// import 'dart:io';
// import 'dart:ui';

// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:flutter_native_timezone/flutter_native_timezone.dart';
// import 'package:flutter_push_notifications/utils/download_util.dart';
// import 'package:rxdart/subjects.dart';
// import 'package:timezone/data/latest_all.dart' as tz;
// import 'package:timezone/timezone.dart' as tz;
