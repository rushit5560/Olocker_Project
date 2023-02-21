import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter/material.dart';
import '../../../constants/app_colors.dart';
import 'my_saving_schemes_list_screen_widgets.dart';
import '../../../controllers/my_saving_schemes_screens_controllers/my_saving_schemes_list_screen_controller.dart';

class MySavingSchemesListScreen extends StatelessWidget {
  MySavingSchemesListScreen({Key? key}) : super(key: key);
  final mySavingSchemesListScreenController =
      Get.put(MySavingSchemesListScreenController());
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
          'My Savings Schemes',
          style: TextStyle(
            color: AppColors.blackTextColor,
            fontSize: 15.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Obx(
        () => mySavingSchemesListScreenController.isLoading.value
            ? MySchemesListLoadingWidget()
            : SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: mySavingSchemesListScreenController
                        .getCustomerSchemeslist.isEmpty
                    ? Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 30.h, horizontal: 10.w),
                        child: Center(
                          child: Text(
                            "Dear user you have not subscribed to any saving scheme as of now.",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500,
                              color: AppColors.blackColor,
                            ),
                          ),
                        ),
                      )
                    : MySchemesListViewModule(), /*Column(
                        children: [
                          // SizedBox(height: 1.h),
                          MySchemesListViewModule(),
                          SizedBox(height: 1.h),
                        ],
                      ),*/
              ),
      ),
    );
  }
}
