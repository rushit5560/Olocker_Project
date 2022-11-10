import 'dart:convert';

AnnouncementOfferModel announcementOfferModelFromJson(String str) => AnnouncementOfferModel.fromJson(json.decode(str));

String announcementOfferModelToJson(AnnouncementOfferModel data) => json.encode(data.toJson());

class AnnouncementOfferModel {
  AnnouncementOfferModel({
    required this.getPushOffer,
    required this.success,
    required this.errorInfo,
  });

  List<GetPushOfferItem> getPushOffer;
  bool success;
  ErrorInfo errorInfo;

  factory AnnouncementOfferModel.fromJson(Map<String, dynamic> json) => AnnouncementOfferModel(
    getPushOffer: List<GetPushOfferItem>.from((json["GetPushOffer"] ?? []).map((x) => GetPushOfferItem.fromJson(x ?? {}))),
    success: json["success"] ?? false,
    errorInfo: ErrorInfo.fromJson(json["error_info"] ?? {}),
  );

  Map<String, dynamic> toJson() => {
    "GetPushOffer": List<dynamic>.from(getPushOffer.map((x) => x.toJson())),
    "success": success,
    "error_info": errorInfo.toJson(),
  };
}

class ErrorInfo {
  ErrorInfo({
    // required this.errorType,
    required this.extraInfo,
    // required this.description,
    // required this.errorData,
  });

  // int errorType;
  String extraInfo;
  // String description;
  // dynamic errorData;

  factory ErrorInfo.fromJson(Map<String, dynamic> json) => ErrorInfo(
    // errorType: json["error_type"],
    extraInfo: json["extra_info"] ?? "",
    // description: json["description"],
    // errorData: json["error_data"],
  );

  Map<String, dynamic> toJson() => {
    // "error_type": errorType,
    "extra_info": extraInfo,
    // "description": description,
    // "error_data": errorData,
  };
}

class GetPushOfferItem {
  GetPushOfferItem({
    required this.srNo,
    required this.name,
    required this.pushSortOrder,
    required this.imageurl,
  });

  String srNo;
  String name;
  String pushSortOrder;
  String imageurl;

  factory GetPushOfferItem.fromJson(Map<String, dynamic> json) => GetPushOfferItem(
    srNo: json["SrNo"].toString(),
    name: json["Name"] ?? "",
    pushSortOrder: json["PushSortOrder"].toString(),
    imageurl: json["Imageurl"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "SrNo": srNo,
    "Name": name,
    "PushSortOrder": pushSortOrder,
    "Imageurl": imageurl,
  };
}
