import 'dart:convert';

import '../error_info_model/error_info_model.dart';

RegisterModel registerModelFromJsonFromJson(String str) =>
    RegisterModel.fromJson(json.decode(str));

// String registerModelFromJsonToJson(RegisterModelFromJson data) => json.encode(data.toJson());

class RegisterModel {
  int statusCode;
  RegisterData data;

  RegisterModel({
    required this.statusCode,
    required this.data,
  });

  factory RegisterModel.fromJson(Map<String, dynamic> json) => RegisterModel(
        statusCode: json["statusCode"] ?? 0,
        data: RegisterData.fromJson(json["data"] ?? {}),
      );
}

class RegisterData {
  UserRegistration userRegistration;
  int safeGoldSrno;
  int safeGoldTxnId;
  bool isSageGoldGift;
  int recieverId;
  bool success;
  ErrorInfoModel errorInfo;

  RegisterData({
    required this.userRegistration,
    required this.safeGoldSrno,
    required this.safeGoldTxnId,
    required this.isSageGoldGift,
    required this.recieverId,
    required this.success,
    required this.errorInfo,
  });

  factory RegisterData.fromJson(Map<String, dynamic> json) => RegisterData(
        userRegistration:
            UserRegistration.fromJson(json["userRegistration"] ?? {}),
        safeGoldSrno: json["SafeGoldSrno"] ?? 0,
        safeGoldTxnId: json["safeGoldTxnId"] ?? 0,
        isSageGoldGift: json["IsSageGoldGift"] ?? false,
        recieverId: json["reciever_id"] ?? 0,
        success: json["success"] ?? false,
        errorInfo: ErrorInfoModel.fromJson(json["error_info"] ?? {}),
      );
}

class UserRegistration {
  UserRegistration({
    required this.firstName,
    required this.lastName,
    required this.mobileNo,
    required this.userEmail,
    this.gender,
    this.country,
    this.state,
    this.city,
    this.pin,
    this.address1,
    required this.dob,
    this.ipAddr,
    required this.custSrNo,
    this.refferedByMobileNo,
    this.safegoldId,
    this.referralCode,
    this.deviceMacId,
    required this.salutation,
    this.panNumber,
    this.adharNumber,
  });

  final String firstName;
  final String lastName;
  final String mobileNo;
  final String userEmail;
  final dynamic gender;
  final dynamic country;
  final dynamic state;
  final dynamic city;
  final dynamic pin;
  final dynamic address1;
  final String dob;
  final dynamic ipAddr;
  final String custSrNo;
  final dynamic refferedByMobileNo;
  final dynamic safegoldId;
  final dynamic referralCode;
  final dynamic deviceMacId;
  final String salutation;
  final dynamic panNumber;
  final dynamic adharNumber;

  factory UserRegistration.fromJson(Map<String, dynamic> json) =>
      UserRegistration(
        firstName: json["firstName"] ?? "",
        lastName: json["lastName"] ?? "",
        mobileNo: json["mobileNo"] ?? "",
        userEmail: json["userEmail"] ?? "",
        gender: json["gender"] ?? "",
        country: json["country"] ?? "",
        state: json["state"] ?? "",
        city: json["city"] ?? "",
        pin: json["pin"] ?? "",
        address1: json["address1"] ?? "",
        dob: json["dob"] ?? "",
        ipAddr: json["ipAddr"] ?? "",
        custSrNo: json["custSrNo"] ?? "",
        refferedByMobileNo: json["refferedByMobileNo"] ?? "",
        safegoldId: json["safegoldId"] ?? "",
        referralCode: json["referralCode"] ?? "",
        deviceMacId: json["deviceMacId"] ?? "",
        salutation: json["salutation"] ?? "",
        panNumber: json["panNumber"] ?? "",
        adharNumber: json["adharNumber"] ?? "",
      );

// Map<String, dynamic> toJson() => {
//   "FirstName": firstName,
//   "LastName": lastName,
//   "MobileNo": mobileNo,
//   "UserEmail": userEmail,
//   "Gender": gender,
//   "Country": country,
//   "State": state,
//   "City": city,
//   "Pin": pin,
//   "Address1": address1,
//   "DOB": dob,
//   "IPAddr": ipAddr,
//   "CustSrNo": custSrNo,
//   "RefferedByMobileNo": refferedByMobileNo,
//   "SafegoldId": safegoldId,
//   "ReferralCode": referralCode,
//   "DeviceMacId": deviceMacId,
//   "Salutation": salutation,
//   "PanNumber": panNumber,
//   "AdharNumber": adharNumber,
// };
}
