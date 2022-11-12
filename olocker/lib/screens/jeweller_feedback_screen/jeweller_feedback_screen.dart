import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:olocker/constants/app_colors.dart';
import 'package:olocker/controllers/jeweller_feedback_screen_controller.dart';
import 'package:olocker/models/jeweller_feedback_screen_models/feedback_form_model.dart';
import 'package:olocker/utils/extensions.dart';
import 'package:olocker/widgets/common_loader.dart';
import 'package:sizer/sizer.dart';

import 'jeweller_feedback_screen_widgets.dart';

class JewellerFeedbackScreen extends StatelessWidget {
  JewellerFeedbackScreen({Key? key}) : super(key: key);
  final jewellerFeedbackScreenController =
      Get.put(JewellerFeedbackScreenController());

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
      body: Obx(
        () => jewellerFeedbackScreenController.isLoading.value
            ? CommonLoader().showCircularLoader()
            : SingleChildScrollView(
                child: Column(
                  children: [
                    ListView.builder(
                      itemCount: jewellerFeedbackScreenController
                          .feedBackFormList.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, i) {
                        String questionType = jewellerFeedbackScreenController
                            .feedBackFormList[i].questionType;
                        // log('$i : $questionType');
                        RatingQuestionList singleItem =
                            jewellerFeedbackScreenController
                                .feedBackFormList[i];
                        return questionType == "RadioButton"
                            ? RadioButtonListModule(
                                singleItem: singleItem,
                                index: i,
                              )
                            : questionType == "CheckBox"
                                ? CheckBoxListModule(
                                    singleItem: singleItem,
                                    index: i,
                                  )
                                : questionType == "TextBox"
                                    ? TextFieldModule(
                                        singleItem: singleItem,
                                        index: i,
                                      )
                                    : Container();
                      },
                    ).commonAllSidePadding(10),

                    GestureDetector(
                      onTap: () {
                        // for(int i = 0;
                        // i < jewellerFeedbackScreenController.finalFeedBackAnsList.length;
                        // i++) {
                        //
                        // }
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: AppColors.orangeColor,
                        ),

                        child: Text(
                          'SUBMIT',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: AppColors.whiteColor,
                            fontSize: 13.sp,
                          ),
                        ).commonSymmetricPadding(horizontal: 50, vertical: 12),
                      ).commonOnlyPadding(bottom: 10),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
