import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:olocker/constants/app_colors.dart';
import 'package:olocker/controllers/home_screen_controller.dart';

class HomeAppBar extends StatelessWidget with PreferredSizeWidget {
  HomeAppBar({Key? key}) : super(key: key);

  final homeScreenController = Get.find<HomeScreenController>();

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: AppColors.whiteColor,
      leading: GestureDetector(
        onTap: () {
          homeScreenController.scaffoldKey.currentState!.openDrawer();
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
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      unselectedItemColor: AppColors.accentColor,
      selectedItemColor: AppColors.accentColor,
      showUnselectedLabels: true,
      showSelectedLabels: true,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(
            Icons.home,
          ),
          label: "HOME",
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.home,
          ),
          label: "PROFILE",
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.home,
          ),
          label: "MESSAGE",
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.home,
          ),
          label: "SCAN QR",
        ),
      ],
    );
  }
}
