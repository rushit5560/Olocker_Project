
import 'dart:convert';

import '../error_info_model/error_info_model.dart';

JewelleryCategoryModel jewelleryCategoryModelFromJson(String str) =>
    JewelleryCategoryModel.fromJson(json.decode(str));

class JewelleryCategoryModel {
  int statusCode;
  Data data;

  JewelleryCategoryModel({
    required this.statusCode,
    required this.data,
  });

  factory JewelleryCategoryModel.fromJson(Map<String, dynamic> json) =>
      JewelleryCategoryModel(
        statusCode: json["statusCode"] ?? 0,
        data: Data.fromJson(json["data"] ?? {}),
      );
}

class Data {
  List<GetPushCollectionItem> getPushCollection;
  List<GetPushOffer> getPushOffer;
  // List<dynamic> getPushSubCategory;
  bool success;
  ErrorInfoModel errorInfo;

  Data({
    required this.getPushCollection,
    required this.getPushOffer,
    // required this.getPushSubCategory,
    required this.success,
    required this.errorInfo,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        getPushCollection: List<GetPushCollectionItem>.from(
            (json["getPushCollection"] ?? [])
                .map((x) => GetPushCollectionItem.fromJson(x))),
        getPushOffer: List<GetPushOffer>.from(
            (json["getPushOffer"] ?? []).map((x) => GetPushOffer.fromJson(x))),
        // getPushSubCategory:
        //     List<dynamic>.from(json["getPushSubCategory"].map((x) => x)),
        success: json["success"] ?? false,
        errorInfo: ErrorInfoModel.fromJson(json["error_info"] ?? {}),
      );
}

class GetPushCollectionItem {
  int srNo;
  String name;
  String title;
  String description;
  bool isActive;
  int pushSortOrder;
  String imageurl;
  int productCount;

  GetPushCollectionItem({
    required this.srNo,
    required this.name,
    required this.title,
    required this.description,
    required this.isActive,
    required this.pushSortOrder,
    required this.imageurl,
    required this.productCount,
  });

  factory GetPushCollectionItem.fromJson(Map<String, dynamic> json) =>
      GetPushCollectionItem(
        srNo: json["SrNo"] ?? 0,
        name: json["Name"] ?? "",
        title: json["Title"] ?? "",
        description: json["Description"] ?? "",
        isActive: json["IsActive"] ?? false,
        pushSortOrder: json["PushSortOrder"] ?? 0,
        imageurl: json["Imageurl"] ?? "",
        productCount: json["ProductCount"] ?? 0,
      );
}

class GetPushOffer {
  int srNo;
  dynamic name;
  int pushSortOrder;
  String imageurl;
  dynamic description;

  GetPushOffer({
    required this.srNo,
    this.name,
    required this.pushSortOrder,
    required this.imageurl,
    this.description,
  });

  factory GetPushOffer.fromJson(Map<String, dynamic> json) => GetPushOffer(
        srNo: json["SrNo"] ?? 0,
        name: json["Name"] ?? "",
        pushSortOrder: json["PushSortOrder"] ?? 0,
        imageurl: json["Imageurl"] ?? "",
        description: json["Description"] ?? "",
      );
}
