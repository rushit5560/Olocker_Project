// To parse this JSON data, do
//
//     final getAllMessageModel = getAllMessageModelFromJson(jsonString);

import 'dart:convert';

import '../error_info_model/error_info_model.dart';

GetAllMessageModel getAllMessageModelFromJson(String str) =>
    GetAllMessageModel.fromJson(json.decode(str));

class GetAllMessageModel {
  int statusCode;
  Data data;

  GetAllMessageModel({
    required this.statusCode,
    required this.data,
  });

  factory GetAllMessageModel.fromJson(Map<String, dynamic> json) =>
      GetAllMessageModel(
        statusCode: json["statusCode"],
        data: Data.fromJson(json["data"]),
      );
}

class Data {
  List<GetNotification> getNotification;
  bool success;
  ErrorInfoModel errorInfo;

  Data({
    required this.getNotification,
    required this.success,
    required this.errorInfo,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        getNotification: List<GetNotification>.from(
            json["getNotification"].map((x) => GetNotification.fromJson(x))),
        success: json["success"],
        errorInfo: ErrorInfoModel.fromJson(json["error_info"]),
      );
}

class GetNotification {
  int srNo;
  int partnerSrNo;
  String partnerName;
  int customerId;
  String title;
  String message;
  int sentBy;
  DateTime timestamp;
  bool isRead;
  int messageType;
  int replyMsgId;
  int productId;
  bool isAdminNotification;

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

  factory GetNotification.fromJson(Map<String, dynamic> json) =>
      GetNotification(
        srNo: json["srNo"] ?? 0,
        partnerSrNo: json["partnerSrNo"] ?? 0,
        partnerName: json["partnerName"] ?? "",
        customerId: json["customerId"] ?? 0,
        title: json["title"] ?? "",
        message: json["message"] ?? "",
        sentBy: json["sentBy"] ?? 0,
        timestamp: DateTime.parse(json["timestamp"] ?? ""),
        isRead: json["isRead"] ?? false,
        messageType: json["messageType"] ?? 0,
        replyMsgId: json["replyMsgId"] ?? 0,
        productId: json["productId"] ?? 0,
        isAdminNotification: json["isAdminNotification"] ?? false,
      );
}
