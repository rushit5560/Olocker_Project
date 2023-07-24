// import 'dart:convert';
//
// AddJewellerModel addJewellerModelFromJson(String str) => AddJewellerModel.fromJson(json.decode(str));
//
// String addJewellerModelToJson(AddJewellerModel data) => json.encode(data.toJson());
//
// class AddJewellerModel {
//   AddJewellerModel({
//     required this.retailerDetail,
//     required this.success,
//     required this.errorInfo,
//   });
//
//   AddRetailerDetail retailerDetail;
//   bool success;
//   ErrorInfo errorInfo;
//
//   factory AddJewellerModel.fromJson(Map<String, dynamic> json) => AddJewellerModel(
//     retailerDetail: AddRetailerDetail.fromJson(json["RetailerDetail"] ?? {}),
//     success: json["success"] ?? false,
//     errorInfo: ErrorInfo.fromJson(json["error_info"] ?? {}),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "RetailerDetail": retailerDetail.toJson(),
//     "success": success,
//     "error_info": errorInfo.toJson(),
//   };
// }
//
// class ErrorInfo {
//   ErrorInfo({
//     required this.errorType,
//     required this.extraInfo,
//     required this.description,
//     // this.errorData,
//   });
//
//   int errorType;
//   String extraInfo;
//   String description;
//   // dynamic errorData;
//
//   factory ErrorInfo.fromJson(Map<String, dynamic> json) => ErrorInfo(
//     errorType: json["error_type"] ?? 0,
//     extraInfo: json["extra_info"] ?? "",
//     description: json["description"] ?? "",
//     // errorData: json["error_data"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "error_type": errorType,
//     "extra_info": extraInfo,
//     "description": description,
//     // "error_data": errorData,
//   };
// }
//
// class AddRetailerDetail {
//   AddRetailerDetail({
//     required this.retailerSrNo,
//     required this.retailerName,
//   });
//
//   int retailerSrNo;
//   String retailerName;
//
//   factory AddRetailerDetail.fromJson(Map<String, dynamic> json) => AddRetailerDetail(
//     retailerSrNo: json["RetailerSrNo"] ?? 0,
//     retailerName: json["RetailerName"] ?? "",
//   );
//
//   Map<String, dynamic> toJson() => {
//     "RetailerSrNo": retailerSrNo,
//     "RetailerName": retailerName,
//   };
// }
//
//
//
//
//





// To parse this JSON data, do
//
//     final addJewellerModel = addJewellerModelFromJson(jsonString);

import 'dart:convert';

import '../error_info_model/error_info_model.dart';

AddJewellerModel addJewellerModelFromJson(String str) => AddJewellerModel.fromJson(json.decode(str));


class AddJewellerModel {
  int statusCode;
  Data data;
  String message;

  AddJewellerModel({
    required this.statusCode,
    required this.data,
    required this.message,
  });

  factory AddJewellerModel.fromJson(Map<String, dynamic> json) => AddJewellerModel(
    statusCode: json["statusCode"]??0,
    data: Data.fromJson(json["data"]??{}),
    message: json["message"]??"",
  );


}

class Data {
  RetailerDetail retailerDetail;
  bool success;
  ErrorInfoModel errorInfo;

  Data({
    required this.retailerDetail,
    required this.success,
    required this.errorInfo,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    retailerDetail: RetailerDetail.fromJson(json["retailerDetail"]??{}),
    success: json["success"]??false,
    errorInfo: ErrorInfoModel.fromJson(json["error_info"]??{}),
  );

}

class RetailerDetail {
  int retailerSrNo;
  String retailerName;

  RetailerDetail({
    required this.retailerSrNo,
    required this.retailerName,
  });

  factory RetailerDetail.fromJson(Map<String, dynamic> json) => RetailerDetail(
    retailerSrNo: json["retailerSrNo"]??0,
    retailerName: json["retailerName"]??"",
  );

}
