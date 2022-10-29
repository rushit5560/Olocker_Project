import 'dart:convert';

EmiScheduleModel emiScheduleModelFromJson(String str) => EmiScheduleModel.fromJson(json.decode(str));

String emiScheduleModelToJson(EmiScheduleModel data) => json.encode(data.toJson());

class EmiScheduleModel {
  EmiScheduleModel({
    required this.emiSrNo,
    required this.loanApplicationId,
    required this.message,
    required this.success,
    required this.errorInfo,
  });

  int emiSrNo;
  String loanApplicationId;
  String message;
  bool success;
  ErrorInfo errorInfo;

  factory EmiScheduleModel.fromJson(Map<String, dynamic> json) => EmiScheduleModel(
    emiSrNo: json["emiSrNo"] ?? 0,
    loanApplicationId: json["LoanApplicationId"] ?? "",
    message: json["Message"] ?? "",
    success: json["success"] ?? false,
    errorInfo: ErrorInfo.fromJson(json["error_info"] ?? {}),
  );

  Map<String, dynamic> toJson() => {
    "emiSrNo": emiSrNo,
    "LoanApplicationId": loanApplicationId,
    "Message": message,
    "success": success,
    "error_info": errorInfo.toJson(),
  };
}

class ErrorInfo {
  ErrorInfo({
    required this.errorType,
    required this.extraInfo,
    required this.description,
    // required this.errorData,
  });

  int errorType;
  String extraInfo;
  String description;
  // dynamic errorData;

  factory ErrorInfo.fromJson(Map<String, dynamic> json) => ErrorInfo(
    errorType: json["error_type"] ?? 0,
    extraInfo: json["extra_info"] ?? "",
    description: json["description"] ?? "",
    // errorData: json["error_data"],
  );

  Map<String, dynamic> toJson() => {
    "error_type": errorType,
    "extra_info": extraInfo,
    "description": description,
    // "error_data": errorData,
  };
}
