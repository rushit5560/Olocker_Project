// // To parse this JSON data, do
// //
// //     final getJewelleryDetailModel = getJewelleryDetailModelFromJson(jsonString);
//
// import 'dart:convert';
//
// GetJewelleryDetailModel getJewelleryDetailModelFromJson(String str) =>
//     GetJewelleryDetailModel.fromJson(json.decode(str));
//
// String getJewelleryDetailModelToJson(GetJewelleryDetailModel data) =>
//     json.encode(data.toJson());
//
// class GetJewelleryDetailModel {
//   GetJewelleryDetailModel({
//     required this.productDetailsData,
//     required this.success,
//     required this.errorInfo,
//   });
//
//   final ProductDetailsData productDetailsData;
//   final bool success;
//   final ErrorInfo errorInfo;
//
//   factory GetJewelleryDetailModel.fromJson(Map<String, dynamic> json) =>
//       GetJewelleryDetailModel(
//         productDetailsData:
//             ProductDetailsData.fromJson(json["ProductDetailsData"] ?? {}),
//         success: json["success"] ?? false,
//         errorInfo: ErrorInfo.fromJson(json["error_info"] ?? {}),
//       );
//
//   Map<String, dynamic> toJson() => {
//         "ProductDetailsData": productDetailsData.toJson(),
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
// class ProductDetailsData {
//   ProductDetailsData({
//     required this.srNo,
//     required this.productSku,
//     required this.itemType,
//     required this.itemTypeName,
//     required this.productTypeName,
//     required this.partnerName,
//     required this.description,
//     required this.weight,
//     // this.width,
//     // this.height,
//     // this.length,
//     // this.breadth,
//     // this.size,
//     // this.unitWidth,
//     // this.unitHeight,
//     // this.unitLength,
//     // this.unitBreadth,
//     // this.unitSize,
//     required this.tryBeforeBuy,
//     required this.price,
//     required this.gst,
//     required this.fullPayment,
//     required this.advancePayment,
//     required this.productStatus,
//     // this.estimateDeliveryDays,
//     required this.productImageList,
//     required this.similarProductList,
//     required this.metaldetails,
//     required this.decorativedetails,
//     required this.stonedetails,
//     required this.diamonddetails,
//     required this.isFav,
//   });
//
//   final int srNo;
//   final String productSku;
//   final String itemType;
//   final String itemTypeName;
//   final String productTypeName;
//   final String partnerName;
//   final String description;
//   final String weight;
//   // final dynamic width;
//   // final dynamic height;
//   // final dynamic length;
//   // final dynamic breadth;
//   // final dynamic size;
//   // final dynamic unitWidth;
//   // final dynamic unitHeight;
//   // final dynamic unitLength;
//   // final dynamic unitBreadth;
//   // final dynamic unitSize;
//   final bool tryBeforeBuy;
//   final String price;
//   final String gst;
//   final String fullPayment;
//   final String advancePayment;
//   final String productStatus;
//   // final dynamic estimateDeliveryDays;
//   final List<ProductImageList> productImageList;
//   final List<SimilarProductList> similarProductList;
//   final List<Metaldetail> metaldetails;
//   final List<Decorativedetail> decorativedetails;
//   final List<Stonedetail> stonedetails;
//   final List<Diamonddetail> diamonddetails;
//   bool isFav;
//
//   factory ProductDetailsData.fromJson(Map<String, dynamic> json) =>
//       ProductDetailsData(
//         srNo: json["SrNo"] ?? 0,
//         productSku: json["ProductSku"] ?? "",
//         itemType: json["ItemType"] ?? "",
//         itemTypeName: json["ItemTypeName"] ?? "",
//         productTypeName: json["ProductTypeName"] ?? "",
//         partnerName: json["PartnerName"] ?? "",
//         description: json["Description"] ?? "",
//         weight: json["Weight"] ?? "",
//         // width: json["Width"],
//         // height: json["Height"],
//         // length: json["Length"],
//         // breadth: json["Breadth"],
//         // size: json["Size"],
//         // unitWidth: json["UnitWidth"],
//         // unitHeight: json["UnitHeight"],
//         // unitLength: json["UnitLength"],
//         // unitBreadth: json["UnitBreadth"],
//         // unitSize: json["UnitSize"],
//         tryBeforeBuy: json["TryBeforeBuy"] ?? false,
//         price: json["Price"] ?? "",
//         gst: json["GST"] ?? "",
//         fullPayment: json["FullPayment"] ?? "",
//         advancePayment: json["AdvancePayment"] ?? "",
//         productStatus: json["ProductStatus"] ?? "",
//         isFav: json["IsFav"] ?? false,
//         // estimateDeliveryDays: json["EstimateDeliveryDays"],
//         productImageList: List<ProductImageList>.from(
//             (json["ProductImageList"] ?? [])
//                 .map((x) => ProductImageList.fromJson(x))),
//         similarProductList: List<SimilarProductList>.from(
//             (json["SimilarProductList"] ?? [])
//                 .map((x) => SimilarProductList.fromJson(x))),
//         metaldetails: List<Metaldetail>.from(
//             (json["metaldetails"] ?? []).map((x) => Metaldetail.fromJson(x))),
//         decorativedetails: List<Decorativedetail>.from(
//             (json["decorativedetails"] ?? [])
//                 .map((x) => Decorativedetail.fromJson(x))),
//         stonedetails: List<Stonedetail>.from(
//             (json["stonedetails"] ?? []).map((x) => Stonedetail.fromJson(x))),
//         diamonddetails: List<Diamonddetail>.from((json["diamonddetails"] ?? [])
//             .map((x) => Diamonddetail.fromJson(x))),
//       );
//
//   Map<String, dynamic> toJson() => {
//         "SrNo": srNo,
//         "ProductSku": productSku,
//         "ItemType": itemType,
//         "ItemTypeName": itemTypeName,
//         "ProductTypeName": productTypeName,
//         "PartnerName": partnerName,
//         "Description": description,
//         "Weight": weight,
//         // "Width": width,
//         // "Height": height,
//         // "Length": length,
//         // "Breadth": breadth,
//         // "Size": size,
//         // "UnitWidth": unitWidth,
//         // "UnitHeight": unitHeight,
//         // "UnitLength": unitLength,
//         // "UnitBreadth": unitBreadth,
//         // "UnitSize": unitSize,
//         "TryBeforeBuy": tryBeforeBuy,
//         "Price": price,
//         "GST": gst,
//         "FullPayment": fullPayment,
//         "AdvancePayment": advancePayment,
//         "ProductStatus": productStatus,
//         // "EstimateDeliveryDays": estimateDeliveryDays,
//         "ProductImageList":
//             List<dynamic>.from(productImageList.map((x) => x.toJson())),
//         "SimilarProductList":
//             List<dynamic>.from(similarProductList.map((x) => x.toJson())),
//         "metaldetails": List<dynamic>.from(metaldetails.map((x) => x.toJson())),
//         "decorativedetails":
//             List<dynamic>.from(decorativedetails.map((x) => x)),
//         "stonedetails": List<dynamic>.from(stonedetails.map((x) => x.toJson())),
//         "diamonddetails": List<dynamic>.from(diamonddetails.map((x) => x)),
//       };
// }
//
// class Metaldetail {
//   Metaldetail({
//     required this.metalWt,
//     required this.unitMetalWt,
//     required this.metalType,
//     required this.metalPurity,
//     required this.isHallmarked,
//   });
//
//   final String metalWt;
//   final String unitMetalWt;
//   final String metalType;
//   final String metalPurity;
//   final bool isHallmarked;
//
//   factory Metaldetail.fromJson(Map<String, dynamic> json) => Metaldetail(
//         metalWt: json["MetalWt"] ?? "",
//         unitMetalWt: json["UnitMetalWt"] ?? "",
//         metalType: json["MetalType"] ?? "",
//         metalPurity: json["MetalPurity"] ?? "",
//         isHallmarked: json["isHallmarked"] ?? false,
//       );
//
//   Map<String, dynamic> toJson() => {
//         "MetalWt": metalWt,
//         "UnitMetalWt": unitMetalWt,
//         "MetalType": metalType,
//         "MetalPurity": metalPurity,
//         "isHallmarked": isHallmarked,
//       };
// }
//
// class Decorativedetail {
//   Decorativedetail({
//     required this.decorativeItemName,
//     required this.decorativeItemWt,
//     required this.unitDecoItemWt,
//     // this.decorativeChargeableAmount,
//   });
//
//   final String decorativeItemName;
//   final String decorativeItemWt;
//   final String unitDecoItemWt;
//   // final dynamic decorativeChargeableAmount;
//
//   factory Decorativedetail.fromJson(Map<String, dynamic> json) =>
//       Decorativedetail(
//         decorativeItemName: json["DecorativeItemName"] ?? "",
//         decorativeItemWt: json["DecorativeItemWt"] ?? "",
//         unitDecoItemWt: json["UnitDecoItemWt"] ?? "",
//         // decorativeChargeableAmount: json["DecorativeChargeableAmount"] ,
//       );
//
//   Map<String, dynamic> toJson() => {
//         "DecorativeItemName": decorativeItemName,
//         "DecorativeItemWt": decorativeItemWt,
//         "UnitDecoItemWt": unitDecoItemWt,
//         // "DecorativeChargeableAmount": decorativeChargeableAmount,
//       };
// }
//
// class ProductImageList {
//   ProductImageList({
//     required this.srNo,
//     required this.imageName,
//     required this.imageLocation,
//   });
//
//   final int srNo;
//   final String imageName;
//   final String imageLocation;
//
//   factory ProductImageList.fromJson(Map<String, dynamic> json) =>
//       ProductImageList(
//         srNo: json["SrNo"] ?? 0,
//         imageName: json["ImageName"] ?? "",
//         imageLocation: json["ImageLocation"] ?? "",
//       );
//
//   Map<String, dynamic> toJson() => {
//         "SrNo": srNo,
//         "ImageName": imageName,
//         "ImageLocation": imageLocation,
//       };
// }
//
// class SimilarProductList {
//   SimilarProductList({
//     required this.srNo,
//     required this.name,
//     required this.price,
//     required this.productImage,
//   });
//
//   final int srNo;
//   final String name;
//   final String price;
//   final String productImage;
//
//   factory SimilarProductList.fromJson(Map<String, dynamic> json) =>
//       SimilarProductList(
//         srNo: json["SrNo"] ?? 0,
//         name: json["Name"] ?? "",
//         price: json["Price"] ?? "",
//         productImage: json["ProductImage"] ?? "",
//       );
//
//   Map<String, dynamic> toJson() => {
//         "SrNo": srNo,
//         "Name": name,
//         "Price": price,
//         "ProductImage": productImage,
//       };
// }
//
// class Diamonddetail {
//   Diamonddetail({
//     required this.stoneName,
//     required this.stoneWt,
//     required this.unitStoneWt,
//     // this.stoneShape,
//     // this.stoneQuality,
//     // this.stoneChargeableAmount,
//   });
//
//   final String stoneName;
//   final String stoneWt;
//   final String unitStoneWt;
//   // final dynamic stoneShape;
//   // final dynamic stoneQuality;
//   // final dynamic stoneChargeableAmount;
//
//   factory Diamonddetail.fromJson(Map<String, dynamic> json) => Diamonddetail(
//         stoneName: json["StoneName"] ?? "",
//         stoneWt: json["StoneWt"] ?? "",
//         unitStoneWt: json["UnitStoneWt"] ?? "",
//         // stoneShape: json["StoneShape"],
//         // stoneQuality: json["StoneQuality"],
//         // stoneChargeableAmount: json["StoneChargeableAmount"],
//       );
//
//   Map<String, dynamic> toJson() => {
//         "StoneName": stoneName,
//         "StoneWt": stoneWt,
//         "UnitStoneWt": unitStoneWt,
//         // "StoneShape": stoneShape,
//         // "StoneQuality": stoneQuality,
//         // "StoneChargeableAmount": stoneChargeableAmount,
//       };
// }
//
// class Stonedetail {
//   Stonedetail({
//     required this.stoneName,
//     required this.stoneWt,
//     required this.unitStoneWt,
//     required this.stoneChargeableAmount,
//   });
//
//   final String stoneName;
//   final String stoneWt;
//   final String unitStoneWt;
//   final String stoneChargeableAmount;
//
//   factory Stonedetail.fromJson(Map<String, dynamic> json) => Stonedetail(
//         stoneName: json["StoneName"] ?? "",
//         stoneWt: json["StoneWt"] ?? "",
//         unitStoneWt: json["UnitStoneWt"] ?? "",
//         stoneChargeableAmount: json["StoneChargeableAmount"] ?? "",
//       );
//
//   Map<String, dynamic> toJson() => {
//         "StoneName": stoneName,
//         "StoneWt": stoneWt,
//         "UnitStoneWt": unitStoneWt,
//         "StoneChargeableAmount": stoneChargeableAmount,
//       };
// }
