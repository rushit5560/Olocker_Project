import 'dart:convert';

import '../error_info_model/error_info_model.dart';

LoginResponseModel loginResponseModelFromJson(String str) =>
    LoginResponseModel.fromJson(json.decode(str));

class LoginResponseModel {
  int statusCode;
  LoginResponseData data;

  LoginResponseModel({
    required this.statusCode,
    required this.data,
  });

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) =>
      LoginResponseModel(
        statusCode: json["statusCode"] ?? 0,
        data: LoginResponseData.fromJson(json["data"] ?? {}),
      );
}

class LoginResponseData {
  List<UserRequestValidateOtp> userRequestValidateOtp;
  bool isCustomer;
  bool success;
  ErrorInfoModel errorInfo;

  LoginResponseData({
    required this.userRequestValidateOtp,
    required this.isCustomer,
    required this.success,
    required this.errorInfo,
  });

  factory LoginResponseData.fromJson(Map<String, dynamic> json) =>
      LoginResponseData(
        userRequestValidateOtp: List<UserRequestValidateOtp>.from(
            (json["userRequestValidateOtp"] ?? [])
                    .map((x) => UserRequestValidateOtp.fromJson(x)) ??
                {}),
        isCustomer: json["isCustomer"] ?? false,
        success: json["success"] ?? false,
        errorInfo: ErrorInfoModel.fromJson(json["error_info"] ?? {}),
      );
}


class UserRequestValidateOtp {
  UserRequestValidateOtp({
    this.userName,
    this.password,
    required this.gender,
    required this.firstName,
    required this.lastName,
    required this.userEmail,
    required this.mobileNo,
    this.address,
    required this.city,
    required this.pin,
    required this.state,
    required this.country,
    required this.dob,
    this.profilePic,
    this.profilePicLoc,
    this.otp,
    required this.custSrNo,
    this.referredByMobileNo,
    required this.deviceId,
    required this.lastPasswordUpdateDate,
    required this.srNo,
  });

  final dynamic userName;
  final dynamic password;
  final String gender;
  final String firstName;
  final String lastName;
  final String userEmail;
  final String mobileNo;
  final dynamic address;
  final String city;
  final String pin;
  final String state;
  final String country;
  final String dob;
  final dynamic profilePic;
  final dynamic profilePicLoc;
  final dynamic otp;
  final String custSrNo;
  final dynamic referredByMobileNo;
  final String deviceId;
  final String lastPasswordUpdateDate;
  final int srNo;

  factory UserRequestValidateOtp.fromJson(Map<String, dynamic> json) =>
      UserRequestValidateOtp(
        userName: json["userName"] ?? "",
        password: json["password"] ?? "",
        gender: json["gender"] ?? "",
        firstName: json["firstName"] ?? "",
        lastName: json["lastName"] ?? "",
        userEmail: json["userEmail"] ?? "",
        mobileNo: json["mobileNo"] ?? "",
        address: json["address"] ?? "",
        city: json["city"] ?? "",
        pin: json["pin"] ?? "",
        state: json["state"] ?? "",
        country: json["country"] ?? "",
        dob: json["dob"] ?? "",
        profilePic: json["profilePic"] ?? "",
        profilePicLoc: json["profilePicLoc"] ?? "",
        otp: json["otp"] ?? "",
        custSrNo: json["custSrNo"] ?? "",
        referredByMobileNo: json["referredByMobileNo"] ?? "",
        deviceId: json["deviceId"] ?? "",
        lastPasswordUpdateDate: json["lastPasswordUpdateDate"] ?? "",
        srNo: json["srNo"] ?? 0,
      );
}
