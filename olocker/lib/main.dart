import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:olocker/constants/app_colors.dart';
import 'package:olocker/screens/splash_screen/splash_screen.dart';
import 'package:olocker/utils/themes.dart';
import 'package:sizer/sizer.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

FlutterLocalNotificationsPlugin notificationplugin =
    FlutterLocalNotificationsPlugin();

void main() async {
  HttpOverrides.global = MyHttpOverrides();
  WidgetsFlutterBinding.ensureInitialized();
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

  AndroidInitializationSettings androidInitializationSettings =
      const AndroidInitializationSettings("@mipmap/ic_launcher");

  InitializationSettings initializationSettings =
      InitializationSettings(android: androidInitializationSettings);
  bool? initialized =
      await notificationplugin.initialize(initializationSettings);
  log("initialized: $initialized");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  void showotification() async{
    AndroidNotificationDetails androidSetails = AndroidNotificationDetails(
      "channelNameId",
      "channelName",
      priority: Priority.max,
      importance: Importance.max,
    );

    NotificationDetails notificationDetails =
        NotificationDetails(android: androidSetails);

 await   notificationplugin.show(0, "title", "body", notificationDetails);
  }

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
