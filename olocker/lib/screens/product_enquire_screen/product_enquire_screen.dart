import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:olocker/constants/app_images.dart';
import 'package:olocker/screens/product_enquire_screen/product_enquire_screen_widgets.dart';
import 'package:olocker/utils/appbar_style.dart';
import 'package:sizer/sizer.dart';
import '../../constants/app_colors.dart';
import '../../controllers/product_enquire_screen_controller.dart';

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
          style: TextStyleConfig.appbarTextStyle(),
        ),
      ),
      // bottomNavigationBar: SendMessageTextField(),
      body: Obx(
        () => productEnquireScreenController.isLoading.value
            ? EnquireScreenLoadingWidget()
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
