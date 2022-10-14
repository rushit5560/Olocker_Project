import 'package:olocker/constants/user_details.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserPrefsData {
  String customerLoggedInKey = "customerLoggedInKey";
  String customerMobileNoKey = "userMobileNoKey";
  String customerIdKey = "customerIdKey";



  setCustomerPrefsData({required String userMobileNo, required String customerId}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(customerLoggedInKey, true);
    prefs.setString(customerMobileNoKey, userMobileNo);
    prefs.setString(customerIdKey, customerId);

    UserDetails.customerLoggedIn = true;
    UserDetails.customerMobileNo = userMobileNo;
    UserDetails.customerId = customerId;
  }

  getCustomerFromPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    UserDetails.customerLoggedIn = prefs.getBool(customerLoggedInKey) ?? false;
    UserDetails.customerMobileNo = prefs.getString(customerMobileNoKey) ?? '';
    UserDetails.customerId = prefs.getString(customerIdKey) ?? '';
  }


  clearDataFromPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(customerLoggedInKey, false);
    prefs.setString(customerMobileNoKey, '');
    prefs.setString(customerIdKey, '');

    UserDetails.customerLoggedIn = false;
    UserDetails.customerMobileNo = '';
    UserDetails.customerId = '';

  }
}