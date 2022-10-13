import 'dart:developer';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:olocker/add_new_jeweller_screen/add_new_jeweller_screen.dart';
import 'package:olocker/constants/app_colors.dart';
import 'package:olocker/constants/app_images.dart';
import 'package:olocker/controllers/home_screen_controller.dart';
import 'package:olocker/utils/extensions.dart';
import 'package:sizer/sizer.dart';


class MainAppBar extends StatelessWidget with PreferredSizeWidget {
  MainAppBar({Key? key}) : super(key: key);

  final homeScreenController = Get.find<HomeScreenController>();

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: AppColors.whiteColor,
      leading: GestureDetector(
        onTap: () {
          // homeScreenController.scaffoldKey.currentState!.openDrawer();
          Scaffold.of(context).openDrawer();
        },
        child: const Icon(
          Icons.menu_rounded,
          color: AppColors.greyColor,
          size: 25,
        ),
      ),
      // title: const Text(
      //   "Olocker",
      //   style: TextStyle(
      //     color: AppColors.accentColor,
      //   ),
      // ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: Image.asset(
            "assets/icons/gift-box.png",
            height: 20,
            color: AppColors.accentColor,
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.favorite_rounded,
            color: AppColors.accentColor,
            size: 24,
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size(double.infinity, 60);
}

class AddNewJewellerButtonModule extends StatelessWidget {
  AddNewJewellerButtonModule({Key? key}) : super(key: key);
  final screenController = Get.find<HomeScreenController>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(()=> AddNewJewellerScreen());
      },
      child: Container(
        width: screenController.size.width,
        height: screenController.size.height * 0.06,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: AppColors.accentColor,
        ),
        child: const Center(
          child: Text(
            'Add New Jeweller',
            style: TextStyle(
              color: AppColors.whiteColor,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ).commonSymmetricPadding(horizontal: 8),
    );
  }
}


class MyJewellersListModule extends StatelessWidget {
  MyJewellersListModule({Key? key}) : super(key: key);
  final screenController = Get.find<HomeScreenController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'My Jewellers',
              style: TextStyle(
                fontSize: 13.sp,
                color: AppColors.accentColor,
              ),
            ),

            GestureDetector(
              onTap: () {},
              child: const Icon(
                Icons.view_module_rounded,
                color: AppColors.accentColor,
              ),
            ),
          ],
        ).commonSymmetricPadding(horizontal: 10),

        SizedBox(
          height: screenController.size.height * 0.023.h,
          child: ListView.builder(
            itemCount: 5,
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, i) {
              return _jewellerListTile();
            },
          ),
        ),
      ],
    );
  }


  Widget _jewellerListTile() {
    return Column(
      children: [
        Container(
          width: screenController.size.width * 0.11.w,
          height: screenController.size.height * 0.015.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: AppColors.greyColor
          ),
        ),
        SizedBox(height: screenController.size.height * 0.001.h),
        Text(
          'Kruti Diamonds',
          style: TextStyle(
            fontSize: 9.sp,
          ),
        ),
      ],
    ).commonAllSidePadding(8);
  }

}

class BannerModule extends StatelessWidget {
  BannerModule({Key? key}) : super(key: key);
  final screenController = Get.find<HomeScreenController>();

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: 4,
      itemBuilder: (context, index, realIndex) {
        return _imageModule()/*.commonSymmetricPadding(horizontal: 5)*/;
      },
      options: CarouselOptions(
        height: screenController.size.height * 0.045.h,
        autoPlay: true,
        viewportFraction: 1,
      ),
    );
  }

  Widget _imageModule() {
    return Container(
      color: AppColors.greyColor,
    );
  }
}

class SmartDealsModule extends StatelessWidget {
  SmartDealsModule({Key? key}) : super(key: key);
  final screenController = Get.find<HomeScreenController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AppImages.dealBgImage),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        children: [
          Obx(
          ()=> Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Smart Deals',
                  style: TextStyle(
                    color: AppColors.whiteColor,
                    fontSize: 12.sp,
                  ),
                ),

                Row(
                  children: [
                    Text(
                      'Online',
                      style: TextStyle(
                        color: screenController.smartDealsSwitch.value
                            ? Colors.white70 : Colors.white,
                        fontSize: 9.sp,
                      ),
                    ),


                    Transform.scale(
                        scale: 0.8,
                        child: Switch(
                            value: screenController.smartDealsSwitch.value,
                            activeTrackColor: AppColors.whiteColor,
                            inactiveTrackColor: AppColors.whiteColor,
                            activeColor: AppColors.accentColor,
                            inactiveThumbColor: AppColors.accentColor,
                            onChanged: (value) {
                              screenController.smartDealsSwitch.value =
                              !screenController.smartDealsSwitch.value;
                              log('${screenController.smartDealsSwitch.value}');
                            },
                        ),
                      ),


                    Text(
                      'Local',
                      style: TextStyle(
                        color: screenController.smartDealsSwitch.value
                            ? Colors.white : Colors.white70,
                        fontSize: 9.sp,
                      ),
                    ),

                  ],
                ),
              ],
            ).commonSymmetricPadding(horizontal: 8),
          ),

          OnlineDealsListModule(),

          SizedBox(height: screenController.size.height * 0.015),
          ViewAllButtonModule(),
          SizedBox(height: screenController.size.height * 0.015),

        ],
      ),
    );
  }
}

class OnlineDealsListModule extends StatelessWidget {
  OnlineDealsListModule({Key? key}) : super(key: key);
  final screenController = Get.find<HomeScreenController>();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: screenController.size.height * 0.016.h,
      child: ListView.builder(
        itemCount: 5,
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemBuilder: (context, i){
          return _onlineDealsListTile();
        },
      ),
    );
  }

  Widget _onlineDealsListTile() {
    return Container(
      width: screenController.size.height * 0.016.h,
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Image.asset(
        AppImages.dealLogoImage,
        fit: BoxFit.contain,
      ).commonAllSidePadding(10),
    ).commonAllSidePadding(2);
  }
}

class ViewAllButtonModule extends StatelessWidget {
  const ViewAllButtonModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: AppColors.accentColor,
      ),
      child: const Text(
        'VIEW ALL',
        style: TextStyle(
          color: AppColors.whiteColor,
          fontWeight: FontWeight.w500,
        ),
      ).commonSymmetricPadding(horizontal: 20, vertical: 10),
    );
  }
}


class OlockerServiceModule extends StatelessWidget {
  OlockerServiceModule({Key? key}) : super(key: key);
  final screenController = Get.find<HomeScreenController>();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: screenController.size.height * 0.040.h,
      child: Stack(
        children: [
          Column(
            children: [
              Expanded(
                flex: 60,
                child: Container(
                  decoration: const BoxDecoration(color: AppColors.accentColor),
                ),
              ),
              Expanded(
                flex: 40,
                child: Container(
                  color: Colors.white,
                ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    height: screenController.size.height * 0.005.h,
                    width: screenController.size.width * 0.13.w,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(AppImages.olockerServiceLogoImage),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: screenController.size.height * 0.0025.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  _serviceModule(
                    width: screenController.size.width * 0.07.w,
                    height: screenController.size.height * 0.025.h,
                    onTap: () {},
                    title: 'Jewellery Insurance',
                    image: AppImages.olockerServiceLogo1Image,
                  ),

                  SizedBox(width: screenController.size.width * 0.008.w),

                  _serviceModule(
                    width: screenController.size.width * 0.07.w,
                    height: screenController.size.height * 0.025.h,
                    onTap: () {},
                    title: 'Personal Loans',
                    image: AppImages.olockerServiceLogo2Image,
                  ),

                ],
              ),
            ],
          ).commonAllSidePadding(10),
        ],
      ),
    );
  }

  Widget _serviceModule({
    required double width,
    required double height,
    required String image,
    required String title,
    required Function() onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: AppColors.greyColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Stack(
          children: [
            Column(
              children: [
                Expanded(
                  flex: 80,
                  child: Container(
                    width: width,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                      ),
                    ),
                    child: ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                      ),
                      child: Image.asset(
                        image,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 20,
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                          color: AppColors.accentColor,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(10),
                            bottomRight: Radius.circular(10),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            title,
                            style: TextStyle(
                              color: AppColors.whiteColor,
                              fontSize: 6.5.sp,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: -15,
                        right: 5,
                        child: Container(
                          width: screenController.size.width * 0.015.w,
                          height: screenController.size.width * 0.015.w,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.whiteColor,
                          ),
                          child: const Center(
                            child: Icon(
                              Icons.keyboard_arrow_right,
                              color: AppColors.accentColor,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}





