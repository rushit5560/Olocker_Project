import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:olocker/controllers/saving_schemes_screens_controllers/saving_schemes_list_screen_controller.dart';
import 'package:sizer/sizer.dart';

import '../../../controllers/my_saving_schemes_screens_controllers/my_saving_schemes_list_screen_controller.dart';

class MySavingSchemesListScreen extends StatelessWidget {
  MySavingSchemesListScreen({Key? key}) : super(key: key);
  final mySavingSchemesListScreenController =
      Get.put(MySavingSchemesListScreenController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange.shade100,
      appBar: AppBar(
        backgroundColor: Colors.orange.shade100,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
        ),
        title: const Text(
          'Saving Schemes',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
      body: Obx(
        () => mySavingSchemesListScreenController.isLoading.value
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : SingleChildScrollView(
                physics: const ClampingScrollPhysics(),
                child: Column(
                  children: [
                    SizedBox(height: 2.h),
                    // PageViewbuilders(),
                    // const SizedBox(height: 10),
                    // Listviewbuilder(),
                  ],
                ),
              ),
      ),
    );
  }
}
