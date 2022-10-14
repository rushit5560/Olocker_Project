import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:olocker/screens/splash_screen/splash_screen.dart';
import 'package:olocker/utils/themes.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return GetMaterialApp(
        title: 'Olocker',
        debugShowCheckedModeBanner: false,
        defaultTransition: Transition.fade,
        transitionDuration: const Duration(milliseconds: 400),
        theme: ThemeData(
          primarySwatch: generateMaterialColor(
            const Color(0xffed6660),
          ),
        ),
        home: SplashScreen(),
      );
    });
  }
}
