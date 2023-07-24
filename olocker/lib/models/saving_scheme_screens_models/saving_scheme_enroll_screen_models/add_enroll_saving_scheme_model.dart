import 'dart:convert';

import 'package:olocker/models/error_info_model/error_info_model.dart';

AddEnrollSavingSchemeModel addEnrollSavingSchemeModelFromJson(String str) => AddEnrollSavingSchemeModel.fromJson(json.decode(str));

String addEnrollSavingSchemeModelToJson(AddEnrollSavingSchemeModel data) => json.encode(data.toJson());

class AddEnrollSavingSchemeModel {
  int statusCode;
  Data data;

  AddEnrollSavingSchemeModel({
    required this.statusCode,
    required this.data,
  });

  factory AddEnrollSavingSchemeModel.fromJson(Map<String, dynamic> json) => AddEnrollSavingSchemeModel(
    statusCode: json["statusCode"] ?? 0,
    data: Data.fromJson(json["data"] ?? {}),
  );

  Map<String, dynamic> toJson() => {
    "statusCode": statusCode,
    // "data": data.toJson(),
  };
}

class Data {
  SavingSchemeDetails savingSchemeDetails;
  PartnerSavingSchemeDetails partnerSavingSchemeDetails;
  // PaymentDetails paymentDetails;
  bool success;
  ErrorInfoModel errorInfo;

  Data({
    required this.savingSchemeDetails,
    required this.partnerSavingSchemeDetails,
    // required this.paymentDetails,
    required this.success,
    required this.errorInfo,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    savingSchemeDetails: SavingSchemeDetails.fromJson(json["savingSchemeDetails"] ?? {}),
    partnerSavingSchemeDetails: PartnerSavingSchemeDetails.fromJson(json["partnerSavingSchemeDetails"] ?? {}),
    // paymentDetails: PaymentDetails.fromJson(json["paymentDetails"]),
    success: json["success"] ?? false,
    errorInfo: ErrorInfoModel.fromJson(json["error_info"] ?? {}),
  );

  /*Map<String, dynamic> toJson() => {
    "savingSchemeDetails": savingSchemeDetails.toJson(),
    "partnerSavingSchemeDetails": partnerSavingSchemeDetails.toJson(),
    "paymentDetails": paymentDetails.toJson(),
    "success": success,
    "error_info": errorInfo.toJson(),
  };*/
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
        monthlyAmount: json["monthlyAmount"] ?? 0,
        tenure: json["tenure"] ?? 0,
        ourContribution: double.parse(json["ourContribution"].toString()),
        maturityAmount: json["maturityAmount"] ?? 0,
        partnerSavingSchemeSrNo: json["partnerSavingSchemeSrNo"] ?? 0,
        paymentId: json["paymentId"] ?? "",
        customer: Customer.fromJson(json["customer"] ?? {}),
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
        // customerSrNo: json["customerSrNo"],
        salutation: json["salutation"] ?? "",
        firstName: json["firstName"] ?? "",
        lastName: json["lastName"] ?? "",
        panNumber: json["panNumber"] ?? "",
        adharNumber: json["adharNumber"] ?? "",
        mobileNumber: json["mobileNumber"] ?? "",
        emailId: json["emailId"] ?? "",
        address: json["address"] ?? "",
        pincode: json["pincode"] ?? "",
        city: json["city"] ?? "",
        state: json["state"] ?? "",
        country: json["country"] ?? "",
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
        customerSrNo: json["customerSrNo"] ?? 0,
        // partnerSavingSchemeDetailsStartDate: json["startDate"],
        installmentAmount: json["installmentAmount"] ?? "",
        startDate: DateTime.parse(json["startDate"] ?? DateTime.now()),
        maturityDate: DateTime.parse(json["maturityDate"] ?? DateTime.now()),
        endDate: DateTime.parse(json["endDate"] ?? DateTime.now()),
        smsReminderDate:
            DateTime.parse(json["smsReminderDate"] ?? DateTime.now()),
        finalAmountPayable: double.parse(json["finalAmountPayable"].toString()),
        ourContribution: double.parse(json["ourContribution"].toString()),
        partnerSavingSchemeSrNo: json["partnerSavingSchemeSrNo"] ?? 0,
        folioNo: json["folioNo"] ?? "",
        amount: json["amount"] ?? 0,
        isPending: json["isPending"] ?? false,
        tenure: json["tenure"] ?? 0,
        maturityAmount: json["maturityAmount"] ?? 0,
        // pendingBillSrNo: List<dynamic>.from(json["pendingBillSrNo"].map((x) => x)),
        startDateNew: DateTime.parse(json["startDateNew"] ?? DateTime.now()),
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






