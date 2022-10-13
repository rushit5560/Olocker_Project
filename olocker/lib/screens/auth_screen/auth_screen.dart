import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:olocker/constants/app_colors.dart';
import 'package:olocker/controllers/auth_screen_controller.dart';

class AuthScreen extends StatelessWidget {
  AuthScreen({Key? key}) : super(key: key);

  final authScreenController = Get.put(AuthScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.only(
              top: Get.statusBarHeight,
              left: 30,
              right: 30,
              bottom: 30,
            ),
            // height: authScreenController.size.height * 0.3,
            width: authScreenController.size.width,
            color: AppColors.accentBGColor,
            child: Image.asset(
              "assets/images/login-register.png",
              fit: BoxFit.cover,
            ),
          ),
          Container(
            padding: EdgeInsets.only(
              top: 30,
              left: 30,
              right: 30,
              bottom: 30,
            ),
            // height: authScreenController.size.height * 0.3,
            width: authScreenController.size.width,
            // color: AppColors.accentBGColor,
            child: Image.asset(
              "assets/images/logo_new.png",
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}
