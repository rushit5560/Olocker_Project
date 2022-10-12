import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:olocker/screens/home_screen/home_screen.dart';
import 'package:olocker/screens/notification_screen/notification_screen.dart';
import 'package:olocker/screens/profile_screen/profile_screen.dart';

class IndexScreenController extends GetxController {
  final size = Get.size;

  RxInt currentBottomIndex = 0.obs;

  final pagesList = <Widget>[
    HomeScreen(),
    ProfileScreen(),
    NotificationScreen(),
  ];

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}
