import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:olocker/constants/app_colors.dart';
import 'package:olocker/screens/profile_screen/profile_screen_widgets.dart';
import 'package:sizer/sizer.dart';
import '../../controllers/profile_screen_controller.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({Key? key}) : super(key: key);

  final profileScreenController = Get.put(ProfileScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.pinkBGColor,
      appBar: AppBar(
        title: Text(
          'Profile',
          style: TextStyle(
            color: AppColors.blackColor,
            fontSize: 14.sp,
            fontWeight: FontWeight.normal,
          ),
        ),
        backgroundColor: AppColors.whiteColor,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            ProfileDetailsFormModule(),
          ],
        ),
      ),
    );
  }
}
