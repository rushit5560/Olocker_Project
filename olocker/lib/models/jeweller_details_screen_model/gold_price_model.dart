import 'dart:convert';

import '../error_info_model/error_info_model.dart';

GoldPriceModel goldPriceModelFromJson(String str) =>
    GoldPriceModel.fromJson(json.decode(str));

class GoldPriceModel {
  int statusCode;
  Data data;

  GoldPriceModel({
    required this.statusCode,
    required this.data,
  });

  factory GoldPriceModel.fromJson(Map<String, dynamic> json) => GoldPriceModel(
        statusCode: json["statusCode"] ?? 0,
        data: Data.fromJson(json["data"] ?? {}),
      );
}

class Data {
  List<IbjAratesList> ibjAratesList;
  bool success;
  ErrorInfoModel errorInfo;

  Data({
    required this.ibjAratesList,
    required this.success,
    required this.errorInfo,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        ibjAratesList: List<IbjAratesList>.from(
            json["ibjAratesList"].map((x) => IbjAratesList.fromJson(x))),
        success: json["success"] ?? false,
        errorInfo: ErrorInfoModel.fromJson(json["error_info"] ?? {}),
      );
}

class IbjAratesList {
  IbjAratesList({
    required this.srNo,
    required this.date,
    required this.metal,
    required this.purity,
    required this.pm,
  });

  int srNo;
  String date;
  String metal;
  int purity;
  int pm;

  factory IbjAratesList.fromJson(Map<String, dynamic> json) => IbjAratesList(
        srNo: json["SrNo"] ?? 0,
        date: json["Date"].toString(),
        metal: json["Metal"] ?? "",
        purity: json["Purity"] ?? 0,
        pm: json["PM"] ?? 0,
      );
}
