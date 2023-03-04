import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:olocker/utils/appbar_style.dart';
import 'package:sizer/sizer.dart';
import '../../constants/app_colors.dart';
import '../../controllers/my_jewellery_portfolio_controller.dart';
import '../../controllers/my_uninsured_jewellery_screen_controller.dart';
import 'my_uninsured_jewellery_screen_widgets.dart';

class MyUnInsuredJewelleryScreen extends StatelessWidget {
  MyUnInsuredJewelleryScreen({Key? key}) : super(key: key);

  final unInsuredJewelleryController =
      Get.put(MyUnInsuredJewelleryScreenController());
  final myJewelleryPortFolioScreenController =
      Get.find<MyJewelleryPortFolioScreenController>();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        myJewelleryPortFolioScreenController
            .getJewelleryPortFolioDetailsFunction();

        return Future.value(true);
      },
      child: Scaffold(
        backgroundColor: AppColors.blueDarkColor,
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Get.back();
              myJewelleryPortFolioScreenController
                  .getJewelleryPortFolioDetailsFunction();
            },
            icon: const Icon(Icons.arrow_back_ios,
                color: AppColors.blackTextColor),
          ),
          titleSpacing: 0,
          title: Text(
            'My UnInsured Jewellery',
            style: TextStyleConfig.appbarTextStyle(),
          ),
          elevation: 0,
          backgroundColor: AppColors.whiteColor,
        ),
        body: Obx(
          () => unInsuredJewelleryController.isLoading.value
              ? const MyUninsuredLoadingWidget()
              : SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      const SizedBox(height: 10),
                      unInsuredJewelleryController.getOrnamentList.isEmpty
                          ? const Padding(
                              padding: EdgeInsets.symmetric(vertical: 100),
                              child: Center(
                                child: Text(
                                  "No UnInsured Jewellery Available",
                                  style: TextStyle(
                                    color: AppColors.whiteColor,
                                  ),
                                ),
                              ),
                            )
                          : UnInsuredJewelleryListModule(),
                      const SizedBox(height: 10),
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}
