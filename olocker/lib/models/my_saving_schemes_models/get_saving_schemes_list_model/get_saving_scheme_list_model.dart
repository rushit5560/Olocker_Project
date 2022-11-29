// To parse this JSON data, do
//
//     final getCustomerSchemeslistModel = getCustomerSchemeslistModelFromJson(jsonString);

import 'dart:convert';

GetCustomerSchemeslistModel getCustomerSchemeslistModelFromJson(String str) =>
    GetCustomerSchemeslistModel.fromJson(json.decode(str));

String getCustomerSchemeslistModelToJson(GetCustomerSchemeslistModel data) =>
    json.encode(data.toJson());

class GetCustomerSchemeslistModel {
  GetCustomerSchemeslistModel({
    required this.getCustomerPurchaseSavingSchemeList,
    required this.success,
    required this.errorInfo,
  });

  final List<GetCustomerPurchaseSavingSchemeData>
      getCustomerPurchaseSavingSchemeList;
  final bool success;
  final ErrorInfo errorInfo;

  factory GetCustomerSchemeslistModel.fromJson(Map<String, dynamic> json) =>
      GetCustomerSchemeslistModel(
        getCustomerPurchaseSavingSchemeList:
            List<GetCustomerPurchaseSavingSchemeData>.from(
                (json["GetCustomerPurchaseSavingSchemeList"] ?? []).map(
                    (x) => GetCustomerPurchaseSavingSchemeData.fromJson(x))),
        success: json["success"] ?? false,
        errorInfo: ErrorInfo.fromJson(json["error_info"] ?? {}),
      );

  Map<String, dynamic> toJson() => {
        "GetCustomerPurchaseSavingSchemeList": List<dynamic>.from(
            getCustomerPurchaseSavingSchemeList.map((x) => x.toJson())),
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

class GetCustomerPurchaseSavingSchemeData {
  GetCustomerPurchaseSavingSchemeData({
    required this.folioNo,
    required this.partnerName,
    required this.startDate,
    required this.maturityDate,
    required this.nextPaymentDate,
    required this.maturityAmount,
    required this.totalPaid,
    required this.monthlyAmount,
    required this.status,
    required this.savingSchemeSrNo,
    required this.partnerSavingSchemeSrNo,
    // this.imageName,
    // this.imageLocation,
    // this.imagePath,
  });

  final String folioNo;
  final String partnerName;
  final DateTime startDate;
  final DateTime maturityDate;
  final DateTime nextPaymentDate;
  final double maturityAmount;
  final double totalPaid;
  final double monthlyAmount;
  final String status;
  final int savingSchemeSrNo;
  final int partnerSavingSchemeSrNo;
  // final dynamic imageName;
  // final dynamic imageLocation;
  // final dynamic imagePath;

  factory GetCustomerPurchaseSavingSchemeData.fromJson(
          Map<String, dynamic> json) =>
      GetCustomerPurchaseSavingSchemeData(
        folioNo: json["FolioNo"] ?? "",
        partnerName: json["PartnerName"] ?? "",
        startDate: DateTime.parse(json["StartDate"] ?? ""),
        maturityDate: DateTime.parse(json["MaturityDate"] ?? ""),
        nextPaymentDate: DateTime.parse(json["NextPaymentDate"] ?? ""),
        maturityAmount: json["MaturityAmount"] ?? 0.0,
        totalPaid: json["TotalPaid"] ?? 0.0,
        monthlyAmount: json["MonthlyAmount"] ?? 0.0,
        status: json["Status"] ?? "",
        savingSchemeSrNo: json["SavingSchemeSrNo"] ?? 0,
        partnerSavingSchemeSrNo: json["PartnerSavingSchemeSrNo"] ?? 0,
        // imageName: json["ImageName"],
        // imageLocation: json["ImageLocation"],
        // imagePath: json["ImagePath"],
      );

  Map<String, dynamic> toJson() => {
        "FolioNo": folioNo,
        "PartnerName": partnerName,
        "StartDate": startDate.toIso8601String(),
        "MaturityDate": maturityDate.toIso8601String(),
        "NextPaymentDate": nextPaymentDate.toIso8601String(),
        "MaturityAmount": maturityAmount,
        "TotalPaid": totalPaid,
        "MonthlyAmount": monthlyAmount,
        "Status": status,
        "SavingSchemeSrNo": savingSchemeSrNo,
        "PartnerSavingSchemeSrNo": partnerSavingSchemeSrNo,
        // "ImageName": imageName,
        // "ImageLocation": imageLocation,
        // "ImagePath": imagePath,
      };
}
