import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:olocker/constants/app_colors.dart';
import 'package:olocker/controllers/jeweller_feedback_screen_controller.dart';
import 'package:olocker/models/jeweller_feedback_screen_models/feedback_form_model.dart';
import 'package:olocker/utils/appbar_style.dart';
import 'package:olocker/utils/extensions.dart';
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
                     style: TextStyleConfig.appbarTextStyle(),

        ),
      ),
      body: Obx(
        () => jewellerFeedbackScreenController.isLoading.value
            ? FeedbackScreenLoadingWidget()
            : jewellerFeedbackScreenController.feedBackFormList.isEmpty
                ? Center(
                    child: Text(
                      'No Feedback Form Available',
                      style: TextStyle(
                        color: AppColors.whiteColor,
                        fontSize: 12.sp,
                      ),
                    ),
                  )
                : SingleChildScrollView(
                    child: Column(
                      children: [
                        ListView.builder(
                          itemCount: jewellerFeedbackScreenController
                              .feedBackFormList.length,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, i) {
                            String questionType =
                                jewellerFeedbackScreenController
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
                                            text:
                                                jewellerFeedbackScreenController
                                                    .feedBackFormList[i]
                                                    .question,
                                          )
                                        : Container();
                          },
                        ).commonAllSidePadding(10),
                        FeedbackSubmitButtonModule(),
                      ],
                    ),
                  ),
      ),
    );
  }
}
