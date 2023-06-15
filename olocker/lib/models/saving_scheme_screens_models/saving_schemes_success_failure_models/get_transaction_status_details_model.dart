// To parse this JSON data, do
//
//     final getTransactionStatusDetailsModel = getTransactionStatusDetailsModelFromJson(jsonString);

import 'dart:convert';

GetTransactionStatusDetailsModel getTransactionStatusDetailsModelFromJson(
        String str) =>
    GetTransactionStatusDetailsModel.fromJson(json.decode(str));

String getTransactionStatusDetailsModelToJson(
        GetTransactionStatusDetailsModel data) =>
    json.encode(data.toJson());

class GetTransactionStatusDetailsModel {
  GetTransactionStatusDetailsModel({
    required this.transactions,
    required this.success,
    required this.errorInfo,
  });

  final List<TransactionData> transactions;
  final bool success;
  final ErrorInfo errorInfo;

  factory GetTransactionStatusDetailsModel.fromJson(
          Map<String, dynamic> json) =>
      GetTransactionStatusDetailsModel(
        transactions: List<TransactionData>.from((json["transactions"] ?? [])
            .map((x) => TransactionData.fromJson(x))),
        success: json["success"] ?? false,
        errorInfo: ErrorInfo.fromJson(json["error_info"] ?? {}),
      );

  Map<String, dynamic> toJson() => {
        "transactions": List<dynamic>.from(transactions.map((x) => x.toJson())),
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
        srNo: json["SrNo"] ?? 0,
        customerPurchaseSavingSchemeSrNo:
            json["CustomerPurchaseSavingSchemeSrNo"] ?? 0,
        transactionUuid: json["TransactionUUID"] ?? "",
        transactionDate: json["TransactionDate"] ?? "",
        transactionId: json["TransactionId"] ?? "",
        transactionStatus: json["TransactionStatus"] ?? "",
        timeStamp: json["TimeStamp"] ?? "",
        transactionAmount: json["TransactionAmount"] ?? "",
        paymentId: json["PaymentId"] ?? "",
        invoiceNo: json["InvoiceNo"] ?? "",
        billingDate: json["BillingDate"] ?? "",
        invoicePath: json["InvoicePath"] ?? "",
        isOnlinePayment: json["IsOnlinePayment"] ?? "",
        nextPaymentDate: json["NextPaymentDate"]??"",
      );

  Map<String, dynamic> toJson() => {
        "SrNo": srNo,
        "CustomerPurchaseSavingSchemeSrNo": customerPurchaseSavingSchemeSrNo,
        "TransactionUUID": transactionUuid,
        "TransactionDate": transactionDate,
        "TransactionId": transactionId,
        "TransactionStatus": transactionStatus,
        "TimeStamp": timeStamp,
        "TransactionAmount": transactionAmount,
        "PaymentId": paymentId,
        "InvoiceNo": invoiceNo,
        "BillingDate": billingDate,
        "InvoicePath": invoicePath,
        "IsOnlinePayment": isOnlinePayment,
        "NextPaymentDate": nextPaymentDate,
      };
}
