import 'dart:convert';

AboutYourSelfModel aboutYourSelfModelFromJson(String str) => AboutYourSelfModel.fromJson(json.decode(str));

String aboutYourSelfModelToJson(AboutYourSelfModel data) => json.encode(data.toJson());

class AboutYourSelfModel {
  AboutYourSelfModel({
    required this.aboutYourSelf,
    required this.ratingGivenByCustomer,
    required this.success,
    required this.errorInfo,
  });

  AboutYourSelf aboutYourSelf;
  bool ratingGivenByCustomer;
  bool success;
  ErrorInfo errorInfo;

  factory AboutYourSelfModel.fromJson(Map<String, dynamic> json) => AboutYourSelfModel(
    aboutYourSelf: AboutYourSelf.fromJson(json["AboutYourSelf"] ?? {}),
    ratingGivenByCustomer: json["RatingGivenByCustomer"] ?? false,
    success: json["success"] ?? false,
    errorInfo: ErrorInfo.fromJson(json["error_info"] ?? {}),
  );

  Map<String, dynamic> toJson() => {
    "AboutYourSelf": aboutYourSelf.toJson(),
    "RatingGivenByCustomer": ratingGivenByCustomer,
    "success": success,
    "error_info": errorInfo.toJson(),
  };
}

class AboutYourSelf {
  AboutYourSelf({
    required this.srNo,
    required this.partnerSrNo,
    required this.aboutShowroom,
    required this.showRoomImage1,
    required this.showRoomImage2,
    required this.showRoomImage3,
    required this.ownerImage1,
    required this.ownerImage2,
    required this.ownerImage3,
    required this.owner1,
    required this.owner2,
    required this.owner3,
    required this.firstOwnerDescription,
    required this.secondOwnerDescription,
    required this.thirdOwnerDescription,
    required this.address,
    required this.contactemail,
    required this.contactphone,
    required this.statename,
    required this.cityname,
    required this.partnerlogo,
    required this.companyName,
    required this.displayName,
    required this.ownersName,
    required this.retailerCode,
    // required this.branches,
  });

  int srNo;
  int partnerSrNo;
  String aboutShowroom;
  String showRoomImage1;
  String showRoomImage2;
  String showRoomImage3;
  String ownerImage1;
  String ownerImage2;
  String ownerImage3;
  String owner1;
  String owner2;
  String owner3;
  String firstOwnerDescription;
  String secondOwnerDescription;
  String thirdOwnerDescription;
  String address;
  String contactemail;
  String contactphone;
  String statename;
  String cityname;
  String partnerlogo;
  String companyName;
  String displayName;
  String ownersName;
  String retailerCode;
  // List<dynamic> branches;

  factory AboutYourSelf.fromJson(Map<String, dynamic> json) => AboutYourSelf(
    srNo: json["SrNo"] ?? 0,
    partnerSrNo: json["PartnerSrNo"] ?? 0,
    aboutShowroom: json["AboutShowroom"] ?? "",
    showRoomImage1: json["ShowRoomImage1"] ?? "",
    showRoomImage2: json["ShowRoomImage2"] ?? "",
    showRoomImage3: json["ShowRoomImage3"] ?? "",
    ownerImage1: json["OwnerImage1"] ?? "",
    ownerImage2: json["OwnerImage2"] ?? "",
    ownerImage3: json["OwnerImage3"].toString(),
    owner1: json["Owner1"] ?? "",
    owner2: json["Owner2"] ?? "",
    owner3: json["Owner3"].toString(),
    firstOwnerDescription: json["FirstOwnerDescription"] ?? "",
    secondOwnerDescription: json["SecondOwnerDescription"] ?? "",
    thirdOwnerDescription: json["ThirdOwnerDescription"].toString(),
    address: json["Address"] ?? "",
    contactemail: json["contactemail"] ?? "",
    contactphone: json["contactphone"] ?? "",
    statename: json["statename"] ?? "",
    cityname: json["cityname"] ?? "",
    partnerlogo: json["partnerlogo"] ?? "",
    companyName: json["CompanyName"] ?? "",
    displayName: json["DisplayName"] ?? "",
    ownersName: json["OwnersName"] ?? "",
    retailerCode: json["RetailerCode"] ?? "",
    // branches: List<dynamic>.from(json["Branches"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "SrNo": srNo,
    "PartnerSrNo": partnerSrNo,
    "AboutShowroom": aboutShowroom,
    "ShowRoomImage1": showRoomImage1,
    "ShowRoomImage2": showRoomImage2,
    "ShowRoomImage3": showRoomImage3,
    "OwnerImage1": ownerImage1,
    "OwnerImage2": ownerImage2,
    "OwnerImage3": ownerImage3,
    "Owner1": owner1,
    "Owner2": owner2,
    "Owner3": owner3,
    "FirstOwnerDescription": firstOwnerDescription,
    "SecondOwnerDescription": secondOwnerDescription,
    "ThirdOwnerDescription": thirdOwnerDescription,
    "Address": address,
    "contactemail": contactemail,
    "contactphone": contactphone,
    "statename": statename,
    "cityname": cityname,
    "partnerlogo": partnerlogo,
    "CompanyName": companyName,
    "DisplayName": displayName,
    "OwnersName": ownersName,
    "RetailerCode": retailerCode,
    // "Branches": List<dynamic>.from(branches.map((x) => x)),
  };
}

class ErrorInfo {
  ErrorInfo({
    // this.errorType,
    // this.extraInfo,
    required this.description,
    // this.errorData,
  });

  // int errorType;
  // String extraInfo;
  String description;
  // dynamic errorData;

  factory ErrorInfo.fromJson(Map<String, dynamic> json) => ErrorInfo(
    // errorType: json["error_type"],
    // extraInfo: json["extra_info"],
    description: json["description"] ?? "",
    // errorData: json["error_data"],
  );

  Map<String, dynamic> toJson() => {
    // "error_type": errorType,
    // "extra_info": extraInfo,
    "description": description,
    // "error_data": errorData,
  };
}
