import 'dart:convert';

CheckEligibilityModel checkEligibilityModelFromJson(String str) => CheckEligibilityModel.fromJson(json.decode(str));

String checkEligibilityModelToJson(CheckEligibilityModel data) => json.encode(data.toJson());

class CheckEligibilityModel {
  CheckEligibilityModel({
    required this.emiSrNo,
    required this.emiTenorOptions,
    required this.loanApplicationId,
    required this.message,
    required this.success,
    required this.errorInfo,
  });

  int emiSrNo;
  List<EmiTenorOption> emiTenorOptions;
  String loanApplicationId;
  String message;
  bool success;
  ErrorInfo errorInfo;

  factory CheckEligibilityModel.fromJson(Map<String, dynamic> json) => CheckEligibilityModel(
    emiSrNo: json["emiSrNo"] ?? 0,
    emiTenorOptions: List<EmiTenorOption>.from((json["EMITenorOptions"]! ?? []).map((x) => EmiTenorOption.fromJson(x ?? {}))),
    loanApplicationId: json["LoanApplicationId"] ?? "",
    message: json["Message"] ?? "",
    success: json["success"] ?? false,
    errorInfo: ErrorInfo.fromJson(json["error_info"] ?? {}),
  );

  Map<String, dynamic> toJson() => {
    "emiSrNo": emiSrNo,
    "EMITenorOptions": List<dynamic>.from(emiTenorOptions.map((x) => x.toJson())),
    "LoanApplicationId": loanApplicationId,
    "Message": message,
    "success": success,
    "error_info": errorInfo.toJson(),
  };
}

class EmiTenorOption {
  EmiTenorOption({
    required this.tenorMonth,
    required this.emiMonthly,
    required this.emiMonthlyLow,
    required this.emiMonthlyHigh,
    required this.emiEligibleAmount,
  });

  String tenorMonth;
  String emiMonthly;
  String emiMonthlyLow;
  String emiMonthlyHigh;
  String emiEligibleAmount;

  factory EmiTenorOption.fromJson(Map<String, dynamic> json) => EmiTenorOption(
    tenorMonth: json["TenorMonth"].toString(),
    emiMonthly: json["EMIMonthly"].toString(),
    emiMonthlyLow: json["EMIMonthlyLow"].toString(),
    emiMonthlyHigh: json["EMIMonthlyHigh"].toString(),
    emiEligibleAmount: json["EMIEligibleAmount"].toString(),
  );

  Map<String, dynamic> toJson() => {
    "TenorMonth": tenorMonth,
    "EMIMonthly": emiMonthly,
    "EMIMonthlyLow": emiMonthlyLow,
    "EMIMonthlyHigh": emiMonthlyHigh,
    "EMIEligibleAmount": emiEligibleAmount,
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
