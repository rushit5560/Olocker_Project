import 'dart:convert';

import '../../error_info_model/error_info_model.dart';

GetPendingBillsListModel getPendingBillsListModelFromJson(String str) =>
    GetPendingBillsListModel.fromJson(json.decode(str));

class GetPendingBillsListModel {
  int statusCode;
  Data data;

  GetPendingBillsListModel({
    required this.statusCode,
    required this.data,
  });

  factory GetPendingBillsListModel.fromJson(Map<String, dynamic> json) =>
      GetPendingBillsListModel(
        statusCode: json["statusCode"] ?? 0,
        data: Data.fromJson(json["data"] ?? {}),
      );
}

class Data {
  final List<GetPendingBillData> getPurchaseSavingSchemeList;
  bool success;
  ErrorInfoModel errorInfo;

  Data({
    required this.getPurchaseSavingSchemeList,
    required this.success,
    required this.errorInfo,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        getPurchaseSavingSchemeList: List<GetPendingBillData>.from(
            (json["GetPurchaseSavingSchemeList"] ?? [])
                .map((x) => GetPendingBillData.fromJson(x))),
        success: json["success"] ?? false,
        errorInfo: ErrorInfoModel.fromJson(json["error_info"] ?? {}),
      );
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
        srNo: json["srNo"] ?? 0.0,
        customerSrNo: json["customerSrNo"] ?? 0,
        partnerSavingSchemeSrNo: json["partnerSavingSchemeSrNo"] ?? 0,
        // folioNo: json["FolioNo"],
        startDate: json["startDate"] ?? "",
        installmentAmount: json["installmentAmount"] ?? 0,
        maturityDate: json["maturityDate"] ?? "",
        finalAmountPayable: json["finalAmountPayable"] ?? 0,
        timeStamp: json["timeStamp"] ?? "",
        smsReminderDate: json["smsReminderDate"] ?? "",
        ourContribution: json["ourContribution"] ?? 0,
        isPending: json["isPending"] ?? false,
        insatllmentDate: json["insatllmentDate"] ?? "",
        invoiceNo: json["invoiceNo"] ?? "",
        isSelected: false,
      );
}
