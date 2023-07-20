// // To parse this JSON data, do
// //
// //     final getCustomerSchemeslistModel = getCustomerSchemeslistModelFromJson(jsonString);
//
// import 'dart:convert';
//
// GetCustomerSchemeslistModel getCustomerSchemeslistModelFromJson(String str) =>
//     GetCustomerSchemeslistModel.fromJson(json.decode(str));
//
// String getCustomerSchemeslistModelToJson(GetCustomerSchemeslistModel data) =>
//     json.encode(data.toJson());
//
// class GetCustomerSchemeslistModel {
//   GetCustomerSchemeslistModel({
//     required this.getCustomerPurchaseSavingSchemeList,
//     required this.success,
//     required this.errorInfo,
//   });
//
//   final List<GetCustomerPurchaseSavingSchemeData>
//       getCustomerPurchaseSavingSchemeList;
//   final bool success;
//   final ErrorInfo errorInfo;
//
//   factory GetCustomerSchemeslistModel.fromJson(Map<String, dynamic> json) =>
//       GetCustomerSchemeslistModel(
//         getCustomerPurchaseSavingSchemeList:
//             List<GetCustomerPurchaseSavingSchemeData>.from(
//                 (json["GetCustomerPurchaseSavingSchemeList"] ?? []).map(
//                     (x) => GetCustomerPurchaseSavingSchemeData.fromJson(x))),
//         success: json["success"] ?? false,
//         errorInfo: ErrorInfo.fromJson(json["error_info"] ?? {}),
//       );
//
//   Map<String, dynamic> toJson() => {
//         "GetCustomerPurchaseSavingSchemeList": List<dynamic>.from(
//             getCustomerPurchaseSavingSchemeList.map((x) => x.toJson())),
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
// class GetCustomerPurchaseSavingSchemeData {
//   GetCustomerPurchaseSavingSchemeData({
//     required this.folioNo,
//     required this.partnerName,
//     required this.startDate,
//     required this.maturityDate,
//     required this.nextPaymentDate,
//     required this.maturityAmount,
//     required this.totalPaid,
//     required this.monthlyAmount,
//     required this.status,
//     required this.savingSchemeSrNo,
//     required this.partnerSavingSchemeSrNo,
//     // this.imageName,
//     // this.imageLocation,
//     // this.imagePath,
//   });
//
//   final String folioNo;
//   final String partnerName;
//   final DateTime startDate;
//   final DateTime maturityDate;
//   final DateTime nextPaymentDate;
//   final double maturityAmount;
//   final double totalPaid;
//   final double monthlyAmount;
//   final String status;
//   final int savingSchemeSrNo;
//   final int partnerSavingSchemeSrNo;
//   // final dynamic imageName;
//   // final dynamic imageLocation;
//   // final dynamic imagePath;
//
//   factory GetCustomerPurchaseSavingSchemeData.fromJson(
//           Map<String, dynamic> json) =>
//       GetCustomerPurchaseSavingSchemeData(
//         folioNo: json["FolioNo"] ?? "",
//         partnerName: json["PartnerName"] ?? "",
//         startDate: DateTime.parse(json["StartDate"] ?? ""),
//         maturityDate: DateTime.parse(json["MaturityDate"] ?? ""),
//         nextPaymentDate: DateTime.parse(json["NextPaymentDate"] ?? ""),
//         maturityAmount: json["MaturityAmount"] ?? 0.0,
//         totalPaid: json["TotalPaid"] ?? 0.0,
//         monthlyAmount: json["MonthlyAmount"] ?? 0.0,
//         status: json["Status"] ?? "",
//         savingSchemeSrNo: json["SavingSchemeSrNo"] ?? 0,
//         partnerSavingSchemeSrNo: json["PartnerSavingSchemeSrNo"] ?? 0,
//         // imageName: json["ImageName"],
//         // imageLocation: json["ImageLocation"],
//         // imagePath: json["ImagePath"],
//       );
//
//   Map<String, dynamic> toJson() => {
//         "FolioNo": folioNo,
//         "PartnerName": partnerName,
//         "StartDate": startDate.toIso8601String(),
//         "MaturityDate": maturityDate.toIso8601String(),
//         "NextPaymentDate": nextPaymentDate.toIso8601String(),
//         "MaturityAmount": maturityAmount,
//         "TotalPaid": totalPaid,
//         "MonthlyAmount": monthlyAmount,
//         "Status": status,
//         "SavingSchemeSrNo": savingSchemeSrNo,
//         "PartnerSavingSchemeSrNo": partnerSavingSchemeSrNo,
//         // "ImageName": imageName,
//         // "ImageLocation": imageLocation,
//         // "ImagePath": imagePath,
//       };
// }
//
//
//
//



// To parse this JSON data, do
//
//     final getCustomerSchemeslistModel = getCustomerSchemeslistModelFromJson(jsonString);

import 'dart:convert';

GetCustomerSchemeslistModel getCustomerSchemeslistModelFromJson(String str) => GetCustomerSchemeslistModel.fromJson(json.decode(str));


class GetCustomerSchemeslistModel {
  int statusCode;
  Data data;

  GetCustomerSchemeslistModel({
    required  this.statusCode,
    required   this.data,
  });

  factory GetCustomerSchemeslistModel.fromJson(Map<String, dynamic> json) => GetCustomerSchemeslistModel(
    statusCode: json["statusCode"]??0,
    data: Data.fromJson(json["data"]??{}),
  );


}

class Data {
  List<GetCustomerPurchaseSavingSchemeData> getCustomerPurchaseSavingSchemeList;
  bool success;
  ErrorInfo errorInfo;

  Data({
    required this.getCustomerPurchaseSavingSchemeList,
    required this.success,
    required  this.errorInfo,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    getCustomerPurchaseSavingSchemeList: List<GetCustomerPurchaseSavingSchemeData>.from((json["getCustomerPurchaseSavingSchemeList"]??[]).map((x) => GetCustomerPurchaseSavingSchemeData.fromJson(x))??{}),
    success: json["success"]??false,
    errorInfo: ErrorInfo.fromJson(json["error_info"]??{}),
  );


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


}
class GetCustomerPurchaseSavingSchemeData {
  int srNo;
  int partnerSavingSchemeSrNo;
  String folioNo;
  String partnerName;
  DateTime startDate;
  DateTime maturityDate;
  DateTime nextPaymentDate;
  double maturityAmount;
  double totalPaid;
  double monthlyAmount;
  String status;
  int savingSchemeSrNo;
  // dynamic imageName;
  // dynamic imageLocation;
  // dynamic imagePath;

  GetCustomerPurchaseSavingSchemeData({
   required this.srNo,
    required this.partnerSavingSchemeSrNo,
    required this.folioNo,
    required  this.partnerName,
    required  this.startDate,
    required this.maturityDate,
    required this.nextPaymentDate,
    required this.maturityAmount,
    required this.totalPaid,
    required this.monthlyAmount,
    required  this.status,
    required this.savingSchemeSrNo,
    // this.imageName,
    // this.imageLocation,
    // this.imagePath,
  });

  factory GetCustomerPurchaseSavingSchemeData.fromJson(Map<String, dynamic> json) => GetCustomerPurchaseSavingSchemeData(
    srNo: json["srNo"]??0,
    partnerSavingSchemeSrNo: json["partnerSavingSchemeSrNo"]??0,
    folioNo: json["folioNo"]??"",
    partnerName: json["partnerName"]??"",
    startDate: DateTime.parse(json["startDate"]??""),
    maturityDate: DateTime.parse(json["maturityDate"]??""),
    nextPaymentDate: DateTime.parse(json["nextPaymentDate"]??""),
    maturityAmount: double.parse(json["maturityAmount"].toString()),
    totalPaid: double.parse(json["totalPaid"].toString()),
    monthlyAmount: double.parse(json["monthlyAmount"].toString()),
    status: json["status"] ?? "",
    savingSchemeSrNo: json["savingSchemeSrNo"] ?? 0,
    // imageName: json["imageName"],
    // imageLocation: json["imageLocation"],
    // imagePath: json["imagePath"],
  );


}
