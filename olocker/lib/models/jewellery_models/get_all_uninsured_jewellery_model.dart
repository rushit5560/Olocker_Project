import 'dart:convert';

import '../error_info_model/error_info_model.dart';

GetUnInsuredOrnamentModel jewelleryPortFolioGetModelFromJson(String str) =>
    GetUnInsuredOrnamentModel.fromJson(json.decode(str));

class GetUnInsuredOrnamentModel {
  int statusCode;
  Data data;

  GetUnInsuredOrnamentModel({
    required this.statusCode,
    required this.data,
  });

  factory GetUnInsuredOrnamentModel.fromJson(Map<String, dynamic> json) =>
      GetUnInsuredOrnamentModel(
        statusCode: json["statusCode"] ?? 0,
        data: Data.fromJson(json["data"] ?? {}),
      );
}

class Data {
  List<UnInsuredOrnament> unInsuredOrnament;
  bool success;
  ErrorInfoModel errorInfo;

  Data({
    required this.unInsuredOrnament,
    required this.success,
    required this.errorInfo,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        unInsuredOrnament: List<UnInsuredOrnament>.from(
            (json["unInsuredOrnament"] ?? [])
                .map((x) => UnInsuredOrnament.fromJson(x))),
        success: json["success"] ?? false,
        errorInfo: ErrorInfoModel.fromJson(json["error_info"] ?? {}),
      );
}

class UnInsuredOrnament {
  int srNo;
  int custSrNo;
  int custOraSrNo;
  String itemName;
  String description;
  String grossWt;
  String hallmarked;
  String wasInsured;
  String url;
  String occassion;
  String ornamentImagesSrNo;
  String oranamentsPrice;
  String purchaseDate;
  double estValue;

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
        estValue: double.parse(json["EstValue"].toString()),
      );
}
