import 'dart:async';
import 'dart:developer';
import 'package:get/get.dart';
import 'package:olocker/constants/user_details.dart';
import 'package:olocker/screens/index_screen/index_screen.dart';
import 'package:olocker/utils/user_prefs_data.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../screens/auth_screen/auth_screen.dart';

class SplashScreenController extends GetxController {
  UserPrefsData userPrefsData = UserPrefsData();

  goToNextScreenFunction() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    // Get Prefs Data in Local Variable
    UserDetails.customerLoggedIn =
        prefs.getBool(userPrefsData.customerLoggedInKey) ?? false;

    log(" UserDetails.customerLoggedIn is ::: ${UserDetails.customerLoggedIn}");

    // UserDetails.customerMobileNo =
    //     prefs.getString(userPrefsData.customerMobileNoKey) ?? '';
    // UserDetails.customerId = prefs.getString(userPrefsData.customerIdKey) ?? '';

    if (UserDetails.customerLoggedIn == false) {
      Get.off(() => AuthScreen());
    } else if (UserDetails.customerLoggedIn == true) {
      userPrefsData.getCustomerFromPrefs();
      Get.off(() => IndexScreen());
    }
  }

  @override
  void onInit() {
    Timer(
      const Duration(seconds: 2),
      goToNextScreenFunction,
    );
    super.onInit();
  }
}
