import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:olocker/constants/app_colors.dart';
import 'package:olocker/controllers/saving_schemes_screens_controllers/saving_schemes_list_screen_controller.dart';
import 'package:olocker/screens/saving_schemes_screens/saving_schemes_list_screen/saving_schemes_list_screen_widgets.dart';
import 'package:olocker/utils/appbar_style.dart';
import 'package:sizer/sizer.dart';

class SavingSchemesListScreen extends StatelessWidget {
  SavingSchemesListScreen({Key? key}) : super(key: key);
  final savingSchemesListScreenController =
      Get.put(SavingSchemesListScreenController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange.shade100,
      appBar: AppBar(
        backgroundColor: Colors.orange.shade100,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
        ),
        title: Text(
          'Savings Schemes',
          style: TextStyleConfig.appbarTextStyle(),
        ),
      ),
      body: Obx(
        () => savingSchemesListScreenController.isLoading.value
            ? const SavingSchemesListLoadingWidget()
            : SingleChildScrollView(
                physics: const ClampingScrollPhysics(),
                child: savingSchemesListScreenController
                        .getSavingSchemesList.isEmpty
                    ? Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 30.h, horizontal: 10.w),
                        child: Center(
                          child: Text(
                            "Currently, there is no savings scheme LIVE. Thank you for showing interest.",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500,
                              color: AppColors.blackColor,
                            ),
                          ),
                        ),
                      )
                    : Column(
                        children: [
                          BannerPageViewModule(),
                          const SizedBox(height: 10),
                          SchemesListViewModule(),
                          SizedBox(height: 2.h)
                        ],
                      ),
              ),
      ),
    );
  }
}
