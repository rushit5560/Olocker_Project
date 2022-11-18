import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:olocker/constants/app_colors.dart';
import 'package:olocker/controllers/saving_schemes_screens_controllers/saving_scheme_enroll_screen_controller.dart';
import 'package:olocker/utils/extensions.dart';
import 'package:sizer/sizer.dart';


class HeaderModule extends StatelessWidget {
  const HeaderModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 25,
            child: Container(),
          ),
          Expanded(
            flex: 75,
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Senco Gold',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: AppColors.accentColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 14.sp,
                    ),
                  ),

                  Text(
                    'Swaarna Sanchay Scheme',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      // color: AppColors.accentColor,
                      // fontWeight: FontWeight.bold,
                      fontSize: 14.sp,
                    ),
                  ),

                ],
              ),
            ),
          ),
        ],
      ).commonSymmetricPadding(horizontal: 15, vertical: 20),
    ).commonAllSidePadding(10);
  }
}

class MonthlyAmountModule extends StatelessWidget {
  MonthlyAmountModule({Key? key}) : super(key: key);
  final screenController = Get.find<SavingSchemeEnrollScreenController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Monthly amount',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14.sp,
            ),
          ),

          TextFormField(
            controller: screenController.monthlyAmountFieldController,
            decoration: InputDecoration(
              prefix: Text(
                '₹',
                style: TextStyle(
                  fontSize: 22.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),

            ),
          ),
        ],
      ).commonSymmetricPadding(horizontal: 15, vertical: 20),
    );
  }
}
