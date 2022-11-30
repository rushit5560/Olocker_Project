import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:olocker/constants/app_colors.dart';
import 'package:olocker/controllers/my_saving_schemes_screens_controllers/my_scheme_pending_bills_screen_controller.dart';
import 'package:olocker/widgets/common_loader.dart';
import 'package:sizer/sizer.dart';

import 'my_scheme_pending_bills_screen_widgets.dart';

class MySchemePendingBillsScreen extends StatelessWidget {
  MySchemePendingBillsScreen({Key? key}) : super(key: key);
  final mySchemePendingBillsScreenController =
      Get.put(MySchemePendingBillsScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkCreamBgColor,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: AppColors.darkCreamBgColor,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon:
              const Icon(Icons.arrow_back_ios, color: AppColors.blackTextColor),
        ),
        title: Text(
          'Pending Bills',
          style: TextStyle(
            color: AppColors.blackTextColor,
            fontSize: 13.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      bottomNavigationBar: PayNowBottomButton(),
      body: Obx(
        () => mySchemePendingBillsScreenController.isLoading.value
            ? CommonLoader().showCircularLoader()
            : SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    MyBillsModule(),
                    mySchemePendingBillsScreenController.getPendingBillsList.isEmpty
                        ? Container()
                        : PandingBillsSelectModule(),
                  ],
                ),
              ),
      ),
    );
  }
}
