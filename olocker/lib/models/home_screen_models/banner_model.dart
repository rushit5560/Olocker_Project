import 'dart:convert';

BannerModel bannerModelFromJson(String str) => BannerModel.fromJson(json.decode(str));

String bannerModelToJson(BannerModel data) => json.encode(data.toJson());

class BannerModel {
  BannerModel({
    required this.notifications,
    required this.success,
    required this.errorInfo,
  });

  List<NotificationBanner> notifications;
  bool success;
  ErrorInfo errorInfo;

  factory BannerModel.fromJson(Map<String, dynamic> json) => BannerModel(
    notifications: List<NotificationBanner>.from(json["Notifications"].map((x) => NotificationBanner.fromJson(x ?? {}))),
    success: json["success"] ?? false,
    errorInfo: ErrorInfo.fromJson(json["error_info"] ?? {}),
  );

  Map<String, dynamic> toJson() => {
    "Notifications": List<dynamic>.from(notifications.map((x) => x.toJson())),
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

class NotificationBanner {
  NotificationBanner({
    required this.srNo,
    required this.title,
    required this.message,
    required this.imageLocation,
    required this.imageName,
    required this.startDate,
    required this.endDate,
  });

  String srNo;
  String title;
  String message;
  String imageLocation;
  String imageName;
  DateTime startDate;
  DateTime endDate;

  factory NotificationBanner.fromJson(Map<String, dynamic> json) => NotificationBanner(
    srNo: json["SrNo"].toString(),
    title: json["Title"] ?? "",
    message: json["Message"] ?? "",
    imageLocation: json["ImageLocation"] ?? "",
    imageName: json["ImageName"] ?? "",
    startDate: DateTime.parse(json["StartDate"] ?? DateTime.now()),
    endDate: DateTime.parse(json["EndDate"] ?? DateTime.now()),
  );

  Map<String, dynamic> toJson() => {
    "SrNo": srNo,
    "Title": title,
    "Message": message,
    "ImageLocation": imageLocation,
    "ImageName": imageName,
    "StartDate": startDate.toIso8601String(),
    "EndDate": endDate.toIso8601String(),
  };
}
