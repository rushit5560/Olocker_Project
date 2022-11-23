import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:olocker/controllers/my_saving_schemes_screens_controllers/my_schemes_details_screen_controller.dart';

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
          'Saving Schemes',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
      backgroundColor: Colors.orange.shade100,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Container(
              height: 550,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
              ),
              child: Column(
                children: [
                  ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                      child: Image.asset(
                        "assets/jewellery.jpg",
                        height: 150,
                        width: Get.width,
                        fit: BoxFit.cover,
                      )),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
