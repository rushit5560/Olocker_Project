import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:olocker/constants/app_colors.dart';
import 'package:olocker/screens/invoice_details_screen/invoice_details_screen_widgets.dart';
import 'package:olocker/utils/appbar_style.dart';
import '../../constants/app_images.dart';
import '../../controllers/invoice_details_screen_controller.dart';
import '../../controllers/my_insured_jewellery_screen_controller.dart';

class InvoiceDetailsScreen extends StatelessWidget {
  InvoiceDetailsScreen({Key? key}) : super(key: key);

  final invoiceDetailsScreenController =
      Get.put(InvoiceDetailsScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () async {
            Get.back();
            final insuredJewelleryController =
                Get.find<MyInsuredJewelleryScreenController>();

            await insuredJewelleryController.getMyInsuredAllJewelleryFunction();
          },
          icon: const Icon(Icons.arrow_back_ios, color: AppColors.blackColor),
        ),
        title: Text(
          'Invoice Details',
          style: TextStyleConfig.appbarTextStyle(),
        ),
        backgroundColor: AppColors.whiteColor,
        elevation: 0,
      ),
      body: Obx(
        () => invoiceDetailsScreenController.isLoading.value
            ? const InvoiceDetailsLoadingWidget()
            : SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                child: Stack(
                  children: [
                    Image.asset(
                      AppImages.invoiceDetailsBgImage,
                      width: double.infinity,
                      height: invoiceDetailsScreenController.size.height -
                          (invoiceDetailsScreenController.size.height * 0.1),
                      fit: BoxFit.cover,
                    ),
                    InvoiceUploadModule(),
                  ],
                ),
              ),
      ),
    );
  }
}
