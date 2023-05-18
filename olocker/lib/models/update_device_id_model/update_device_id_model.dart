// To parse this JSON data, do
//
//     final updateDeviceId = updateDeviceIdFromJson(jsonString);

import 'dart:convert';

UpdateDeviceIdModel updateDeviceIdFromJson(String str) =>
    UpdateDeviceIdModel.fromJson(json.decode(str));

class UpdateDeviceIdModel {
  bool success;

  UpdateDeviceIdModel({
    required this.success,
  });

  factory UpdateDeviceIdModel.fromJson(Map<String, dynamic> json) =>
      UpdateDeviceIdModel(
        success: json["success"],
      );
}
