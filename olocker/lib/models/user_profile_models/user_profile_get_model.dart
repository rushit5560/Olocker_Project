// To parse this JSON data, do
//
//     final userProfileGetModel = userProfileGetModelFromJson(jsonString);

import 'dart:convert';

UserProfileGetModel userProfileGetModelFromJson(String str) =>
    UserProfileGetModel.fromJson(json.decode(str));

String userProfileGetModelToJson(UserProfileGetModel data) =>
    json.encode(data.toJson());

class UserProfileGetModel {
  UserProfileGetModel({
    required this.customerProfile,
    required this.success,
    required this.errorInfo,
  });

  final CustomerProfile customerProfile;
  final bool success;
  final ErrorInfo errorInfo;

  factory UserProfileGetModel.fromJson(Map<String, dynamic> json) =>
      UserProfileGetModel(
        customerProfile:
            CustomerProfile.fromJson(json["CustomerProfile"] ?? {}),
        success: json["success"] ?? false,
        errorInfo: ErrorInfo.fromJson(json["error_info"] ?? {}),
      );

  Map<String, dynamic> toJson() => {
        "CustomerProfile": customerProfile.toJson(),
        "success": success,
        "error_info": errorInfo.toJson(),
      };
}

class CustomerProfile {
  CustomerProfile({
    required this.custSrNo,
    required this.firstName,
    required this.lastName,
    required this.userEmail,
    required this.gender,
    required this.country,
    required this.state,
    required this.city,
    required this.pin,
    required this.address1,
    required this.dob,
    required this.ipAddr,
    required this.imageLocation,
    required this.whatYouLikeToDo,
    required this.referralCode,
    required this.mobileNo,
    required this.safegoldId,
    required this.salutation,
  });

  final String custSrNo;
  final String firstName;
  final String lastName;
  final String userEmail;
  final String gender;
  final String country;
  final String state;
  final String city;
  final String pin;
  final String address1;
  final String dob;
  final String ipAddr;
  final String imageLocation;
  final String whatYouLikeToDo;
  final String referralCode;
  final String mobileNo;
  final String safegoldId;
  final String salutation;

  factory CustomerProfile.fromJson(Map<String, dynamic> json) =>
      CustomerProfile(
        custSrNo: json["CustSrNo"] ?? "",
        firstName: json["FirstName"] ?? "",
        lastName: json["LastName"] ?? "",
        userEmail: json["UserEmail"] ?? "",
        gender: json["Gender"] ?? "",
        country: json["Country"] ?? "",
        state: json["State"] ?? "",
        city: json["City"] ?? "",
        pin: json["Pin"] ?? "",
        address1: json["Address1"] ?? "",
        dob: json["DOB"] ?? "",
        ipAddr: json["IPAddr"] ?? "",
        imageLocation: json["ImageLocation"] ?? "",
        whatYouLikeToDo: json["WhatYouLikeToDo"] ?? "",
        referralCode: json["ReferralCode"] ?? "",
        mobileNo: json["MobileNo"] ?? "",
        safegoldId: json["SafegoldId"] ?? "",
        salutation: json["Salutation"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "CustSrNo": custSrNo,
        "FirstName": firstName,
        "LastName": lastName,
        "UserEmail": userEmail,
        "Gender": gender,
        "Country": country,
        "State": state,
        "City": city,
        "Pin": pin,
        "Address1": address1,
        "DOB": dob,
        "IPAddr": ipAddr,
        "ImageLocation": imageLocation,
        "WhatYouLikeToDo": whatYouLikeToDo,
        "ReferralCode": referralCode,
        "MobileNo": mobileNo,
        "SafegoldId": safegoldId,
        "Salutation": salutation,
      };
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
