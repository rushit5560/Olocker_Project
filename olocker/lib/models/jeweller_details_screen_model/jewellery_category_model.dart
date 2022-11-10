import 'dart:convert';

JewelleryCategoryModel jewelleryCategoryModelFromJson(String str) => JewelleryCategoryModel.fromJson(json.decode(str));

String jewelleryCategoryModelToJson(JewelleryCategoryModel data) => json.encode(data.toJson());

class JewelleryCategoryModel {
  JewelleryCategoryModel({
    required this.getPushCollection,
    // required this.getPushOffer,
    // required this.getPushSubCategory,
    required this.success,
    required this.errorInfo,
  });

  List<GetPushCollectionItem> getPushCollection;
  // List<dynamic> getPushOffer;
  // List<GetPushSubCategory> getPushSubCategory;
  bool success;
  ErrorInfo errorInfo;

  factory JewelleryCategoryModel.fromJson(Map<String, dynamic> json) => JewelleryCategoryModel(
    getPushCollection: List<GetPushCollectionItem>.from((json["GetPushCollection"] ?? []).map((x) => GetPushCollectionItem.fromJson(x))),
    // getPushOffer: List<dynamic>.from((json["GetPushOffer"] ?? []).map((x) => x)),
    // getPushSubCategory: List<GetPushSubCategory>.from(json["GetPushSubCategory"].map((x) => GetPushSubCategory.fromJson(x))),
    success: json["success"],
    errorInfo: ErrorInfo.fromJson(json["error_info"]),
  );

  Map<String, dynamic> toJson() => {
    "GetPushCollection": List<dynamic>.from(getPushCollection.map((x) => x.toJson())),
    // "GetPushOffer": List<dynamic>.from(getPushOffer.map((x) => x)),
    // "GetPushSubCategory": List<dynamic>.from(getPushSubCategory.map((x) => x.toJson())),
    "success": success,
    "error_info": errorInfo.toJson(),
  };
}

class ErrorInfo {
  ErrorInfo({
    // this.errorType,
    required this.extraInfo,
    // this.description,
    // this.errorData,
  });

  // int errorType;
  String extraInfo;
  // String description;
  // dynamic errorData;

  factory ErrorInfo.fromJson(Map<String, dynamic> json) => ErrorInfo(
    // errorType: json["error_type"],
    extraInfo: json["extra_info"] ?? "",
    // description: json["description"],
    // errorData: json["error_data"],
  );

  Map<String, dynamic> toJson() => {
    // "error_type": errorType,
    "extra_info": extraInfo,
    // "description": description,
    // "error_data": errorData,
  };
}

class GetPushCollectionItem {
  GetPushCollectionItem({
    required this.srNo,
    required this.name,
    required this.title,
    required this.description,
    required this.isActive,
    required this.pushSortOrder,
    required this.imageurl,
  });

  String srNo;
  String name;
  String title;
  String description;
  bool isActive;
  String pushSortOrder;
  String imageurl;

  factory GetPushCollectionItem.fromJson(Map<String, dynamic> json) => GetPushCollectionItem(
    srNo: json["SrNo"].toString(),
    name: json["Name"] ?? "",
    title: json["Title"] ?? "",
    description: json["Description"] ?? "",
    isActive: json["IsActive"] ?? false,
    pushSortOrder: json["PushSortOrder"].toString(),
    imageurl: json["Imageurl"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "SrNo": srNo,
    "Name": name,
    "Title": title,
    "Description": description,
    "IsActive": isActive,
    "PushSortOrder": pushSortOrder,
    "Imageurl": imageurl,
  };
}

// class GetPushSubCategory {
//   GetPushSubCategory({
//     this.srNo,
//     this.name,
//     this.pushSortOrder,
//     this.imageurl,
//     this.categorySrNo,
//     this.category,
//   });
//
//   int srNo;
//   String name;
//   int pushSortOrder;
//   String imageurl;
//   dynamic categorySrNo;
//   String category;
//
//   factory GetPushSubCategory.fromJson(Map<String, dynamic> json) => GetPushSubCategory(
//     srNo: json["SrNo"],
//     name: json["Name"],
//     pushSortOrder: json["PushSortOrder"],
//     imageurl: json["Imageurl"],
//     categorySrNo: json["CategorySrNo"],
//     category: json["Category"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "SrNo": srNo,
//     "Name": name,
//     "PushSortOrder": pushSortOrder,
//     "Imageurl": imageurl,
//     "CategorySrNo": categorySrNo,
//     "Category": category,
//   };
// }
