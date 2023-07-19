// To parse this JSON data, do
//
//     final checkMobileNumberModel = checkMobileNumberModelFromJson(jsonString);

// import 'dart:convert';
//
// CheckMobileNumberModel checkMobileNumberModelFromJson(String str) =>
//     CheckMobileNumberModel.fromJson(json.decode(str));
//
// class CheckMobileNumberModel {
//   int statusCode;
//   CheckMobileNumberData data;
//
//   CheckMobileNumberModel({
//     required this.statusCode,
//     required this.data,
//   });
//
//   factory CheckMobileNumberModel.fromJson(Map<String, dynamic> json) =>
//       CheckMobileNumberModel(
//         statusCode: json["statusCode"] ?? 0,
//         data: CheckMobileNumberData.fromJson(json["data"] ?? {}),
//       );
// }
//
// class CheckMobileNumberData {
//   String mobileNo;
//   String customerId;
//   bool isExist;
//
//   CheckMobileNumberData({
//     required this.mobileNo,
//     required this.customerId,
//     required this.isExist,
//   });
//
//   factory CheckMobileNumberData.fromJson(Map<String, dynamic> json) =>
//       CheckMobileNumberData(
//         mobileNo: json["mobileNo"] ?? "",
//         customerId: json["customerId"] ?? "",
//         isExist: json["isExist"] ?? false,
//       );
// }
//

// To parse this JSON data, do
//
//     final checkMobileNumberModel = checkMobileNumberModelFromJson(jsonString);

import 'dart:convert';

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
  ErrorInfo errorInfo;

  CheckMobileNumberData({
    required this.userMobile,
    required this.success,
    required this.errorInfo,
  });

  factory CheckMobileNumberData.fromJson(Map<String, dynamic> json) =>
      CheckMobileNumberData(
        userMobile: UserMobile.fromJson(json["userMobile"] ?? {}),
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
        errorData: json["error_data"] ?? "",
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
        mobileNo: json["mobileNo"] ?? "",
        customerId: json["customerId"] ?? "",
        isExist: json["isExist"] ?? false,
      );
}
