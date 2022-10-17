
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:olocker/constants/api_url.dart';
import 'package:olocker/constants/app_colors.dart';
import 'package:olocker/constants/app_images.dart';
import 'package:olocker/controllers/my_jewellers_screen_controller.dart';
import 'package:olocker/models/home_screen_models/banner_model.dart';
import 'package:olocker/utils/extensions.dart';
import 'package:sizer/sizer.dart';

class BackGroundModule extends StatelessWidget {
  const BackGroundModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 70,
          child: Container(
            alignment: Alignment.topCenter,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AppImages.jewellersShapeImage),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Expanded(
          flex: 30,
          child: Container(),
        ),
      ],
    );
  }
}

class BannerSliderModule extends StatelessWidget {
  BannerSliderModule({Key? key}) : super(key: key);
  final screenController = Get.find<MyJewellersScreenController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Stack(
        alignment: Alignment.bottomRight,
        children: [
          CarouselSlider.builder(
            itemCount: screenController.bannerList.length,
            itemBuilder: (context, i, realIndex) {
              NotificationBanner singleBanner = screenController.bannerList[i];
              return _imageModule(singleBanner);
            },
            options: CarouselOptions(
              height: screenController.size.height * 0.022.h,
              autoPlay: true,
              viewportFraction: 1,
              autoPlayInterval: const Duration(seconds: 10),
              onPageChanged: (index, reason) {
                screenController.isLoading(true);
                screenController.activeIndex.value = index;
                screenController.isLoading(false);
              },
            ),
          ).commonSymmetricPadding(vertical: 10),
          Positioned(
            right: 20,
            bottom: 15,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: List.generate(
                screenController.bannerList.length,
                (index) => screenController.activeIndex.value == index
                    ? Container(
                        margin: const EdgeInsets.all(4),
                        width: screenController.size.width * 0.010.w,
                        height: screenController.size.width * 0.010.w,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        child: Container(
                          decoration: const BoxDecoration(
                            color: Colors.orange,
                            shape: BoxShape.circle,
                          ),
                        ).commonAllSidePadding(2),
                      )
                    : Container(
                        margin: const EdgeInsets.all(4),
                        width: screenController.size.width * 0.006.w,
                        height: screenController.size.width * 0.006.w,
                        decoration: const BoxDecoration(
                          color: Colors.grey,
                          shape: BoxShape.circle,
                        ),
                      ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _imageModule(NotificationBanner singleBanner) {
    String imgUrl = ApiUrl.apiImagePath +
        singleBanner.imageLocation +
        singleBanner.imageName;
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(image: NetworkImage(imgUrl), fit: BoxFit.fill),
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade200,
              blurRadius: 2,
              spreadRadius: 2,
            ),
          ],
        ),
      ),
    ).commonSymmetricPadding(horizontal: 10);
  }
}

class AllJewellersListModule extends StatelessWidget {
  AllJewellersListModule({Key? key}) : super(key: key);
  final screenController = Get.find<MyJewellersScreenController>();

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: screenController.allJewellersList.length,
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1.4,
        crossAxisSpacing: 2,
        mainAxisSpacing: 2,
      ),
      itemBuilder: (context, i) {
        String imgUrl = ApiUrl.apiImagePath +
            screenController.allJewellersList[i].logoFileName;
        return Container(
          decoration: BoxDecoration(
            borderRadius: i % 2 == 0
                ? const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                  )
                : const BorderRadius.only(
                    topRight: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ),
            color: AppColors.whiteColor,
          ),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                // flex: 80,
                /*child: Image.network(
                    imgUrl,
                  fit: BoxFit.fitWidth,
                ),*/
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(imgUrl),
                      fit: BoxFit.fill
                    ),
                  ),
                  // child: Image.network(imgUrl),
                ).commonAllSidePadding(5),
              ),

              Text(
                screenController.allJewellersList[i].companyName.toUpperCase(),
                style: TextStyle(
                  color: AppColors.blackColor,
                  fontSize: 10.sp,
                ),
              ),
            ],
          ).commonAllSidePadding(8),
        );
      },
    );
  }
}
