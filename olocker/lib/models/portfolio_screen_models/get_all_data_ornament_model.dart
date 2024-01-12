// // To parse this JSON data, do
// //
// //     final getAddDataOrnamentModel = getAddDataOrnamentModelFromJson(jsonString);
//
// import 'dart:convert';
//
// GetAddDataOrnamentModel getAddDataOrnamentModelFromJson(String str) =>
//     GetAddDataOrnamentModel.fromJson(json.decode(str));
//
// String getAddDataOrnamentModelToJson(GetAddDataOrnamentModel data) =>
//     json.encode(data.toJson());
//
// class GetAddDataOrnamentModel {
//   GetAddDataOrnamentModel({
//     required this.productDetails,
//     required this.metalTypes,
//     required this.metalPurity,
//     required this.stoneDetails,
//     required this.decorativeItemDetails,
//     required this.success,
//     required this.errorInfo,
//   });
//
//   final List<SingleItemDetail> productDetails;
//   final List<SingleItemDetail> metalTypes;
//   final List<SingleItemDetail> metalPurity;
//   final List<SingleItemDetail> stoneDetails;
//   final List<SingleItemDetail> decorativeItemDetails;
//   final bool success;
//   final ErrorInfo errorInfo;
//
//   factory GetAddDataOrnamentModel.fromJson(Map<String, dynamic> json) =>
//       GetAddDataOrnamentModel(
//         productDetails: List<SingleItemDetail>.from(
//             (json["ProductDetails"] ?? [])
//                 .map((x) => SingleItemDetail.fromJson(x))),
//         metalTypes: List<SingleItemDetail>.from((json["MetalTypes"] ?? [])
//             .map((x) => SingleItemDetail.fromJson(x))),
//         metalPurity: List<SingleItemDetail>.from((json["MetalPurity"] ?? [])
//             .map((x) => SingleItemDetail.fromJson(x))),
//         stoneDetails: List<SingleItemDetail>.from((json["StoneDetails"] ?? [])
//             .map((x) => SingleItemDetail.fromJson(x))),
//         decorativeItemDetails: List<SingleItemDetail>.from(
//             (json["DecoItemDetails"] ?? [])
//                 .map((x) => SingleItemDetail.fromJson(x))),
//         success: json["success"],
//         errorInfo: ErrorInfo.fromJson(
//           (json["error_info"] ?? {}),
//         ),
//       );
//
//   Map<String, dynamic> toJson() => {
//         "ProductDetails":
//             List<dynamic>.from(productDetails.map((x) => x.toJson())),
//         "MetalTypes": List<dynamic>.from(metalTypes.map((x) => x.toJson())),
//         "MetalPurity": List<dynamic>.from(metalPurity.map((x) => x.toJson())),
//         "StoneDetails": List<dynamic>.from(stoneDetails.map((x) => x.toJson())),
//         "DecoItemDetails":
//             List<dynamic>.from(decorativeItemDetails.map((x) => x.toJson())),
//         "success": success,
//         "error_info": errorInfo.toJson(),
//       };
// }
//
// class SingleItemDetail {
//   SingleItemDetail(
//       {required this.id,
//       required this.value,
//       this.description,
//       this.iconImage,
//       s});
//
//   final int id;
//   final String value;
//   final dynamic description;
//   final dynamic iconImage;
//
//   factory SingleItemDetail.fromJson(Map<String, dynamic> json) =>
//       SingleItemDetail(
//         id: json["Id"] ?? 0,
//         value: json["Value"] ?? "",
//         description: json["Description"] ?? "",
//         iconImage: json["IconImage"] ?? "",
//       );
//
//   Map<String, dynamic> toJson() => {
//         "Id": id,
//         "Value": value,
//         "Description": description,
//         "IconImage": iconImage,
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
// //
import 'dart:convert';

import 'package:olocker/models/error_info_model/error_info_model.dart';

GetAddDataOrnamentModel getAddDataOrnamentModelFromJson(String str) =>
    GetAddDataOrnamentModel.fromJson(json.decode(str));

class GetAddDataOrnamentModel {
  int statusCode;
  Data data;

  GetAddDataOrnamentModel({
    required this.statusCode,
    required this.data,
  });

  factory GetAddDataOrnamentModel.fromJson(Map<String, dynamic> json) =>
      GetAddDataOrnamentModel(
        statusCode: json["statusCode"] ?? 0,
        data: Data.fromJson(json["data"] ?? {}),
      );

}

class Data {
  List<DecoItemDetail> productDetails;
  List<DecoItemDetail> metalTypes;
  List<DecoItemDetail> metalPurity;
  List<DecoItemDetail> stoneDetails;
  List<DecoItemDetail> decoItemDetails;
  bool success;
  ErrorInfoModel errorInfo;

  Data({
    required this.productDetails,
    required this.metalTypes,
    required this.metalPurity,
    required this.stoneDetails,
    required this.decoItemDetails,
    required this.success,
    required this.errorInfo,
  });

  factory Data.fromJson(Map<String, dynamic> json) =>
      Data(
        productDetails: List<DecoItemDetail>.from(
            (json["productDetails"] ?? []).map((x) =>
                DecoItemDetail.fromJson(x))),
        metalTypes: List<DecoItemDetail>.from(
            (json["MetalTypes"] ?? []).map((x) => DecoItemDetail.fromJson(x))),
        metalPurity: List<DecoItemDetail>.from(
            (json["MetalPurity"] ?? []).map((x) => DecoItemDetail.fromJson(x))),
        stoneDetails: List<DecoItemDetail>.from(
            (json["StoneDetails"] ?? []).map((x) =>
                DecoItemDetail.fromJson(x))),
        decoItemDetails: List<DecoItemDetail>.from(
            (json["DecoItemDetails"] ?? []).map((x) =>
                DecoItemDetail.fromJson(x))),
        success: json["success"] ?? false,
        errorInfo: ErrorInfoModel.fromJson(json["error_info"] ?? {}),
      );


}

class DecoItemDetail {
  int id;
  String value;
  String description;
  String iconImage;

  DecoItemDetail({
    required this.id,
    required this.value,
    required this.description,
    required this.iconImage,
  });

  factory DecoItemDetail.fromJson(Map<String, dynamic> json) =>
      DecoItemDetail(
        id: json["id"] ?? 0,
        value: json["value"] ?? "",
        description: json["description"] ?? "",
        iconImage: json["iconImage"] ?? "",
      );


}


