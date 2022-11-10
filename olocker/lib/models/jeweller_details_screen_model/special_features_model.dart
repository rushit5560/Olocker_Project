import 'dart:convert';

SpecialFeaturesModel specialFeaturesModelFromJson(String str) => SpecialFeaturesModel.fromJson(json.decode(str));

String specialFeaturesModelToJson(SpecialFeaturesModel data) => json.encode(data.toJson());

class SpecialFeaturesModel {
  SpecialFeaturesModel({
    required this.specialFeature,
    required this.success,
    required this.errorInfo,
  });

  List<SpecialFeatureItem> specialFeature;
  bool success;
  ErrorInfo errorInfo;

  factory SpecialFeaturesModel.fromJson(Map<String, dynamic> json) => SpecialFeaturesModel(
    specialFeature: List<SpecialFeatureItem>.from((json["SpecialFeature"] ?? []).map((x) => SpecialFeatureItem.fromJson(x ?? {}))),
    success: json["success"] ?? false,
    errorInfo: ErrorInfo.fromJson(json["error_info"] ?? {}),
  );

  Map<String, dynamic> toJson() => {
    "SpecialFeature": List<dynamic>.from(specialFeature.map((x) => x.toJson())),
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

class SpecialFeatureItem {
  SpecialFeatureItem({
    required this.srNo,
    required this.partnerSrNo,
    required this.feature,
    required this.featureId,
    required this.percentage,
    required this.totalDays,
    required this.iconUrl,
  });

  int srNo;
  int partnerSrNo;
  String feature;
  int featureId;
  String percentage;
  String totalDays;
  String iconUrl;

  factory SpecialFeatureItem.fromJson(Map<String, dynamic> json) => SpecialFeatureItem(
    srNo: json["SrNo"] ?? 0,
    partnerSrNo: json["PartnerSrNo"] ?? 0,
    feature: json["Feature"] ?? "",
    featureId: json["FeatureId"] ?? 0,
    percentage: json["Percentage"].toString(),
    totalDays: json["TotalDays"].toString(),
    iconUrl: json["IconURL"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "SrNo": srNo,
    "PartnerSrNo": partnerSrNo,
    "Feature": feature,
    "FeatureId": featureId,
    "Percentage": percentage,
    "TotalDays": totalDays,
    "IconURL": iconUrl,
  };
}
