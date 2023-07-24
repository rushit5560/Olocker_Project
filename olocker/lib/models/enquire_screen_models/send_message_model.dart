// // To parse this JSON data, do
// //
// //     final sendMessageModel = sendMessageModelFromJson(jsonString);
//
// import 'dart:convert';
//
// SendMessageModel sendMessageModelFromJson(String str) =>
//     SendMessageModel.fromJson(json.decode(str));
//
// String sendMessageModelToJson(SendMessageModel data) =>
//     json.encode(data.toJson());
//
// class SendMessageModel {
//   SendMessageModel({
//     required this.msgId,
//     required this.threadId,
//     required this.success,
//     required this.errorInfo,
//   });
//
//   final int msgId;
//   final int threadId;
//   final bool success;
//   final ErrorInfo errorInfo;
//
//   factory SendMessageModel.fromJson(Map<String, dynamic> json) =>
//       SendMessageModel(
//         msgId: json["MsgId"] ?? 0,
//         threadId: json["ThreadId"] ?? 0,
//         success: json["success"] ?? false,
//         errorInfo: ErrorInfo.fromJson(json["error_info"] ?? {}),
//       );
//
//   Map<String, dynamic> toJson() => {
//         "MsgId": msgId,
//         "ThreadId": threadId,
//         "success": success,
//         "error_info": errorInfo.toJson(),
//       };
// }
//

// To parse this JSON data, do
//
//     final sendMessageModel = sendMessageModelFromJson(jsonString);

import 'dart:convert';

import '../error_info_model/error_info_model.dart';

SendMessageModel sendMessageModelFromJson(String str) =>
    SendMessageModel.fromJson(json.decode(str));

class SendMessageModel {
  int statusCode;
  Data data;

  SendMessageModel({
    required this.statusCode,
    required this.data,
  });

  factory SendMessageModel.fromJson(Map<String, dynamic> json) =>
      SendMessageModel(
        statusCode: json["statusCode"] ?? 0,
        data: Data.fromJson(json["data"] ?? {}),
      );
}

class Data {
  int replyMsgId;
  int srNo;
  String message;
  bool success;
  ErrorInfoModel errorInfo;

  Data({
    required this.replyMsgId,
    required this.srNo,
    required this.message,
    required this.success,
    required this.errorInfo,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        replyMsgId: json["replyMsgId"] ?? 0,
        srNo: json["srNo"] ?? 0,
        message: json["message"] ?? "",
        success: json["success"] ?? false,
        errorInfo: ErrorInfoModel.fromJson(json["error_info"] ?? {}),
      );
}
