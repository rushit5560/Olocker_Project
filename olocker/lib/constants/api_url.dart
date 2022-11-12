class ApiHeader {
  Map<String, String> headers = <String, String>{
    'Content-Type': "application/json",
    'MobileAppKey': "EED26D5A-711D-49BD-8999-38D8A60329C5",
  };
}

class ApiUrl {
  static const String apiMainPath = "https://devappapi.olocker.in/";
  static const String apiImagePath = "https://devappapi.olocker.in";

  // Home Screen Api
  static const String myJewellersApi = "${apiMainPath}api/user/GetMyJewellers";
  static const String smartDealsOnlineApi =
      "${apiMainPath}api/user/GetOnlineDeals";
  static const String bannerApi =
      "${apiMainPath}api/User/GetGraphicalNotifications";
  static const String addMyJewellerApi = "${apiMainPath}api/User/AddMyJeweller";

  // Index Screen Api
  static const String getNotificationCountApi =
      "${apiMainPath}api/User/GetNotificationCount";

  // Online Deal Details Screen Api
  static const String addCustomerFavouriteDealsApi =
      "${apiMainPath}api/User/InsertCustomerFavDeal";

  // Online Deal Favourite Screen Api
  static const String getCustomerFavouriteDealsApi =
      "${apiMainPath}api/User/GetFavDeals";

  // profile Screen Api
  static const String getUserProfileApi =
      "${apiMainPath}api/User/GetUserProfile";
  static const String updateUserProfileApi =
      "${apiMainPath}api/User/UpdateProfile";
  static const String getCityStateByPincodeApi =
      "${apiMainPath}api/User/GetCityStateByPincode";

  // manage jewellery portfolio Screen Api
  static const String getAllDataAddOrnamentApi =
      "${apiMainPath}api/Info/GetAllDataAddOrnament";
  static const String addOrnamentApi = "${apiMainPath}api/User/AddOrnament";
  static const String getAllUnInsuredOrnamentApi =
      "${apiMainPath}api/User/GetAllUnInsuredOrnament";
  static const String getAllInsuredOrnamentApi =
      "${apiMainPath}api/User/GetAllInsuredOrnament";
  static const String getOrnamentDetailApi =
      "${apiMainPath}api/User/GetOrnamentDetail";
  static const String updateUnInsuredOrnamentImageApi =
      "${apiMainPath}api/User/UpdateUnInsuredOrnamentImage";
  static const String getJewelleryPortfolioApi =
      "${apiMainPath}api/User/GetJewelleryPortfolio";

  // manage ornament recordings Screen Api
  static const String getOrnamentTrackingApi =
      "${apiMainPath}api/User/GetOrnamentTracking";
  static const String addTrackingDataApi =
      "${apiMainPath}api/User/AddTrackingData";

  //favourites apis
  static const String getFavProductApi = "${apiMainPath}api/User/GetFavProduct";

  //authentication apis
  static const String userLoginApi = "${apiMainPath}api/User/UserLogin/";
  static const String validateOtpApi = "${apiMainPath}api/user/ValidateOtp/";
  static const String checkUserByMobileApi =
      "${apiMainPath}api/User/CheckUserByMobile";
  static const String registerApi = "${apiMainPath}api/User/Register";

  static const String checkEligibilityApi =
      "${apiMainPath}api/Partner/CheckEMIEligibility";
  static const String emiScheduleApi = "${apiMainPath}api/Partner/EMISchedule";
  static const String uploadDocumentApi =
      "${apiMainPath}api/Partner/UploadEMIDocument";

  /// Jeweller Details Screen Api's
  static const String getSpecialFeaturesApi =
      "${apiMainPath}api/Partner/GetSpecialFeatures";
  static const String getAnnouncementOfferApi =
      "${apiMainPath}api/Partner/GetAnnouncementOffer";
  static const String getJewelleryCategoryApi =
      "${apiMainPath}api/Partner/GetPushToAppData";
  static const String getJewelleryTypeApi =
      "${apiMainPath}api/Partner/GetUniqueList";
  static const String getBestSellerApi =
      "${apiMainPath}api/Partner/GetBestSellerProducts";
  static const String getClientTestimonialsApi =
      "${apiMainPath}api/Partner/GetClientTestimonials";
  static const String getGoldPriceApi =
      "${apiMainPath}api/Partner/GetIBJARatesByPartnerId";

  static const String getFeedbackFormApi =
      "${apiMainPath}api/Partner/GetRatingQuestions";

  static const String getLoyaltyPointApi =
      "${apiMainPath}api/User/GetPartnerPoint";
}
