import 'dart:convert';

GoldPriceModel goldPriceModelFromJson(String str) => GoldPriceModel.fromJson(json.decode(str));

String goldPriceModelToJson(GoldPriceModel data) => json.encode(data.toJson());

class GoldPriceModel {
  GoldPriceModel({
    required this.ibjAratesList,
    required this.success,
    required this.errorInfo,
  });

  List<IbjAratesList> ibjAratesList;
  bool success;
  ErrorInfo errorInfo;

  factory GoldPriceModel.fromJson(Map<String, dynamic> json) => GoldPriceModel(
    ibjAratesList: List<IbjAratesList>.from((json["IBJAratesList"] ?? []).map((x) => IbjAratesList.fromJson(x ?? {}))),
    success: json["success"] ?? false,
    errorInfo: ErrorInfo.fromJson(json["error_info"] ?? {}),
  );

  Map<String, dynamic> toJson() => {
    "IBJAratesList": List<dynamic>.from(ibjAratesList.map((x) => x.toJson())),
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

class IbjAratesList {
  IbjAratesList({
    required this.srNo,
    required this.date,
    required this.metal,
    required this.purity,
    required this.pm,
  });

  int srNo;
  String date;
  String metal;
  int purity;
  int pm;

  factory IbjAratesList.fromJson(Map<String, dynamic> json) => IbjAratesList(
    srNo: json["SrNo"] ?? 0,
    date: json["Date"].toString(),
    metal: json["Metal"] ?? "",
    purity: json["Purity"] ?? 0,
    pm: json["PM"] ?? 0,
  );

  Map<String, dynamic> toJson() => {
    "SrNo": srNo,
    "Date": date,
    "Metal": metal,
    "Purity": purity,
    "PM": pm,
  };
}
