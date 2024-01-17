import 'dart:convert';

import '../error_info_model/error_info_model.dart';

AboutDetailsModel aboutDetailsModelFromJson(String str) =>
    AboutDetailsModel.fromJson(json.decode(str));

class AboutDetailsModel {
  int statusCode;
  Data data;

  AboutDetailsModel({
    required this.statusCode,
    required this.data,
  });

  factory AboutDetailsModel.fromJson(Map<String, dynamic> json) =>
      AboutDetailsModel(
        statusCode: json["statusCode"] ?? 0,
        data: Data.fromJson(json["data"] ?? {}),
      );
}

class Data {
  AboutYourSelf aboutYourSelf;
  bool ratingGivenByCustomer;
  bool success;
  ErrorInfoModel errorInfo;

  Data({
    required this.aboutYourSelf,
    required this.ratingGivenByCustomer,
    required this.success,
    required this.errorInfo,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        aboutYourSelf: AboutYourSelf.fromJson(json["AboutYourSelf"] ?? {}),
        ratingGivenByCustomer: json["ratingGivenByCustomer"] ?? false,
        success: json["success"] ?? false,
        errorInfo: ErrorInfoModel.fromJson(json["error_info"] ?? {}),
      );
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

  factory AboutYourSelf.fromJson(Map<String, dynamic> json) => AboutYourSelf(
        srNo: json["SrNo"] ?? 0,
        partnerSrNo: json["PartnerSrNo"] ?? 0,
        aboutShowroom: json["AboutShowroom"] ?? "",
        showRoomImage1: json["ShowRoomImage1"] ?? "",
        showRoomImage2: json["ShowRoomImage2"] ?? "",
        showRoomImage3: json["ShowRoomImage3"] ?? "",
        ownerImage1: json["OwnerImage1"] ?? "",
        ownerImage2: json["OwnerImage2"] ?? "",
        ownerImage3: json["ownerImage3"] ?? "",
        owner1: json["Owner1"] ?? "",
        owner2: json["Owner2"] ?? "",
        owner3: json["owner3"] ?? "",
        firstOwnerDescription: json["FirstOwnerDescription"] ?? "",
        secondOwnerDescription: json["SecondOwnerDescription"] ?? "",
        thirdOwnerDescription: json["thirdOwnerDescription"] ?? "",
        address: json["Address"] ?? "",
        contactEmail: json["ContactEmail"] ?? "",
        contactPhone: json["ContactPhone"] ?? 0,
        stateName: json["StateName"] ?? "",
        cityName: json["CityName"] ?? "",
        partnerLogo: json["PartnerLogo"] ?? "",
        companyName: json["CompanyName"] ?? "",
        displayName: json["DisplayName"] ?? "",
        ownersName: json["OwnersName"] ?? "",
        retailerCode: json["RetailerCode"] ?? "",
      );
}
