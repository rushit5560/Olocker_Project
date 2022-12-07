import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:olocker/constants/app_colors.dart';
import 'package:olocker/widgets/common_loader.dart';
import 'package:sizer/sizer.dart';

import '../../../controllers/my_saving_schemes_screens_controllers/my_scheme_payment_success_screen_controller.dart';
import '../../../widgets/common_widgets.dart';
import 'my_scheme_payment_success_screen_widgets.dart';

class MySchemePaymentSuccessScreen extends StatelessWidget {
  MySchemePaymentSuccessScreen({Key? key}) : super(key: key);
  final schemePaymentSuccessScreenController =
      Get.put(MySchemePaymentSuccessScreenController());

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        CommonWidgets().showBorderSnackBar(
          context: context,
          displayText: "You can not go back from this page.",
        );

        // can not go back if false
        return false;
      },
      child: Scaffold(
        backgroundColor: AppColors.darkCreamBgColor,
        appBar: AppBar(
          elevation: 0,

          backgroundColor: AppColors.darkCreamBgColor,
          automaticallyImplyLeading: false,
          centerTitle: true,
          // leading: IconButton(
          //   onPressed: () {
          //     CommonWidgets().showBorderSnackBar(
          //       context: context,
          //       displayText: "You can not go back from this page.",
          //     );
          //   },
          //   icon: const Icon(Icons.arrow_back_ios,
          //       color: AppColors.blackTextColor),
          // ),
          title: Text(
            'Payment Status',
            style: TextStyle(
              color: AppColors.blackTextColor,
              fontSize: 13.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        bottomNavigationBar: GoBackToSchemeDetailsButton(),
        body: Obx(
          () => schemePaymentSuccessScreenController.isLoading.value
              ? CommonLoader().showCircularLoader()
              : SingleChildScrollView(
                  child: Column(
                    children: [
                      PaymentSuccessContainerWidget(),
                      SizedBox(height: 2.h),
                      ImageShowWidget(),
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}
