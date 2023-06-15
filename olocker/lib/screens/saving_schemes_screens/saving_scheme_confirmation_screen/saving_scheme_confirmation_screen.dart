import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:olocker/constants/app_colors.dart';

import 'package:olocker/screens/saving_schemes_screens/saving_scheme_confirmation_screen/saving_scheme_confirmation_screen_widgets.dart';
import 'package:olocker/utils/appbar_style.dart';
import 'package:olocker/utils/extensions.dart';
import 'package:olocker/widgets/common_widgets.dart';
import 'package:sizer/sizer.dart';

import '../../../controllers/saving_schemes_screens_controllers/saving_scheme_confirmation_screen_controller.dart';
import '../../../widgets/saving_schemes_widgets.dart';

class SavingSchemeConfirmationScreen extends StatelessWidget {
  SavingSchemeConfirmationScreen({Key? key}) : super(key: key);

  final savingSelectionScreenController =
      Get.put(SavingSchemeConfirmationScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: AppColors.lightBrownBgColor,
      appBar: AppBar(
        backgroundColor: AppColors.lightBrownBgColor,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            CommonWidgets().showBorderSnackBar(
              context: context,
              displayText: "You can not go back from this page.",
            );
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
        title: Text(
          'Enroll',
          style: TextStyleConfig.appbarTextStyle(),
        ),
      ),
      bottomNavigationBar: ProceedToPayButtonModule(),
      body: Column(
        children: [
          JewellerDetailImageInfoModule(
            imagePath: savingSelectionScreenController.jewellerLogo,
            schemeName: savingSelectionScreenController.jewellerName,
            schemeTagLine: savingSelectionScreenController.schemeTagLine,
          ),
          SizedBox(height: 2.h),
          AmountDetailsModule(),
        ],
      ).commonAllSidePadding(15),
    );
    // );
  }
}
