import 'dart:convert';

import '../error_info_model/error_info_model.dart';

GetOrnamentDetailsModel getOrnamentDetailsModelFromJson(String str) =>
    GetOrnamentDetailsModel.fromJson(json.decode(str));

class GetOrnamentDetailsModel {
  int statusCode;
  Data data;

  GetOrnamentDetailsModel({
    required this.statusCode,
    required this.data,
  });

  factory GetOrnamentDetailsModel.fromJson(Map<String, dynamic> json) =>
      GetOrnamentDetailsModel(
        statusCode: json["statusCode"] ?? 0,
        data: Data.fromJson(json["data"] ?? {}),
      );
}

class Data {
  int ornamentSrNo;
  int custsrno;
  String name;
  String description;
  String grosswt;
  String hallmarked;
  String purchasedFrom;
  String purchaseDate;
  String occasion;
  int purchasePrice;
  int purchasePriceLessGst;
  int labourCharges;
  List<Metaldetail> metaldetails;
  List<Decorativeitem> stonedetails;
  List<Decorativeitem> decorativeitem;

  // List<dynamic> jewellerycertificatedetails;
  Ornamentimage ornamentimage;
  bool success;
  ErrorInfoModel errorInfo;

  Data({
    required this.ornamentSrNo,
    required this.custsrno,
    required this.name,
    required this.description,
    required this.grosswt,
    required this.hallmarked,
    required this.purchasedFrom,
    required this.purchaseDate,
    required this.occasion,
    required this.purchasePrice,
    required this.purchasePriceLessGst,
    required this.labourCharges,
    required this.metaldetails,
    required this.stonedetails,
    required this.decorativeitem,
    // required this.jewellerycertificatedetails,
    required this.ornamentimage,
    required this.success,
    required this.errorInfo,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        ornamentSrNo: json["ornamentSrNo"] ?? 0,
        custsrno: json["custsrno"] ?? 0,
        name: json["name"] ?? "",
        description: json["description"] ?? "",
        grosswt: json["grosswt"] ?? "",
        hallmarked: json["hallmarked"] ?? "",
        purchasedFrom: json["purchased_from"] ?? "",
        purchaseDate: (json["purchase_date"] ?? "").toString(),
        occasion: json["occasion"] ?? "",
        purchasePrice: json["purchase_price"] ?? 0,
        purchasePriceLessGst: json["purchase_price_less_gst"] ?? 0,
        labourCharges: json["labour_charges"] ?? 0,
        metaldetails: List<Metaldetail>.from(
            (json["metaldetails"] ?? []).map((x) => Metaldetail.fromJson(x))),
        stonedetails: List<Decorativeitem>.from((json["stonedetails"] ?? [])
            .map((x) => Decorativeitem.fromJson(x))),
        decorativeitem: List<Decorativeitem>.from((json["decorativeitem"] ?? [])
            .map((x) => Decorativeitem.fromJson(x))),
        // jewellerycertificatedetails: List<dynamic>.from(json["jewellerycertificatedetails"].map((x) => x)),
        ornamentimage: Ornamentimage.fromJson(json["ornamentimage"] ?? {}),
        success: json["success"] ?? false,
        errorInfo: ErrorInfoModel.fromJson(json["error_info"] ?? {}),
      );
}

class Metaldetail {
  String netmetalweight;
  String metaltype;
  String purity;

  Metaldetail({
    required this.netmetalweight,
    required this.metaltype,
    required this.purity,
  });

  factory Metaldetail.fromJson(Map<String, dynamic> json) => Metaldetail(
        netmetalweight: json["netmetalweight"] ?? "",
        metaltype: json["metaltype"] ?? "",
        purity: json["purity"] ?? "",
      );
}

class Ornamentimage {
  String name;
  String path;

  Ornamentimage({
    required this.name,
    required this.path,
  });

  factory Ornamentimage.fromJson(Map<String, dynamic> json) => Ornamentimage(
        name: json["name"] ?? "",
        path: json["path"] ?? "",
      );
}

class Decorativeitem {
  Decorativeitem({
    required this.name,
    required this.wt,
    required this.unitofwt,
  });

  final String name;
  final String wt;
  final String unitofwt;

  factory Decorativeitem.fromJson(Map<String, dynamic> json) => Decorativeitem(
        name: json["name"] ?? "",
        wt: json["wt"] ?? "",
        unitofwt: json["unitofwt"] ?? "",
      );
}
