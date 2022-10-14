import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:olocker/constants/app_colors.dart';

class OnlineDealsListScreen extends StatelessWidget {
  const OnlineDealsListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.whiteColor,
        title: const Text(
          'Online Deals',
          style: TextStyle(color: AppColors.blackColor),
        ),
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(Icons.arrow_back_ios, color: AppColors.blackColor),
        ),
      ),
    );
  }
}
