import 'dart:developer';

import 'package:olocker/constants/user_details.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserPrefsData {
  String customerLoggedInKey = "customerLoggedInKey";
  String customerIdKey = "customerIdKey";

  String customerUserNameKey = "customerUserNameKey";

  String customerGenderKey = "customerGenderKey";

  String customerFirstNameKey = "customerFirstNameKey";
  String customerLastNameKey = "customerLastNameKey";

  String customerUserEmailKey = "customerUserEmailKey";
  String customerMobileNoKey = "userMobileNoKey";
  String customerAddressKey = "customerAddressKey";

  String customerCityKey = "customerCityKey";
  String customerPinKey = "customerPinKey";
  String customerStateKey = "customerStateKey";
  String customerCountryKey = "customerCountryKey";
  String customerDOBKey = "customerDOBKey";

  String customerSalutationKey = "customerSalutationKey";

  setCustomerPrefsData({
    required String customerMobileNo,
    required String customerId,
    required String customerUsername,
    required String customerFname,
    required String customerLname,
    required String customerEmail,
    required String customerGender,
    required String customerAddress,
    required String customerCity,
    required String customerPin,
    required String customerState,
    required String customerCountry,
    required String customerDob,
  }) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(customerLoggedInKey, true);

    prefs.setString(customerUserNameKey, customerUsername);
    prefs.setString(customerGenderKey, customerGender);

    prefs.setString(customerFirstNameKey, customerFname);
    prefs.setString(customerLastNameKey, customerLname);
    prefs.setString(customerUserEmailKey, customerEmail);
    prefs.setString(customerMobileNoKey, customerMobileNo);

    prefs.setString(customerAddressKey, customerAddress);
    prefs.setString(customerCityKey, customerCity);
    prefs.setString(customerPinKey, customerPin);
    prefs.setString(customerStateKey, customerState);
    prefs.setString(customerCountryKey, customerCountry);
    prefs.setString(customerDOBKey, customerDob);

    prefs.setString(customerIdKey, customerId);

    UserDetails.customerLoggedIn = true;

    UserDetails.customerUsername = customerUsername;
    UserDetails.customerGender = customerGender;

    UserDetails.customerFname = customerFname;
    UserDetails.customerLname = customerLname;
    UserDetails.customerEmail = customerEmail;
    UserDetails.customerMobileNo = customerMobileNo;

    UserDetails.customerAddress = customerAddress;
    UserDetails.customerCity = customerCity;
    UserDetails.customerPin = customerPin;
    UserDetails.customerState = customerState;
    UserDetails.customerCountry = customerCountry;
    UserDetails.customerDob = customerDob;

    UserDetails.customerId = customerId;

    log("UserDetails.customerLoggedIn ::: ${UserDetails.customerLoggedIn}");

    log("UserDetails.customerUsername ::: ${UserDetails.customerUsername}");
    log("UserDetails.customerGender ::: ${UserDetails.customerGender}");

    log("UserDetails.customerFname ::: ${UserDetails.customerFname}");
    log("UserDetails.customerLname ::: ${UserDetails.customerLname}");
    log("UserDetails.customerEmail ::: ${UserDetails.customerEmail}");
    log("UserDetails.customerMobileNo ::: ${UserDetails.customerMobileNo}");

    log("UserDetails.customerAddress ::: ${UserDetails.customerAddress}");
    log("UserDetails.customerCity ::: ${UserDetails.customerCity}");
    log("UserDetails.customerPin ::: ${UserDetails.customerPin}");
    log("UserDetails.customerState ::: ${UserDetails.customerState}");
    log("UserDetails.customerCountry ::: ${UserDetails.customerCountry}");
    log("UserDetails.customerDob ::: ${UserDetails.customerDob}");

    log("UserDetails.customerId ::: ${UserDetails.customerId}");
  }

  getCustomerFromPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    UserDetails.customerLoggedIn = prefs.getBool(customerLoggedInKey) ?? false;
    UserDetails.customerUsername = prefs.getString(customerUserNameKey) ?? '';
    UserDetails.customerGender = prefs.getString(customerGenderKey) ?? '';

    UserDetails.customerFname = prefs.getString(customerFirstNameKey) ?? '';
    UserDetails.customerLname = prefs.getString(customerLastNameKey) ?? '';
    UserDetails.customerEmail = prefs.getString(customerUserEmailKey) ?? '';
    UserDetails.customerMobileNo = prefs.getString(customerMobileNoKey) ?? '';

    UserDetails.customerAddress = prefs.getString(customerAddressKey) ?? '';
    UserDetails.customerCity = prefs.getString(customerCityKey) ?? '';
    UserDetails.customerPin = prefs.getString(customerPinKey) ?? '';
    UserDetails.customerState = prefs.getString(customerStateKey) ?? '';
    UserDetails.customerCountry = prefs.getString(customerCountryKey) ?? '';
    UserDetails.customerDob = prefs.getString(customerDOBKey) ?? '';

    UserDetails.customerId = prefs.getString(customerIdKey) ?? '';

    log("UserDetails.customerLoggedIn ::: ${UserDetails.customerLoggedIn}");

    log("UserDetails.customerUsername ::: ${UserDetails.customerUsername}");
    log("UserDetails.customerGender ::: ${UserDetails.customerGender}");

    log("UserDetails.customerFname ::: ${UserDetails.customerFname}");
    log("UserDetails.customerLname ::: ${UserDetails.customerLname}");
    log("UserDetails.customerEmail ::: ${UserDetails.customerEmail}");
    log("UserDetails.customerMobileNo ::: ${UserDetails.customerMobileNo}");

    log("UserDetails.customerAddress ::: ${UserDetails.customerAddress}");
    log("UserDetails.customerCity ::: ${UserDetails.customerCity}");
    log("UserDetails.customerPin ::: ${UserDetails.customerPin}");
    log("UserDetails.customerState ::: ${UserDetails.customerState}");
    log("UserDetails.customerCountry ::: ${UserDetails.customerCountry}");
    log("UserDetails.customerDob ::: ${UserDetails.customerDob}");

    log("UserDetails.customerId ::: ${UserDetails.customerId}");
  }

  clearDataFromPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setBool(customerLoggedInKey, false);

    prefs.setString(customerUserNameKey, "");
    prefs.setString(customerGenderKey, "");

    prefs.setString(customerFirstNameKey, "");
    prefs.setString(customerLastNameKey, "");
    prefs.setString(customerUserEmailKey, "");
    prefs.setString(customerMobileNoKey, "");

    prefs.setString(customerAddressKey, "");
    prefs.setString(customerCityKey, "");
    prefs.setString(customerPinKey, "");
    prefs.setString(customerStateKey, "");
    prefs.setString(customerCountryKey, "");
    prefs.setString(customerDOBKey, "");

    prefs.setString(customerIdKey, "");

    UserDetails.customerLoggedIn = false;

    UserDetails.customerUsername = "";
    UserDetails.customerGender = "";

    UserDetails.customerFname = "";
    UserDetails.customerLname = "";
    UserDetails.customerEmail = "";
    UserDetails.customerMobileNo = "";

    UserDetails.customerAddress = "";
    UserDetails.customerCity = "";
    UserDetails.customerPin = "";
    UserDetails.customerState = "";
    UserDetails.customerCountry = "";
    UserDetails.customerDob = "";

    UserDetails.customerId = "";

    log("UserDetails.customerLoggedIn ::: ${UserDetails.customerLoggedIn}");

    log("UserDetails.customerUsername ::: ${UserDetails.customerUsername}");
    log("UserDetails.customerGender ::: ${UserDetails.customerGender}");

    log("UserDetails.customerFname ::: ${UserDetails.customerFname}");
    log("UserDetails.customerLname ::: ${UserDetails.customerLname}");
    log("UserDetails.customerEmail ::: ${UserDetails.customerEmail}");
    log("UserDetails.customerMobileNo ::: ${UserDetails.customerMobileNo}");

    log("UserDetails.customerAddress ::: ${UserDetails.customerAddress}");
    log("UserDetails.customerCity ::: ${UserDetails.customerCity}");
    log("UserDetails.customerPin ::: ${UserDetails.customerPin}");
    log("UserDetails.customerState ::: ${UserDetails.customerState}");
    log("UserDetails.customerCountry ::: ${UserDetails.customerCountry}");
    log("UserDetails.customerDob ::: ${UserDetails.customerDob}");

    log("UserDetails.customerId ::: ${UserDetails.customerId}");
  }
}
