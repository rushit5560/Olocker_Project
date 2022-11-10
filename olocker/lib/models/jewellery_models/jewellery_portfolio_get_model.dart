// To parse this JSON data, do
//
//     final jewelleryPortFolioGetModel = jewelleryPortFolioGetModelFromJson(jsonString);

import 'dart:convert';

JewelleryPortFolioGetModel jewelleryPortFolioGetModelFromJson(String str) =>
    JewelleryPortFolioGetModel.fromJson(json.decode(str));

String jewelleryPortFolioGetModelToJson(JewelleryPortFolioGetModel data) =>
    json.encode(data.toJson());

class JewelleryPortFolioGetModel {
  JewelleryPortFolioGetModel({
    required this.insuredOrnaments,
    required this.unInsuredOrnaments,
    required this.totalJewelleryPortfolio,
    required this.success,
    required this.errorInfo,
  });

  final List<InsuredOrnament> insuredOrnaments;
  final List<InsuredOrnament> unInsuredOrnaments;
  final List<InsuredOrnament> totalJewelleryPortfolio;
  final bool success;
  final ErrorInfo errorInfo;

  factory JewelleryPortFolioGetModel.fromJson(Map<String, dynamic> json) =>
      JewelleryPortFolioGetModel(
        insuredOrnaments: List<InsuredOrnament>.from(
            (json["InsuredOrnaments"] ?? [])
                .map((x) => InsuredOrnament.fromJson(x))),
        unInsuredOrnaments: List<InsuredOrnament>.from(
            (json["UnInsuredOrnaments"] ?? [])
                .map((x) => InsuredOrnament.fromJson(x))),
        totalJewelleryPortfolio: List<InsuredOrnament>.from(
            (json["TotalJewelleryPortfolio"] ?? [])
                .map((x) => InsuredOrnament.fromJson(x))),
        success: json["success"] ?? false,
        errorInfo: ErrorInfo.fromJson(json["error_info"] ?? {}),
      );

  Map<String, dynamic> toJson() => {
        "InsuredOrnaments":
            List<dynamic>.from(insuredOrnaments.map((x) => x.toJson())),
        "UnInsuredOrnaments":
            List<dynamic>.from(unInsuredOrnaments.map((x) => x.toJson())),
        "TotalJewelleryPortfolio":
            List<dynamic>.from(totalJewelleryPortfolio.map((x) => x.toJson())),
        "success": success,
        "error_info": errorInfo.toJson(),
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

class InsuredOrnament {
  InsuredOrnament({
    required this.noofItems,
    required this.insuredValue,
    required this.marketValue,
    required this.gainLoss,
    required this.insuredInputValue,
    required this.inputValue,
  });

  final int noofItems;
  final double insuredValue;
  final double marketValue;
  final String gainLoss;
  final double insuredInputValue;
  final double inputValue;

  factory InsuredOrnament.fromJson(Map<String, dynamic> json) =>
      InsuredOrnament(
        noofItems: json["NoofItems"] ?? 0,
        insuredValue: json["InsuredValue"] ?? 0.0,
        marketValue: json["MarketValue"] ?? 0.0,
        gainLoss: json["GainLoss"] ?? "",
        insuredInputValue: json["InsuredInputValue"] ?? 0.0,
        inputValue: json["InputValue"] ?? 0.0,
      );

  Map<String, dynamic> toJson() => {
        "NoofItems": noofItems,
        "InsuredValue": insuredValue,
        "MarketValue": marketValue,
        "GainLoss": gainLoss,
        "InsuredInputValue": insuredInputValue,
        "InputValue": inputValue,
      };
}
