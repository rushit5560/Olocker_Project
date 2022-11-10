import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:olocker/constants/app_colors.dart';
import 'package:olocker/controllers/jeweller_details_screen_controller.dart';
import 'package:olocker/utils/extensions.dart';
import 'package:sizer/sizer.dart';

class JewellerFeaturesModule extends StatelessWidget {
  const JewellerFeaturesModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(color: Colors.grey),
          bottom: BorderSide(color: Colors.grey),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              'EMI Available',
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(color: Colors.grey, fontSize: 10.sp),
            ),
          ),
          Expanded(
            child: Text(
              '100% Certified Products',
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(color: Colors.grey, fontSize: 10.sp),
            ),
          ),
          Expanded(
            child: Text(
              'Free Jewellery Indurance',
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(color: Colors.grey, fontSize: 10.sp),
            ),
          ),
        ],
      ).commonAllSidePadding(10),
    );
  }
}

class JewellerBannerModule extends StatelessWidget {
  JewellerBannerModule({Key? key}) : super(key: key);
  final screenController = Get.find<JewellerDetailsScreenController>();

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: 3,
      itemBuilder: (context, i, realIndex) {
        return _imageModule() /*.commonSymmetricPadding(horizontal: 5)*/;
      },
      options: CarouselOptions(
        height: screenController.size.height * 0.040.h,
        autoPlay: true,
        viewportFraction: 1,
        // autoPlayAnimationDuration: const Duration(seconds: 10),
        autoPlayInterval: const Duration(seconds: 10),
      ),
    ).commonSymmetricPadding(vertical: 8);
  }

  Widget _imageModule() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.grey,
      ),
    ).commonSymmetricPadding(horizontal: 5);
  }

}

class FourFunctionalModule extends StatelessWidget {
  FourFunctionalModule({Key? key}) : super(key: key);
  final screenController = Get.find<JewellerDetailsScreenController>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: SizedBox(
      height: screenController.size.height * 0.015.h,
        child: Row(
          children: [
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: AppColors.accentColor,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Text(
                    'My \nFavourite',
                    maxLines: 2,
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: AppColors.whiteColor,
                      fontSize: 10.sp,
                    ),
                  ),
                ),
              ).commonAllSidePadding(5),
            ),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: AppColors.accentColor,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Text(
                    'Loyalty \nPoints',
                    maxLines: 2,
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: AppColors.whiteColor,
                      fontSize: 10.sp,
                    ),
                  ),
                ),
              ).commonAllSidePadding(5),
            ),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: AppColors.accentColor,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Text(
                    'About us',
                    maxLines: 2,
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: AppColors.whiteColor,
                      fontSize: 10.sp,
                    ),
                  ),
                ),
              ).commonAllSidePadding(5),
            ),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: AppColors.accentColor,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Text(
                    'Feedback',
                    maxLines: 2,
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: AppColors.whiteColor,
                      fontSize: 10.sp,
                    ),
                  ),
                ),
              ).commonAllSidePadding(5),
            ),
          ],
        ),
      ),
    );
  }
}

class NecklaceBannerModule extends StatelessWidget {
  NecklaceBannerModule({Key? key}) : super(key: key);
  final screenController = Get.find<JewellerDetailsScreenController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: screenController.size.height * 0.023.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.grey,
      ),
    ).commonSymmetricPadding(horizontal: 5);
  }
}

class BanglesBannerModule extends StatelessWidget {
  BanglesBannerModule({Key? key}) : super(key: key);
  final screenController = Get.find<JewellerDetailsScreenController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: screenController.size.height * 0.023.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.grey,
      ),
    ).commonSymmetricPadding(horizontal: 5, vertical: 5);
  }
}

class ReferAndJewellerEmiModule extends StatelessWidget {
  ReferAndJewellerEmiModule({Key? key}) : super(key: key);
  final screenController = Get.find<JewellerDetailsScreenController>();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: screenController.size.height * 0.033.h,
            decoration: BoxDecoration(
              color: AppColors.creamBgColor,
              borderRadius: BorderRadius.circular(10),
            ),
          ).commonSymmetricPadding(vertical: 8, horizontal: 14),
        ),
        Expanded(
          child: Container(
            height: screenController.size.height * 0.033.h,
            decoration: BoxDecoration(
              color: AppColors.creamBgColor,
              borderRadius: BorderRadius.circular(10),
            ),
          ).commonSymmetricPadding(vertical: 8, horizontal: 14),
        ),
      ],
    );
  }
}




