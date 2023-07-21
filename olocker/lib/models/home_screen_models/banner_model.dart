import 'dart:convert';

import '../error_info_model/error_info_model.dart';

BannerModel bannerModelFromJson(String str) =>
    BannerModel.fromJson(json.decode(str));

class BannerModel {
  int statusCode;
  Data data;

  BannerModel({
    required this.statusCode,
    required this.data,
  });

  factory BannerModel.fromJson(Map<String, dynamic> json) => BannerModel(
        statusCode: json["statusCode"] ?? 0,
        data: Data.fromJson(json["data"] ?? {}),
      );
}

class Data {
  List<NotificationBanner> notifications;
  bool success;
  ErrorInfoModel errorInfo;

  Data({
    required this.notifications,
    required this.success,
    required this.errorInfo,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        notifications: List<NotificationBanner>.from(
            (json["notifications"] ?? [])
                    .map((x) => NotificationBanner.fromJson(x)) ??
                {}),
        success: json["success"] ?? false,
        errorInfo: ErrorInfoModel.fromJson(json["error_info"] ?? {}),
      );
}

class NotificationBanner {
  int srNo;
  String title;
  String message;
  String imageLocation;
  String imageName;
  String startDate;
  String endDate;

  NotificationBanner({
    required this.srNo,
    required this.title,
    required this.message,
    required this.imageLocation,
    required this.imageName,
    required this.startDate,
    required this.endDate,
  });

  factory NotificationBanner.fromJson(Map<String, dynamic> json) =>
      NotificationBanner(
        srNo: json["srNo"] ?? 0,
        title: json["title"] ?? "",
        message: json["message"] ?? "",
        imageLocation: json["imageLocation"] ?? "",
        imageName: json["imageName"] ?? "",
        startDate: json["startDate"] ?? "",
        endDate: json["endDate"] ?? "",
      );
}
