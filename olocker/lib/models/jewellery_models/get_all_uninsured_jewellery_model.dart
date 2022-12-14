// To parse this JSON data, do
//
//     final getUnInsuredOrnamentModel = getUnInsuredOrnamentModelFromJson(jsonString);

import 'dart:convert';

GetUnInsuredOrnamentModel getUnInsuredOrnamentModelFromJson(String str) =>
    GetUnInsuredOrnamentModel.fromJson(json.decode(str));

String getUnInsuredOrnamentModelToJson(GetUnInsuredOrnamentModel data) =>
    json.encode(data.toJson());

class GetUnInsuredOrnamentModel {
  GetUnInsuredOrnamentModel({
    required this.unInsuredOrnament,
    required this.success,
    required this.errorInfo,
  });

  final List<UnInsuredOrnament> unInsuredOrnament;
  final bool success;
  final ErrorInfo errorInfo;

  factory GetUnInsuredOrnamentModel.fromJson(Map<String, dynamic> json) =>
      GetUnInsuredOrnamentModel(
        unInsuredOrnament: List<UnInsuredOrnament>.from(
            (json["UnInsuredOrnament"] ?? [])
                .map((x) => UnInsuredOrnament.fromJson(x))),
        success: json["success"] ?? false,
        errorInfo: ErrorInfo.fromJson((json["error_info"] ?? {})),
      );

  Map<String, dynamic> toJson() => {
        "UnInsuredOrnament":
            List<dynamic>.from(unInsuredOrnament.map((x) => x.toJson())),
        "success": success,
        "error_info": errorInfo.toJson(),
      };
}

class ErrorInfo {
  ErrorInfo({
    required this.errorType,
    required this.extraInfo,
    required this.description,
    required this.errorData,
  });

  int errorType;
  String extraInfo;
  String description;
  String errorData;

  factory ErrorInfo.fromJson(Map<String, dynamic> json) => ErrorInfo(
        errorType: json["error_type"] ?? 0,
        extraInfo: json["extra_info"] ?? "",
        description: json["description"] ?? "",
        errorData: json["error_data"].toString(),
      );

  Map<String, dynamic> toJson() => {
        "error_type": errorType,
        "extra_info": extraInfo,
        "description": description,
        "error_data": errorData,
      };
}

class UnInsuredOrnament {
  UnInsuredOrnament({
    required this.srNo,
    required this.custSrNo,
    required this.custOraSrNo,
    required this.itemName,
    required this.description,
    required this.grossWt,
    required this.hallmarked,
    required this.wasInsured,
    required this.url,
    required this.occassion,
    required this.ornamentImagesSrNo,
    required this.oranamentsPrice,
    required this.purchaseDate,
    required this.estValue,
  });

  final int srNo;
  final int custSrNo;
  final int custOraSrNo;
  final String itemName;
  final String description;
  final String grossWt;
  final String hallmarked;
  final String wasInsured;
  final String url;
  final String occassion;
  final String ornamentImagesSrNo;
  final String oranamentsPrice;
  final String purchaseDate;
  final double estValue;

  factory UnInsuredOrnament.fromJson(Map<String, dynamic> json) =>
      UnInsuredOrnament(
          srNo: json["SrNo"] ?? 0,
          custSrNo: json["CustSrNo"] ?? 0,
          custOraSrNo: json["CustOraSrNo"] ?? 0,
          itemName: json["ItemName"] ?? "",
          description: json["Description"] ?? "",
          grossWt: json["GrossWt"] ?? "",
          hallmarked: json["Hallmarked"] ?? "",
          wasInsured: json["WasInsured"] ?? "",
          url: json["url"] ?? "",
          occassion: json["Occassion"] ?? "",
          ornamentImagesSrNo: json["OrnamentImagesSrNo"] ?? "",
          oranamentsPrice: json["OranamentsPrice"] ?? "",
          purchaseDate: json["PurchaseDate"] ?? "",
          estValue: json["EstValue"] ?? 0.0);

  Map<String, dynamic> toJson() => {
        "SrNo": srNo,
        "CustSrNo": custSrNo,
        "CustOraSrNo": custOraSrNo,
        "ItemName": itemName,
        "Description": description,
        "GrossWt": grossWt,
        "Hallmarked": hallmarked,
        "WasInsured": wasInsured,
        "url": url,
        "Occassion": occassion,
        "OrnamentImagesSrNo": ornamentImagesSrNo,
        "OranamentsPrice": oranamentsPrice,
        "PurchaseDate": purchaseDate,
        "EstValue": estValue,
      };
}
