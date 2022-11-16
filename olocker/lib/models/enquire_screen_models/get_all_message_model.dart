// To parse this JSON data, do
//
//     final getAllMessageModel = getAllMessageModelFromJson(jsonString);

import 'dart:convert';

GetAllMessageModel getAllMessageModelFromJson(String str) =>
    GetAllMessageModel.fromJson(json.decode(str));

String getAllMessageModelToJson(GetAllMessageModel data) =>
    json.encode(data.toJson());

class GetAllMessageModel {
  GetAllMessageModel({
    required this.getNotification,
    required this.success,
    required this.errorInfo,
  });

  final List<GetNotification> getNotification;
  final bool success;
  final ErrorInfo errorInfo;

  factory GetAllMessageModel.fromJson(Map<String, dynamic> json) =>
      GetAllMessageModel(
        getNotification: List<GetNotification>.from(
            (json["GetNotification"] ?? [])
                .map((x) => GetNotification.fromJson(x))),
        success: json["success"] ?? false,
        errorInfo: ErrorInfo.fromJson(json["error_info"] ?? {}),
      );

  Map<String, dynamic> toJson() => {
        "GetNotification":
            List<dynamic>.from(getNotification.map((x) => x.toJson())),
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

class GetNotification {
  GetNotification({
    required this.srNo,
    required this.partnerSrNo,
    required this.partnerName,
    required this.customerId,
    required this.title,
    required this.message,
    required this.sentBy,
    required this.timestamp,
    required this.isRead,
    required this.messageType,
    required this.replyMsgId,
    required this.productId,
    required this.isAdminNotification,
  });

  final int srNo;
  final int partnerSrNo;
  final String partnerName;
  final int customerId;
  final String title;
  final String message;
  final int sentBy;
  final DateTime timestamp;
  final bool isRead;
  final int messageType;
  final int replyMsgId;
  final int productId;
  final bool isAdminNotification;

  factory GetNotification.fromJson(Map<String, dynamic> json) =>
      GetNotification(
        srNo: json["SrNo"] ?? 0,
        partnerSrNo: json["PartnerSrNo"] ?? 0,
        partnerName: json["PartnerName"] ?? "",
        customerId: json["CustomerId"] ?? 0,
        title: json["Title"] ?? "",
        message: json["Message"] ?? "",
        sentBy: json["SentBy"] ?? 0,
        timestamp: DateTime.parse(json["Timestamp"] ?? ""),
        isRead: json["IsRead"] ?? false,
        messageType: json["MessageType"] ?? 0,
        replyMsgId: json["ReplyMsgId"] ?? 0,
        productId: json["ProductId"] ?? 0,
        isAdminNotification: json["IsAdminNotification"] ?? false,
      );

  Map<String, dynamic> toJson() => {
        "SrNo": srNo,
        "PartnerSrNo": partnerSrNo,
        "PartnerName": partnerName,
        "CustomerId": customerId,
        "Title": title,
        "Message": message,
        "SentBy": sentBy,
        "Timestamp": timestamp.toIso8601String(),
        "IsRead": isRead,
        "MessageType": messageType,
        "ReplyMsgId": replyMsgId,
        "ProductId": productId,
        "IsAdminNotification": isAdminNotification,
      };
}
