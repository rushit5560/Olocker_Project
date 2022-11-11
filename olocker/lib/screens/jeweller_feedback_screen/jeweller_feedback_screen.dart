import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:olocker/constants/app_colors.dart';
import 'package:olocker/controllers/jeweller_feedback_screen_controller.dart';
import 'package:olocker/utils/extensions.dart';
import 'package:sizer/sizer.dart';

import 'jeweller_feedback_screen_widgets.dart';

class JewellerFeedbackScreen extends StatelessWidget {
  JewellerFeedbackScreen({Key? key}) : super(key: key);
  final jewellerFeedbackScreenController = Get.put(JewellerFeedbackScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blueDarkColor,

      appBar: AppBar(
        backgroundColor: AppColors.whiteColor,
        elevation: 0,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon:
          const Icon(Icons.arrow_back_ios, color: AppColors.blackTextColor),
        ),

        title: Text(
          'Feedback',
          style: TextStyle(
            color: AppColors.blackTextColor,
            fontSize: 13.sp,
            fontWeight: FontWeight.w400,
          ),
        ),


      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            JewellerCollectionModule(),
          ],
        ).commonAllSidePadding(10),
      ),
    );
  }
}
