import 'dart:developer';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:olocker/constants/api_url.dart';
import 'package:olocker/constants/app_colors.dart';
import 'package:olocker/constants/app_images.dart';
import 'package:olocker/controllers/home_screen_controller.dart';
import 'package:olocker/models/home_screen_models/banner_model.dart';
import 'package:olocker/models/home_screen_models/my_jewellers_model.dart';
import 'package:olocker/models/home_screen_models/smart_deals_online_model.dart';
import 'package:olocker/screens/add_new_jeweller_screen/add_new_jeweller_screen.dart';
import 'package:olocker/screens/jeweller_details_screen/jeweller_details_screen.dart';
import 'package:olocker/screens/my_jewellers_screen/my_jewellers_screen.dart';
import 'package:olocker/screens/my_jewellery_portfolio_screen/my_jewellery_portfolio_screen.dart';
import 'package:olocker/screens/online_deals_screen/online_deals_screen.dart';
import 'package:olocker/screens/personal_loans_screen/personal_loans_screen.dart';
import 'package:olocker/utils/extensions.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';
import '../all_loyalty_points_screen/all_loyalty_points_screen.dart';
import '../my_favourites_screen/my_favourites_screen.dart';
import '../online_deals_list_screen/online_deals_list_screen.dart';

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
          homeScreenController.scaffoldKey.currentState!.openDrawer();
          // Scaffold.of(context).openDrawer();
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
          onPressed: () {
            Get.to(() => AllLoyaltyPointScreen());
          },
          icon: Image.asset(
            "assets/icons/gift-box.png",
            height: 18,
            color: AppColors.accentColor,
          ),
        ),
        IconButton(
          onPressed: () {
            Get.to(
              () => MyFavouritesScreen(),
              arguments: [
                "undefined",
              ],
            );
          },
          icon: const Icon(
            Icons.favorite_rounded,
            color: AppColors.accentColor,
            size: 22,
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
        Get.to(() => AddNewJewellerScreen());
      },
      child: Container(
        width: screenController.size.width,
        height: screenController.size.height * 0.06,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: AppColors.accentColor,
        ),
        child: Center(
          child: Text(
            'Add New Jeweller',
            style: TextStyle(
              fontSize: 12.5.sp,
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
      crossAxisAlignment: CrossAxisAlignment.start,
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
              onTap: () => Get.to(
                () => MyJewellersScreen(),
                arguments: [
                  screenController.bannerList,
                  screenController.myAllJewellersList,
                ],
              ),
              child: const Icon(
                Icons.view_module_rounded,
                color: AppColors.accentColor,
              ),
            ),
          ],
        ).commonSymmetricPadding(horizontal: 10),
        screenController.myAllJewellersList.isEmpty
            ? Container(height: screenController.size.height * 0.005.h)
            : SizedBox(
                height: screenController.size.height * 0.17,
                child: ListView.builder(
                  itemCount: screenController.myAllJewellersList.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, i) {
                    JewellerData jewellerData =
                        screenController.myAllJewellersList[i];
                    return _jewellerListTile(jewellerData);
                  },
                ),
              ),
      ],
    );
  }

  Widget _jewellerListTile(JewellerData jewellerData) {
    String imgUrl = ApiUrl.apiImagePath + jewellerData.logoFileName;
    // log("imgUrl :: $imgUrl");
    return GestureDetector(
      onTap: () {
        Get.to(() => JewellerDetailsScreen(), arguments: [
          jewellerData.partnerSrNo,
          jewellerData.companyName,
        ]);
      },
      child: Column(
        children: [
          Container(
            width: screenController.size.width * 0.37,
            height: screenController.size.height * 0.11,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              // color: AppColors.greyColor,
              // image: DecorationImage(
              //   image: NetworkImage(imgUrl),
              //   fit: BoxFit.fill,
              // ),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: CachedNetworkImage(
                imageUrl: imgUrl,
                fit: BoxFit.fill,
                errorWidget: (context, error, stackTrace) {
                  return Container(
                    color: AppColors.greyTextColor.withOpacity(0.5),
                    child: const Center(
                      child: Text("No Image"),
                    ),
                  );
                },
              ),
            ),
          ),
          SizedBox(height: screenController.size.height * 0.001.h),
          Text(
            jewellerData.companyName,
            style: TextStyle(
              fontSize: 9.sp,
            ),
          ),
        ],
      ).commonAllSidePadding(8),
    );
  }
}

class BannerModule extends StatelessWidget {
  BannerModule({Key? key}) : super(key: key);
  final screenController = Get.find<HomeScreenController>();

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: screenController.bannerList.length,
      itemBuilder: (context, i, realIndex) {
        NotificationBanner singleBanner = screenController.bannerList[i];
        return _imageModule(
            singleBanner) /*.commonSymmetricPadding(horizontal: 5)*/;
      },
      options: CarouselOptions(
        height: 39.h,
        autoPlay: true,
        viewportFraction: 1,
        // autoPlayAnimationDuration: const Duration(seconds: 10),
        autoPlayInterval: const Duration(seconds: 10),
      ),
    );
  }

  Widget _imageModule(NotificationBanner singleBanner) {
    String imgUrl = ApiUrl.apiImagePath +
        singleBanner.imageLocation +
        singleBanner.imageName;
    return CachedNetworkImage(
      imageUrl: imgUrl,
      fit: BoxFit.cover,
      width: double.infinity,
      errorWidget: (context, error, stackTrace) {
        return Container(
          color: AppColors.greyTextColor.withOpacity(0.5),
          child: const Center(
            child: Text("No Image"),
          ),
        );
      },
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
            () => Row(
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
                            ? Colors.white70
                            : Colors.white,
                        fontSize: 10.sp,
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
                          screenController.isLoading(true);
                          screenController.smartDealsSwitch.value =
                              !screenController.smartDealsSwitch.value;
                          log('${screenController.smartDealsSwitch.value}');
                          screenController.isLoading(false);
                        },
                      ),
                    ),
                    Text(
                      'Local',
                      style: TextStyle(
                        color: screenController.smartDealsSwitch.value
                            ? Colors.white
                            : Colors.white70,
                        fontSize: 10.sp,
                      ),
                    ),
                  ],
                ),
              ],
            ).commonSymmetricPadding(horizontal: 8),
          ),
          screenController.smartDealsSwitch.value == false
              ? OnlineDealsListModule()
              : Text(
                  'Keep checking this space for exciting deals',
                  style: TextStyle(
                    fontFamily: "Roboto",
                    color: AppColors.whiteColor,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
          SizedBox(height: screenController.size.height * 0.015),
          screenController.smartDealsSwitch.value == false
              ? ViewAllButtonModule()
              : Container(),
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
      height: screenController.size.height * 0.022.h,
      child: ListView.builder(
        itemCount: screenController.smartDealsOnlineList.length,
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        shrinkWrap: true,
        itemBuilder: (context, i) {
          VendorDealsList vendorDeals =
              screenController.smartDealsOnlineList[i];
          return _onlineDealsListTile(vendorDeals);
        },
      ),
    );
  }

  Widget _onlineDealsListTile(VendorDealsList vendorDeals) {
    String imgUrl = vendorDeals.categoryImage;
    return GestureDetector(
      onTap: () {
        Get.to(
          () => OnlineDealsListScreen(),
          arguments: vendorDeals,
        );
      },
      child: Container(
        width: screenController.size.height * 0.019.h,
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: CachedNetworkImage(
          imageUrl: imgUrl,
          fit: BoxFit.contain,
          width: screenController.size.height * 0.019.h,
          height: screenController.size.height * 0.019.h,
        ).commonAllSidePadding(8),
        // Image.network(
        //   imgUrl,
        //   fit: BoxFit.contain,
        //   width: screenController.size.height * 0.019.h,
        //   height: screenController.size.height * 0.019.h,
        // ).commonAllSidePadding(8),
      ).commonAllSidePadding(2),
    );
  }
}

class ViewAllButtonModule extends StatelessWidget {
  ViewAllButtonModule({Key? key}) : super(key: key);
  final screenController = Get.find<HomeScreenController>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.to(
        () => OnlineDealsScreen(),
        arguments: screenController.smartDealsOnlineList,
      ),
      child: Container(
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
      ),
    );
  }
}

class OlockerServiceModule extends StatelessWidget {
  OlockerServiceModule({Key? key}) : super(key: key);
  final screenController = Get.find<HomeScreenController>();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
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
                    height: 5.h,
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
                    width: 150,
                    height: 170,
                    onTap: () {
                      Get.to(() => MyJewelleryPortFolioScreen());
                    },
                    title: 'Jewellery Insurance',
                    image: AppImages.olockerServiceLogo1Image,
                  ),
                  SizedBox(width: screenController.size.width * 0.008.w),
                  _serviceModule(
                    width: 150,
                    height: 170,
                    onTap: () {
                      Get.to(() => PersonalLoansScreen());
                    },
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
                              fontSize: 9.5.sp,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: -12,
                        right: 5,
                        child: Container(
                          width: 24,
                          height: 24,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.whiteColor,
                          ),
                          child: const Center(
                            child: Icon(
                              Icons.keyboard_arrow_right,
                              color: AppColors.accentColor,
                              size: 18,
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

class HomeScreenLoadingWidget extends StatelessWidget {
  HomeScreenLoadingWidget({Key? key}) : super(key: key);
  final screenController = Get.find<HomeScreenController>();

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
              SizedBox(height: 1.h),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 15),
                height: 60,
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: AppColors.greyColor,
                  borderRadius: BorderRadius.all(
                    Radius.circular(8),
                  ),
                ),
              ),
              SizedBox(height: 2.h),
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
                height: screenController.size.height * 0.17,
                child: ListView.builder(
                  itemCount: 3,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, i) {
                    return Column(
                      children: [
                        Container(
                          width: screenController.size.width * 0.37,
                          height: screenController.size.height * 0.11,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: AppColors.greyColor,
                          ),
                        ),
                        SizedBox(
                            height: screenController.size.height * 0.001.h),
                        Container(height: 10, color: AppColors.greyColor),
                      ],
                    ).commonAllSidePadding(8);
                  },
                ),
              ),
              // SizedBox(height: homeScreenController.size.height * 0.02),

              Container(
                  height: 39.h,
                  width: double.infinity,
                  color: AppColors.greyColor),
              SizedBox(height: 2.h),

              Container(
                height: 60,
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: AppColors.greyColor,
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
