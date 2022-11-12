import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:olocker/constants/app_colors.dart';
import 'package:olocker/controllers/jeweller_feedback_screen_controller.dart';
import 'package:olocker/models/jeweller_feedback_screen_models/geedback_form_model.dart';
import 'package:olocker/utils/extensions.dart';
import 'package:sizer/sizer.dart';

class RadioButtonListTileModule extends StatelessWidget {
  final RatingQuestionList singleItem;
  RadioButtonListTileModule({Key? key, required this.singleItem}) : super(key: key);
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

          ListView.builder(
            itemCount: singleItem.answer.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, i) {
              return Row(
                children: [
                  
                ],
              );
            },
          ),

        ],
      ),
    ).commonSymmetricPadding(vertical: 5);
  }
}
