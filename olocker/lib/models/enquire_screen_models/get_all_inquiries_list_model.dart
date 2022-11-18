// To parse this JSON data, do
//
//     final getAllInquiriesListModel = getAllInquiriesListModelFromJson(jsonString);

import 'dart:convert';

GetAllInquiriesListModel getAllInquiriesListModelFromJson(String str) =>
    GetAllInquiriesListModel.fromJson(json.decode(str));

String getAllInquiriesListModelToJson(GetAllInquiriesListModel data) =>
    json.encode(data.toJson());

class GetAllInquiriesListModel {
  GetAllInquiriesListModel({
    required this.getInquiryNotification,
    required this.success,
    required this.errorInfo,
  });

  final List<GetInquiryNotification> getInquiryNotification;
  final bool success;
  final ErrorInfo errorInfo;

  factory GetAllInquiriesListModel.fromJson(Map<String, dynamic> json) =>
      GetAllInquiriesListModel(
        getInquiryNotification: List<GetInquiryNotification>.from(
            (json["GetInquiryNotification"] ?? [])
                .map((x) => GetInquiryNotification.fromJson(x))),
        success: json["success"] ?? false,
        errorInfo: ErrorInfo.fromJson(json["error_info"] ?? {}),
      );

  Map<String, dynamic> toJson() => {
        "GetInquiryNotification":
            List<dynamic>.from(getInquiryNotification.map((x) => x.toJson())),
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

class GetInquiryNotification {
  GetInquiryNotification({
    required this.srNo,
    required this.partnerSrNo,
    required this.customerId,
    required this.title,
    required this.message,
    required this.sentBy,
    required this.timestamp,
    required this.isRead,
    required this.messageType,
    required this.replyMsgId,
    required this.productId,
    required this.itemName,
    required this.itemDesc,
    required this.productsPrice,
    required this.imgeUrl,
    required this.itemType,
  });

  final int srNo;
  final int partnerSrNo;
  final int customerId;
  final String title;
  final String message;
  final int sentBy;
  final DateTime timestamp;
  final bool isRead;
  final int messageType;
  final int replyMsgId;
  final int productId;
  final String itemName;
  final String itemDesc;
  final double productsPrice;
  final String imgeUrl;
  final String itemType;

  factory GetInquiryNotification.fromJson(Map<String, dynamic> json) =>
      GetInquiryNotification(
        srNo: json["SrNo"] ?? 0,
        partnerSrNo: json["PartnerSrNo"] ?? 0,
        customerId: json["CustomerId"] ?? 0,
        title: json["Title"] ?? "",
        message: json["Message"] ?? "",
        sentBy: json["SentBy"] ?? 0,
        timestamp: DateTime.parse(json["Timestamp"] ?? ""),
        isRead: json["IsRead"] ?? false,
        messageType: json["MessageType"] ?? 0,
        replyMsgId: json["ReplyMsgId"] ?? 0,
        productId: json["ProductId"] ?? 0,
        itemName: json["ItemName"] ?? "",
        itemDesc: json["ItemDesc"] ?? "",
        productsPrice: json["ProductsPrice"] ?? 0.0,
        imgeUrl: json["ImgeUrl"] ?? "",
        itemType: json["ItemType"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "SrNo": srNo,
        "PartnerSrNo": partnerSrNo,
        "CustomerId": customerId,
        "Title": title,
        "Message": message,
        "SentBy": sentBy,
        "Timestamp": timestamp.toIso8601String(),
        "IsRead": isRead,
        "MessageType": messageType,
        "ReplyMsgId": replyMsgId,
        "ProductId": productId,
        "ItemName": itemName,
        "ItemDesc": itemDesc,
        "ProductsPrice": productsPrice,
        "ImgeUrl": imgeUrl,
        "ItemType": itemType,
      };
}
