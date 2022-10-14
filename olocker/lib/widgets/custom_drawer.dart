import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:olocker/constants/app_colors.dart';
import 'package:olocker/constants/app_images.dart';
import 'package:olocker/controllers/home_screen_controller.dart';
import 'package:olocker/screens/auth_screen/auth_screen.dart';
import 'package:olocker/utils/extensions.dart';
import 'package:olocker/utils/user_prefs_data.dart';
import 'package:sizer/sizer.dart';

class CustomDrawer extends StatelessWidget {
  CustomDrawer({Key? key}) : super(key: key);
  final homeScreenController = Get.find<HomeScreenController>();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          _profileHeaderModule(),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  _homeModule(),
                  _divider(),
                  _myJewellerModule(),
                  _divider(),
                  _myOlockerModule(),
                  _divider(),
                  _mySavingSchemeModule(),
                  _divider(),
                  _myDealsModule(),
                  _divider(),
                  _myPointsModule(),
                  _divider(),
                ],
              ),
            ),
          ),
          _logoutButton(),
        ],
      ),
    );
  }

  // Home Module
  Widget _homeModule() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(
          AppIcons.drawerHomeIcon,
          height: homeScreenController.size.width * 0.010.w,
        ),
        SizedBox(width: homeScreenController.size.width * 0.008.w),
        const Text('Home'),
      ],
    ).commonSymmetricPadding(horizontal: 15, vertical: 12);
  }

  // My Jeweller
  Widget _myJewellerModule() {
    return ExpandablePanel(
      header: Row(
        children: [
          Image.asset(
            AppIcons.drawerJewellerIcon,
            height: homeScreenController.size.width * 0.014.w,
          ),
          SizedBox(width: homeScreenController.size.width * 0.008.w),
          const Text('My Jeweller'),
        ],
      ).commonSymmetricPadding(vertical: 8),
      collapsed: Container(),
      expanded: Column(
        children: [
          Container(
            color: AppColors.accentBGColor,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  AppIcons.drawerRetailerIcon,
                  height: homeScreenController.size.width * 0.010.w,
                ),
                SizedBox(width: homeScreenController.size.width * 0.008.w),
                const Text("Retailer's Home"),
              ],
            ).commonSymmetricPadding(horizontal: 30, vertical: 14),
          ),
          Container(
            color: AppColors.accentBGColor,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  AppIcons.drawerAddJewellerIcon,
                  height: homeScreenController.size.width * 0.010.w,
                ),
                SizedBox(width: homeScreenController.size.width * 0.008.w),
                const Text("Add Jeweller"),
              ],
            ).commonSymmetricPadding(horizontal: 30, vertical: 14),
          ),
        ],
      ),
    ).commonSymmetricPadding(horizontal: 15);
  }

  // My Olocker
  Widget _myOlockerModule() {
    return ExpandablePanel(
      header: Row(
        children: [
          Image.asset(
            AppIcons.drawerOlockerIcon,
            height: homeScreenController.size.width * 0.014.w,
          ),
          SizedBox(width: homeScreenController.size.width * 0.008.w),
          const Text('My Olocker'),
        ],
      ).commonSymmetricPadding(vertical: 8),
      collapsed: Container(),
      expanded: Column(
        children: [
          Container(
            color: AppColors.accentBGColor,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  AppIcons.drawerInsuredJewelleryIcon,
                  height: homeScreenController.size.width * 0.010.w,
                ),
                SizedBox(width: homeScreenController.size.width * 0.008.w),
                const Text("My insured Jewellery"),
              ],
            ).commonSymmetricPadding(horizontal: 30, vertical: 14),
          ),
          Container(
            color: AppColors.accentBGColor,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  AppIcons.drawerInsuredJewelleryPortfolioIcon,
                  height: homeScreenController.size.width * 0.010.w,
                ),
                SizedBox(width: homeScreenController.size.width * 0.008.w),
                const Text("My Jewellery portfolio"),
              ],
            ).commonSymmetricPadding(horizontal: 30, vertical: 14),
          ),
        ],
      ),
    ).commonSymmetricPadding(horizontal: 15);
  }

  // My Saving Scheme Module
  Widget _mySavingSchemeModule() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(
          AppIcons.drawerSavingSchemeIcon,
          height: homeScreenController.size.width * 0.010.w,
        ),
        SizedBox(width: homeScreenController.size.width * 0.008.w),
        const Text('My Saving Scheme'),
      ],
    ).commonSymmetricPadding(horizontal: 15, vertical: 12);
  }

  // My Deals Module
  Widget _myDealsModule() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(
          AppIcons.drawerSavingSchemeIcon,
          height: homeScreenController.size.width * 0.010.w,
        ),
        SizedBox(width: homeScreenController.size.width * 0.008.w),
        const Text('My Deals'),
      ],
    ).commonSymmetricPadding(horizontal: 15, vertical: 12);
  }

  // My Deals Module
  Widget _myPointsModule() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(
          AppIcons.drawerMyPointsIcon,
          height: homeScreenController.size.width * 0.010.w,
        ),
        SizedBox(width: homeScreenController.size.width * 0.008.w),
        const Text('My points'),
      ],
    ).commonSymmetricPadding(horizontal: 15, vertical: 12);
  }

  // Profile Header Module
  Widget _profileHeaderModule() {
    return Container(
      height: homeScreenController.size.height * 0.018.h,
      decoration: const BoxDecoration(
        color: AppColors.accentColor,
      ),
      child: Row(
        children: [
          SizedBox(width: homeScreenController.size.width * 0.010.w),
          Container(
            width: homeScreenController.size.width * 0.040.w,
            height: homeScreenController.size.width * 0.040.w,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.whiteColor,
            ),
          ),
          SizedBox(width: homeScreenController.size.width * 0.012.w),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Welcome',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: AppColors.whiteColor,
                  fontSize: 10.sp,
                ),
              ),
              Text(
                'Rushit Patel',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: AppColors.whiteColor,
                  fontSize: 11.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // Logout Button
  Widget _logoutButton() {
    return GestureDetector(
      onTap: () {
        UserPrefsData().clearDataFromPrefs();
        Get.offAll(() => AuthScreen());
      },
      child: Container(
        decoration: const BoxDecoration(
          color: AppColors.accentColor,
        ),
        child: Row(
          children: [
            Icon(
              Icons.power_settings_new_rounded,
              color: AppColors.whiteColor,
              size: 6.w,
            ),
            SizedBox(width: 5.w),
            Text(
              'Logout',
              style: TextStyle(
                color: AppColors.whiteColor,
                fontSize: 13.sp,
              ),
            ),
          ],
        ).commonAllSidePadding(8),
      ),
    );
  }

  Widget _divider() {
    return const Divider(height: 1, thickness: 1);
  }
}
