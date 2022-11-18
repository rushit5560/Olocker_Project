import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:olocker/constants/app_colors.dart';
import 'package:olocker/controllers/jeweller_feedback_screen_controller.dart';
import 'package:olocker/models/jeweller_feedback_screen_models/feedback_form_model.dart';
import 'package:olocker/utils/extensions.dart';
import 'package:sizer/sizer.dart';

/*class RadioButtonListModule extends StatefulWidget {
  final RatingQuestionList singleItem;
  final int index;

  RadioButtonListModule({
    Key? key,
    required this.singleItem,
    required this.index,
  }) : super(key: key);

  @override
  State<RadioButtonListModule> createState() =>
      _RadioButtonListTileModuleState();
}

class _RadioButtonListTileModuleState extends State<RadioButtonListModule> {
  final screenController = Get.find<JewellerFeedbackScreenController>();

  @override
  Widget build(BuildContext context) {
    // Answer groupValue1 = widget.groupValue;

    return Container(
      decoration: BoxDecoration(
        color: AppColors.darkCreamBgColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            widget.singleItem.question,
            style: TextStyle(
              fontSize: 12.sp,
            ),
          ).commonAllSidePadding(10),
          ListView.builder(
            itemCount: widget.singleItem.answer.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, i) {
              return RadioListTile<String>(
                title: Text(widget.singleItem.answer[i].questionAnswer),
                value: widget.singleItem.answer[i].questionAnswer,
                groupValue: screenController.radioButtonValueList[widget.index],
                onChanged: (value) {
                  screenController.isLoading(true);

                  String selectedValue =
                      widget.singleItem.answer[i].questionAnswer;
                  List<String> selectedValueList = [];
                  selectedValueList.add(selectedValue);
                  // index, selectedValueList
                  for (int i = 0;
                      i < screenController.finalFeedBackAnsList.length;
                      i++) {
                    if (widget.index == i) {
                      screenController.finalFeedBackAnsList[widget.index] =
                          selectedValueList;

                      // This is only for update ui
                      screenController.radioButtonValueList[widget.index] =
                          selectedValue;
                      log('radioButtonValueList : ${screenController.radioButtonValueList[widget.index]}');
                    }
                  }
                  // for(int i =0; i < screenController.finalFeedBackAnsList.length; i++) {
                  //   log('finalFeedBackAnsList $i : ${screenController.finalFeedBackAnsList[i]}');
                  // }

                  // log('groupValue123 : ${groupValue1.questionAnswer}');
                  screenController.isLoading(false);
                },
              );
            },
          ),
        ],
      ),
    ).commonSymmetricPadding(vertical: 5);
  }
}*/

class RadioButtonListModule extends StatelessWidget {
  final RatingQuestionList singleItem;
  final int index;
  RadioButtonListModule({Key? key,
    required this.singleItem,
    required this.index,
  }) : super(key: key);

  final screenController = Get.find<JewellerFeedbackScreenController>();

  @override
  Widget build(BuildContext context) {
    return Container(
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
              fontSize: 14.sp,
            ),
          ).commonAllSidePadding(10),
          const Divider(thickness: 2, color: AppColors.blueDarkColor),
          ListView.builder(
            itemCount: singleItem.answer.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, i) {
              return Theme(
                data: ThemeData(
                  unselectedWidgetColor: AppColors.blueDarkColor,
                  backgroundColor: AppColors.whiteColor,
                ),
                child: RadioListTile<String>(
                  title: Text(
                    singleItem.answer[i].questionAnswer,
                    style: TextStyle(
                      color: AppColors.blueDarkColor,
                      fontSize: 14.sp,
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
    ).commonSymmetricPadding(vertical: 5);
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
              fontSize: 12.sp,
            ),
          ).commonAllSidePadding(10),
          const Divider(thickness: 2, color: AppColors.blueDarkColor),
          ListView.builder(
            itemCount: singleItem.answer.length,
            shrinkWrap: true,
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

                      for( int j = 0; j < singleItem.answer.length; j++) {
                        if(singleItem.answer[j].isSelected == true) {
                          selectedValueList.add(singleItem.answer[j].questionAnswer);
                        }
                      }
                      log('selectedValueList : ${selectedValueList.length}');

                      screenController.finalFeedBackAnsList[index] = selectedValueList;

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
                        fontSize: 14.sp,
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

    ).commonSymmetricPadding(vertical: 5);
  }
}

class TextFieldModule extends StatelessWidget {
  final RatingQuestionList singleItem;
  final int index;
  TextFieldModule({Key? key,
    required this.singleItem,
    required this.index,
  }) : super(key: key);

  final screenController = Get.find<JewellerFeedbackScreenController>();

  @override
  Widget build(BuildContext context) {
    return Container(
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
              fontSize: 12.sp,
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
    ).commonSymmetricPadding(vertical: 5);
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

        for(int i=0; i < screenController.finalFeedBackAnsList.length; i++) {
          if(screenController.finalFeedBackAnsList[i].toString() == "[]") {
            screenController.allDataValid = false.obs;
          }
        }

        if(screenController.allDataValid.value) {
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




