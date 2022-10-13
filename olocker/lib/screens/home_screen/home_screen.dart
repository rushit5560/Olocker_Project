import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:olocker/constants/app_colors.dart';
import 'package:olocker/widgets/custom_drawer.dart';
import '../../controllers/home_screen_controller.dart';
import 'home_screen_widgets.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final homeScreenController = Get.put(HomeScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: MainAppBar(),
      drawer: CustomDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            AddNewJewellerButtonModule(),
            SizedBox(height: homeScreenController.size.height * 0.02),

            MyJewellersListModule(),
            // SizedBox(height: homeScreenController.size.height * 0.02),

            BannerModule(),
            SizedBox(height: homeScreenController.size.height * 0.02),

            SmartDealsModule(),
            SizedBox(height: homeScreenController.size.height * 0.02),

            OlockerServiceModule(),
            // SizedBox(height: homeScreenController.size.height * 0.02),

          ],
        ),
      ),
    );
  }
}
