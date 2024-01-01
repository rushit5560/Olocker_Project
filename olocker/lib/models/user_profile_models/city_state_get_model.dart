import 'dart:convert';

CityStateGetModel cityStateGetModelFromJson(String str) =>
    CityStateGetModel.fromJson(json.decode(str));

class CityStateGetModel {
  int statusCode;
  Data data;

  CityStateGetModel({
    required this.statusCode,
    required this.data,
  });

  factory CityStateGetModel.fromJson(Map<String, dynamic> json) =>
      CityStateGetModel(
        statusCode: json["statusCode"] ?? 0,
        data: Data.fromJson(json["data"] ?? {}),
      );
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

class Data {
  StateCityDetails stateCityDetails;
  bool success;
  ErrorInfo errorInfo;

  Data({
    required this.stateCityDetails,
    required this.success,
    required this.errorInfo,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        stateCityDetails:
            StateCityDetails.fromJson(json["StateCityDetails"] ?? {}),
        success: json["success"] ?? false,
        errorInfo: ErrorInfo.fromJson(json["error_info"] ?? {}),
      );
}

class StateCityDetails {
  String stateId;
  String stateName;
  String cityId;
  String cityName;

  StateCityDetails({
    required this.stateId,
    required this.stateName,
    required this.cityId,
    required this.cityName,
  });

  factory StateCityDetails.fromJson(Map<String, dynamic> json) =>
      StateCityDetails(
        stateId: json["StateId"] ?? "",
        stateName: json["StateName"] ?? "",
        cityId: json["CityId"] ?? "",
        cityName: json["CityName"] ?? "",
      );
}
