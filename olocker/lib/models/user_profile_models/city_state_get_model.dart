import 'dart:convert';

CityStateGetModel cityStateGetModelFromJson(String str) => CityStateGetModel.fromJson(json.decode(str));

String cityStateGetModelToJson(CityStateGetModel data) => json.encode(data.toJson());

class CityStateGetModel {
  int statusCode;
  Data data;

  CityStateGetModel({
    required this.statusCode,
    required this.data,
  });

  factory CityStateGetModel.fromJson(Map<String, dynamic> json) => CityStateGetModel(
    statusCode: json["statusCode"] ?? 0,
    data: Data.fromJson(json["data"] ?? {}),
  );

  Map<String, dynamic> toJson() => {
    "statusCode": statusCode,
    "data": data.toJson(),
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
    stateCityDetails: StateCityDetails.fromJson(json["stateCityDetails"] ?? {}),
    success: json["success"] ?? false,
    errorInfo: ErrorInfo.fromJson(json["error_info"] ?? {}),
  );

  Map<String, dynamic> toJson() => {
    "stateCityDetails": stateCityDetails.toJson(),
    "success": success,
    "error_info": errorInfo.toJson(),
  };
}

class StateCityDetails {
  int stateId;
  String stateName;
  int cityId;
  String cityName;

  StateCityDetails({
    required this.stateId,
    required this.stateName,
    required this.cityId,
    required this.cityName,
  });

  factory StateCityDetails.fromJson(Map<String, dynamic> json) => StateCityDetails(
    stateId: json["stateId"] ?? 0,
    stateName: json["stateName"] ?? "",
    cityId: json["cityId"] ?? 0,
    cityName: json["cityName"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "stateId": stateId,
    "stateName": stateName,
    "cityId": cityId,
    "cityName": cityName,
  };
}

