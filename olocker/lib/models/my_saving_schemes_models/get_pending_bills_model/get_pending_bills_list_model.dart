import 'dart:convert';

import '../../error_info_model/error_info_model.dart';

GetPendingBillsListModel getPendingBillsListModelFromJson(String str) => GetPendingBillsListModel.fromJson(json.decode(str));

String getPendingBillsListModelToJson(GetPendingBillsListModel data) => json.encode(data.toJson());

class GetPendingBillsListModel {
  int statusCode;
  Data data;

  GetPendingBillsListModel({
    required this.statusCode,
    required this.data,
  });

  factory GetPendingBillsListModel.fromJson(Map<String, dynamic> json) => GetPendingBillsListModel(
    statusCode: json["statusCode"] ?? 0,
    data: Data.fromJson(json["data"] ?? {}),
  );

  Map<String, dynamic> toJson() => {
    "statusCode": statusCode,
    // "data": data.toJson(),
  };
}

class Data {
  List<GetPendingBillData> getPurchaseSavingSchemeList;
  bool success;
  ErrorInfoModel errorInfo;

  Data({
    required this.getPurchaseSavingSchemeList,
    required this.success,
    required this.errorInfo,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    getPurchaseSavingSchemeList: List<GetPendingBillData>.from((json["GetPurchaseSavingSchemeList"] ?? []).map((x) => GetPendingBillData.fromJson(x ?? {}))),
    success: json["success"] ?? false,
    errorInfo: ErrorInfoModel.fromJson(json["error_info"] ?? {}),
  );

  // Map<String, dynamic> toJson() => {
    // "getPurchaseSavingSchemeList": List<dynamic>.from(getPurchaseSavingSchemeList.map((x) => x.toJson())),
    // "success": success,
    // "error_info": errorInfo.toJson(),
  // };
}

class GetPendingBillData {
  GetPendingBillData({
    required this.srNo,
    required this.customerSrNo,
    required this.partnerSavingSchemeSrNo,
    // this.folioNo,
    // required this.startDate,
    required this.installmentAmount,
    // required this.maturityDate,
    required this.finalAmountPayable,
    // required this.timeStamp,
    // required this.smsReminderDate,
    required this.ourContribution,
    required this.isPending,
    required this.insatllmentDate,
    required this.isSelected,
    required this.invoiceNo,
  });

  final int srNo;
  final int customerSrNo;
  final int partnerSavingSchemeSrNo;
  // final dynamic folioNo;
  // final String startDate;
  final int installmentAmount;
  // final String maturityDate;
  final int finalAmountPayable;
  // final String timeStamp;
  // final String smsReminderDate;
  final int ourContribution;
  final bool isPending;
  final String insatllmentDate;
  final String invoiceNo;
  bool isSelected;

  factory GetPendingBillData.fromJson(Map<String, dynamic> json) =>
      GetPendingBillData(
        srNo: json["srNo"] ?? 0,
        customerSrNo: json["customerSrNo"] ?? 0,
        partnerSavingSchemeSrNo: json["partnerSavingSchemeSrNo"] ?? 0,
        // folioNo: json["FolioNo"],
        // startDate: json["startDate"] ?? "",
        installmentAmount: json["installmentAmount"] ?? 0,
        // maturityDate: json["maturityDate"] ?? "",
        finalAmountPayable: json["finalAmountPayable"] ?? 0,
        // timeStamp: json["timeStamp"] ?? "",
        // smsReminderDate: json["smsReminderDate"] ?? "",
        ourContribution: json["ourContribution"] ?? 0,
        isPending: json["isPending"] ?? false,
        insatllmentDate: (json["insatllmentDate"] ?? DateTime.now()).toString(),
        invoiceNo: json["invoiceNo"] ?? "",
        isSelected: false,
      );
}
