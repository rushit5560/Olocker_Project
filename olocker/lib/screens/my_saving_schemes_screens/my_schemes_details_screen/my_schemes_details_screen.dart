import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:olocker/controllers/my_saving_schemes_screens_controllers/my_schemes_details_screen_controller.dart';
import 'package:olocker/screens/my_saving_schemes_screens/my_schemes_details_screen/my_schemes_details_screen_widgets.dart';
import 'package:olocker/utils/extensions.dart';

class MySchemesDetailsScreen extends StatelessWidget {
  MySchemesDetailsScreen({Key? key}) : super(key: key);

  final mySchemePendingPaymentScreenController =
      Get.put(MySchemesDetailsScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange.shade100,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
        title: const Text(
          'Schemes Details',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
      backgroundColor: Colors.orange.shade100,
      body: SingleChildScrollView(
        child: Column(
          children: [MySchemesDetailsScreenModule()],
        ).commonAllSidePadding(12),
      ),
    );
  }
}
