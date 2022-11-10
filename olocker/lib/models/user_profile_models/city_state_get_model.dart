// To parse this JSON data, do
//
//     final cityStateGetModel = cityStateGetModelFromJson(jsonString);

import 'dart:convert';

CityStateGetModel cityStateGetModelFromJson(String str) =>
    CityStateGetModel.fromJson(json.decode(str));

String cityStateGetModelToJson(CityStateGetModel data) =>
    json.encode(data.toJson());

class CityStateGetModel {
  CityStateGetModel({
    required this.stateCityDetails,
    required this.success,
    required this.errorInfo,
  });

  final StateCityDetails stateCityDetails;
  final bool success;
  final ErrorInfo errorInfo;

  factory CityStateGetModel.fromJson(Map<String, dynamic> json) =>
      CityStateGetModel(
        stateCityDetails:
            StateCityDetails.fromJson((json["StateCityDetails"] ?? {})),
        success: json["success"] ?? false,
        errorInfo: ErrorInfo.fromJson((json["error_info"] ?? {})),
      );

  Map<String, dynamic> toJson() => {
        "StateCityDetails": stateCityDetails.toJson(),
        "success": success,
        "error_info": errorInfo.toJson(),
      };
}

class ErrorInfo {
  ErrorInfo({
    required this.errorType,
    required this.extraInfo,
    required this.description,
    this.errorData,
  });

  final int errorType;
  final String extraInfo;
  final String description;
  final dynamic errorData;

  factory ErrorInfo.fromJson(Map<String, dynamic> json) => ErrorInfo(
        errorType: json["error_type"] ?? 0,
        extraInfo: json["extra_info"] ?? "",
        description: json["description"] ?? "",
        errorData: json["error_data"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "error_type": errorType,
        "extra_info": extraInfo,
        "description": description,
        "error_data": errorData,
      };
}

class StateCityDetails {
  StateCityDetails({
    required this.stateId,
    required this.stateName,
    required this.cityId,
    required this.cityName,
  });

  final int stateId;
  final String stateName;
  final int cityId;
  final String cityName;

  factory StateCityDetails.fromJson(Map<String, dynamic> json) =>
      StateCityDetails(
        stateId: json["StateId"] ?? 0,
        stateName: json["StateName"] ?? "",
        cityId: json["CityId"] ?? 0,
        cityName: json["CityName"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "StateId": stateId,
        "StateName": stateName,
        "CityId": cityId,
        "CityName": cityName,
      };
}
