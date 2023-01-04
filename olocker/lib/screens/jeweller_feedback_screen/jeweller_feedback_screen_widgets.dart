import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:olocker/constants/app_colors.dart';
import 'package:olocker/controllers/jeweller_feedback_screen_controller.dart';
import 'package:olocker/models/jeweller_feedback_screen_models/feedback_form_model.dart';
import 'package:olocker/utils/extensions.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';

class FeedbackScreenLoadingWidget extends StatelessWidget {
  FeedbackScreenLoadingWidget({Key? key}) : super(key: key);

  final screenController = Get.find<JewellerFeedbackScreenController>();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Shimmer.fromColors(
        baseColor: Colors.grey.shade300,
        highlightColor: Colors.grey.shade100,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 32.h,
                margin:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                padding: const EdgeInsets.symmetric(vertical: 12),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColors.lightBrownBgColor,
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              Container(
                height: 32.h,
                margin:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                padding: const EdgeInsets.symmetric(vertical: 12),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColors.lightBrownBgColor,
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              Container(
                height: 18.h,
                margin:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                padding: const EdgeInsets.symmetric(vertical: 12),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColors.lightBrownBgColor,
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RadioButtonListModule extends StatelessWidget {
  final RatingQuestionList singleItem;
  final int index;
  RadioButtonListModule({
    Key? key,
    required this.singleItem,
    required this.index,
  }) : super(key: key);

  final screenController = Get.find<JewellerFeedbackScreenController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.darkCreamBgColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            singleItem.question,
            style: TextStyle(
              fontSize: 13.sp,
              fontWeight: FontWeight.w500,
            ),
          ).commonSymmetricPadding(horizontal: 15, vertical: 12),
          const Divider(thickness: 2, color: AppColors.blueDarkColor),
          ListView.builder(
            itemCount: singleItem.answer.length,
            padding: const EdgeInsets.only(bottom: 8),
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, i) {
              return Theme(
                data: ThemeData(
                  unselectedWidgetColor: AppColors.blueDarkColor,
                  backgroundColor: AppColors.whiteColor,
                ),
                child: RadioListTile<String>(
                  dense: true,
                  title: Text(
                    singleItem.answer[i].questionAnswer,
                    style: TextStyle(
                      color: AppColors.blueDarkColor,
                      fontSize: 13.sp,
                    ),
                  ),
                  value: singleItem.answer[i].questionAnswer,
                  groupValue: screenController.radioButtonValueList[index],
                  activeColor: AppColors.blueDarkColor,
                  // tileColor: AppColors.whiteColor,
                  selectedTileColor: AppColors.blueDarkColor,
                  onChanged: (value) {
                    screenController.isLoading(true);

                    String selectedValue = singleItem.answer[i].questionAnswer;
                    List<String> selectedValueList = [];
                    selectedValueList.add(selectedValue);
                    // index, selectedValueList
                    for (int i = 0;
                        i < screenController.finalFeedBackAnsList.length;
                        i++) {
                      if (index == i) {
                        screenController.finalFeedBackAnsList[index] =
                            selectedValueList;

                        // This is only for update ui
                        screenController.radioButtonValueList[index] =
                            selectedValue;
                        log('radioButtonValueList : ${screenController.radioButtonValueList[index]}');
                      }
                    }
                    // for(int i =0; i < screenController.finalFeedBackAnsList.length; i++) {
                    //   log('finalFeedBackAnsList $i : ${screenController.finalFeedBackAnsList[i]}');
                    // }

                    // log('groupValue123 : ${groupValue1.questionAnswer}');
                    screenController.isLoading(false);
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class CheckBoxListModule extends StatelessWidget {
  final RatingQuestionList singleItem;
  final int index;

  CheckBoxListModule({
    Key? key,
    required this.singleItem,
    required this.index,
  }) : super(key: key);

  final screenController = Get.find<JewellerFeedbackScreenController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.darkCreamBgColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            singleItem.question,
            style: TextStyle(
              fontSize: 13.sp,
              fontWeight: FontWeight.w500,
            ),
          ).commonAllSidePadding(10),
          const Divider(thickness: 2, color: AppColors.blueDarkColor),
          ListView.builder(
            itemCount: singleItem.answer.length,
            shrinkWrap: true,
            padding: const EdgeInsets.only(bottom: 8),
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, i) {
              return Row(
                children: [
                  Checkbox(
                    value: singleItem.answer[i].isSelected,
                    activeColor: AppColors.blueDarkColor,
                    onChanged: (value) {
                      screenController.isLoading(true);
                      singleItem.answer[i].isSelected =
                          !singleItem.answer[i].isSelected;

                      List<String> selectedValueList = [];

                      for (int j = 0; j < singleItem.answer.length; j++) {
                        if (singleItem.answer[j].isSelected == true) {
                          selectedValueList
                              .add(singleItem.answer[j].questionAnswer);
                        }
                      }
                      log('selectedValueList : ${selectedValueList.length}');

                      screenController.finalFeedBackAnsList[index] =
                          selectedValueList;

                      log('finalFeedBackAnsList : ${screenController.finalFeedBackAnsList[index]}');

                      screenController.isLoading(false);
                    },
                  ),
                  Expanded(
                    child: Text(
                      singleItem.answer[i].questionAnswer,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 13.sp,
                        color: AppColors.blueDarkColor,
                      ),
                    ),
                  ),
                ],
              );
              /*return CheckboxListTile(
                title: Text(
                    singleItem.answer[i].questionAnswer,
                  style: TextStyle(
                    color: AppColors.blueDarkColor,
                    fontSize: 14.sp,
                  ),
                ),
                onChanged: (value) {},
                value: singleItem.answer[i].isSelected,
              );*/
            },
          ),
        ],
      ),
    );
  }
}

class TextFieldModule extends StatelessWidget {
  final RatingQuestionList singleItem;
  final int index;
  TextFieldModule({
    Key? key,
    required this.singleItem,
    required this.index,
  }) : super(key: key);

  final screenController = Get.find<JewellerFeedbackScreenController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.darkCreamBgColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            singleItem.question,
            style: TextStyle(
              fontSize: 13.sp,
              fontWeight: FontWeight.w500,
            ),
          ).commonAllSidePadding(10),
          const Divider(thickness: 2, color: AppColors.blueDarkColor),
          TextFormField(
            // validator: ,
            cursorColor: AppColors.blueDarkColor,
            decoration: const InputDecoration(
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: AppColors.blueDarkColor,
                  width: 2,
                ),
              ),
              hintText: 'Enter any answer',
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: AppColors.blueDarkColor,
                  width: 2,
                ),
              ),
              border: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: AppColors.blueDarkColor,
                  width: 3,
                ),
              ),
            ),
            onChanged: (value) {
              screenController.finalFeedBackAnsList[index] = [value];
              log('${screenController.finalFeedBackAnsList[index]}');
            },
          ).commonOnlyPadding(bottom: 10, left: 10, right: 10),
        ],
      ),
    );
  }
}

class FeedbackSubmitButtonModule extends StatelessWidget {
  FeedbackSubmitButtonModule({Key? key}) : super(key: key);
  final screenController = Get.find<JewellerFeedbackScreenController>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        screenController.allDataValid = true.obs;

        for (int i = 0; i < screenController.finalFeedBackAnsList.length; i++) {
          if (screenController.finalFeedBackAnsList[i].toString() == "[]") {
            screenController.allDataValid = false.obs;
          }
        }

        if (screenController.allDataValid.value) {
          await screenController.setFeedbackFormFunction();
        } else {
          //todo - fail snackbar show here
        }
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
    );
  }
}
