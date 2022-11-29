import 'dart:convert';

AddEnrollSavingSchemeModel addEnrollSavingSchemeModelFromJson(String str) =>
    AddEnrollSavingSchemeModel.fromJson(json.decode(str));

// String addEnrollSavingSchemeModelToJson(AddEnrollSavingSchemeModel data) => json.encode(data.toJson());

class AddEnrollSavingSchemeModel {
  AddEnrollSavingSchemeModel({
    required this.savingSchemeDetails,
    required this.partnerSavingSchemeDetails,
    // required this.paymentDetails,
    required this.success,
    required this.errorInfo,
  });

  SavingSchemeDetails savingSchemeDetails;
  PartnerSavingSchemeDetails partnerSavingSchemeDetails;
  // PaymentDetails paymentDetails;
  bool success;
  ErrorInfo errorInfo;

  factory AddEnrollSavingSchemeModel.fromJson(Map<String, dynamic> json) =>
      AddEnrollSavingSchemeModel(
        savingSchemeDetails:
            SavingSchemeDetails.fromJson(json["SavingSchemeDetails"] ?? {}),
        partnerSavingSchemeDetails: PartnerSavingSchemeDetails.fromJson(
            json["PartnerSavingSchemeDetails"] ?? {}),
        // paymentDetails: PaymentDetails.fromJson(json["PaymentDetails"] ?? {}),
        success: json["success"] ?? false,
        errorInfo: ErrorInfo.fromJson(json["error_info"] ?? {}),
      );
}

class ErrorInfo {
  ErrorInfo({
    required this.errorType,
    required this.extraInfo,
    required this.description,
    this.errorData,
  });

  final int errorType;
  final String extraInfo;
  final String description;
  final dynamic errorData;

  factory ErrorInfo.fromJson(Map<String, dynamic> json) => ErrorInfo(
        errorType: json["error_type"] ?? 0,
        extraInfo: json["extra_info"] ?? "",
        description: json["description"] ?? "",
        errorData: json["error_data"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "error_type": errorType,
        "extra_info": extraInfo,
        "description": description,
        "error_data": errorData,
      };
}

class SavingSchemeDetails {
  SavingSchemeDetails({
    required this.monthlyAmount,
    required this.tenure,
    required this.ourContribution,
    required this.maturityAmount,
    required this.partnerSavingSchemeSrNo,
    required this.paymentId,
    required this.customer,
  });

  int monthlyAmount;
  int tenure;
  double ourContribution;
  int maturityAmount;
  int partnerSavingSchemeSrNo;
  String paymentId;
  Customer customer;

  factory SavingSchemeDetails.fromJson(Map<String, dynamic> json) =>
      SavingSchemeDetails(
        monthlyAmount: json["MonthlyAmount"] ?? 0,
        tenure: json["Tenure"] ?? 0,
        ourContribution: json["OurContribution"] ?? 0.0,
        maturityAmount: json["MaturityAmount"] ?? 0,
        partnerSavingSchemeSrNo: json["PartnerSavingSchemeSrNo"] ?? 0,
        paymentId: json["PaymentId"] ?? "",
        customer: Customer.fromJson(json["Customer"] ?? {}),
      );

  /*Map<String, dynamic> toJson() => {
    "MonthlyAmount": monthlyAmount,
    "Tenure": tenure,
    "OurContribution": ourContribution,
    "MaturityAmount": maturityAmount,
    "PartnerSavingSchemeSrNo": partnerSavingSchemeSrNo,
    "PaymentId": paymentId,
    "Customer": customer.toJson(),
  };*/
}

class Customer {
  Customer({
    // this.customerSrNo,
    required this.salutation,
    required this.firstName,
    required this.lastName,
    required this.panNumber,
    required this.adharNumber,
    required this.mobileNumber,
    required this.emailId,
    required this.address,
    required this.pincode,
    required this.city,
    required this.state,
    required this.country,
  });

  // dynamic customerSrNo;
  String salutation;
  String firstName;
  String lastName;
  String panNumber;
  String adharNumber;
  String mobileNumber;
  String emailId;
  String address;
  String pincode;
  String city;
  String state;
  String country;

  factory Customer.fromJson(Map<String, dynamic> json) => Customer(
        // customerSrNo: json["CustomerSrNo"],
        salutation: json["Salutation"] ?? "",
        firstName: json["FirstName"] ?? "",
        lastName: json["LastName"] ?? "",
        panNumber: json["PanNumber"] ?? "",
        adharNumber: json["AdharNumber"] ?? "",
        mobileNumber: json["MobileNumber"] ?? "",
        emailId: json["EmailId"] ?? "",
        address: json["Address"] ?? "",
        pincode: json["Pincode"] ?? "",
        city: json["City"] ?? "",
        state: json["State"] ?? "",
        country: json["Country"] ?? "",
      );

  /*Map<String, dynamic> toJson() => {
    "CustomerSrNo": customerSrNo,
    "Salutation": salutation,
    "FirstName": firstName,
    "LastName": lastName,
    "PanNumber": panNumber,
    "AdharNumber": adharNumber,
    "MobileNumber": mobileNumber,
    "EmailId": emailId,
    "Address": address,
    "Pincode": pincode,
    "City": city,
    "State": state,
    "Country": country,
  };*/
}

class PartnerSavingSchemeDetails {
  PartnerSavingSchemeDetails({
    required this.customerSrNo,
    // this.partnerSavingSchemeDetailsStartDate,
    required this.installmentAmount,
    required this.startDate,
    required this.maturityDate,
    required this.endDate,
    required this.smsReminderDate,
    required this.finalAmountPayable,
    required this.ourContribution,
    required this.partnerSavingSchemeSrNo,
    required this.folioNo,
    required this.amount,
    required this.isPending,
    required this.tenure,
    required this.maturityAmount,
    // this.pendingBillSrNo,
    required this.startDateNew,
  });

  int customerSrNo;
  // dynamic partnerSavingSchemeDetailsStartDate;
  String installmentAmount;
  DateTime startDate;
  DateTime maturityDate;
  DateTime endDate;
  DateTime smsReminderDate;
  double finalAmountPayable;
  double ourContribution;
  int partnerSavingSchemeSrNo;
  String folioNo;
  int amount;
  bool isPending;
  int tenure;
  int maturityAmount;
  // List<dynamic> pendingBillSrNo;
  DateTime startDateNew;

  factory PartnerSavingSchemeDetails.fromJson(Map<String, dynamic> json) =>
      PartnerSavingSchemeDetails(
        customerSrNo: json["CustomerSrNo"] ?? 0,
        // partnerSavingSchemeDetailsStartDate: json["startDate"],
        installmentAmount: json["InstallmentAmount"] ?? "",
        startDate: DateTime.parse(json["StartDate"] ?? DateTime.now()),
        maturityDate: DateTime.parse(json["MaturityDate"] ?? DateTime.now()),
        endDate: DateTime.parse(json["EndDate"] ?? DateTime.now()),
        smsReminderDate:
            DateTime.parse(json["SmsReminderDate"] ?? DateTime.now()),
        finalAmountPayable: json["FinalAmountPayable"] ?? 0.0,
        ourContribution: json["OurContribution"] ?? 0.0,
        partnerSavingSchemeSrNo: json["PartnerSavingSchemeSrNo"] ?? 0,
        folioNo: json["FolioNo"] ?? "",
        amount: json["Amount"] ?? 0,
        isPending: json["IsPending"] ?? false,
        tenure: json["Tenure"] ?? 0,
        maturityAmount: json["MaturityAmount"] ?? 0,
        // pendingBillSrNo: List<dynamic>.from(json["PendingBillSrNo"].map((x) => x)),
        startDateNew: DateTime.parse(json["StartDateNew"] ?? DateTime.now()),
      );

  /*Map<String, dynamic> toJson() => {
    "CustomerSrNo": customerSrNo,
    "startDate": partnerSavingSchemeDetailsStartDate,
    "InstallmentAmount": installmentAmount,
    "StartDate": startDate.toIso8601String(),
    "MaturityDate": maturityDate.toIso8601String(),
    "EndDate": endDate.toIso8601String(),
    "SmsReminderDate": smsReminderDate.toIso8601String(),
    "FinalAmountPayable": finalAmountPayable,
    "OurContribution": ourContribution,
    "PartnerSavingSchemeSrNo": partnerSavingSchemeSrNo,
    "FolioNo": folioNo,
    "Amount": amount,
    "IsPending": isPending,
    "Tenure": tenure,
    "MaturityAmount": maturityAmount,
    "PendingBillSrNo": List<dynamic>.from(pendingBillSrNo.map((x) => x)),
    "StartDateNew": startDateNew.toIso8601String(),
  };*/
}

// class PaymentDetails {
//   PaymentDetails({
//     this.vadsSiteId,
//     this.vadsKey,
//     this.vadsVersion,
//     this.vadsCtxMode,
//     this.vadsTransDate,
//     this.vadsPageAction,
//     this.vadsActionMode,
//     this.vadsCurrency,
//     this.vadsPaymentConfig,
//     this.vadsAmount,
//     this.vadsTransId,
//     this.vadsValidationMode,
//     this.vadsCaptureDelay,
//     this.vadsPaymentCards,
//     this.vadsLanguage,
//     this.vadsReturnMode,
//     this.vadsUrlReturn,
//     this.vadsRedirectSuccessTimeout,
//     this.vadsRedirectSuccessMessage,
//     this.vadsRedirectErrorTimeout,
//     this.vadsRedirectErrorMessage,
//     this.vadsOrderId,
//     this.gatewayUrl,
//   });
//
//   dynamic vadsSiteId;
//   dynamic vadsKey;
//   dynamic vadsVersion;
//   dynamic vadsCtxMode;
//   dynamic vadsTransDate;
//   dynamic vadsPageAction;
//   dynamic vadsActionMode;
//   dynamic vadsCurrency;
//   dynamic vadsPaymentConfig;
//   dynamic vadsAmount;
//   dynamic vadsTransId;
//   dynamic vadsValidationMode;
//   dynamic vadsCaptureDelay;
//   dynamic vadsPaymentCards;
//   dynamic vadsLanguage;
//   dynamic vadsReturnMode;
//   dynamic vadsUrlReturn;
//   dynamic vadsRedirectSuccessTimeout;
//   dynamic vadsRedirectSuccessMessage;
//   dynamic vadsRedirectErrorTimeout;
//   dynamic vadsRedirectErrorMessage;
//   dynamic vadsOrderId;
//   dynamic gatewayUrl;
//
//   factory PaymentDetails.fromJson(Map<String, dynamic> json) => PaymentDetails(
//     vadsSiteId: json["vads_site_id"],
//     vadsKey: json["vads_key"],
//     vadsVersion: json["vads_version"],
//     vadsCtxMode: json["vads_ctx_mode"],
//     vadsTransDate: json["vads_trans_date"],
//     vadsPageAction: json["vads_page_action"],
//     vadsActionMode: json["vads_action_mode"],
//     vadsCurrency: json["vads_currency"],
//     vadsPaymentConfig: json["vads_payment_config"],
//     vadsAmount: json["vads_amount"],
//     vadsTransId: json["vads_trans_id"],
//     vadsValidationMode: json["vads_validation_mode"],
//     vadsCaptureDelay: json["vads_capture_delay"],
//     vadsPaymentCards: json["vads_payment_cards"],
//     vadsLanguage: json["vads_language"],
//     vadsReturnMode: json["vads_return_mode"],
//     vadsUrlReturn: json["vads_url_return"],
//     vadsRedirectSuccessTimeout: json["vads_redirect_success_timeout"],
//     vadsRedirectSuccessMessage: json["vads_redirect_success_message"],
//     vadsRedirectErrorTimeout: json["vads_redirect_error_timeout"],
//     vadsRedirectErrorMessage: json["vads_redirect_error_message"],
//     vadsOrderId: json["vads_order_id"],
//     gatewayUrl: json["gateway_url"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "vads_site_id": vadsSiteId,
//     "vads_key": vadsKey,
//     "vads_version": vadsVersion,
//     "vads_ctx_mode": vadsCtxMode,
//     "vads_trans_date": vadsTransDate,
//     "vads_page_action": vadsPageAction,
//     "vads_action_mode": vadsActionMode,
//     "vads_currency": vadsCurrency,
//     "vads_payment_config": vadsPaymentConfig,
//     "vads_amount": vadsAmount,
//     "vads_trans_id": vadsTransId,
//     "vads_validation_mode": vadsValidationMode,
//     "vads_capture_delay": vadsCaptureDelay,
//     "vads_payment_cards": vadsPaymentCards,
//     "vads_language": vadsLanguage,
//     "vads_return_mode": vadsReturnMode,
//     "vads_url_return": vadsUrlReturn,
//     "vads_redirect_success_timeout": vadsRedirectSuccessTimeout,
//     "vads_redirect_success_message": vadsRedirectSuccessMessage,
//     "vads_redirect_error_timeout": vadsRedirectErrorTimeout,
//     "vads_redirect_error_message": vadsRedirectErrorMessage,
//     "vads_order_id": vadsOrderId,
//     "gateway_url": gatewayUrl,
//   };
// }




