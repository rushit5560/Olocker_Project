import 'package:flutter/material.dart';
import 'package:olocker/constants/app_colors.dart';
import 'package:olocker/constants/app_images.dart';
import 'package:olocker/screens/saving_schemes_screens/saving_scheme_confirmation_screen/saving_scheme_confirmation_screen_widgets.dart';
import 'package:olocker/utils/extensions.dart';
import 'package:sizer/sizer.dart';

class SavingSchemeConfirmationScreen extends StatelessWidget {
  const SavingSchemeConfirmationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool _isChecked = true;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: AppColors.lightBrownBgColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.lightBrownBgColor,
        leading: const Icon(
          Icons.arrow_back_ios,
          color: AppColors.blackColor,
        ),
        title: const Text(
          "Enroll",
          style: TextStyle(
            color: AppColors.blackColor,
          ),
        ).commonOnlyPadding(left: 50),
      ),
      body: Column(
        children: [
          const SencoConfirmationImageModule(),
          SizedBox(height: 2.h),
          const AmountContainerCustom(),
          const BottomButtonModule()
        ],
      ).commonAllSidePadding(15),
    );
  }
}
