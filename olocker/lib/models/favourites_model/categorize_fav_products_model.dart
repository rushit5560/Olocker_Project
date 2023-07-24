// To parse this JSON data, do
//
//     final categorizeFavProductsModel = categorizeFavProductsModelFromJson(jsonString);

import 'dart:convert';

import 'favourites_model.dart';

CategorizeFavProductsModel categorizeFavProductsModelFromJson(String str) =>
    CategorizeFavProductsModel.fromJson(json.decode(str));


class CategorizeFavProductsModel {
  CategorizeFavProductsModel({
    required this.products,
  });

  final List<CategorizedProduct> products;

  factory CategorizeFavProductsModel.fromJson(Map<String, dynamic> json) =>
      CategorizeFavProductsModel(
        products: List<CategorizedProduct>.from(
            json["products"].map((x) => CategorizedProduct.fromJson(x))),
      );


}

class CategorizedProduct {
  CategorizedProduct({
    required this.itemTypeName,
    required this.favProductsList,
  });

   String itemTypeName;
   List<FavProduct> favProductsList;

  factory CategorizedProduct.fromJson(Map<String, dynamic> json) =>
      CategorizedProduct(
        itemTypeName: json["ItemTypeName"],
        favProductsList: List<FavProduct>.from(
            json["FavProductsList"].map((x) => FavProduct.fromJson(x))),
      );


}
