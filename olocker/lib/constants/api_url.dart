class ApiHeader {
  Map<String, String> headers = <String, String>{
    'Content-Type': "application/json",
    'MobileAppKey': "EED26D5A-711D-49BD-8999-38D8A60329C5",
  };
}

class ApiUrl {
  static const String apiMainPath = "http://5.189.147.159:7013/";

  static const String apiImagePath = "https://devappapi.olocker.in/";
  // static const String apiImagePath = "https://www.olocker.in/";

  static const String apiProfileImagePath = "${apiMainPath}ProfileImage/";


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
  static const String insertCustomerFavDealApi =
      "${apiMainPath}api/User/InsertCustomerFavDeal";

  // Online Deal Favourite Screen Api
  static const String getCustomerFavouriteDealsApi =
      "${apiMainPath}api/User/GetFavDeals";

  //saving schemes screeen apis
  static const String getParterSavingSchemeApi =
      "${apiMainPath}api/User/GetParterSavingScheme";
  static const String getSavingSchemeDetailsApi =
      "${apiMainPath}api/User/GetSavingSchemeDetails";
  static const String addEnrollSavingSchemeApi =
      "${apiMainPath}api/User/AddEnrollSavingSchemeDetails";
  static const String paymentSavingSchemeApi =
      "${apiMainPath}api/User/PaymentSavingScheme";
  static const String getCustomerSavingTransactions =
      "${apiMainPath}api/User/GetCustomerSavingTransactions";

  // my saving schemes
  static const String getCustomerSavingSchemeApi =
      "${apiMainPath}api/User/GetCustomerSavingScheme";
  static const String getPendingBillDetailListApi =
      "${apiMainPath}api/User/PendingBillDetail";
  static const String mySchemesEMIPaymentsApi =
      "${apiMainPath}api/User/EMIPayments";

  // profile Screen Api
  static const String getUserProfileApi =
      "${apiMainPath}api/User/GetUserProfile";
  static const String updateUserProfileApi =
      "${apiMainPath}api/User/UpdateProfile";
  static const String getCityStateByPincodeApi =
      "${apiMainPath}api/User/GetCityStateByPincode";

  //ABOUT US screen apis
  static const String getAboutUsJewellerDetailsApi =
      "${apiMainPath}api/User/GetDetails";

  //notification screen apis\
  static const String getAllNotificationApi =
      "${apiMainPath}api/User/GetAllNotification";
  static const String readMarkUserNotificationApi =
      "${apiMainPath}api/User/ReadMarkUserNotification";

  // manage jewellery portfolio Screen Api
  static const String getAllDataAddOrnamentApi =
      "${apiMainPath}api/Info/GetAllDataAddOrnament";
  static const String addOrnamentApi = "${apiMainPath}api/User/AddOrnament";
  static const String updateOrnamentApi =
      "${apiMainPath}api/User/UpdateOrnament";

//uninsured apis
  static const String getAllInsuredOrnamentApi =
      "${apiMainPath}api/User/GetAllInsuredOrnament";
  static const String getOrnamentDetailApi =
      "${apiMainPath}api/User/GetOrnamentDetail";
  static const String updateUnInsuredOrnamentImageApi =
      "${apiMainPath}api/User/UpdateUnInsuredOrnamentImage";
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
      "${apiMainPath}api/User/GetOrnamentTracking";
  static const String addTrackingDataApi =
      "${apiMainPath}api/User/AddTrackingData";

  // refer and earn screen apis
  static const String getPartnerByCodeApi =
      "${apiMainPath}api/Partner/GetPartnerByCode";
  static const String getLoyalityPlanApi =
      "${apiMainPath}api/Partner/GetLoyalityPlan";

  //favourites apis
  static const String getFavProductApi = "${apiMainPath}api/User/GetFavProduct";

  // static const String deleteFavProductApi = "${apiMainPath}api/User/RemoveFavProduct";

  //authentication apis
  static const String userLoginApi = "${apiMainPath}api/User/UserLogin";
  static const String validateOtpApi = "${apiMainPath}api/user/ValidateOtp";
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
  static const String getOfferDetailApi =
      "${apiMainPath}api/Partner/GetOfferDetail";
  static const String getJewelleryGetPushToAppDataApi =
      "${apiMainPath}api/Partner/GetPushToAppData";
  static const String getNewArrivalApi =
      "${apiMainPath}api/Partner/GetPushToAppCollections";
  static const String getJewelleryTypeApi =
      "${apiMainPath}api/Partner/GetUniqueList";
  static const String getBestSellerApi =
      "${apiMainPath}api/Partner/GetBestSellerProducts";
  static const String getClientTestimonialsApi =
      "${apiMainPath}api/Partner/GetClientTestimonials";
  static const String getGoldPriceApi =
      "${apiMainPath}api/Partner/GetIBJARatesByPartnerId";

  static const String getAboutYourSelfApi = "${apiMainPath}api/User/GetDetails";

  /// Jewellery Details Screen Api's
  // static const String getJewelleryDetailApi =
  //     "${apiMainPath}api/User/GetProductDetail";
  static const String getOfferJewelleryDetailApi =
      "${apiMainPath}api/User/GetProductDetail";
  static const String removeFavProductApi =
      "${apiMainPath}api/User/RemoveFavProduct";
  static const String addFavProductApi = "${apiMainPath}api/User/AddFavProduct";

  /// Enquire Screen Api's
  static const String sendProductInquiryApi =
      "${apiMainPath}api/User/SendProductInquiry";
  static const String getNotificationAllReplyApi =
      "${apiMainPath}api/Partner/GetNotificationAllReply";
  static const String getAllInquiresApi =
      "${apiMainPath}api/User/GetAllInquires";

  // static const String getJewelleryCategoryApi =
  //     "${apiMainPath}api/Partner/GetPushToAppData";
  // static const String getJewelleryTypeApi =
  //     "${apiMainPath}api/Partner/GetUniqueList";
  // static const String getBestSellerApi =
  //     "${apiMainPath}api/Partner/GetBestSellerProducts";
  // static const String getClientTestimonialsApi =
  //     "${apiMainPath}api/Partner/GetClientTestimonials";
  // static const String getGoldPriceApi =
  //     "${apiMainPath}api/Partner/GetIBJARatesByPartnerId";

  static const String getFeedbackFormApi =
      "${apiMainPath}api/Partner/GetRatingQuestions";

  static const String getLoyaltyPointApi =
      "${apiMainPath}api/User/GetPartnerPoint";

  static const String setFeedbackFormApi =
      "${apiMainPath}api/User/AddCustomerFeedback";
  static const String getJewellerJewelleriesApi =
      "${apiMainPath}api/Partner/SearchProductList1";

  // update device id api
  static String updateDeviceIdApi =
      "${apiMainPath}api/User/UpdateCustomerDeviceId";
}
