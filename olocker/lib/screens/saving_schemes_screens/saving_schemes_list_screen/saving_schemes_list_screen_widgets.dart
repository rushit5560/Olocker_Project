import 'dart:developer';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:olocker/constants/app_colors.dart';
import 'package:olocker/constants/app_images.dart';
import 'package:olocker/screens/saving_schemes_screens/saving_scheme_enroll_screen/saving_scheme_enroll_screen.dart';
import 'package:olocker/screens/saving_schemes_screens/saving_schemes_explainer_screen/saving_schemes_explainer_screen.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';
import '../../../constants/api_url.dart';
import '../../../controllers/saving_schemes_screens_controllers/saving_schemes_list_screen_controller.dart';
import '../../../models/saving_scheme_screens_models/get_saving_scheme_list_models/get_saving_schemes_list_model.dart';

class BannerPageViewModule extends StatelessWidget {
  BannerPageViewModule({Key? key}) : super(key: key);
  final savingSchemesListScreenController =
      Get.find<SavingSchemesListScreenController>();
  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: savingSchemesListScreenController.getSavingSchemesList.length,
      itemBuilder: (context, i, realIndex) {
        // String imgUrl = ApiUrl.apiMainPath +
        //     screenController.announcementOfferList[i].imageurl;

        log("image url :: ${ApiUrl.apiImagePath + savingSchemesListScreenController.getSavingSchemesList[i].imagePath}");
        return Container(
          height: savingSchemesListScreenController.size.height * 0.25,
          width: double.infinity,
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: () {
              Get.to(
                () => SavingSchemesExplainerScreen(),
                arguments: savingSchemesListScreenController
                    .getSavingSchemesList[i].srNo,
              );
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: CachedNetworkImage(
                imageUrl: ApiUrl.apiImagePath +
                    savingSchemesListScreenController
                        .getSavingSchemesList[i].imagePath,
                fit: BoxFit.cover,
                height: savingSchemesListScreenController.size.height * 0.25,
                width: double.infinity,
                errorWidget: (ctx, str, strace) {
                  return Image.asset(
                    AppImages.noLogoImage,
                    fit: BoxFit.cover,
                  );
                },
              ),
            ),
          ),
        );
      },
      options: CarouselOptions(
        height: Get.size.height * 0.25,
        autoPlay: true,
        viewportFraction: 0.92,
        autoPlayInterval: const Duration(seconds: 5),
      ),
    );
  }
}

class SchemesListViewModule extends StatelessWidget {
  SchemesListViewModule({Key? key}) : super(key: key);
  final savingSchemesListScreenController =
      Get.find<SavingSchemesListScreenController>();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: savingSchemesListScreenController.getSavingSchemesList.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        var singleScheme =
            savingSchemesListScreenController.getSavingSchemesList[index];
        return SingleSavingSchemeItem(
          singleScheme: singleScheme,
          index: index,
        );
      },
    );
  }
}

class SingleSavingSchemeItem extends StatelessWidget {
  SingleSavingSchemeItem({
    Key? key,
    required this.singleScheme,
    required this.index,
  }) : super(key: key);

  final GetSavingSchemeData singleScheme;
  final int index;
  final savingSchemesListScreenController =
      Get.find<SavingSchemesListScreenController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5.w, vertical: 1.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: index.floor().isEven
            ? AppColors.greenButtonColor
            : AppColors.blueTintColor,
      ),
      child: Container(
        margin: EdgeInsets.only(left: 3.w),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(10),
            bottomRight: Radius.circular(10),
          ),
          color: Colors.white,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              singleScheme.schemeName,
              style: TextStyle(
                fontSize: 15.sp,
                fontWeight: FontWeight.w500,
                color: AppColors.accentColor,
              ),
            ),
            SizedBox(height: 1.5.h),
            SizedBox(
              width: savingSchemesListScreenController.size.width * 0.75,
              child: Text(
                singleScheme.schemeTagLine,
                maxLines: null,
                style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColors.greyColor,
                ),
              ),
            ),
            SizedBox(height: 3.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(
                  height: 5.h,
                  child: ElevatedButton(
                      onPressed: () {
                        Get.to(
                          () => SavingSchemesExplainerScreen(),
                          arguments: singleScheme.srNo,
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        primary: AppColors.accentColor,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(28),
                          ),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          "MORE INFO",
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: "Roboto-Medium",
                            fontWeight: FontWeight.bold,
                            fontSize: 12.sp,
                            fontStyle: FontStyle.italic,
                            letterSpacing: 0.6,
                          ),
                        ),
                      )),
                ),
                SizedBox(width: 2.w),
                SizedBox(
                  height: 5.h,
                  child: ElevatedButton(
                    onPressed: () {
                      Get.to(
                        () => SavingSchemeEnrollScreen(),
                        arguments: singleScheme,
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      primary: AppColors.accentColor,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(28),
                        ),
                      ),
                    ),
                    child: Center(
                      child: Row(
                        children: [
                          SizedBox(
                            height: 20,
                            width: 20,
                            child: Image.asset(AppImages.enrollLightningImage),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            "ENROLL",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontFamily: "Roboto-Medium",
                              fontSize: 12.sp,
                              fontStyle: FontStyle.italic,
                              letterSpacing: 0.6,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 1.h),
          ],
        ),
      ),
    );
  }
}

class SavingSchemesListLoadingWidget extends StatelessWidget {
  SavingSchemesListLoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Shimmer.fromColors(
        baseColor: Colors.grey.shade300,
        highlightColor: Colors.grey.shade100,
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 10),
              Container(
                height: 21.h,
                width: double.infinity,
                margin:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 12),
                decoration: BoxDecoration(
                  color: AppColors.greyColor,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(12),
                  ),
                ),
              ),
              SizedBox(height: 1.h),
              ListView.builder(
                itemCount: 2,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Container(
                    height: 22.h,
                    width: double.infinity,
                    margin: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 12),
                    padding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 12),
                    decoration: BoxDecoration(
                      color: AppColors.greyColor,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(12),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
