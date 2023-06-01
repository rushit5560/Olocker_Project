import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:olocker/utils/appbar_style.dart';
import '../../constants/app_colors.dart';
import '../../controllers/my_jewellery_portfolio_controller.dart';
import 'my_jewellery_portfolio_screen_widgets.dart';

class MyJewelleryPortFolioScreen extends StatelessWidget {
  MyJewelleryPortFolioScreen({Key? key}) : super(key: key);

  final jewellPortFolioController =
      Get.put(MyJewelleryPortFolioScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightBrownBgColor,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Get.back(),
          icon:
              const Icon(Icons.arrow_back_ios, color: AppColors.blackTextColor),
        ),
        titleSpacing: 0,
        title: Text(
          'My Jewellery Portfolio',
          style: TextStyleConfig.appbarTextStyle(),
        ),
        elevation: 0,
        backgroundColor: AppColors.whiteColor,
      ),
      body: Obx(
        () => jewellPortFolioController.isLoading.value
            ? MyPortFolioLoadingWidget()
            : SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Stack(
                  children: [
                    Image.asset(
                      "assets/images/uninsured_bg.png",
                      width: jewellPortFolioController.size.width,
                    ),
                    Column(
                      children: [
                        const SizedBox(height: 10),
                        TotalJewelleryPortfolioModule(),
                        MyInsuredJewelleryModule(),
                        MyUnInsuredJewelleryModule(),
                      ],
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
