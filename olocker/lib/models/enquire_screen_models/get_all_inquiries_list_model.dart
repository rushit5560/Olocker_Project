import 'dart:convert';

import '../error_info_model/error_info_model.dart';

GetAllInquiriesListModel getAllInquiriesListModelFromJson(String str) =>
    GetAllInquiriesListModel.fromJson(json.decode(str));

class GetAllInquiriesListModel {
  int statusCode;
  Data data;

  GetAllInquiriesListModel({
    required this.statusCode,
    required this.data,
  });

  factory GetAllInquiriesListModel.fromJson(Map<String, dynamic> json) =>
      GetAllInquiriesListModel(
        statusCode: json["statusCode"] ?? 0,
        data: Data.fromJson(json["data"] ?? {}),
      );
}

class Data {
  List<GetInquiryNotification> getInquiryNotification;
  bool success;
  ErrorInfoModel errorInfo;

  Data({
    required this.getInquiryNotification,
    required this.success,
    required this.errorInfo,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        getInquiryNotification: List<GetInquiryNotification>.from(
            (json["GetInquiryNotification"] ?? [])
                .map((x) => GetInquiryNotification.fromJson(x))),
        success: json["success"] ?? false,
        errorInfo: ErrorInfoModel.fromJson(json["error_info"] ?? {}),
      );
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
}
