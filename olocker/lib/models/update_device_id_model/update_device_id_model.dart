import 'dart:convert';

UpdateDeviceIdModel updateDeviceIdModelFromJson(String str) =>
    UpdateDeviceIdModel.fromJson(json.decode(str));

class UpdateDeviceIdModel {
  int statusCode;
  UpdateDeviceId data;

  UpdateDeviceIdModel({
    required this.statusCode,
    required this.data,
  });

  factory UpdateDeviceIdModel.fromJson(Map<String, dynamic> json) =>
      UpdateDeviceIdModel(
        statusCode: json["statusCode"] ?? 0,
        data: UpdateDeviceId.fromJson(json["data"] ?? {}),
      );
}

class UpdateDeviceId {
  bool success;
  ErrorInfo errorInfo;

  UpdateDeviceId({
    required this.success,
    required this.errorInfo,
  });

  factory UpdateDeviceId.fromJson(Map<String, dynamic> json) => UpdateDeviceId(
        success: json["success"] ?? false,
        errorInfo: ErrorInfo.fromJson(json["error_info"] ?? {}),
      );
}

class ErrorInfo {
  int errorType;
  String extraInfo;
  String description;
  String errorData;

  ErrorInfo({
    required this.errorType,
    required this.extraInfo,
    required this.description,
    required this.errorData,
  });

  factory ErrorInfo.fromJson(Map<String, dynamic> json) => ErrorInfo(
        errorType: json["error_type"] ?? 0,
        extraInfo: json["extra_info"] ?? "",
        description: json["description"] ?? "",
        errorData: json["error_data"] ?? "",
      );
}
