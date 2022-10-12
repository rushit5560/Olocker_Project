import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:olocker/controllers/home_screen_controller.dart';
import 'package:olocker/screens/home_screen/home_screen_widgets.dart';

import '../../widgets/custom_drawer.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final homeScreenController = Get.put(HomeScreenController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: homeScreenController.scaffoldKey,
        appBar: HomeAppBar(),
        drawer: const CustomDrawer(),
        bottomNavigationBar: BottomNavBar(),
        body: Column(
          children: [],
        ),
      ),
    );
  }
}
