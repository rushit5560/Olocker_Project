// // To parse this JSON data, do
// //
// //     final getOrnamentRecordingsModel = getOrnamentRecordingsModelFromJson(jsonString);
//
// import 'dart:convert';
//
// GetOrnamentRecordingsModel getOrnamentRecordingsModelFromJson(String str) =>
//     GetOrnamentRecordingsModel.fromJson(json.decode(str));
//
// String getOrnamentRecordingsModelToJson(GetOrnamentRecordingsModel data) =>
//     json.encode(data.toJson());
//
// class GetOrnamentRecordingsModel {
//   GetOrnamentRecordingsModel({
//     required this.ornamentHistoryDetails,
//     required this.trackingDetails,
//     required this.success,
//     required this.errorInfo,
//   });
//
//   final List<OrnamentHistoryDetail> ornamentHistoryDetails;
//   final List<TrackingDetail> trackingDetails;
//   final bool success;
//   final ErrorInfo errorInfo;
//
//   factory GetOrnamentRecordingsModel.fromJson(Map<String, dynamic> json) =>
//       GetOrnamentRecordingsModel(
//         ornamentHistoryDetails: List<OrnamentHistoryDetail>.from(
//             (json["OrnamentHistoryDetails"] ?? [])
//                 .map((x) => OrnamentHistoryDetail.fromJson(x))),
//         trackingDetails: List<TrackingDetail>.from(
//             (json["TrackingDetails"] ?? [])
//                 .map((x) => TrackingDetail.fromJson(x))),
//         success: json["success"] ?? false,
//         errorInfo: ErrorInfo.fromJson((json["error_info"] ?? {})),
//       );
//
//   Map<String, dynamic> toJson() => {
//         "OrnamentHistoryDetails":
//             List<dynamic>.from(ornamentHistoryDetails.map((x) => x.toJson())),
//         "TrackingDetails":
//             List<dynamic>.from(trackingDetails.map((x) => x.toJson())),
//         "success": success,
//         "error_info": errorInfo.toJson(),
//       };
// }
//
// class ErrorInfo {
//   ErrorInfo({
//     required this.errorType,
//     required this.extraInfo,
//     required this.description,
//     this.errorData,
//   });
//
//   final int errorType;
//   final String extraInfo;
//   final String description;
//   final dynamic errorData;
//
//   factory ErrorInfo.fromJson(Map<String, dynamic> json) => ErrorInfo(
//         errorType: json["error_type"] ?? 0,
//         extraInfo: json["extra_info"] ?? "",
//         description: json["description"] ?? "",
//         errorData: json["error_data"] ?? "",
//       );
//
//   Map<String, dynamic> toJson() => {
//         "error_type": errorType,
//         "extra_info": extraInfo,
//         "description": description,
//         "error_data": errorData,
//       };
// }
//
// class OrnamentHistoryDetail {
//   OrnamentHistoryDetail({
//     required this.srNo,
//     required this.custOraSrNo,
//     required this.custSrNo,
//     required this.activity,
//     required this.details,
//     required this.notes,
//     required this.ornamentLocation,
//     required this.date,
//   });
//
//   final int srNo;
//   final int custOraSrNo;
//   final int custSrNo;
//   final String activity;
//   final String details;
//   final String notes;
//   final String ornamentLocation;
//   final String date;
//
//   factory OrnamentHistoryDetail.fromJson(Map<String, dynamic> json) =>
//       OrnamentHistoryDetail(
//         srNo: json["SrNo"] ?? 0,
//         custOraSrNo: json["CustOraSrNo"] ?? 0,
//         custSrNo: json["CustSrNo"] ?? 0,
//         activity: json["Activity"] ?? "",
//         details: json["Details"] ?? "",
//         notes: json["Notes"] ?? "",
//         ornamentLocation: json["OrnamentLocation"] ?? "",
//         date: json["Date"] ?? "",
//       );
//
//   Map<String, dynamic> toJson() => {
//         "SrNo": srNo,
//         "CustOraSrNo": custOraSrNo,
//         "CustSrNo": custSrNo,
//         "Activity": activity,
//         "Details": details,
//         "Notes": notes,
//         "OrnamentLocation": ornamentLocation,
//         "Date": date,
//       };
// }
//
// class TrackingDetail {
//   TrackingDetail({
//     required this.userOraSrNo,
//     required this.oid,
//     required this.itemName,
//     required this.grossWt,
//   });
//
//   final int userOraSrNo;
//   final String oid;
//   final String itemName;
//   final String grossWt;
//
//   factory TrackingDetail.fromJson(Map<String, dynamic> json) => TrackingDetail(
//         userOraSrNo: json["UserOraSrNo"] ?? 0,
//         oid: json["OID"] ?? "",
//         itemName: json["ItemName"] ?? "",
//         grossWt: json["GrossWt"] ?? "",
//       );
//
//   Map<String, dynamic> toJson() => {
//         "UserOraSrNo": userOraSrNo,
//         "OID": oid,
//         "ItemName": itemName,
//         "GrossWt": grossWt,
//       };
// }
//
//
//
//
// To parse this JSON data, do
//
//     final getOrnamentRecordingsModel = getOrnamentRecordingsModelFromJson(jsonString);

import 'dart:convert';

import '../error_info_model/error_info_model.dart';

GetOrnamentRecordingsModel getOrnamentRecordingsModelFromJson(String str) =>
    GetOrnamentRecordingsModel.fromJson(json.decode(str));

class GetOrnamentRecordingsModel {
  int statusCode;
  Data data;

  GetOrnamentRecordingsModel({
    required this.statusCode,
    required this.data,
  });

  factory GetOrnamentRecordingsModel.fromJson(Map<String, dynamic> json) =>
      GetOrnamentRecordingsModel(
        statusCode: json["statusCode"] ?? 0,
        data: Data.fromJson(json["data"] ?? {}),
      );
}

class Data {
  List<OrnamentHistoryDetail> ornamentHistoryDetails;
  List<TrackingDetail> trackingDetails;
  bool success;
  ErrorInfoModel errorInfo;

  Data({
    required this.ornamentHistoryDetails,
    required this.trackingDetails,
    required this.success,
    required this.errorInfo,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        ornamentHistoryDetails: List<OrnamentHistoryDetail>.from(
            (json["ornamentHistoryDetails"] ?? [])
                .map((x) => OrnamentHistoryDetail.fromJson(x))),
        trackingDetails: List<TrackingDetail>.from(
            (json["trackingDetails"] ?? [])
                .map((x) => TrackingDetail.fromJson(x))),
        success: json["success"] ?? false,
        errorInfo: ErrorInfoModel.fromJson(json["error_info"] ?? {}),
      );
}

class OrnamentHistoryDetail {
  int srNo;
  int custOraSrNo;
  int custSrNo;
  String activity;
  String details;
  String notes;
  String ornamentLocation;
  String date;

  OrnamentHistoryDetail({
    required this.srNo,
    required this.custOraSrNo,
    required this.custSrNo,
    required this.activity,
    required this.details,
    required this.notes,
    required this.ornamentLocation,
    required this.date,
  });

  factory OrnamentHistoryDetail.fromJson(Map<String, dynamic> json) =>
      OrnamentHistoryDetail(
        srNo: json["srNo"] ?? 0,
        custOraSrNo: json["custOraSrNo"] ?? 0,
        custSrNo: json["custSrNo"] ?? 0,
        activity: json["activity"] ?? "",
        details: json["details"] ?? "",
        notes: json["notes"] ?? "",
        ornamentLocation: json["ornamentLocation"] ?? "",
        date: json["date"] ?? "",
      );
}

class TrackingDetail {
  TrackingDetail({
    required this.userOraSrNo,
    required this.oid,
    required this.itemName,
    required this.grossWt,
  });

  final int userOraSrNo;
  final String oid;
  final String itemName;
  final String grossWt;

  factory TrackingDetail.fromJson(Map<String, dynamic> json) => TrackingDetail(
        userOraSrNo: json["UserOraSrNo"] ?? 0,
        oid: json["OID"] ?? "",
        itemName: json["ItemName"] ?? "",
        grossWt: json["GrossWt"] ?? "",
      );
}
