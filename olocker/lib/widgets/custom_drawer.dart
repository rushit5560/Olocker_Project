import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:olocker/constants/api_url.dart';
import 'package:olocker/constants/app_colors.dart';
import 'package:olocker/constants/app_images.dart';
import 'package:olocker/constants/user_details.dart';
import 'package:olocker/controllers/home_screen_controller.dart';
import 'package:olocker/controllers/profile_screen_controller.dart';
import 'package:olocker/screens/add_new_jeweller_screen/add_new_jeweller_screen.dart';
import 'package:olocker/screens/all_loyalty_points_screen/all_loyalty_points_screen.dart';
import 'package:olocker/screens/auth_screen/auth_screen.dart';
import 'package:olocker/screens/my_insured_jewellery_screen/my_insured_jewellery_screen.dart';
import 'package:olocker/screens/my_saving_schemes_screens/my_saving_schemes_list_screen/my_saving_schemes_list_screen.dart';
import 'package:olocker/utils/extensions.dart';
import 'package:olocker/utils/user_prefs_data.dart';
import 'package:sizer/sizer.dart';
import '../controllers/index_screen_controller.dart';
import '../screens/my_jewellers_screen/my_jewellers_screen.dart';
import '../screens/my_jewellery_portfolio_screen/my_jewellery_portfolio_screen.dart';
import '../screens/online_favourite_deals_screen/online_favourite_deals_screen.dart';

class CustomDrawer extends StatelessWidget {
  CustomDrawer({Key? key}) : super(key: key);
  final homeScreenController = Get.find<HomeScreenController>();
  final profileScreenController = Get.find<ProfileScreenController>();

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
          const Text(
            'Version : 1.0.0',
            style: TextStyle(fontSize: 16),
          ).commonSymmetricPadding(vertical: 5),
          _logoutButton(),
        ],
      ),
    );
  }

  // Home Module
  Widget _homeModule() {
    return GestureDetector(
      onTap: () {
        homeScreenController.scaffoldKey.currentState!.closeDrawer();
        Get.back();
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            height: homeScreenController.size.width * 0.018.w,
            width: homeScreenController.size.width * 0.018.w,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  AppIcons.drawerHomeIcon,
                ),
              ),
            ),
          ),
          SizedBox(width: homeScreenController.size.width * 0.008.w),
          const Text('Home'),
        ],
      ).commonSymmetricPadding(horizontal: 15, vertical: 12),
    );
  }

  // My Jeweller
  Widget _myJewellerModule() {
    return ExpandablePanel(
      header: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Row(
          children: [
            Container(
              height: homeScreenController.size.width * 0.018.w,
              width: homeScreenController.size.width * 0.018.w,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    AppIcons.drawerJewellerIcon,
                  ),
                ),
              ),
            ),
            // Image.asset(
            //   AppIcons.drawerJewellerIcon,
            //   height: homeScreenController.size.width * 0.015.w,
            // ),
            SizedBox(width: homeScreenController.size.width * 0.008.w),
            const Text('My Jeweller'),
          ],
        ).commonSymmetricPadding(vertical: 8),
      ),
      collapsed: Container(),
      expanded: Column(
        children: [
          GestureDetector(
            onTap: () {
              homeScreenController.scaffoldKey.currentState!.closeDrawer();
              Get.to(
                () => MyJewellersScreen(),
                arguments: [
                  homeScreenController.bannerList,
                  homeScreenController.myAllJewellersList,
                ],
              );
            },
            child: Container(
              // color: AppColors.accentBGColor.withOpacity(0.5),
              color: AppColors.accentPinkColor,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: homeScreenController.size.width * 0.017.w,
                    width: homeScreenController.size.width * 0.017.w,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                          AppIcons.drawerRetailerIcon,
                        ),
                      ),
                    ),
                  ),
                  // Image.asset(
                  //   AppIcons.drawerRetailerIcon,
                  //   height: homeScreenController.size.width * 0.010.w,
                  // ),
                  SizedBox(width: homeScreenController.size.width * 0.008.w),
                  const Text(
                    "Retailer's Home",
                    style: TextStyle(
                      color: AppColors.blueDarkColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ).commonSymmetricPadding(horizontal: 30, vertical: 14),
            ),
          ),
          _divider(),
          GestureDetector(
            onTap: () {
              homeScreenController.scaffoldKey.currentState!.closeDrawer();
              Get.to(() => AddNewJewellerScreen());
            },
            child: Container(
              // color: AppColors.accentBGColor.withOpacity(0.5),
              color: AppColors.accentPinkColor,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: homeScreenController.size.width * 0.017.w,
                    width: homeScreenController.size.width * 0.017.w,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                          AppIcons.drawerAddJewellerIcon,
                        ),
                      ),
                    ),
                  ),
                  // Image.asset(
                  //   AppIcons.drawerAddJewellerIcon,
                  //   height: homeScreenController.size.width * 0.010.w,
                  // ),
                  SizedBox(width: homeScreenController.size.width * 0.008.w),
                  const Text(
                    "Add Jeweller",
                    style: TextStyle(
                      color: AppColors.blueDarkColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ).commonSymmetricPadding(horizontal: 30, vertical: 14),
            ),
          ),
        ],
      ),
    );
  }

  // My Olocker
  Widget _myOlockerModule() {
    return ExpandablePanel(
      header: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Row(
          children: [
            Container(
              height: homeScreenController.size.width * 0.018.w,
              width: homeScreenController.size.width * 0.018.w,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    AppIcons.drawerOlockerIcon,
                  ),
                ),
              ),
            ),
            // Image.asset(
            //   AppIcons.drawerOlockerIcon,
            //   height: homeScreenController.size.width * 0.014.w,
            // ),
            SizedBox(width: homeScreenController.size.width * 0.008.w),
            const Text('My Olocker'),
          ],
        ).commonSymmetricPadding(vertical: 8),
      ),
      collapsed: Container(),
      expanded: Column(
        children: [
          GestureDetector(
            onTap: () {
              homeScreenController.scaffoldKey.currentState!.closeDrawer();
              Get.to(() => MyInsuredJewelleryScreen());
            },
            child: Container(
              // color: AppColors.accentBGColor.withOpacity(0.5),
              color: AppColors.accentPinkColor,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: homeScreenController.size.width * 0.017.w,
                    width: homeScreenController.size.width * 0.017.w,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                          AppIcons.drawerInsuredJewelleryIcon,
                        ),
                      ),
                    ),
                  ),
                  // Image.asset(
                  //   AppIcons.drawerInsuredJewelleryIcon,
                  //   height: homeScreenController.size.width * 0.010.w,
                  // ),
                  SizedBox(width: homeScreenController.size.width * 0.008.w),
                  const Text(
                    "My insured Jewellery",
                    style: TextStyle(
                      color: AppColors.blueDarkColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ).commonSymmetricPadding(horizontal: 30, vertical: 14),
            ),
          ),
          _divider(),
          GestureDetector(
            onTap: () {
              homeScreenController.scaffoldKey.currentState!.closeDrawer();
              Get.to(() => MyJewelleryPortFolioScreen());
            },
            child: Container(
              // color: AppColors.accentBGColor.withOpacity(0.5),
              color: AppColors.accentPinkColor,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: homeScreenController.size.width * 0.017.w,
                    width: homeScreenController.size.width * 0.017.w,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                          AppIcons.drawerInsuredJewelleryPortfolioIcon,
                        ),
                      ),
                    ),
                  ),
                  // Image.asset(
                  //   AppIcons.drawerInsuredJewelleryPortfolioIcon,
                  //   height: homeScreenController.size.width * 0.010.w,
                  // ),
                  SizedBox(width: homeScreenController.size.width * 0.008.w),
                  const Text(
                    "My Jewellery Portfolio",
                    style: TextStyle(
                      color: AppColors.blueDarkColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ).commonSymmetricPadding(horizontal: 30, vertical: 14),
            ),
          ),
        ],
      ),
    );
  }

  // My Saving Scheme Module
  Widget _mySavingSchemeModule() {
    return GestureDetector(
      onTap: () {
        homeScreenController.scaffoldKey.currentState!.closeDrawer();
        Get.to(
          () => MySavingSchemesListScreen(),
        );
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: homeScreenController.size.width * 0.018.w,
            width: homeScreenController.size.width * 0.018.w,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  AppIcons.drawerSavingSchemeIcon,
                ),
              ),
            ),
          ),

          // Image.asset(
          //   AppIcons.drawerSavingSchemeIcon,
          //   height: homeScreenController.size.width * 0.010.w,
          // ),
          SizedBox(width: homeScreenController.size.width * 0.008.w),
          const Text('My Saving Scheme'),
        ],
      ).commonSymmetricPadding(horizontal: 15, vertical: 12),
    );
  }

  // My Deals Module
  Widget _myDealsModule() {
    return GestureDetector(
      onTap: () {
        homeScreenController.scaffoldKey.currentState!.closeDrawer();
        Get.to(() => OnlineFavouriteDealsScreen());
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: homeScreenController.size.width * 0.018.w,
            width: homeScreenController.size.width * 0.018.w,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  AppIcons.drawerSavingSchemeIcon,
                ),
              ),
            ),
          ),

          // Image.asset(
          //   AppIcons.drawerSavingSchemeIcon,
          //   height: homeScreenController.size.width * 0.010.w,
          // ),
          SizedBox(width: homeScreenController.size.width * 0.008.w),
          const Text('My Deals'),
        ],
      ).commonSymmetricPadding(horizontal: 15, vertical: 12),
    );
  }

  // My Deals Module
  Widget _myPointsModule() {
    return GestureDetector(
      onTap: () {
        homeScreenController.scaffoldKey.currentState!.closeDrawer();
        Get.to(() => AllLoyaltyPointScreen());
      },
      child: SizedBox(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: homeScreenController.size.width * 0.018.w,
              width: homeScreenController.size.width * 0.018.w,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    AppIcons.drawerMyPointsIcon,
                  ),
                ),
              ),
            ),
            // Image.asset(
            //   AppIcons.drawerMyPointsIcon,
            //   height: homeScreenController.size.width * 0.010.w,
            // ),
            SizedBox(width: homeScreenController.size.width * 0.008.w),
            const Text('My Points'),
          ],
        ).commonSymmetricPadding(horizontal: 15, vertical: 12),
      ),
    );
  }

  // Profile Header Module
  Widget _profileHeaderModule() {
    return Container(
      height: homeScreenController.size.height * 0.018.h,
      decoration: const BoxDecoration(
        // color: AppColors.accentColor,

        image: DecorationImage(
            image: AssetImage(AppImages.sidmenuImage),
            opacity: 0.2,
            colorFilter: ColorFilter.mode(
              // AppColors.accentColor.withOpacity(0.7),
              Colors.redAccent,
              BlendMode.color,
            ),
            fit: BoxFit.cover),
      ),
      child: Row(
        children: [
          SizedBox(width: homeScreenController.size.width * 0.010.w),
          GestureDetector(
            onTap: () {
              final indexScreenController = Get.find<IndexScreenController>();

              indexScreenController.currentBottomIndex.value = 1;
            },
            child: Container(
              width: 75,
              height: 75,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.whiteColor,
                border: Border.all(color: AppColors.greyColor),
              ),
              child: ClipRRect(
                borderRadius: const BorderRadius.all(
                  Radius.circular(200),
                ),
                child: profileScreenController.selectedProfileImage != null
                    ? Container(
                        decoration: BoxDecoration(
                        color: Colors.black,
                        shape: BoxShape.circle,
                        border:
                            Border.all(color: AppColors.whiteColor, width: 3),
                        image: DecorationImage(
                          image: FileImage(
                            profileScreenController.selectedProfileImage!,
                          ),
                          fit: BoxFit.cover,
                        ),
                        // child: Image.file(
                        //     profileScreenController.selectedProfileImage!,
                        //     height: 75,
                        //     width: 75,
                        //     fit: BoxFit.cover,
                        //   ),
                      ))
                    : Container(
                        decoration: BoxDecoration(
                          color: Colors.black,
                          shape: BoxShape.circle,
                          border:
                              Border.all(color: AppColors.whiteColor, width: 3),
                          image: const DecorationImage(
                            image: NetworkImage(
                              "${ApiUrl.apiImagePath}/images/JewelleryApp/2020/5/9e926966718148acaedc690e4a55d5f8_1.png",
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                        // child: Image.network(
                        //   "${ApiUrl.apiImagePath}/images/JewelleryApp/2020/5/9e926966718148acaedc690e4a55d5f8_1.png",
                        //   // profileScreenController.apiGetProfileImage!.path,
                        //   height: 75,
                        //   width: 75,

                        //   fit: BoxFit.cover,
                        //   errorBuilder: (context, error, stackTrace) {
                        //     return Image.asset(
                        //       AppIcons.drawerSavingSchemeIcon,
                        //       height: 75,
                        //       width: 75,
                        //       fit: BoxFit.fill,
                        //     );
                        //   },
                        // ),
                      ),
              ),
            ),
          ),
          SizedBox(width: 5.w),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Welcome',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    color: AppColors.whiteColor, fontSize: 17, fontFamily: ""),
              ),
              SizedBox(
                // width: 45.w,
                child: Text(
                  "${UserDetails.customerFname.capitalizeFirst!} ${UserDetails.customerLname.capitalizeFirst!}",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: AppColors.whiteColor,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Roboto-Regular",
                  ),
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
            SizedBox(width: 2.w),
            const Text(
              'Logout',
              style: TextStyle(
                color: AppColors.whiteColor,
                fontSize: 20,
                fontFamily: "",
              ),
            ),
          ],
        ).commonAllSidePadding(8),
      ),
    );
  }

  Widget _divider() {
    return const Divider(
      height: 1,
      thickness: 1,
      color: Colors.black26,
    );
  }
}
