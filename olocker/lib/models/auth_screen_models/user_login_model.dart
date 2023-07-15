
import 'dart:convert';

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
  ErrorInfo errorInfo;

  UserLoginData({
    required this.isCustomer,
    required this.deviceId,
    required this.lastPasswordUpdateDate,
    required this.srNo,
    required this.success,
    required this.errorInfo,
  });

  factory UserLoginData.fromJson(Map<String, dynamic> json) => UserLoginData(
        isCustomer: json["isCustomer"] ?? false,
        deviceId: json["deviceId"] ?? "",
        lastPasswordUpdateDate: json["lastPasswordUpdateDate"] ?? "",
        srNo: json["srNo"] ?? 0,
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
}
