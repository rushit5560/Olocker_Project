class ApiHeader {
  Map<String, String> headers = <String, String>{
    'Content-Type': "application/json",
    'MobileAppKey': "EED26D5A-711D-49BD-8999-38D8A60329C5",
  };
}

class ApiUrl {
  static const String apiMainPath = "https://devappapi.olocker.in/";
  static const String apiImagePath = "https://devappapi.olocker.in/";

  static const String myJewellersApi = "api/user/GetMyJewellers";

  static const String checkUserByMobileApi = "api/User/CheckUserByMobile";
  static const String validateOtpApi = "api/user/ValidateOtp/";
  static const String registerApi = "api/User/Register";
}
