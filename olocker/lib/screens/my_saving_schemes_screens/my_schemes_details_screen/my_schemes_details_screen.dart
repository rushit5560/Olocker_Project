import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:olocker/controllers/my_saving_schemes_screens_controllers/my_schemes_details_screen_controller.dart';
import 'package:olocker/screens/my_saving_schemes_screens/my_schemes_details_screen/my_schemes_details_screen_widgets.dart';
import 'package:olocker/utils/appbar_style.dart';
import 'package:sizer/sizer.dart';
import '../../../constants/app_colors.dart';

class MySchemesDetailsScreen extends StatelessWidget {
  MySchemesDetailsScreen({Key? key}) : super(key: key);

  final mySchemePendingPaymentScreenController =
      Get.put(MySchemesDetailsScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange.shade100,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
        title: Text(
          'Schemes Details',
          style: TextStyleConfig.appbarTextStyle(),
        ),
      ),
      backgroundColor: Colors.orange.shade100,
      body: Obx(
        () => mySchemePendingPaymentScreenController.isLoading.value
            ? const SchemeDetailsLoadingWidget()
            : SingleChildScrollView(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  child: Column(
                    children: [
                      mySchemePendingPaymentScreenController
                                  .schemeData.status ==
                              "UNMATURED"
                          ? UnmaturedSchemeDetailsModule(
                              schemeData: mySchemePendingPaymentScreenController
                                  .schemeData,
                            )
                          : MaturedSchemeDetailsModule(
                              schemeData: mySchemePendingPaymentScreenController
                                  .schemeData,
                            ),
                      SizedBox(height: 2.h),
                      JewellerCallDetailsModule(),
                      SizedBox(height: 2.5.h),
                      PaymentRefundRowModule(),
                      MySchemesTransactionsListViewModule(),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
