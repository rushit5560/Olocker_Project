import 'dart:developer';

import 'package:olocker/constants/user_details.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserPrefsData {
  String customerLoggedInKey = "customerLoggedInKey";
  String customerMobileNoKey = "userMobileNoKey";
  String customerIdKey = "customerIdKey";

  String customerFirstNameKey = "customerFirstNameKey";
  String customerLastNameKey = "customerLastNameKey";

  String customerUserEmailKey = "customerUserEmailKey";

  String customerSalutationKey = "customerSalutationKey";

  setCustomerPrefsData({
    required String userMobileNo,
    required String customerId,
    required String customerFname,
    required String customerLname,
    required String customerEmail,
    required String customerSalutation,
  }) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(customerLoggedInKey, true);
    prefs.setString(customerMobileNoKey, userMobileNo);
    prefs.setString(customerIdKey, customerId);

    prefs.setString(customerFirstNameKey, customerFname);
    prefs.setString(customerLastNameKey, customerLname);
    prefs.setString(customerUserEmailKey, customerEmail);
    prefs.setString(customerIdKey, customerId);
    prefs.setString(customerSalutationKey, customerSalutation);

    UserDetails.customerLoggedIn = true;
    UserDetails.customerMobileNo = userMobileNo;

    UserDetails.customerFname = customerFname;
    UserDetails.customerLname = customerLname;
    UserDetails.customerEmail = customerEmail;
    UserDetails.customerId = customerId;
    UserDetails.customerSalutation = customerSalutation;

    log("UserDetails.customerLoggedIn ::: ${UserDetails.customerLoggedIn}");
    log("UserDetails.customerMobileNo ::: ${UserDetails.customerMobileNo}");
    log("UserDetails.customerFname ::: ${UserDetails.customerFname}");
    log("UserDetails.customerLname ::: ${UserDetails.customerLname}");
    log("UserDetails.customerEmail ::: ${UserDetails.customerEmail}");
    log("UserDetails.customerId ::: ${UserDetails.customerId}");
    log("UserDetails.customerSalutation ::: ${UserDetails.customerSalutation}");
  }

  getCustomerFromPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    UserDetails.customerLoggedIn = prefs.getBool(customerLoggedInKey) ?? false;
    UserDetails.customerMobileNo = prefs.getString(customerMobileNoKey) ?? '';

    UserDetails.customerFname = prefs.getString(customerFirstNameKey) ?? '';
    UserDetails.customerLname = prefs.getString(customerLastNameKey) ?? '';
    UserDetails.customerEmail = prefs.getString(customerUserEmailKey) ?? '';
    UserDetails.customerId = prefs.getString(customerIdKey) ?? '';
    UserDetails.customerSalutation =
        prefs.getString(customerSalutationKey) ?? '';

    log("UserDetails.customerLoggedIn ::: ${UserDetails.customerLoggedIn}");
    log("UserDetails.customerMobileNo ::: ${UserDetails.customerMobileNo}");
    log("UserDetails.customerFname ::: ${UserDetails.customerFname}");
    log("UserDetails.customerLname ::: ${UserDetails.customerLname}");
    log("UserDetails.customerEmail ::: ${UserDetails.customerEmail}");
    log("UserDetails.customerId ::: ${UserDetails.customerId}");
    log("UserDetails.customerSalutation ::: ${UserDetails.customerSalutation}");
  }

  clearDataFromPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(customerLoggedInKey, false);
    prefs.setString(customerMobileNoKey, "");
    prefs.setString(customerIdKey, "");

    prefs.setString(customerFirstNameKey, "");
    prefs.setString(customerLastNameKey, "");
    prefs.setString(customerUserEmailKey, "");
    prefs.setString(customerIdKey, "");
    prefs.setString(customerSalutationKey, "");

    UserDetails.customerLoggedIn = false;
    UserDetails.customerMobileNo = "";

    UserDetails.customerFname = "";
    UserDetails.customerLname = "";
    UserDetails.customerEmail = "";
    UserDetails.customerId = "";
    UserDetails.customerSalutation = "customerSalutation";

    log("UserDetails.customerLoggedIn ::: ${UserDetails.customerLoggedIn}");
    log("UserDetails.customerMobileNo ::: ${UserDetails.customerMobileNo}");
    log("UserDetails.customerFname ::: ${UserDetails.customerFname}");
    log("UserDetails.customerLname ::: ${UserDetails.customerLname}");
    log("UserDetails.customerEmail ::: ${UserDetails.customerEmail}");
    log("UserDetails.customerId ::: ${UserDetails.customerId}");
    log("UserDetails.customerSalutation ::: ${UserDetails.customerSalutation}");
  }
}
