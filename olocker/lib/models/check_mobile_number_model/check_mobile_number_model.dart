import 'dart:convert';

import '../error_info_model/error_info_model.dart';

CheckMobileNumberModel checkMobileNumberModelFromJson(String str) =>
    CheckMobileNumberModel.fromJson(json.decode(str));

class CheckMobileNumberModel {
  int statusCode;
  CheckMobileNumberData data;

  CheckMobileNumberModel({
    required this.statusCode,
    required this.data,
  });

  factory CheckMobileNumberModel.fromJson(Map<String, dynamic> json) =>
      CheckMobileNumberModel(
        statusCode: json["statusCode"] ?? 0,
        data: CheckMobileNumberData.fromJson(json["data"] ?? {}),
      );
}

class CheckMobileNumberData {
  UserMobile userMobile;
  bool success;
  ErrorInfoModel errorInfo;

  CheckMobileNumberData({
    required this.userMobile,
    required this.success,
    required this.errorInfo,
  });

  factory CheckMobileNumberData.fromJson(Map<String, dynamic> json) =>
      CheckMobileNumberData(
        userMobile: UserMobile.fromJson(json["UserMobile"] ?? {}),
        success: json["success"] ?? false,
        errorInfo: ErrorInfoModel.fromJson(json["error_info"] ?? {}),
      );
}

class UserMobile {
  String mobileNo;
  String customerId;
  bool isExist;

  UserMobile({
    required this.mobileNo,
    required this.customerId,
    required this.isExist,
  });

  factory UserMobile.fromJson(Map<String, dynamic> json) => UserMobile(
        mobileNo: json["MobileNo"] ?? "",
        customerId: json["CustomerId"] ?? "",
        isExist: json["IsExist"] ?? false,
      );
}
