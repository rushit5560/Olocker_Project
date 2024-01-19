import 'dart:convert';

import '../error_info_model/error_info_model.dart';

UserLoginModel userLoginModelFromJson(String str) =>
    UserLoginModel.fromJson(json.decode(str));

class UserLoginModel {
  int statusCode;
  UserLoginData data;

  UserLoginModel({
    required this.statusCode,
    required this.data,
  });

  factory UserLoginModel.fromJson(Map<String, dynamic> json) => UserLoginModel(
        statusCode: json["statusCode"] ?? 0,
        data: UserLoginData.fromJson(json["data"] ?? {}),
      );
}

class UserLoginData {
  bool isCustomer;
  String deviceId;
  String lastPasswordUpdateDate;
  int srNo;
  bool success;
  ErrorInfoModel errorInfo;
  String otp;

  UserLoginData({
    required this.isCustomer,
    required this.deviceId,
    required this.lastPasswordUpdateDate,
    required this.srNo,
    required this.success,
    required this.errorInfo,
    required this.otp,
  });

  factory UserLoginData.fromJson(Map<String, dynamic> json) => UserLoginData(
        isCustomer: json["isCustomer"] ?? false,
        deviceId: json["deviceId"] ?? "",
        lastPasswordUpdateDate: json["lastPasswordUpdateDate"] ?? "",
        srNo: json["srNo"] ?? 0,
        success: json["success"] ?? false,
        errorInfo: ErrorInfoModel.fromJson(json["error_info"] ?? {}),
        otp: json["otp"] ?? "",
      );
}
