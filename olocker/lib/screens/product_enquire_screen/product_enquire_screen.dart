import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:olocker/constants/app_images.dart';
import 'package:olocker/screens/product_enquire_screen/product_enquire_screen_widgets.dart';
import 'package:sizer/sizer.dart';

import '../../constants/app_colors.dart';
import '../../controllers/product_enquire_screen_controller.dart';
import '../../widgets/common_loader.dart';

class ProductEnquireScreen extends StatelessWidget {
  ProductEnquireScreen({Key? key}) : super(key: key);

  final productEnquireScreenController =
      Get.put(ProductEnquireScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: AppColors.blueDarkColor,
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor,
        elevation: 0,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon:
              const Icon(Icons.arrow_back_ios, color: AppColors.blackTextColor),
        ),
        title: Text(
          "Enquire",
          style: TextStyle(
            fontFamily: "Roboto",
            color: AppColors.blackTextColor,
            fontSize: 13.sp,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
      // bottomNavigationBar: SendMessageTextField(),
      body: Obx(
        () => productEnquireScreenController.isLoading.value
            ? CommonLoader().showCircularLoader()
            : Stack(
                children: [
                  Image.asset(
                    AppImages.enquireBgImageImage,
                    width: double.infinity,
                  ),
                  ChatDisplayModule(),
                  SendMessageTextField(),
                ],
              ),
      ),
    );
  }
}
