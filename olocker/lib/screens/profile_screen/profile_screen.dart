import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:olocker/constants/app_colors.dart';
import 'package:olocker/controllers/index_screen_controller.dart';
import 'package:olocker/screens/index_screen/index_screen_widgets.dart';

import '../../controllers/home_screen_controller.dart';
import '../../controllers/profile_screen_controller.dart';
import '../../widgets/custom_drawer.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({Key? key}) : super(key: key);

  final profileScreenController = Get.put(ProfileScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text("Profile Screen"),
          )
        ],
      ),
    );
  }
}
