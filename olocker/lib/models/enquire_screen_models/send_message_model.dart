// To parse this JSON data, do
//
//     final sendMessageModel = sendMessageModelFromJson(jsonString);

import 'dart:convert';

SendMessageModel sendMessageModelFromJson(String str) =>
    SendMessageModel.fromJson(json.decode(str));

String sendMessageModelToJson(SendMessageModel data) =>
    json.encode(data.toJson());

class SendMessageModel {
  SendMessageModel({
    required this.msgId,
    required this.threadId,
    required this.success,
    required this.errorInfo,
  });

  final int msgId;
  final int threadId;
  final bool success;
  final ErrorInfo errorInfo;

  factory SendMessageModel.fromJson(Map<String, dynamic> json) =>
      SendMessageModel(
        msgId: json["MsgId"] ?? 0,
        threadId: json["ThreadId"] ?? 0,
        success: json["success"] ?? false,
        errorInfo: ErrorInfo.fromJson(json["error_info"] ?? {}),
      );

  Map<String, dynamic> toJson() => {
        "MsgId": msgId,
        "ThreadId": threadId,
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
