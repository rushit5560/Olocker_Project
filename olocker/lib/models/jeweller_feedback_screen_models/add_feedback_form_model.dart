import 'dart:convert';

AddFeedbackFormModel addFeedbackFormModelFromJson(String str) => AddFeedbackFormModel.fromJson(json.decode(str));

String addFeedbackFormModelToJson(AddFeedbackFormModel data) => json.encode(data.toJson());

class AddFeedbackFormModel {
  AddFeedbackFormModel({
    required this.success,
    required this.errorInfo,
  });

  bool success;
  ErrorInfo errorInfo;

  factory AddFeedbackFormModel.fromJson(Map<String, dynamic> json) => AddFeedbackFormModel(
    success: json["success"] ?? false,
    errorInfo: ErrorInfo.fromJson(json["error_info"] ?? {}),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "error_info": errorInfo.toJson(),
  };
}

class ErrorInfo {
  ErrorInfo({
    // this.errorType,
    required this.extraInfo,
    required this.description,
    // this.errorData,
  });

  // int errorType;
  String extraInfo;
  String description;
  // dynamic errorData;

  factory ErrorInfo.fromJson(Map<String, dynamic> json) => ErrorInfo(
    // errorType: json["error_type"],
    extraInfo: json["extra_info"] ?? "",
    description: json["description"] ?? "",
    // errorData: json["error_data"],
  );

  Map<String, dynamic> toJson() => {
    // "error_type": errorType,
    "extra_info": extraInfo,
    "description": description,
    // "error_data": errorData,
  };
}
