import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:olocker/constants/app_colors.dart';
import 'package:olocker/screens/submit_claim_form_screen/submit_claim_form_screen_widgets.dart';

import 'package:sizer/sizer.dart';

import '../../controllers/submit_claim_form_screen_controller.dart';
import '../../widgets/common_loader.dart';

class SubmitClaimFormScreen extends StatelessWidget {
  SubmitClaimFormScreen({Key? key}) : super(key: key);

  final submitClaimController = Get.put(SubmitClaimFormScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blueDarkColor,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(Icons.arrow_back_ios, color: AppColors.blackColor),
        ),
        title: Text(
          'Submit Claim',
          style: TextStyle(
            fontFamily: "Roboto",
            color: AppColors.blackColor,
            fontSize: 14.sp,
            fontWeight: FontWeight.normal,
          ),
        ),
        backgroundColor: AppColors.whiteColor,
        elevation: 0,
      ),
      body: Obx(
        () => submitClaimController.isLoading.value
            ? SubmitClaimLoadingWidget()
            : SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 20),
                    SubmitClaimFormModule(),
                  ],
                ),
              ),
      ),
    );
  }
}
