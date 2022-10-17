// To parse this JSON data, do
//
//     final getAddDataOrnamentModel = getAddDataOrnamentModelFromJson(jsonString);

import 'dart:convert';

GetAddDataOrnamentModel getAddDataOrnamentModelFromJson(String str) =>
    GetAddDataOrnamentModel.fromJson(json.decode(str));

String getAddDataOrnamentModelToJson(GetAddDataOrnamentModel data) =>
    json.encode(data.toJson());

class GetAddDataOrnamentModel {
  GetAddDataOrnamentModel({
    required this.productDetails,
    required this.metalTypes,
    required this.metalPurity,
    required this.stoneDetails,
    required this.decorativeItemDetails,
    required this.success,
    required this.errorInfo,
  });

  final List<SingleItemDetail> productDetails;
  final List<SingleItemDetail> metalTypes;
  final List<SingleItemDetail> metalPurity;
  final List<SingleItemDetail> stoneDetails;
  final List<SingleItemDetail> decorativeItemDetails;
  final bool success;
  final ErrorInfo errorInfo;

  factory GetAddDataOrnamentModel.fromJson(Map<String, dynamic> json) =>
      GetAddDataOrnamentModel(
        productDetails: List<SingleItemDetail>.from(
            (json["ProductDetails"] ?? [])
                .map((x) => SingleItemDetail.fromJson(x))),
        metalTypes: List<SingleItemDetail>.from((json["MetalTypes"] ?? [])
            .map((x) => SingleItemDetail.fromJson(x))),
        metalPurity: List<SingleItemDetail>.from((json["MetalPurity"] ?? [])
            .map((x) => SingleItemDetail.fromJson(x))),
        stoneDetails: List<SingleItemDetail>.from((json["StoneDetails"] ?? [])
            .map((x) => SingleItemDetail.fromJson(x))),
        decorativeItemDetails: List<SingleItemDetail>.from(
            (json["DecoItemDetails"] ?? [])
                .map((x) => SingleItemDetail.fromJson(x))),
        success: json["success"],
        errorInfo: ErrorInfo.fromJson(
          (json["error_info"] ?? {}),
        ),
      );

  Map<String, dynamic> toJson() => {
        "ProductDetails":
            List<dynamic>.from(productDetails.map((x) => x.toJson())),
        "MetalTypes": List<dynamic>.from(metalTypes.map((x) => x.toJson())),
        "MetalPurity": List<dynamic>.from(metalPurity.map((x) => x.toJson())),
        "StoneDetails": List<dynamic>.from(stoneDetails.map((x) => x.toJson())),
        "DecoItemDetails":
            List<dynamic>.from(decorativeItemDetails.map((x) => x.toJson())),
        "success": success,
        "error_info": errorInfo.toJson(),
      };
}

class SingleItemDetail {
  SingleItemDetail(
      {required this.id,
      required this.value,
      this.description,
      this.iconImage,
      s});

  final int id;
  final String value;
  final dynamic description;
  final dynamic iconImage;

  factory SingleItemDetail.fromJson(Map<String, dynamic> json) =>
      SingleItemDetail(
        id: json["Id"] ?? 0,
        value: json["Value"] ?? "",
        description: json["Description"] ?? "",
        iconImage: json["IconImage"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "Id": id,
        "Value": value,
        "Description": description,
        "IconImage": iconImage,
      };
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

  Map<String, dynamic> toJson() => {
        "error_type": errorType,
        "extra_info": extraInfo,
        "description": description,
        "error_data": errorData,
      };
}
