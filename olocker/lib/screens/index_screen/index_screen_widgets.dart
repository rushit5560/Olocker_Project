import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:olocker/constants/app_colors.dart';
import 'package:olocker/controllers/index_screen_controller.dart';
import 'package:sizer/sizer.dart';

class MainAppBar extends StatelessWidget with PreferredSizeWidget {
  MainAppBar({Key? key}) : super(key: key);

  final indexScreenController = Get.find<IndexScreenController>();

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: AppColors.whiteColor,
      leading: GestureDetector(
        onTap: () {
          indexScreenController.scaffoldKey.currentState!.openDrawer();
        },
        child: const Icon(
          Icons.menu_rounded,
          color: AppColors.greyColor,
          size: 25,
        ),
      ),
      title: const Text(
        "Olocker",
        style: TextStyle(
          color: AppColors.accentColor,
        ),
      ),
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

class BottomNavBar extends StatelessWidget {
  BottomNavBar({Key? key}) : super(key: key);

  final indexScreenController = Get.find<IndexScreenController>();

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: indexScreenController.currentBottomIndex.value,
      type: BottomNavigationBarType.fixed,
      unselectedItemColor: AppColors.whiteColor,
      selectedItemColor: AppColors.whiteColor,
      showUnselectedLabels: true,
      showSelectedLabels: true,
      onTap: (index) {
        indexScreenController.currentBottomIndex.value = index;
      },
      backgroundColor: AppColors.accentColor,
      selectedLabelStyle: TextStyle(
        fontSize: 11.sp,
        fontWeight: FontWeight.w500,
        color: AppColors.whiteColor,
      ),
      unselectedLabelStyle: TextStyle(
        fontSize: 11.sp,
        fontWeight: FontWeight.w400,
        color: AppColors.whiteColor,
      ),
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
            child: SvgPicture.asset(
              "assets/svgs/message.svg",
              color: AppColors.whiteColor,
              height:
                  indexScreenController.currentBottomIndex.value == 2 ? 24 : 23,
              width:
                  indexScreenController.currentBottomIndex.value == 2 ? 24 : 23,
            ),
          ),
          label: "NOTIFICATION",
        ),
      ],
    );
  }
}
