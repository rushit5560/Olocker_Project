
class ErrorInfoModel {
  ErrorInfoModel({
    required this.errorType,
    required this.extraInfo,
    required this.description,
    this.errorData,
  });

  final int errorType;
  final String extraInfo;
  final String description;
  final dynamic errorData;

  factory ErrorInfoModel.fromJson(Map<String, dynamic> json) => ErrorInfoModel(
    errorType: json["error_type"] ?? 0,
    extraInfo: json["extra_info"] ?? "",
    description: json["description"] ?? "",
    errorData: json["error_data"] ?? "",
  );
}
