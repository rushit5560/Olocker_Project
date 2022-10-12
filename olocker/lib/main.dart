import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:olocker/utils/themes.dart';

import 'screens/home_screen/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Olocker',
      debugShowCheckedModeBanner: false,
      defaultTransition: Transition.cupertino,
      theme: ThemeData(
        primarySwatch: generateMaterialColor(
          const Color(0xffed6660),
        ),
      ),
      home: HomeScreen(),
    );
  }
}
