import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:olocker/constants/app_colors.dart';
import 'package:olocker/screens/service/local_notification.dart';
import 'package:olocker/widgets/common_loader.dart';
import 'package:olocker/widgets/custom_drawer.dart';
import 'package:sizer/sizer.dart';
import '../../controllers/home_screen_controller.dart';
import 'home_screen_widgets.dart';

// ignore: must_be_immutable
class HomeScreen extends StatefulWidget {
 const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final homeScreenController = Get.put(HomeScreenController());

  CommonLoader commonLoader = CommonLoader();
// @override
//   void initState() {
//     LocalNotificationService.initilize();
//     // trminated state
//     FirebaseMessaging.instance.getInitialMessage().then((message) {
//       if (message != null) {
//         setState(() {
//           message.notification!.hashCode;
//           message.notification!.title;
//           message.notification!.body;
//         });
//       }
//     });
// //forground state
//     FirebaseMessaging.onMessage.listen((RemoteMessage message) {
//       LocalNotificationService.showNotificationOnForeground(message);
  
//       setState(() {
//         message.notification!.hashCode;
//         message.notification!.title;
//         message.notification!.body;
//       });
//     });

//     //background state
//     FirebaseMessaging.onMessageOpenedApp.listen((message) {
//       setState(() {
//         message.notification!.hashCode;
//         message.notification!.title;
//         message.notification!.body;
//       });
//     });

//     super.initState();
//   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: homeScreenController.scaffoldKey,
      backgroundColor: AppColors.whiteColor,
      appBar: MainAppBar(),
      drawer: CustomDrawer(),
      body: Obx(
        () => homeScreenController.isLoading.value
            ? HomeScreenLoadingWidget()
            : LiquidPullToRefresh(
                // key: _refreshIndicatorKey, // key if you want to add
                onRefresh: homeScreenController.getMyJewellersFunction,
                showChildOpacityTransition: false,
                springAnimationDurationInMilliseconds: 500,
                height: 50,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(height: 1.h),
                      AddNewJewellerButtonModule(),
                      SizedBox(height: 2.h),
                      MyJewellersListModule(),
                      // SizedBox(height: homeScreenController.size.height * 0.02),
                      BannerModule(),
                      const SizedBox(height: 5),
                      SmartDealsModule(),
                      // SizedBox(height: 2.h),
                      OlockerServiceModule(),
                      // SizedBox(height: homeScreenController.size.height * 0.02),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
