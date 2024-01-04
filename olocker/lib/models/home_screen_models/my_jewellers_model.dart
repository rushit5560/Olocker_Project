import 'dart:convert';

import '../error_info_model/error_info_model.dart';

MyJewellersModel myJewellersModelFromJson(String str) =>
    MyJewellersModel.fromJson(json.decode(str));

class MyJewellersModel {
  int statusCode;
  Data data;

  MyJewellersModel({
    required this.statusCode,
    required this.data,
  });

  factory MyJewellersModel.fromJson(Map<String, dynamic> json) =>
      MyJewellersModel(
        statusCode: json["statusCode"] ?? 0,
        data: Data.fromJson(json["data"] ?? {}),
      );
}

class Data {
  List<JewellerData> jewellerData;
  bool success;
  ErrorInfoModel errorInfo;

  Data({
    required this.jewellerData,
    required this.success,
    required this.errorInfo,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        jewellerData: List<JewellerData>.from((json["addMyJewellerdata"] ?? [])
                .map((x) => JewellerData.fromJson(x)) ??
            {}),
        success: json["success"] ?? false,
        errorInfo: ErrorInfoModel.fromJson(json["error_info"] ?? {}),
      );
}

class JewellerData {
  String customerName;
  String logoFileName;
  String companyName;
  String ownersName;
  String registrationDate;
  String activationDate;
  String paymentMode;
  int partnerSrNo;

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

  factory JewellerData.fromJson(Map<String, dynamic> json) => JewellerData(
        customerName: json["CustomerName"] ?? "",
        logoFileName: json["LogoFileName"] ?? "",
        companyName: json["CompanyName"] ?? "",
        ownersName: json["OwnersName"] ?? "",
        registrationDate: json["RegistrationDate"] ?? "",
        activationDate: json["ActivationDate"] ?? "",
        paymentMode: json["PaymentMode"] ?? "",
        partnerSrNo: json["PartnerSrNo"] ??0,
      );
}
