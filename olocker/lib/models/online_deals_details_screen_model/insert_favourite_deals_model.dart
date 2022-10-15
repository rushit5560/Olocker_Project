import 'dart:convert';

InsertFavouriteDealModel insertFavouriteDealModelFromJson(String str) => InsertFavouriteDealModel.fromJson(json.decode(str));

String insertFavouriteDealModelToJson(InsertFavouriteDealModel data) => json.encode(data.toJson());

class InsertFavouriteDealModel {
  InsertFavouriteDealModel({
    required this.srno,
    required this.success,
    required this.errorInfo,
  });

  int srno;
  bool success;
  ErrorInfo errorInfo;

  factory InsertFavouriteDealModel.fromJson(Map<String, dynamic> json) => InsertFavouriteDealModel(
    srno: json["Srno"] ?? 0,
    success: json["success"] ?? false,
    errorInfo: ErrorInfo.fromJson(json["error_info"] ?? {}),
  );

  Map<String, dynamic> toJson() => {
    "Srno": srno,
    "success": success,
    "error_info": errorInfo.toJson(),
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
