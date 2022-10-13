import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:olocker/screens/otp_screen/otp_screen.dart';

class MobileNumberScreenController extends GetxController {
  final size = Get.size;

  TextEditingController numberController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  submitMobileNumber() {
    if (formKey.currentState!.validate()) {
      try {
        Get.to(() => OtpScreen());
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
