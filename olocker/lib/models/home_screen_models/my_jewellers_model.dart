import 'dart:convert';

MyJewellersModel myJewellersModelFromJson(String str) => MyJewellersModel.fromJson(json.decode(str));

String myJewellersModelToJson(MyJewellersModel data) => json.encode(data.toJson());

class MyJewellersModel {
  MyJewellersModel({
    required this.addMyJewellerdata,
    required this.success,
    required this.errorInfo,
  });

  List<JewellerData> addMyJewellerdata;
  bool success;
  ErrorInfo errorInfo;

  factory MyJewellersModel.fromJson(Map<String, dynamic> json) => MyJewellersModel(
    addMyJewellerdata: List<JewellerData>.from((json["AddMyJewellerdata"]! ?? []).map((x) => JewellerData.fromJson(x ?? {}))),
    success: json["success"] ?? false,
    errorInfo: ErrorInfo.fromJson(json["error_info"] ?? {}),
  );

  Map<String, dynamic> toJson() => {
    "AddMyJewellerdata": List<dynamic>.from(addMyJewellerdata.map((x) => x.toJson())),
    "success": success,
    "error_info": errorInfo.toJson(),
  };
}

class JewellerData {
  JewellerData({
    required this.customerName,
    required this.logoFileName,
    required this.companyName,
    required this.ownersName,
    required this.registrationDate,
    required this.activationDate,
    required this.paymentMode,
    required this.partnerSrNo,
  });

  String customerName;
  String logoFileName;
  String companyName;
  String ownersName;
  String registrationDate;
  String activationDate;
  String paymentMode;
  int partnerSrNo;

  factory JewellerData.fromJson(Map<String, dynamic> json) => JewellerData(
    customerName: json["CustomerName"] ?? "",
    logoFileName: json["LogoFileName"] ?? "",
    companyName: json["CompanyName"] ?? "",
    ownersName: json["OwnersName"] ?? "",
    registrationDate: json["RegistrationDate"] ?? "",
    activationDate: json["ActivationDate"] ?? "",
    paymentMode: json["PaymentMode"] ?? "",
    partnerSrNo: json["PartnerSrNo"] ?? 0,
  );

  Map<String, dynamic> toJson() => {
    "CustomerName": customerName,
    "LogoFileName": logoFileName,
    "CompanyName": companyName,
    "OwnersName": ownersName,
    "RegistrationDate": registrationDate,
    "ActivationDate": activationDate,
    "PaymentMode": paymentMode,
    "PartnerSrNo": partnerSrNo,
  };
}

class ErrorInfo {
  ErrorInfo({
    required this.errorType,
    required this.extraInfo,
    required this.description,
    required this.errorData,
  });

  int errorType;
  String extraInfo;
  String description;
  String errorData;

  factory ErrorInfo.fromJson(Map<String, dynamic> json) => ErrorInfo(
    errorType: json["error_type"] ?? 0,
    extraInfo: json["extra_info"] ?? "",
    description: json["description"] ?? "",
    errorData: json["error_data"].toString(),
  );

  Map<String, dynamic> toJson() => {
    "error_type": errorType,
    "extra_info": extraInfo,
    "description": description,
    "error_data": errorData,
  };
}
