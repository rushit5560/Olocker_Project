import 'dart:convert';

import '../../error_info_model/error_info_model.dart';

GetSavingSchemesListModel getSavingSchemesListModelFromJson(String str) =>
    GetSavingSchemesListModel.fromJson(json.decode(str));

class GetSavingSchemesListModel {
  int statusCode;
  Data data;

  GetSavingSchemesListModel({
    required this.statusCode,
    required this.data,
  });

  factory GetSavingSchemesListModel.fromJson(Map<String, dynamic> json) =>
      GetSavingSchemesListModel(
        statusCode: json["statusCode"] ?? 0,
        data: Data.fromJson(json["data"] ?? {}),
      );
}

class Data {
  List<GetSavingSchemeData> getSavingSchemeList;
  String getSavingScheme;
  String partnerLogo;
  bool success;
  ErrorInfoModel errorInfo;

  Data({
    required this.getSavingSchemeList,
    required this.getSavingScheme,
    required this.partnerLogo,
    required this.success,
    required this.errorInfo,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        getSavingSchemeList: List<GetSavingSchemeData>.from(
            (json["getSavingSchemeList"] ?? [])
                    .map((x) => GetSavingSchemeData.fromJson(x)) ??
                {}),
        getSavingScheme: json["getSavingScheme"] ?? "",
        partnerLogo: json["partnerLogo"] ?? "",
        success: json["success"] ?? false,
        errorInfo: ErrorInfoModel.fromJson(json["error_info"] ?? {}),
      );
}


class GetSavingSchemeData {
  GetSavingSchemeData({
    required this.srNo,
    required this.partnerSrNo,
    required this.minimumMonthlyAmount,
    required this.tenor,
    required this.yourBenefits,
    required this.planEndAmount,
    required this.usersLimit,
    required this.gracePeriod,
    required this.redeemableInCash,
    required this.redeemableOnline,
    required this.termsAndCondition,
    required this.imagePath,
    required this.isActive,
    required this.contributionPercent,
    // this.freeOnOrnamentPercentage,
    required this.schemeName,
    required this.schemeTagLine,
    required this.partnerName,
    required this.partnerLogo,
    required this.ourContribution,
    // this.paymentGatewayApiKey,
    // this.paymentGatewaySecret,
    // this.paymentGatewayType,
    // this.finalAmount,
    required this.mobile,
    required this.hOaddress,
  });

  final int srNo;
  final double partnerSrNo;
  final double minimumMonthlyAmount;
  final double tenor;
  final double yourBenefits;
  final double planEndAmount;
  final double usersLimit;
  final double gracePeriod;
  final bool redeemableInCash;
  final bool redeemableOnline;
  final String termsAndCondition;
  final String imagePath;
  final bool isActive;
  final double contributionPercent;

  // final dynamic freeOnOrnamentPercentage;
  final String schemeName;
  final String schemeTagLine;
  final String partnerName;
  final String partnerLogo;
  final String ourContribution;

  // final dynamic paymentGatewayApiKey;
  // final dynamic paymentGatewaySecret;
  // final dynamic paymentGatewayType;
  // final dynamic finalAmount;
  final String mobile;
  final String hOaddress;

  factory GetSavingSchemeData.fromJson(Map<String, dynamic> json) =>
      GetSavingSchemeData(
        srNo: json["srNo"] ?? 0,
        partnerSrNo: (json["partnerSrNo"] ?? 0).toDouble(),
        minimumMonthlyAmount: (json["minimumMonthlyAmount"] ?? 0).toDouble(),
        tenor: (json["Tenor"] ?? 0).toDouble(),
        yourBenefits: (json["yourBenefits"] ?? 0).toDouble(),
        planEndAmount: (json["planEndAmount"] ?? 0).toDouble(),
        usersLimit: (json["usersLimit"] ?? 0).toDouble(),
        gracePeriod: (json["gracePeriod"] ?? 0).toDouble(),
        redeemableInCash: json["redeemableInCash"] ?? false,
        redeemableOnline: json["redeemableOnline"] ?? false,
        termsAndCondition: json["termsAndCondition"] ?? "",
        imagePath: json["imagePath"] ?? "",
        isActive: json["isActive"] ?? false,
        contributionPercent: (json["contributionPercent"] ?? 0).toDouble(),
        // freeOnOrnamentPercentage: json["freeOnOrnamentPercentage"],
        schemeName: json["schemeName"] ?? "",
        schemeTagLine: json["schemeTagLine"] ?? "",
        partnerName: json["partnerName"] ?? "",
        partnerLogo: json["partnerLogo"] ?? "",
        ourContribution: json["ourContribution"] ?? "",
        // paymentGatewayApiKey: json["paymentGatewayApiKey"],
        // paymentGatewaySecret: json["paymentGatewaySecret"],
        // paymentGatewayType: json["paymentGatewayType"],
        // finalAmount: json["finalAmount"],
        mobile: json["mobile"] ?? "",
        hOaddress: json["hOaddress"] ?? "",
      );
}
