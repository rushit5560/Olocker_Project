import 'dart:developer';
import 'dart:io';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:olocker/constants/app_colors.dart';
import 'package:olocker/screens/splash_screen/splash_screen.dart';
import 'package:olocker/utils/themes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:sizer/sizer.dart';

// Future<void> firebseMessagenigBackgroundhendler(RemoteMessage message) async {
//   await Firebase.initializeApp();
//   log("firebseMessagenigBackgroundhendler message.messageId ${message.messageId}");
//   log("message.notification!.title ${message.notification!.title}");
//   log("message.notification!.body, ${message.notification!.body}");

//   flutterLocalNotificationsPlugin.show(
//     message.notification.hashCode,
//     message.notification!.title,
//     message.notification!.body,
//     const NotificationDetails(
//       android: AndroidNotificationDetails(
//         '1',
//         'User Activity',
//         channelDescription: "myjeweller",
//         importance: Importance.max,
//         priority: Priority.high,
//         ticker: 'ticker',
//         icon: 'ic_launcher',
//       ),
//     ),
//     payload: message.notification!.android!.smallIcon,
//   );
// }

// const AndroidNotificationChannel channel = AndroidNotificationChannel(
//   "high_importance_channel",
//   "High importance notification",
//   importance: Importance.high,
// );
// final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
//     FlutterLocalNotificationsPlugin();

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

final FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  // FirebaseMessaging.onBackgroundMessage(firebseMessagenigBackgroundhendler);
  // await flutterLocalNotificationsPlugin
  //     .resolvePlatformSpecificImplementation<
  //         AndroidFlutterLocalNotificationsPlugin>()
  //     ?.createNotificationChannel(channel);
  HttpOverrides.global = MyHttpOverrides();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      systemNavigationBarColor: AppColors.blackColor,
      statusBarColor: AppColors.whiteColor,
      statusBarIconBrightness: Brightness.dark,
    ),
  );

  // Request permission for notifications (required for iOS)
  // await firebaseMessaging.requestPermission();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return GetMaterialApp(
          title: 'Olocker',
          debugShowCheckedModeBanner: false,
          defaultTransition: Transition.fade,
          transitionDuration: const Duration(milliseconds: 400),
          theme: ThemeData(
            primarySwatch: generateMaterialColor(
              const Color(0xffed6660),
            ),
            fontFamily: 'Acephimere',
          ),
          home: SplashScreen(),
        );
      },
    );
  }
}
