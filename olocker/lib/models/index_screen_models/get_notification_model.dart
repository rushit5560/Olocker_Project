import 'dart:convert';

NotificationCountModel notificationCountModelFromJson(String str) => NotificationCountModel.fromJson(json.decode(str));

String notificationCountModelToJson(NotificationCountModel data) => json.encode(data.toJson());

class NotificationCountModel {
  NotificationCountModel({
    required this.parNotificationCount,
    required this.success,
    required this.errorInfo,
  });

  ParNotificationCount parNotificationCount;
  bool success;
  ErrorInfo errorInfo;

  factory NotificationCountModel.fromJson(Map<String, dynamic> json) => NotificationCountModel(
    parNotificationCount: ParNotificationCount.fromJson(json["ParNotificationCount"] ?? {}),
    success: json["success"] ?? false,
    errorInfo: ErrorInfo.fromJson(json["error_info"] ?? {}),
  );

  Map<String, dynamic> toJson() => {
    "ParNotificationCount": parNotificationCount.toJson(),
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

class ParNotificationCount {
  ParNotificationCount({
    required this.numberofNotification,
  });

  int numberofNotification;

  factory ParNotificationCount.fromJson(Map<String, dynamic> json) => ParNotificationCount(
    numberofNotification: json["NumberofNotification"] ?? 0,
  );

  Map<String, dynamic> toJson() => {
    "NumberofNotification": numberofNotification,
  };
}
