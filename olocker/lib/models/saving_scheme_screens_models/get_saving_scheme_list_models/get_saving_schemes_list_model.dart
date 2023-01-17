// To parse this JSON data, do
//
//     final getSavingSchemesListModel = getSavingSchemesListModelFromJson(jsonString);

import 'dart:convert';

GetSavingSchemesListModel getSavingSchemesListModelFromJson(String str) =>
    GetSavingSchemesListModel.fromJson(json.decode(str));

String getSavingSchemesListModelToJson(GetSavingSchemesListModel data) =>
    json.encode(data.toJson());

class GetSavingSchemesListModel {
  GetSavingSchemesListModel({
    required this.getSavingSchemeList,
    // this.getSavingScheme,
    required this.success,
    required this.errorInfo,
  });

  final List<GetSavingSchemeData> getSavingSchemeList;
  // final dynamic getSavingScheme;
  final bool success;
  final ErrorInfo errorInfo;

  factory GetSavingSchemesListModel.fromJson(Map<String, dynamic> json) =>
      GetSavingSchemesListModel(
        getSavingSchemeList: List<GetSavingSchemeData>.from(
            (json["GetSavingSchemeList"] ?? [])
                .map((x) => GetSavingSchemeData.fromJson(x))),
        // getSavingScheme: json["GetSavingScheme"],
        success: json["success"] ?? false,
        errorInfo: ErrorInfo.fromJson(json["error_info"] ?? {}),
      );

  Map<String, dynamic> toJson() => {
        "GetSavingSchemeList":
            List<dynamic>.from(getSavingSchemeList.map((x) => x.toJson())),
        // "GetSavingScheme": getSavingScheme,
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

class GetSavingSchemeData {
  GetSavingSchemeData({
    required this.srNo,
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
  final dynamic partnerName;
  final dynamic partnerLogo;
  final String ourContribution;
  // final dynamic paymentGatewayApiKey;
  // final dynamic paymentGatewaySecret;
  // final dynamic paymentGatewayType;
  // final dynamic finalAmount;
  final double mobile;
  final String hOaddress;

  factory GetSavingSchemeData.fromJson(Map<String, dynamic> json) =>
      GetSavingSchemeData(
        srNo: json["SrNo"] ?? 0,
        minimumMonthlyAmount: (json["MinimumMonthlyAmount"] ?? 0).toDouble(),
        tenor: (json["Tenor"] ?? 0).toDouble(),
        yourBenefits: (json["YourBenefits"] ?? 0).toDouble(),
        planEndAmount: (json["PlanEndAmount"] ?? 0).toDouble(),
        usersLimit: (json["UsersLimit"] ?? 0).toDouble(),
        gracePeriod: (json["GracePeriod"] ?? 0).toDouble(),
        redeemableInCash: json["RedeemableInCash"] ?? false,
        redeemableOnline: json["RedeemableOnline"] ?? false,
        termsAndCondition: json["TermsAndCondition"] ?? "",
        imagePath: json["ImagePath"] ?? "",
        isActive: json["IsActive"] ?? false,
        contributionPercent: (json["ContributionPercent"] ?? 0).toDouble(),
        // freeOnOrnamentPercentage: json["FreeOnOrnamentPercentage"],
        schemeName: json["SchemeName"] ?? "",
        schemeTagLine: json["SchemeTagLine"] ?? "",
        partnerName: json["PartnerName"] ?? "",
        partnerLogo: json["PartnerLogo"] ?? "",
        ourContribution: json["OurContribution"] ?? "",
        // paymentGatewayApiKey: json["PaymentGatewayApiKey"],
        // paymentGatewaySecret: json["PaymentGatewaySecret"],
        // paymentGatewayType: json["PaymentGatewayType"],
        // finalAmount: json["FinalAmount"],
        mobile: json["Mobile"] ?? 0.0,
        hOaddress: json["HOaddress"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "SrNo": srNo,
        "MinimumMonthlyAmount": minimumMonthlyAmount,
        "Tenor": tenor,
        "YourBenefits": yourBenefits,
        "PlanEndAmount": planEndAmount,
        "UsersLimit": usersLimit,
        "GracePeriod": gracePeriod,
        "RedeemableInCash": redeemableInCash,
        "RedeemableOnline": redeemableOnline,
        "TermsAndCondition": termsAndCondition,
        "ImagePath": imagePath,
        "IsActive": isActive,
        "ContributionPercent": contributionPercent,
        // "FreeOnOrnamentPercentage": freeOnOrnamentPercentage,
        "SchemeName": schemeName,
        "SchemeTagLine": schemeTagLine,
        "PartnerName": partnerName,
        "PartnerLogo": partnerLogo,
        "OurContribution": ourContribution,
        // "PaymentGatewayApiKey": paymentGatewayApiKey,
        // "PaymentGatewaySecret": paymentGatewaySecret,
        // "PaymentGatewayType": paymentGatewayType,
        // "FinalAmount": finalAmount,
        "Mobile": mobile,
        "HOaddress": hOaddress,
      };
}
