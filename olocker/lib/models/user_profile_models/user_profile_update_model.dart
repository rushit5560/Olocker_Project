// To parse this JSON data, do
//
//     final updateProfileModel = updateProfileModelFromJson(jsonString);

import 'dart:convert';

UpdateProfileModel updateProfileModelFromJson(String str) =>
    UpdateProfileModel.fromJson(json.decode(str));

class UpdateProfileModel {
  int statusCode;
  Data data;

  UpdateProfileModel({
    required this.statusCode,
    required this.data,
  });

  factory UpdateProfileModel.fromJson(Map<String, dynamic> json) =>
      UpdateProfileModel(
        statusCode: json["statusCode"] ?? 0,
        data: Data.fromJson(json["data"] ?? {}),
      );
}

class Data {
  UserProfile userProfile;
  bool success;
  ErrorInfo errorInfo;

  Data({
    required this.userProfile,
    required this.success,
    required this.errorInfo,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        userProfile: UserProfile.fromJson(json["UserProfile"] ?? {}),
        success: json["success"] ?? false,
        errorInfo: ErrorInfo.fromJson(json["error_info"] ?? {}),
      );
}

class ErrorInfo {
  int errorType;
  String extraInfo;
  String description;
  String errorData;

  ErrorInfo({
    required this.errorType,
    required this.extraInfo,
    required this.description,
    required this.errorData,
  });

  factory ErrorInfo.fromJson(Map<String, dynamic> json) => ErrorInfo(
        errorType: json["error_type"] ?? 0,
        extraInfo: json["extra_info"] ?? "",
        description: json["description"] ?? "",
        errorData: json["error_data "] ?? "",
      );
}

class UserProfile {
  String firstName;
  String lastName;
  String userEmail;
  String gender;
  String country;
  String state;
  String city;
  String pin;
  String address1;
  String dob;
  String ipAddr;
  String custSrNo;
  String whatYouLikeToDo;
  String imageurl;
  String salutation;

  UserProfile({
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
    required this.custSrNo,
    required this.whatYouLikeToDo,
    required this.imageurl,
    required this.salutation,
  });

  factory UserProfile.fromJson(Map<String, dynamic> json) => UserProfile(
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
        custSrNo: json["CustSrNo"] ?? "",
        whatYouLikeToDo: json["WhatYouLikeToDo"] ?? "",
        imageurl: json["Imageurl"] ?? "",
        salutation: json["Salutation"] ?? "",
      );
}
