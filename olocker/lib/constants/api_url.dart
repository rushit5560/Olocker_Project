class ApiHeader {
  Map<String, String> headers = <String, String>{
    'Content-Type': "application/json",
    'MobileAppKey': "EED26D5A-711D-49BD-8999-38D8A60329C5",
  };
}

class ApiUrl {
  static const String apiMainPath = "http://5.189.147.159:7013/";
  static const String apiMainUrl = "https://b2capp.olocker.in/";

  // static const String apiMainPath = "https://devappapi.olocker.in/";
  static const String apiImagePath = "https://devappapi.olocker.in/";

  // static const String apiImagePath = "https://www.olocker.in/";
  static const String apiProfileImagePath = "${apiMainPath}ProfileImage/";

  // Home Screen Api

  static const String myJewellersApi = "${apiMainUrl}api/User/GetMyJewellers";
  static const String smartDealsOnlineApi =
      "${apiMainUrl}api/User/GetOnlineDeals";
  static const String smartDealsOffOnlineApi =
      "${apiMainUrl}api/Partner/GetOfflineDeals";
  static const String bannerApi =
      "${apiMainUrl}api/User/GetGraphicalNotifications";
  static const String addMyJewellerApi = "${apiMainPath}api/User/AddMyJeweller";

  // Index Screen Api
  static const String getNotificationCountApi =
      "${apiMainPath}api/User/GetNotificationCount";

  // Online Deal Details Screen Api
  static const String insertCustomerFavDealApi =
      "${apiMainUrl}api/User/InsertCustomerFavDeal";

  // Online Deal Favourite Screen Api
  static const String getCustomerFavouriteDealsApi =
      "${apiMainUrl}api/user/GetFavDeals";

  //saving schemes screeen apis
  static const String getParterSavingSchemeApi =
      "${apiMainPath}api/User/GetParterSavingScheme";
  static const String getSavingSchemeDetailsApi =
      "${apiMainUrl}api/User/GetSavingSchemeDetails";
  static const String addEnrollSavingSchemeApi =
      "${apiMainPath}api/User/AddEnrollSavingSchemeDetails";
  static const String paymentSavingSchemeApi =
      "${apiMainPath}api/User/PaymentSavingScheme";
  static const String getCustomerSavingTransactions =
      "${apiMainUrl}api/User/GetCustomerSavingTransactions";

  // my saving schemes
  static const String getCustomerSavingSchemeApi =
      "${apiMainUrl}api/User/GetCustomerSavingScheme";
  static const String getPendingBillDetailListApi =
      "${apiMainUrl}api/User/PendingBillDetail";
  static const String mySchemesEMIPaymentsApi =
      "${apiMainPath}api/User/EMIPayments";

  // profile Screen Api
  static const String getUserProfileApi =
      "${apiMainUrl}api/User/GetUserProfile";
  static const String updateUserProfileApi =
      "${apiMainUrl}api/User/UpdateProfile";
  static const String getCityStateByPincodeApi =
      "${apiMainUrl}api/User/GetCityStateByPincode";

  //ABOUT US screen apis
  static const String getAboutUsJewellerDetailsApi =
      "${apiMainPath}api/User/GetDetails";

  //notification screen apis\
  static const String getAllNotificationApi =
      "${apiMainUrl}api/User/GetAllNotification";
  static const String readMarkUserNotificationApi =
      "${apiMainPath}api/User/ReadMarkUserNotification";

  // manage jewellery portfolio Screen Api
  static const String getAllDataAddOrnamentApi =
      "${apiMainUrl}api/Info/GetAllDataAddOrnament";
  static const String addOrnamentApi = "${apiMainPath}api/User/AddOrnament";
  static const String updateOrnamentApi =
      "${apiMainPath}api/User/UpdateOrnament";

//uninsured apis
  static const String getAllInsuredOrnamentApi =
      "${apiMainUrl}api/User/GetAllInsuredOrnament";
  static const String getOrnamentDetailApi =
      "${apiMainPath}api/User/GetOrnamentDetail";
  static const String updateUnInsuredOrnamentImageApi =
      "${apiMainUrl}api/User/UpdateUnInsuredOrnamentImage";
  static const String getJewelleryPortfolioApi =
      "${apiMainPath}api/User/GetJewelleryPortfolio";

//insured apis
  static const String getAllUnInsuredOrnamentApi =
      "${apiMainPath}api/User/GetAllUnInsuredOrnament";
  static const String trackClaimApi = "${apiMainPath}api/User/TrackClaim";
  static const String addClaimApi = "${apiMainPath}api/User/AddClaim";
  static const String updateInvoiceApi = "${apiMainPath}api/User/UpdateInvoice";
  static const String deleteInvoiceApi = "${apiMainPath}api/User/DeleteInvoice";

  // manage ornament recordings Screen Api
  static const String getOrnamentTrackingApi =
      "${apiMainUrl}api/User/GetOrnamentTracking";
  static const String addTrackingDataApi =
      "${apiMainUrl}api/User/AddTrackingData";

  // refer and earn screen apis
  static const String getPartnerByCodeApi =
      "${apiMainUrl}api/Partner/GetPartnerByCode";
  static const String getLoyalityPlanApi =
      "${apiMainUrl}api/Partner/GetLoyalityPlan";

  //favourites apis
  static const String getFavProductApi = "${apiMainPath}api/User/GetFavProduct";

  // static const String deleteFavProductApi = "${apiMainPath}api/User/RemoveFavProduct";

  //authentication apis
  static const String userLoginApi = "${apiMainUrl}api/User/UserLogin";
  static const String validateOtpApi = "${apiMainUrl}api/User/ValidateOtp";
  static const String checkUserByMobileApi =
      "${apiMainUrl}api/User/CheckUserByMobile";
  static const String registerApi = "${apiMainUrl}api/User/Register";

  static const String checkEligibilityApi =
      "${apiMainPath}api/Partner/CheckEMIEligibility";
  static const String emiScheduleApi = "${apiMainPath}api/Partner/EMISchedule";
  static const String uploadDocumentApi =
      "${apiMainPath}api/Partner/UploadEMIDocument";

  /// Jeweller Details Screen Api's
  static const String getSpecialFeaturesApi =
      "${apiMainUrl}api/Partner/GetSpecialFeatures";
  static const String getAnnouncementOfferApi =
      "${apiMainUrl}api/Partner/GetAnnouncementOffer";
  static const String getOfferDetailApi =
      "${apiMainUrl}api/Partner/GetOfferDetails";
  static const String getJewelleryGetPushToAppDataApi =
      "${apiMainPath}api/Partner/GetPushToAppData";

  // static const String getNewArrivalApi =
  //     "${apiMainUrl}api/Partner/GetPushToAppCollections";
  static const String getJewelleryTypeApi =
      "${apiMainPath}api/Partner/GetUniqueList";
  static const String getBestSellerApi =
      "${apiMainPath}api/Partner/GetBestSellerProducts";
  static const String getClientTestimonialsApi =
      "${apiMainUrl}api/Partner/GetClientTestimonials";
  static const String getGoldPriceApi =
      "${apiMainUrl}api/Partner/GetIBJARatesByPartnerId";

  static const String getAboutYourSelfApi = "${apiMainPath}api/User/GetDetails";

  /// Jewellery Details Screen Api's
  // static const String getJewelleryDetailApi =
  //     "${apiMainPath}api/User/GetProductDetail";
  static const String getOfferJewelleryDetailApi =
      "${apiMainUrl}api/User/GetProductDetail";
  static const String removeFavProductApi =
      "${apiMainPath}api/User/RemoveFavProduct";
  static const String addFavProductApi = "${apiMainUrl}api/User/AddFavProduct";

  /// Enquire Screen Api's
  static const String sendProductInquiryApi =
      "${apiMainUrl}api/User/SendProductInquiry";
  static const String getNotificationAllReplyApi =
      "${apiMainUrl}api/Partner/GetNotificationAllReply";
  static const String getAllInquiresApi =
      "${apiMainUrl}api/User/GetAllInquires";

  static const String getFeedbackFormApi =
      "${apiMainUrl}api/Partner/GetRatingQuestions";

  static const String getLoyaltyPointApi =
      "${apiMainUrl}api/User/GetPartnerPoint";

  static const String setFeedbackFormApi =
      "${apiMainPath}api/User/AddCustomerFeedback";
  static const String getJewellerJewelleriesApi =
      "${apiMainUrl}api/Partner/SearchProductList1";

  // update device id api
  static String updateDeviceIdApi =
      "${apiMainUrl}api/User/UpdateCustomerDeviceId";
}
