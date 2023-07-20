


import 'dart:convert';

GetTransactionStatusDetailsModel getTransactionStatusDetailsModelFromJson(String str) => GetTransactionStatusDetailsModel.fromJson(json.decode(str));


class GetTransactionStatusDetailsModel {
  int statusCode;
  Data data;

  GetTransactionStatusDetailsModel({
    required this.statusCode,
    required this.data,
  });

  factory GetTransactionStatusDetailsModel.fromJson(Map<String, dynamic> json) => GetTransactionStatusDetailsModel(
    statusCode: json["statusCode"]??0,
    data: Data.fromJson(json["data"]??{}),
  );


}

class Data {
  List<TransactionData> transactions;
  bool success;
  ErrorInfo errorInfo;

  Data({
    required this.transactions,
    required this.success,
    required this.errorInfo,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    transactions: List<TransactionData>.from((json["transactions"] ?? [])
        .map((x) => TransactionData.fromJson(x))??{}),
    success: json["success"]??false,
    errorInfo: ErrorInfo.fromJson(json["error_info"]??{}),
  );


}

class ErrorInfo {
  ErrorInfo({
    required this.errorType,
    required this.extraInfo,
    required this.description,
    required  this.errorData,
  });

  final int errorType;
  final String extraInfo;
  final String description;
  final String errorData;

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


class TransactionData {
  TransactionData({
    required this.srNo,
    required this.customerPurchaseSavingSchemeSrNo,
    required this.transactionUuid,
    required this.transactionDate,
    required this.transactionId,
    required this.transactionStatus,
    required this.timeStamp,
    required this.transactionAmount,
    required this.paymentId,
    required this.invoiceNo,
    required this.billingDate,
    required this.invoicePath,
    required this.isOnlinePayment,
    required this.nextPaymentDate,
  });

  final int srNo;
  final int customerPurchaseSavingSchemeSrNo;
  final String transactionUuid;
  final String transactionDate;
  final String transactionId;
  final String transactionStatus;
  final String timeStamp;
  final String transactionAmount;
  final String paymentId;
  final String invoiceNo;
  final String billingDate;
  final String invoicePath;
  final String isOnlinePayment;
  final String nextPaymentDate;

  factory TransactionData.fromJson(Map<String, dynamic> json) =>
      TransactionData(
        srNo: json["srNo"] ?? 0,
        customerPurchaseSavingSchemeSrNo:
        json["customerPurchaseSavingSchemeSrNo"] ?? 0,
        transactionUuid: json["transactionUUID"] ?? "",
        transactionDate: json["transactionDate"] ?? "",
        transactionId: json["transactionId"] ?? "",
        transactionStatus: json["transactionStatus"] ?? "",
        timeStamp: json["timeStamp"] ?? "",
        transactionAmount: json["transactionAmount"] ?? "",
        paymentId: json["paymentId"] ?? "",
        invoiceNo: json["invoiceNo"] ?? "",
        billingDate: json["billingDate"] ?? "",
        invoicePath: json["invoicePath"] ?? "",
        isOnlinePayment: json["isOnlinePayment"] ?? "",
        nextPaymentDate: json["nextPaymentDate"]??"",
      );

}

