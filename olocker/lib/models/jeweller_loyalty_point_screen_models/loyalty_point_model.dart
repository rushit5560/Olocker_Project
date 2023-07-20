// // import 'dart:convert';
// //
// // LoyaltyPointsModel loyaltyPointsModelFromJson(String str) =>
// //     LoyaltyPointsModel.fromJson(json.decode(str));
// //
// // String loyaltyPointsModelToJson(LoyaltyPointsModel data) =>
// //     json.encode(data.toJson());
// //
// // class LoyaltyPointsModel {
// //   LoyaltyPointsModel({
// //     required this.partnerPoint,
// //     required this.success,
// //     required this.errorInfo,
// //   });
// //
// //   List<PartnerPoint> partnerPoint;
// //   bool success;
// //   ErrorInfo errorInfo;
// //
// //   factory LoyaltyPointsModel.fromJson(Map<String, dynamic> json) =>
// //       LoyaltyPointsModel(
// //         partnerPoint: List<PartnerPoint>.from(
// //             (json["PartnerPoint"] ?? []).map((x) => PartnerPoint.fromJson(x))),
// //         success: json["success"] ?? false,
// //         errorInfo: ErrorInfo.fromJson(json["error_info"] ?? {}),
// //       );
// //
// //   Map<String, dynamic> toJson() => {
// //         "PartnerPoint": List<dynamic>.from(partnerPoint.map((x) => x.toJson())),
// //         "success": success,
// //         "error_info": errorInfo.toJson(),
// //       };
// // }
// //
// // class ErrorInfo {
// //   ErrorInfo({
// //     // this.errorType,
// //     required this.extraInfo,
// //     // this.description,
// //     // this.errorData,
// //   });
// //
// //   // int errorType;
// //   String extraInfo;
// //
// //   // String description;
// //   // dynamic errorData;
// //
// //   factory ErrorInfo.fromJson(Map<String, dynamic> json) => ErrorInfo(
// //         // errorType: json["error_type"],
// //         extraInfo: json["extra_info"] ?? "",
// //         // description: json["description"],
// //         // errorData: json["error_data"],
// //       );
// //
// //   Map<String, dynamic> toJson() => {
// //         // "error_type": errorType,
// //         "extra_info": extraInfo,
// //         // "description": description,
// //         // "error_data": errorData,
// //       };
// // }
//
//
//
// import 'dart:convert';
//
// LoyaltyPointsModel loyaltyPointsModelFromJson(String str) => LoyaltyPointsModel.fromJson(json.decode(str));
//
//
//
// class LoyaltyPointsModel {
//   int statusCode;
//   Data data;
//
//   LoyaltyPointsModel({
//     required this.statusCode,
//     required this.data,
//   });
//
//   factory LoyaltyPointsModel.fromJson(Map<String, dynamic> json) => LoyaltyPointsModel(
//     statusCode: json["statusCode"]??0,
//     data: Data.fromJson(json["data"]??{}),
//   );
//
// }
//
// class Data {
//   List<PartnerPoint> partnerPoint;
//   bool success;
//   ErrorInfo errorInfo;
//
//   Data({
//     required this.partnerPoint,
//     required this.success,
//     required this.errorInfo,
//   });
//
//   factory Data.fromJson(Map<String, dynamic> json) => Data(
//     partnerPoint: List<PartnerPoint>.from((json["partnerPoint"]??[]).map((x) => PartnerPoint.fromJson(x))??{}),
//     success: json["success"]??false,
//     errorInfo: ErrorInfo.fromJson(json["error_info"]??{}),
//   );
//
//
// }
//
//
//
// class ErrorInfo {
//   ErrorInfo({
//     // this.errorType,
//     required this.extraInfo,
//     // this.description,
//     // this.errorData,
//   });
//
//   // int errorType;
//   String extraInfo;
//
//   // String description;
//   // dynamic errorData;
//
//   factory ErrorInfo.fromJson(Map<String, dynamic> json) => ErrorInfo(
//     // errorType: json["error_type"],
//     extraInfo: json["extra_info"] ?? "",
//     // description: json["description"],
//     // errorData: json["error_data"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     // "error_type": errorType,
//     "extra_info": extraInfo,
//     // "description": description,
//     // "error_data": errorData,
//   };
// }
//
//
// class PartnerPoint {
//   PartnerPoint({
//     required this.partner,
//     required this.totalPoints,
//     required this.valuePerPoint,
//     required this.totalReedemedPoint,
//     required this.totalRemainingPoint,
//     required this.totalExpirePoint,
//     required this.logoUrl,
//     required this.partnerSrNo,
//     required this.pointsEarnedSummary,
//     required this.pointsRedeemedSummary,
//     required this.expirePointModels,
//   });
//
//   String partner;
//   String totalPoints;
//   String valuePerPoint;
//   String totalReedemedPoint;
//   String totalRemainingPoint;
//   int totalExpirePoint;
//   String logoUrl;
//   String partnerSrNo;
//   List<PointsEarnedSummary> pointsEarnedSummary;
//   List<PointsRedeemedSummary> pointsRedeemedSummary;
//   List<ExpirePointModel> expirePointModels;
//
//   factory PartnerPoint.fromJson(Map<String, dynamic> json) => PartnerPoint(
//     partner: json["partner"] ?? "",
//     totalPoints: json["totalPoints"].toString(),
//     valuePerPoint: json["valuePerPoint"].toString(),
//     totalReedemedPoint: (json["totalReedemedPoint"] ?? 0).toString(),
//     totalRemainingPoint: json["totalRemainingPoint"].toString(),
//     totalExpirePoint: json["totalExpirePoint"]??0,
//     logoUrl: json["logoUrl"] ?? "",
//     partnerSrNo: json["PartnerSrNo"].toString(),
//     pointsEarnedSummary: List<PointsEarnedSummary>.from(
//         (json["PointsEarnedSummary"] ?? [])
//             .map((x) => PointsEarnedSummary.fromJson(x))),
//     pointsRedeemedSummary: List<PointsRedeemedSummary>.from(
//         (json["PointsRedeemedSummary"] ?? [])
//             .map((x) => PointsRedeemedSummary.fromJson(x))),
//     expirePointModels: List<ExpirePointModel>.from(
//         (json["expirePointModels"] ?? [])
//             .map((x) => ExpirePointModel.fromJson(x))),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "Partner": partner,
//     "TotalPoints": totalPoints,
//     "ValuePerPoint": valuePerPoint,
//     "TotalReedemedPoint": totalReedemedPoint,
//     "TotalRemainingPoint": totalRemainingPoint,
//     "LogoUrl": logoUrl,
//     "PartnerSrNo": partnerSrNo,
//     "PointsEarnedSummary":
//     List<dynamic>.from(pointsEarnedSummary.map((x) => x.toJson())),
//     "expirePointModels":
//     List<dynamic>.from(expirePointModels.map((x) => x.toJson())),
//     // "PointsRedeemedSummary": List<dynamic>.from(pointsRedeemedSummary.map((x) => x)),
//   };
// }
//
// class ExpirePointModel {
//   String pointExpiryDate;
//   double points;
//
//   ExpirePointModel({
//     required this.pointExpiryDate,
//     required this.points,
//   });
//
//   factory ExpirePointModel.fromJson(Map<String, dynamic> json) =>
//       ExpirePointModel(
//         pointExpiryDate: json["PointExpiryDate"] ?? "",
//         points: json["points"] ?? 0.0,
//       );
//
//   Map<String, dynamic> toJson() => {
//     "PointExpiryDate": pointExpiryDate,
//     "points": points,
//   };
// }
//
// class PointsEarnedSummary {
//   PointsEarnedSummary({
//     required this.points,
//     required this.dateAdded,
//     required this.creditType,
//     required this.pointExpiryDate,
//   });
//
//   int points;
//   String dateAdded;
//   String creditType;
//   String pointExpiryDate;
//
//   factory PointsEarnedSummary.fromJson(Map<String, dynamic> json) =>
//       PointsEarnedSummary(
//         points: json["Points"] ?? 0,
//         dateAdded: json["DateAdded"] ?? "",
//         creditType: json["CreditType"] ?? "",
//         pointExpiryDate: json["PointExpiryDate"] ?? "",
//       );
//
//   Map<String, dynamic> toJson() => {
//     "Points": points,
//     "DateAdded": dateAdded,
//     "CreditType": creditType,
//     "PointExpiryDate": pointExpiryDate,
//   };
// }
//
// class PointsRedeemedSummary {
//   String dateRedeemed;
//   int pointsRdeemed;
//   String redeemtionType;
//
//   PointsRedeemedSummary({
//     required this.dateRedeemed,
//     required this.pointsRdeemed,
//     required this.redeemtionType,
//   });
//
//   factory PointsRedeemedSummary.fromJson(Map<String, dynamic> json) =>
//       PointsRedeemedSummary(
//         dateRedeemed: json["DateRedeemed"] ?? "",
//         pointsRdeemed: json["PointsRdeemed"] ?? 0,
//         redeemtionType: json["RedeemtionType"] ?? "",
//       );
// }
//
//

// To parse this JSON data, do
//
//     final loyaltyPointsModel = loyaltyPointsModelFromJson(jsonString);

import 'dart:convert';

LoyaltyPointsModel loyaltyPointsModelFromJson(String str) =>
    LoyaltyPointsModel.fromJson(json.decode(str));

class LoyaltyPointsModel {
  int statusCode;
  Data data;

  LoyaltyPointsModel({
    required this.statusCode,
    required this.data,
  });

  factory LoyaltyPointsModel.fromJson(Map<String, dynamic> json) =>
      LoyaltyPointsModel(
        statusCode: json["statusCode"] ?? 0,
        data: Data.fromJson(json["data"] ?? {}),
      );
}

class Data {
  List<PartnerPoint> partnerPoint;
  bool success;
  ErrorInfo errorInfo;

  Data({
    required this.partnerPoint,
    required this.success,
    required this.errorInfo,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        partnerPoint: List<PartnerPoint>.from(
            (json["partnerPoint"] ?? []).map((x) => PartnerPoint.fromJson(x)) ??
                {}),
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

class PartnerPoint {
  String partner;
  String totalPoints;
  String valuePerPoint;
  String totalReedemedPoint;
  String totalRemainingPoint;
  int totalExpirePoint;
  String logoUrl;
  String expirePoint;
  String partnerSrNo;
  List<PointsEarnedSummary> pointsEarnedSummary;
  List<PointsRedeemedSummary> pointsRedeemedSummary;
  List<ExpirePointModel> expirePointModels;

  PartnerPoint({
    required this.partner,
    required this.totalPoints,
    required this.valuePerPoint,
    required this.totalReedemedPoint,
    required this.totalRemainingPoint,
    required this.totalExpirePoint,
    required this.logoUrl,
    required this.expirePoint,
    required this.partnerSrNo,
    required this.pointsEarnedSummary,
    required this.pointsRedeemedSummary,
    required this.expirePointModels,
  });

  factory PartnerPoint.fromJson(Map<String, dynamic> json) => PartnerPoint(
        partner: json["partner"] ?? "",
        totalPoints: (json["totalPoints"] ?? 0).toString(),
        valuePerPoint: (json["valuePerPoint"] ?? 0.0 ?? 0).toString(),
        totalReedemedPoint: (json["totalReedemedPoint"] ?? 0).toString(),
        totalRemainingPoint: (json["totalRemainingPoint"] ?? 0).toString(),
        totalExpirePoint: json["totalExpirePoint"] ?? 0,
        logoUrl: json["logoUrl"] ?? "",
        expirePoint: (json["expirePoint"] ?? 0).toString(),
        partnerSrNo: (json["partnerSrNo"] ?? 0).toString(),
        pointsEarnedSummary: List<PointsEarnedSummary>.from(
            (json["pointsEarnedSummary"] ?? [])
                    .map((x) => PointsEarnedSummary.fromJson(x)) ??
                {}),
        pointsRedeemedSummary: List<PointsRedeemedSummary>.from(
            (json["PointsRedeemedSummary"] ?? [])
                    .map((x) => PointsRedeemedSummary.fromJson(x)) ??
                {}),
        expirePointModels: List<ExpirePointModel>.from(
            (json["expirePointModels"] ?? [])
                    .map((x) => ExpirePointModel.fromJson(x)) ??
                {}),
      );
}

class ExpirePointModel {
  String pointExpiryDate;
  String points;

  ExpirePointModel({
    required this.pointExpiryDate,
    required this.points,
  });

  factory ExpirePointModel.fromJson(Map<String, dynamic> json) =>
      ExpirePointModel(
        pointExpiryDate: json["pointExpiryDate"] ?? "",
        points: (json["points"] ?? 0.0 ?? 0).toString(),
      );
}

class PointsRedeemedSummary {
  String dateRedeemed;
  int pointsRdeemed;
  String redeemtionType;

  PointsRedeemedSummary({
    required this.dateRedeemed,
    required this.pointsRdeemed,
    required this.redeemtionType,
  });

  factory PointsRedeemedSummary.fromJson(Map<String, dynamic> json) =>
      PointsRedeemedSummary(
        dateRedeemed: json["DateRedeemed "] ?? "",
        pointsRdeemed: json["PointsRdeemed"] ?? 0,
        redeemtionType: json["RedeemtionType"] ?? "",
      );
}

class PointsEarnedSummary {
  int points;
  String dateAdded;
  String creditType;
  String pointExpiryDate;

  PointsEarnedSummary({
    required this.points,
    required this.dateAdded,
    required this.creditType,
    required this.pointExpiryDate,
  });

  factory PointsEarnedSummary.fromJson(Map<String, dynamic> json) =>
      PointsEarnedSummary(
        points: json["points"] ?? 0,
        dateAdded: json["dateAdded"] ?? "",
        creditType: json["creditType"] ?? "",
        pointExpiryDate: json["pointExpiryDate"] ?? "",
      );
}
