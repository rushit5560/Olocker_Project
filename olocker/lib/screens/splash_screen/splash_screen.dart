import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:olocker/controllers/splash_screen_controller.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({Key? key}) : super(key: key);
  final splashScreenController = Get.put(SplashScreenController());

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Center(
          child: Text(
            'Splash Screen'
          ),
        ),
      ),
    );
  }
}
