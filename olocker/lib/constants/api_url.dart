class ApiHeader {
  Map<String, String> headers = <String, String>{
    'Content-Type': "application/json",
    'MobileAppKey': "EED26D5A-711D-49BD-8999-38D8A60329C5",
  };
}

class ApiUrl {
  static const String apiMainPath = "https://devappapi.olocker.in/";
  static const String apiImagePath = "https://devappapi.olocker.in/";

  // Home Screen Api
  static const String myJewellersApi = "${apiMainPath}api/user/GetMyJewellers";
  static const String smartDealsOnlineApi = "${apiMainPath}api/user/GetOnlineDeals";
  static const String bannerApi = "${apiMainPath}api/User/GetGraphicalNotifications";

  // Index Screen Api
  static const String getNotificationCountApi = "${apiMainPath}api/User/GetNotificationCount";

  static const String userLoginApi = "${apiMainPath}api/User/UserLogin/";
  static const String validateOtpApi = "${apiMainPath}api/user/ValidateOtp/";
  static const String checkUserByMobileApi =
      "${apiMainPath}api/User/CheckUserByMobile";
  static const String registerApi = "${apiMainPath}api/User/Register";
}
