import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:olocker/screens/index_screen/index_screen.dart';

class OtpScreenController extends GetxController {
  final size = Get.size;

  TextEditingController otpController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  submitOtpNumberFunction() {
    if (formKey.currentState!.validate()) {
      try {
        Get.to(() => IndexScreen());
      } catch (e) {
        log("${e.toString()}");
        rethrow;
      }
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}
