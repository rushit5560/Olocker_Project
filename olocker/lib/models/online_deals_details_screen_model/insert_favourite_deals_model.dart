import 'dart:convert';

InsertFavouriteDealModel insertFavouriteDealModelFromJson(String str) => InsertFavouriteDealModel.fromJson(json.decode(str));

String insertFavouriteDealModelToJson(InsertFavouriteDealModel data) => json.encode(data.toJson());

class InsertFavouriteDealModel {
  int statusCode;
  Data data;

  InsertFavouriteDealModel({
    required this.statusCode,
    required this.data,
  });

  factory InsertFavouriteDealModel.fromJson(Map<String, dynamic> json) => InsertFavouriteDealModel(
    statusCode: json["statusCode"] ?? 0,
    data: Data.fromJson(json["data"] ?? {}),
  );

  Map<String, dynamic> toJson() => {
    "statusCode": statusCode,
    "data": data.toJson(),
  };
}

class Data {
  int srno;
  bool success;
  ErrorInfo errorInfo;

  Data({
    required this.srno,
    required this.success,
    required this.errorInfo,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    srno: json["srno"] ?? 0,
    success: json["success"] ?? false,
    errorInfo: ErrorInfo.fromJson(json["error_info"] ?? {}),
  );

  Map<String, dynamic> toJson() => {
    "srno": srno,
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
