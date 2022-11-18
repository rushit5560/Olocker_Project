import 'dart:convert';

AboutDetailsModel aboutDetailsModelFromJson(String str) =>
    AboutDetailsModel.fromJson(json.decode(str));

String aboutDetailsModelToJson(AboutDetailsModel data) =>
    json.encode(data.toJson());

class AboutDetailsModel {
  AboutDetailsModel({
    required this.aboutYourSelf,
    required this.ratingGivenByCustomer,
    required this.success,
    required this.errorInfo,
  });

  final AboutYourSelf aboutYourSelf;
  final bool ratingGivenByCustomer;
  final bool success;
  final ErrorInfo errorInfo;

  factory AboutDetailsModel.fromJson(Map<String, dynamic> json) =>
      AboutDetailsModel(
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
    required this.contactEmail,
    required this.contactPhone,
    required this.stateName,
    required this.cityName,
    required this.partnerLogo,
    required this.companyName,
    required this.displayName,
    required this.ownersName,
    required this.retailerCode,
    required this.branches,
  });

  final int srNo;
  final int partnerSrNo;
  final String aboutShowroom;
  final String showRoomImage1;
  final String showRoomImage2;
  final String showRoomImage3;
  final String ownerImage1;
  final String ownerImage2;
  final String ownerImage3;
  final String owner1;
  final String owner2;
  final String owner3;
  final String firstOwnerDescription;
  final String secondOwnerDescription;
  final String thirdOwnerDescription;
  final String address;
  final String contactEmail;
  final String contactPhone;
  final String stateName;
  final String cityName;
  final String partnerLogo;
  final String companyName;
  final String displayName;
  final String ownersName;
  final String retailerCode;
  final List<dynamic> branches;

  factory AboutYourSelf.fromJson(Map<String, dynamic> json) => AboutYourSelf(
        srNo: json["SrNo"] ?? 0,
        partnerSrNo: json["PartnerSrNo"] ?? 0,
        aboutShowroom: json["AboutShowroom"] ?? "",
        showRoomImage1: json["ShowRoomImage1"] ?? "",
        showRoomImage2: json["ShowRoomImage2"] ?? "",
        showRoomImage3: json["ShowRoomImage3"] ?? "",
        ownerImage1: json["OwnerImage1"] ?? "",
        ownerImage2: json["OwnerImage2"] ?? "",
        ownerImage3: json["OwnerImage3"] ?? "",
        owner1: json["Owner1"] ?? "",
        owner2: json["Owner2"] ?? "",
        owner3: json["Owner3"] ?? "",
        firstOwnerDescription: json["FirstOwnerDescription"] ?? "",
        secondOwnerDescription: json["SecondOwnerDescription"] ?? "",
        thirdOwnerDescription: json["ThirdOwnerDescription"] ?? "",
        address: json["Address"] ?? "",
        contactEmail: json["ContactEmail"] ?? "",
        contactPhone: json["ContactPhone"] ?? 0,
        stateName: json["StateName"] ?? "",
        cityName: json["CityName"] ?? "",
        partnerLogo: json["PartnerLogo"] ?? "",
        companyName: json["CompanyName"] ?? "",
        displayName: json["DisplayName"] ?? "",
        ownersName: json["OwnersName"] ?? "",
        retailerCode: json["RetailerCode"] ?? 0,
        branches: List<dynamic>.from((json["Branches"] ?? []).map((x) => x)),
      );

  get sliderImageList => null;

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
        "ContactEmail": contactEmail,
        "ContactPhone": contactPhone,
        "StateName": stateName,
        "CityName": cityName,
        "PartnerLogo": partnerLogo,
        "CompanyName": companyName,
        "DisplayName": displayName,
        "OwnersName": ownersName,
        "RetailerCode": retailerCode,
        "Branches": List<dynamic>.from(branches.map((x) => x)),
      };
}

class ErrorInfo {
  ErrorInfo({
    required this.errorType,
    required this.extraInfo,
    required this.description,
    this.errorData,
  });

  final int errorType;
  final String extraInfo;
  final String description;
  final dynamic errorData;

  factory ErrorInfo.fromJson(Map<String, dynamic> json) => ErrorInfo(
        errorType: json["error_type"] ?? 0,
        extraInfo: json["extra_info"] ?? "",
        description: json["description"] ?? "",
        errorData: json["error_data"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "error_type": errorType,
        "extra_info": extraInfo,
        "description": description,
        "error_data": errorData,
      };
}
