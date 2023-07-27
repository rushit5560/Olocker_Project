// // To parse this JSON data, do
// //
// //     final addOrnamentResponseModel = addOrnamentResponseModelFromJson(jsonString);
//
// import 'dart:convert';
//
// AddOrnamentResponseModel addOrnamentResponseModelFromJson(String str) =>
//     AddOrnamentResponseModel.fromJson(json.decode(str));
//
// // String addOrnamentResponseModelToJson(AddOrnamentResponseModel data) =>
// //     json.encode(data.toJson());
//
// class AddOrnamentResponseModel {
//   AddOrnamentResponseModel({
//     // required this.data,
//     required this.success,
//     required this.errorInfo,
//   });
//
//   // final Data data;
//   final bool success;
//   final ErrorInfo errorInfo;
//
//   factory AddOrnamentResponseModel.fromJson(Map<String, dynamic> json) =>
//       AddOrnamentResponseModel(
//         // data: Data.fromJson((json["Data"] ?? {})),
//         success: json["success"] ?? false,
//         errorInfo: ErrorInfo.fromJson(json["error_info"] ?? {}),
//       );
//
//   // Map<String, dynamic> toJson() => {
//   //       "Data": data.toJson(),
//   //       "success": success,
//   //       "error_info": errorInfo.toJson(),
//   //     };
// }
// //
// // class Data {
// //   Data({
// //     required this.srNo,
// //     required this.custSrNo,
// //     required this.custOraSrNo,
// //     this.itemName,
// //     this.description,
// //     this.grossWt,
// //     this.hallmarked,
// //     this.wasInsured,
// //     this.url,
// //     this.occassion,
// //     this.ornamentImagesSrNo,
// //     this.oranamentsPrice,
// //     this.purchaseDate,
// //     required this.estValue,
// //   });
// //
// //   final int srNo;
// //   final int custSrNo;
// //   final int custOraSrNo;
// //   final dynamic itemName;
// //   final dynamic description;
// //   final dynamic grossWt;
// //   final dynamic hallmarked;
// //   final dynamic wasInsured;
// //   final dynamic url;
// //   final dynamic occassion;
// //   final dynamic ornamentImagesSrNo;
// //   final dynamic oranamentsPrice;
// //   final dynamic purchaseDate;
// //   final double estValue;
// //
// //   factory Data.fromJson(Map<String, dynamic> json) => Data(
// //         srNo: json["SrNo"] ?? 0,
// //         custSrNo: json["CustSrNo"] ?? 0,
// //         custOraSrNo: json["CustOraSrNo"] ?? 0,
// //         itemName: json["ItemName"] ?? "",
// //         description: json["Description"] ?? "",
// //         grossWt: json["GrossWt"] ?? "",
// //         hallmarked: json["Hallmarked"] ?? "",
// //         wasInsured: json["WasInsured"] ?? "",
// //         url: json["url"] ?? "",
// //         occassion: json["Occassion"] ?? "",
// //         ornamentImagesSrNo: json["OrnamentImagesSrNo"] ?? "",
// //         oranamentsPrice: json["OranamentsPrice"] ?? "",
// //         purchaseDate: json["PurchaseDate"] ?? "",
// //         estValue: json["EstValue"] ?? 0.0,
// //       );
// //
// //   Map<String, dynamic> toJson() => {
// //         "SrNo": srNo,
// //         "CustSrNo": custSrNo,
// //         "CustOraSrNo": custOraSrNo,
// //         "ItemName": itemName,
// //         "Description": description,
// //         "GrossWt": grossWt,
// //         "Hallmarked": hallmarked,
// //         "WasInsured": wasInsured,
// //         "url": url,
// //         "Occassion": occassion,
// //         "OrnamentImagesSrNo": ornamentImagesSrNo,
// //         "OranamentsPrice": oranamentsPrice,
// //         "PurchaseDate": purchaseDate,
// //         "EstValue": estValue,
// //       };
// // }
//
// class ErrorInfo {
//   ErrorInfo({
//     required this.errorType,
//     required this.extraInfo,
//     required this.description,
//     required this.errorData,
//   });
//
//   int errorType;
//   String extraInfo;
//   String description;
//   String errorData;
//
//   factory ErrorInfo.fromJson(Map<String, dynamic> json) => ErrorInfo(
//         errorType: json["error_type"] ?? 0,
//         extraInfo: json["extra_info"] ?? "",
//         description: json["description"] ?? "",
//         errorData: json["error_data"].toString(),
//       );
//
//   Map<String, dynamic> toJson() => {
//         "error_type": errorType,
//         "extra_info": extraInfo,
//         "description": description,
//         "error_data": errorData,
//       };
// }
// To parse this JSON data, do
//
//     final addOrnamentResponseModel = addOrnamentResponseModelFromJson(jsonString);

import 'dart:convert';

AddOrnamentResponseModel addOrnamentResponseModelFromJson(String str) =>
    AddOrnamentResponseModel.fromJson(json.decode(str));


class AddOrnamentResponseModel {
  int statusCode;
  String message;

  AddOrnamentResponseModel({
    required this.statusCode,
    required this.message,
  });

  factory AddOrnamentResponseModel.fromJson(Map<String, dynamic> json) =>
      AddOrnamentResponseModel(
        statusCode: json["statusCode"] ?? 0,
        message: json["message"] ?? "",
      );
}
