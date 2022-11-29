// To parse this JSON data, do
//
//     final getPendingBillsListModel = getPendingBillsListModelFromJson(jsonString);

import 'dart:convert';

GetPendingBillsListModel getPendingBillsListModelFromJson(String str) =>
    GetPendingBillsListModel.fromJson(json.decode(str));

String getPendingBillsListModelToJson(GetPendingBillsListModel data) =>
    json.encode(data.toJson());

class GetPendingBillsListModel {
  GetPendingBillsListModel({
    required this.getPurchaseSavingSchemeList,
    required this.success,
    required this.errorInfo,
  });

  final List<GetPendingBillData> getPurchaseSavingSchemeList;
  final bool success;
  final ErrorInfo errorInfo;

  factory GetPendingBillsListModel.fromJson(Map<String, dynamic> json) =>
      GetPendingBillsListModel(
        getPurchaseSavingSchemeList: List<GetPendingBillData>.from(
            (json["GetPurchaseSavingSchemeList"] ?? [])
                .map((x) => GetPendingBillData.fromJson(x))),
        success: json["success"] ?? false,
        errorInfo: ErrorInfo.fromJson(json["error_info"] ?? {}),
      );

  Map<String, dynamic> toJson() => {
        "GetPurchaseSavingSchemeList": List<dynamic>.from(
            getPurchaseSavingSchemeList.map((x) => x.toJson())),
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

class GetPendingBillData {
  GetPendingBillData({
    required this.srNo,
    required this.customerSrNo,
    required this.partnerSavingSchemeSrNo,
    // this.folioNo,
    required this.startDate,
    required this.installmentAmount,
    required this.maturityDate,
    required this.finalAmountPayable,
    required this.timeStamp,
    required this.smsReminderDate,
    required this.ourContribution,
    required this.isPending,
    required this.insatllmentDate,
    required this.isSelected,
    required this.invoiceNo,
  });

  final double srNo;
  final double customerSrNo;
  final double partnerSavingSchemeSrNo;
  // final dynamic folioNo;
  final String startDate;
  final double installmentAmount;
  final String maturityDate;
  final double finalAmountPayable;
  final String timeStamp;
  final String smsReminderDate;
  final double ourContribution;
  final bool isPending;
  final String insatllmentDate;
  final String invoiceNo;
  bool isSelected;

  factory GetPendingBillData.fromJson(Map<String, dynamic> json) =>
      GetPendingBillData(
        srNo: json["SrNo"] ?? 0.0,
        customerSrNo: json["CustomerSrNo"] ?? 0,
        partnerSavingSchemeSrNo: json["PartnerSavingSchemeSrNo"] ?? 0,
        // folioNo: json["FolioNo"],
        startDate: json["StartDate"] ?? "",
        installmentAmount: json["InstallmentAmount"] ?? 0,
        maturityDate: json["MaturityDate"] ?? "",
        finalAmountPayable: json["FinalAmountPayable"] ?? 0,
        timeStamp: json["TimeStamp"] ?? "",
        smsReminderDate: json["SmsReminderDate"] ?? "",
        ourContribution: json["OurContribution"] ?? 0,
        isPending: json["IsPending"] ?? false,
        insatllmentDate: json["InsatllmentDate"] ?? "",
        invoiceNo: json["InvoiceNo"] ?? "",
        isSelected: false,
      );

  Map<String, dynamic> toJson() => {
        "SrNo": srNo,
        "CustomerSrNo": customerSrNo,
        "PartnerSavingSchemeSrNo": partnerSavingSchemeSrNo,
        // "FolioNo": folioNo,
        "StartDate": startDate,
        "InstallmentAmount": installmentAmount,
        "MaturityDate": maturityDate,
        "FinalAmountPayable": finalAmountPayable,
        "TimeStamp": timeStamp,
        "SmsReminderDate": smsReminderDate,
        "OurContribution": ourContribution,
        "IsPending": isPending,
        "InsatllmentDate": insatllmentDate,
        "InvoiceNo": invoiceNo,
      };
}
