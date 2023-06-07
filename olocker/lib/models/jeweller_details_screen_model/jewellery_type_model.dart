import 'dart:convert';

JewelleryTypeModel jewelleryTypeModelFromJson(String str) => JewelleryTypeModel.fromJson(json.decode(str));

String jewelleryTypeModelToJson(JewelleryTypeModel data) => json.encode(data.toJson());

class JewelleryTypeModel {
  JewelleryTypeModel({
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
  ErrorInfo errorInfo;

  factory JewelleryTypeModel.fromJson(Map<String, dynamic> json) => JewelleryTypeModel(
    // collections: List<CollectionItem>.from((json["Collections"] ?? []).map((x) => CollectionItem.fromJson(x ?? {}))),
    // categories: List<CategoryItem>.from((json["Categories"] ?? []).map((x) => CategoryItem.fromJson(x ?? {}))),
    // subCategories: List<SubCategoriesItem>.from((json["SubCategories"] ?? []).map((x) => SubCategoriesItem.fromJson(x ?? {}))),
    // productTypes: List<ProductTypeItem>.from((json["ProductTypes"] ?? []).map((x) => ProductTypeItem.fromJson(x ?? {}))),
    productTypeMen: List<ProductTypeItem>.from((json["ProductTypeMen"] ?? []).map((x) => ProductTypeItem.fromJson(x ?? {}))),
    productTypeWomen: List<ProductTypeItem>.from((json["ProductTypeWomen"] ?? []).map((x) => ProductTypeItem.fromJson(x ?? {}))),
    productTypeKids: List<ProductTypeItem>.from((json["ProductTypeKids"] ?? []).map((x) => ProductTypeItem.fromJson(x ?? {}))),
    success: json["success"] ?? false,
    errorInfo: ErrorInfo.fromJson(json["error_info"] ?? {}),
  );

  Map<String, dynamic> toJson() => {
    // "Collections": List<dynamic>.from(collections.map((x) => x.toJson())),
    // "Categories": List<dynamic>.from(categories.map((x) => x.toJson())),
    // "SubCategories": List<dynamic>.from(subCategories.map((x) => x.toJson())),
    // "ProductTypes": List<dynamic>.from(productTypes.map((x) => x.toJson())),
    "ProductTypeMen": List<dynamic>.from(productTypeMen.map((x) => x.toJson())),
    "ProductTypeWomen": List<dynamic>.from(productTypeWomen.map((x) => x.toJson())),
    // "ProductTypeKids": List<dynamic>.from(productTypeKids.map((x) => x)),
    "success": success,
    "error_info": errorInfo.toJson(),
  };
}

// class CollectionItem {
//   CollectionItem({
//     required this.collectionId,
//     required this.name,
//     required this.collectionImage,
//   });
//
//   String collectionId;
//   String name;
//   String collectionImage;
//
//   factory CollectionItem.fromJson(Map<String, dynamic> json) => CollectionItem(
//     collectionId: json["CollectionId"] ?? "",
//     name: json["Name"] ?? "",
//     collectionImage: json["CollectionImage"] ?? "",
//   );
//
//   Map<String, dynamic> toJson() => {
//     "CollectionId": collectionId,
//     "Name": name,
//     "CollectionImage": collectionImage,
//   };
// }

// class CategoryItem {
//   CategoryItem({
//     required this.categoryId,
//     required this.categoryName,
//     required this.categoryImage,
//   });
//
//   int categoryId;
//   String categoryName;
//   String categoryImage;
//
//   factory CategoryItem.fromJson(Map<String, dynamic> json) => CategoryItem(
//     categoryId: json["CategoryId"] ?? 0,
//     categoryName: json["CategoryName"] ?? "",
//     categoryImage: json["CategoryImage"] ?? "",
//   );
//
//   Map<String, dynamic> toJson() => {
//     "CategoryId": categoryId,
//     "CategoryName": categoryName,
//     "CategoryImage": categoryImage,
//   };
// }
//
// class SubCategoriesItem {
//   SubCategoriesItem({
//     required this.categoryId,
//     required this.subCategoryId,
//     required this.subCategoryName,
//   });
//
//   int categoryId;
//   int subCategoryId;
//   String subCategoryName;
//
//   factory SubCategoriesItem.fromJson(Map<String, dynamic> json) => SubCategoriesItem(
//     categoryId: json["CategoryId"] ?? 0,
//     subCategoryId: json["SubCategoryId"] ?? 0,
//     subCategoryName: json["SubCategoryName"] ?? "",
//   );
//
//   Map<String, dynamic> toJson() => {
//     "CategoryId": categoryId,
//     "SubCategoryId": subCategoryId,
//     "SubCategoryName": subCategoryName,
//   };
// }

class ProductTypeItem {
  ProductTypeItem({
    required this.name,
    required this.image,
  });

  String name;
  String image;

  factory ProductTypeItem.fromJson(Map<String, dynamic> json) => ProductTypeItem(
    name: json["Name"] ?? "",
    image: json["Image"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "Name": name,
    "Image": image,
  };
}

class ErrorInfo {
  ErrorInfo({
    // required this.errorType,
    required this.extraInfo,
    // required this.description,
    // required this.errorData,
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





