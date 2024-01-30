import 'dart:convert';

import '../error_info_model/error_info_model.dart';

JewelleryTypeModel jewelleryTypeModelFromJson(String str) =>
    JewelleryTypeModel.fromJson(json.decode(str));

class JewelleryTypeModel {
  int statusCode;
  Data data;

  JewelleryTypeModel({
    required this.statusCode,
    required this.data,
  });

  factory JewelleryTypeModel.fromJson(Map<String, dynamic> json) =>
      JewelleryTypeModel(
        statusCode: json["statusCode"] ?? 0,
        data: Data.fromJson(json["data"] ?? {}),
      );
}

class Data {
  Data({
    // required this.collections,
    // required this.categories,
    // required this.subCategories,
    // required this.productTypes,
    required this.productTypeMen,
    required this.productTypeWomen,
    required this.productTypeKids,
    required this.success,
    required this.errorInfo,
  });

  // List<CollectionItem> collections;
  // List<CategoryItem> categories;
  // List<SubCategoriesItem> subCategories;
  // List<ProductTypeItem> productTypes;
  List<ProductTypeItem> productTypeMen;
  List<ProductTypeItem> productTypeWomen;
  List<ProductTypeItem> productTypeKids;
  bool success;
  ErrorInfoModel errorInfo;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        // collections: List<CollectionItem>.from((json["Collections"] ?? []).map((x) => CollectionItem.fromJson(x ?? {}))),
        // categories: List<CategoryItem>.from((json["Categories"] ?? []).map((x) => CategoryItem.fromJson(x ?? {}))),
        // subCategories: List<SubCategoriesItem>.from((json["SubCategories"] ?? []).map((x) => SubCategoriesItem.fromJson(x ?? {}))),
        // productTypes: List<ProductTypeItem>.from((json["ProductTypes"] ?? []).map((x) => ProductTypeItem.fromJson(x ?? {}))),
        productTypeMen: List<ProductTypeItem>.from(
            (json["productTypeMen"] ?? [])
                .map((x) => ProductTypeItem.fromJson(x ?? {}))),
        productTypeWomen: List<ProductTypeItem>.from(
            (json["productTypeWomen"] ?? [])
                .map((x) => ProductTypeItem.fromJson(x ?? {}))),
        productTypeKids: List<ProductTypeItem>.from(
            (json["productTypeKids"] ?? [])
                .map((x) => ProductTypeItem.fromJson(x ?? {}))),
        success: json["success"] ?? false,
        errorInfo: ErrorInfoModel.fromJson(json["error_info"] ?? {}),
      );
}

class ProductTypeItem {
  String name;
  String image;
  int? productCount;

  ProductTypeItem({
    required this.name,
    required this.image,
    this.productCount,
  });

  factory ProductTypeItem.fromJson(Map<String, dynamic> json) =>
      ProductTypeItem(
        name: json["Name"] ?? "",
        image: json["Image"] ?? "",
        productCount: json["count"] ?? 0,
      );
}
