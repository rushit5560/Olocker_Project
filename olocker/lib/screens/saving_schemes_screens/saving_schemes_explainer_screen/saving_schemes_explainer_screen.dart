import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_super_html_viewer/flutter_super_html_viewer.dart';
import 'package:get/get.dart';
import 'package:olocker/constants/api_url.dart';
import 'package:olocker/screens/saving_schemes_screens/saving_schemes_explainer_screen/saving_schemes_explainer_screen_widgets.dart';
import 'package:olocker/utils/appbar_style.dart';
import 'package:sizer/sizer.dart';
import '../../../constants/app_images.dart';
import '../../../controllers/saving_schemes_screens_controllers/saving_schemes_explainer_screen_controller.dart';

class SavingSchemesExplainerScreen extends StatelessWidget {
  SavingSchemesExplainerScreen({Key? key}) : super(key: key);

  final savingSchemesExplainerScreenController =
      Get.put(SavingSchemesExplainerScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      backgroundColor: Colors.orange.shade100,
      body: Obx(
        () => savingSchemesExplainerScreenController.isLoading.value
            ? const SchemeExplainerLoadingWidget()
            : SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 15),
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                        ),
                        child: Column(
                          children: [
                            // Text("api not properly ready"),
                            ClipRRect(
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20),
                              ),
                              child: CachedNetworkImage(
                                imageUrl: ApiUrl.apiImagePath +
                                    savingSchemesExplainerScreenController
                                        .getSavingSchemesList[0].imagePath,
                                fit: BoxFit.fill,
                                height: savingSchemesExplainerScreenController
                                        .size.height *
                                    0.25,
                                width: double.infinity,
                                errorWidget: (ctx, str, strace) {
                                  return Image.asset(
                                    AppImages.noLogoImage,
                                    fit: BoxFit.cover,
                                  );
                                },
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 12, horizontal: 15),

                              child: HtmlContentViewer(
                                htmlContent: savingSchemesExplainerScreenController
                                    .getSavingSchemesList[0].termsAndCondition,
                              ),
                              // Text(),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 2.h),
                  ],
                ),
              ),
      ),
    );
  }
}
