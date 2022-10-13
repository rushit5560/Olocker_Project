import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:olocker/constants/app_colors.dart';
import 'package:olocker/controllers/index_screen_controller.dart';
import 'package:olocker/screens/index_screen/index_screen_widgets.dart';

import '../../widgets/custom_drawer.dart';

class IndexScreen extends StatelessWidget {
  IndexScreen({Key? key}) : super(key: key);

  final indexScreenController = Get.put(IndexScreenController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Obx(
        () => Scaffold(
          key: indexScreenController.scaffoldKey,
          backgroundColor: AppColors.whiteColor,
          // appBar: MainAppBar(),
          // drawer: const CustomDrawer(),
          bottomNavigationBar: BottomNavBar(),
          body: indexScreenController
              .pagesList[indexScreenController.currentBottomIndex.value],
        ),
      ),
    );
  }
}
