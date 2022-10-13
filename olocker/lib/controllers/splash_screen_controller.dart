import 'dart:async';

import 'package:get/get.dart';
import 'package:olocker/screens/index_screen/index_screen.dart';

import '../screens/auth_screen/auth_screen.dart';

class SplashScreenController extends GetxController {
  goToNextScreenFunction() {
    Get.off(
      () => AuthScreen(),
    );
  }

  @override
  void onInit() {
    Timer(const Duration(seconds: 2), goToNextScreenFunction);
    super.onInit();
  }
}
