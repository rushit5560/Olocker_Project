// To parse this JSON data, do
//
//     final loginResponseModel = loginResponseModelFromJson(jsonString);

import 'dart:convert';

LoginResponseModel loginResponseModelFromJson(String str) =>
    LoginResponseModel.fromJson(json.decode(str));

String loginResponseModelToJson(LoginResponseModel data) =>
    json.encode(data.toJson());

class LoginResponseModel {
  LoginResponseModel({
    required this.userRequestValidateOtp,
    required this.isCustomer,
    required this.success,
    required this.errorInfo,
  });

  final List<UserRequestValidateOtp> userRequestValidateOtp;
  final bool isCustomer;
  final bool success;
  final ErrorInfo errorInfo;

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) =>
      LoginResponseModel(
        userRequestValidateOtp: List<UserRequestValidateOtp>.from(
            (json["UserRequestValidateOtp"] ?? [])
                .map((x) => UserRequestValidateOtp.fromJson(x))),
        isCustomer: json["IsCustomer"] ?? false,
        success: json["success"] ?? false,
        errorInfo: ErrorInfo.fromJson(json["error_info"] ?? {}),
      );

  Map<String, dynamic> toJson() => {
        "UserRequestValidateOtp":
            List<dynamic>.from(userRequestValidateOtp.map((x) => x.toJson())),
        "IsCustomer": isCustomer,
        "success": success,
        "error_info": errorInfo.toJson(),
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

  factory UserRequestValidateOtp.fromJson(Map<String, dynamic> json) =>
      UserRequestValidateOtp(
        userName: json["UserName"] ?? "",
        password: json["Password"] ?? "",
        gender: json["Gender"] ?? "",
        firstName: json["FirstName"] ?? "",
        lastName: json["LastName"] ?? "",
        userEmail: json["UserEmail"] ?? "",
        mobileNo: json["MobileNo"] ?? "",
        address: json["Address"] ?? "",
        city: json["City"] ?? "",
        pin: json["Pin"] ?? "",
        state: json["State"] ?? "",
        country: json["Country"] ?? "",
        dob: json["DOB"] ?? "",
        profilePic: json["ProfilePic"] ?? "",
        profilePicLoc: json["ProfilePicLoc"] ?? "",
        otp: json["OTP"] ?? "",
        custSrNo: json["CustSrNo"] ?? "",
        referredByMobileNo: json["ReferredByMobileNo"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "UserName": userName,
        "Password": password,
        "Gender": gender,
        "FirstName": firstName,
        "LastName": lastName,
        "UserEmail": userEmail,
        "MobileNo": mobileNo,
        "Address": address,
        "City": city,
        "Pin": pin,
        "State": state,
        "Country": country,
        "DOB": dob,
        "ProfilePic": profilePic,
        "ProfilePicLoc": profilePicLoc,
        "OTP": otp,
        "CustSrNo": custSrNo,
        "ReferredByMobileNo": referredByMobileNo,
      };
}
