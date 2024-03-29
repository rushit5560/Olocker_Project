import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:olocker/constants/app_colors.dart';
import 'package:olocker/controllers/index_screen_controller.dart';
import 'package:olocker/utils/extensions.dart';
import 'package:sizer/sizer.dart';

class BottomNavBar extends StatelessWidget {
  BottomNavBar({Key? key}) : super(key: key);

  final indexScreenController = Get.find<IndexScreenController>();

  @override
  Widget build(BuildContext context) {
    log("indexScreenController.notificationCount.value ${indexScreenController.notificationCount.value}");
    return BottomNavigationBar(
      currentIndex: indexScreenController.currentBottomIndex.value,
      type: BottomNavigationBarType.fixed,
      unselectedItemColor: AppColors.whiteColor,
      selectedItemColor: AppColors.whiteColor,
      showUnselectedLabels: true,
      showSelectedLabels: true,
      onTap: (index) {
        indexScreenController.currentBottomIndex.value = index;
        // if (index == 2) {
          // indexScreenController.notificationCount.value = 0;
        // }
      },
      backgroundColor: AppColors.accentColor,
      selectedLabelStyle: const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w500,
          color: AppColors.whiteColor,
          fontFamily: ""),
      unselectedLabelStyle: const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w400,
          color: AppColors.whiteColor,
          fontFamily: ""),
      items: [
        BottomNavigationBarItem(
          icon: Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: SvgPicture.asset(
              "assets/svgs/home.svg",
              color: AppColors.whiteColor,
              height:
                  indexScreenController.currentBottomIndex.value == 0 ? 24 : 23,
              width:
                  indexScreenController.currentBottomIndex.value == 0 ? 24 : 23,
            ),
          ),
          label: "HOME",
        ),
        BottomNavigationBarItem(
          icon: Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: SvgPicture.asset(
              "assets/svgs/profile.svg",
              color: AppColors.whiteColor,
              height:
                  indexScreenController.currentBottomIndex.value == 1 ? 24 : 23,
              width:
                  indexScreenController.currentBottomIndex.value == 1 ? 24 : 23,
            ),
          ),
          label: "PROFILE",
        ),
        BottomNavigationBarItem(
          icon: Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: Stack(
              alignment: Alignment.topCenter,
              clipBehavior: Clip.none,
              children: [
                Image.asset(
                  "assets/icons/notification.png",
                  color: AppColors.whiteColor,
                  height: indexScreenController.currentBottomIndex.value == 2
                      ? 24
                      : 23,
                  width: indexScreenController.currentBottomIndex.value == 2
                      ? 24
                      : 23,
                ),
                // SvgPicture.asset(
                //   "assets/icons/notification.png",
                //   color: AppColors.whiteColor,
                //   height: indexScreenController.currentBottomIndex.value == 2
                //       ? 24
                //       : 23,
                //   width: indexScreenController.currentBottomIndex.value == 2
                //       ? 24
                //       : 23,
                // ),

                // ignore: unnecessary_null_comparison

                Obx(() => 
                indexScreenController.isLoading.value ? Container() :
                indexScreenController.notificationCount.value != 0
                    ? Positioned(
                        top: -5,
                        right: -5,
                        child: Container(
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.whiteColor,
                          ),
                          child: Center(
                            child: Obx(
                              () => indexScreenController.isLoading.value
                                  ? Container()
                                  : Text(
                                      '${indexScreenController.notificationCount.value}',
                                      style: TextStyle(
                                        color: AppColors.accentColor,
                                        fontSize: 9.sp,
                                      ),
                                    ).commonAllSidePadding(3),
                            ),
                          ),
                        ),
                      )
                    : Container()),
              ],
            ),
          ),
          label: "NOTIFICATION",
        ),
      ],
    );
  }
}
