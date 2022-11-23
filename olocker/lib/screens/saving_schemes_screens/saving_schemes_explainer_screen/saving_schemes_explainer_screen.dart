import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

import 'package:get/get.dart';
import 'package:olocker/constants/api_url.dart';
import 'package:olocker/widgets/common_loader.dart';
import 'package:sizer/sizer.dart';

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
          'Saving Schemes',
          style: TextStyle(
            color: Colors.black,
            fontSize: 15.sp,
            fontWeight: FontWeight.normal,
          ),
        ),
      ),
      backgroundColor: Colors.orange.shade100,
      body: Obx(
        () => savingSchemesExplainerScreenController.isLoading.value
            ? CommonLoader().showCircularLoader()
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
                            Text("api not properly ready"),
                            // ClipRRect(
                            //   borderRadius: const BorderRadius.only(
                            //     topLeft: Radius.circular(20),
                            //     topRight: Radius.circular(20),
                            //   ),
                            //   child: CachedNetworkImage(
                            //     imageUrl: ApiUrl.apiImagePath +
                            //         savingSchemesExplainerScreenController
                            //             .getSavingSchemeData.imagePath,
                            //     fit: BoxFit.fill,
                            //     height: savingSchemesExplainerScreenController
                            //             .size.height *
                            //         0.28,
                            //     width: double.infinity,
                            //   ),
                            // ),
                            // Padding(
                            //   padding: const EdgeInsets.symmetric(
                            //       vertical: 12, horizontal: 15),

                            //   child: Html(
                            //     data: savingSchemesExplainerScreenController
                            //         .getSavingSchemeData.termsAndCondition,
                            //   ),
                            //   // Text(),
                            // ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
