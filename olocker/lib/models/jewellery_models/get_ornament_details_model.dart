// To parse this JSON data, do
//
//     final getOrnamentDetailsModel = getOrnamentDetailsModelFromJson(jsonString);

import 'dart:convert';

GetOrnamentDetailsModel getOrnamentDetailsModelFromJson(String str) =>
    GetOrnamentDetailsModel.fromJson(json.decode(str));

String getOrnamentDetailsModelToJson(GetOrnamentDetailsModel data) =>
    json.encode(data.toJson());

class GetOrnamentDetailsModel {
  GetOrnamentDetailsModel({
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
    required this.jewellerycertificatedetails,
    required this.ornamentimage,
    required this.success,
    required this.errorInfo,
  });

  final int ornamentSrNo;
  final int custsrno;
  final String name;
  final String description;
  final String grosswt;
  final String hallmarked;
  final String purchasedFrom;
  final String purchaseDate;
  final String occasion;
  final double purchasePrice;
  final double purchasePriceLessGst;
  final double labourCharges;
  final List<Metaldetail> metaldetails;
  final List<Decorativeitem> stonedetails;
  final List<Decorativeitem> decorativeitem;
  final List<dynamic> jewellerycertificatedetails;
  final Ornamentimage ornamentimage;
  final bool success;
  final ErrorInfo errorInfo;

  factory GetOrnamentDetailsModel.fromJson(Map<String, dynamic> json) =>
      GetOrnamentDetailsModel(
        ornamentSrNo: json["OrnamentSrNo"] ?? 0,
        custsrno: json["custsrno"] ?? 0,
        name: json["name"] ?? "",
        description: json["description"] ?? "",
        grosswt: json["grosswt"] ?? "",
        hallmarked: json["hallmarked"] ?? "",
        purchasedFrom: json["purchased_from"] ?? "",
        purchaseDate: json["purchase_date"] ?? "",
        occasion: json["occasion"] ?? "",
        purchasePrice: json["purchase_price"] ?? 0.0,
        purchasePriceLessGst: json["purchase_price_less_gst"] ?? 0.0,
        labourCharges: json["labour_charges"] ?? 0.0,
        metaldetails: List<Metaldetail>.from(
            (json["metaldetails"] ?? []).map((x) => Metaldetail.fromJson(x))),
        stonedetails: List<Decorativeitem>.from((json["stonedetails"] ?? [])
            .map((x) => Decorativeitem.fromJson(x))),
        decorativeitem: List<Decorativeitem>.from((json["decorativeitem"] ?? [])
            .map((x) => Decorativeitem.fromJson(x))),
        jewellerycertificatedetails: List<dynamic>.from(
            (json["jewellerycertificatedetails"] ?? []).map((x) => x)),
        ornamentimage: Ornamentimage.fromJson(json["ornamentimage"] ?? {}),
        success: json["success"] ?? false,
        errorInfo: ErrorInfo.fromJson((json["error_info"] ?? {})),
      );

  Map<String, dynamic> toJson() => {
        "OrnamentSrNo": ornamentSrNo,
        "custsrno": custsrno,
        "name": name,
        "description": description,
        "grosswt": grosswt,
        "hallmarked": hallmarked,
        "purchased_from": purchasedFrom,
        "purchase_date": purchaseDate,
        "occasion": occasion,
        "purchase_price": purchasePrice,
        "purchase_price_less_gst": purchasePriceLessGst,
        "labour_charges": labourCharges,
        "metaldetails": List<dynamic>.from(metaldetails.map((x) => x.toJson())),
        "stonedetails": List<dynamic>.from(stonedetails.map((x) => x.toJson())),
        "decorativeitem":
            List<dynamic>.from(decorativeitem.map((x) => x.toJson())),
        "jewellerycertificatedetails":
            List<dynamic>.from(jewellerycertificatedetails.map((x) => x)),
        "ornamentimage": ornamentimage.toJson(),
        "success": success,
        "error_info": errorInfo.toJson(),
      };
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

  Map<String, dynamic> toJson() => {
        "name": name,
        "wt": wt,
        "unitofwt": unitofwt,
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

class Metaldetail {
  Metaldetail({
    required this.netmetalweight,
    required this.metaltype,
    required this.purity,
  });

  final String netmetalweight;
  final String metaltype;
  final String purity;

  factory Metaldetail.fromJson(Map<String, dynamic> json) => Metaldetail(
        netmetalweight: json["netmetalweight"] ?? "",
        metaltype: json["metaltype"] ?? "",
        purity: json["purity"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "netmetalweight": netmetalweight,
        "metaltype": metaltype,
        "purity": purity,
      };
}

class Ornamentimage {
  Ornamentimage({
    required this.name,
    required this.path,
  });

  final String name;
  final String path;

  factory Ornamentimage.fromJson(Map<String, dynamic> json) => Ornamentimage(
        name: json["name"] ?? "",
        path: json["path"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "path": path,
      };
}
