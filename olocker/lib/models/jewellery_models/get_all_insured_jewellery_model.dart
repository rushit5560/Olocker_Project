// To parse this JSON data, do
//
//     final getUnInsuredOrnamentModel = getUnInsuredOrnamentModelFromJson(jsonString);

import 'dart:convert';

GetInsuredOrnamentModel getUnInsuredOrnamentModelFromJson(String str) =>
    GetInsuredOrnamentModel.fromJson(json.decode(str));

String getUnInsuredOrnamentModelToJson(GetInsuredOrnamentModel data) =>
    json.encode(data.toJson());

class GetInsuredOrnamentModel {
  GetInsuredOrnamentModel({
    required this.insuredOrnament,
    required this.success,
    required this.errorInfo,
  });

  final List<InsuredOrnament> insuredOrnament;
  final bool success;
  final ErrorInfo errorInfo;

  factory GetInsuredOrnamentModel.fromJson(Map<String, dynamic> json) =>
      GetInsuredOrnamentModel(
        insuredOrnament: List<InsuredOrnament>.from(
            (json["insuredOrnament"] ?? [])
                .map((x) => InsuredOrnament.fromJson(x))),
        success: json["success"] ?? false,
        errorInfo: ErrorInfo.fromJson((json["error_info"] ?? {})),
      );

  Map<String, dynamic> toJson() => {
        "InsuredOrnament":
            List<dynamic>.from(insuredOrnament.map((x) => x.toJson())),
        "success": success,
        "error_info": errorInfo.toJson(),
      };
}

class ErrorInfo {
  ErrorInfo({
    required this.errorType,
    required this.extraInfo,
    required this.description,
    required this.errorData,
  });

  int errorType;
  String extraInfo;
  String description;
  String errorData;

  factory ErrorInfo.fromJson(Map<String, dynamic> json) => ErrorInfo(
        errorType: json["error_type"] ?? 0,
        extraInfo: json["extra_info"] ?? "",
        description: json["description"] ?? "",
        errorData: json["error_data"].toString(),
      );

  Map<String, dynamic> toJson() => {
        "error_type": errorType,
        "extra_info": extraInfo,
        "description": description,
        "error_data": errorData,
      };
}

class InsuredOrnament {
  InsuredOrnament({
    required this.srNo,
    required this.custSrNo,
    required this.custOraSrNo,
    required this.itemName,
    required this.description,
    required this.grossWt,
    required this.daysToExpire,
    required this.hallmarked,
    required this.url,
    required this.ornamentImagesSrNo,
    required this.insuredForAmt,
    required this.purchaseDate,
    required this.estValue,
    required this.expiryDate,
    required this.policyNo,
    required this.policySrNo,
    required this.isClaim,
    required this.oid,
    required this.customerName,
    required this.mobileNo,
    required this.coi,
    required this.invoiceName,
    required this.pdfUrl,
    required this.isClaimEligible,
    required this.calimMsg,
  });

  final int srNo;
  final int custSrNo;
  final int custOraSrNo;
  final String itemName;
  final String description;
  final String grossWt;
  final String daysToExpire;
  final String hallmarked;
  final String url;
  final String ornamentImagesSrNo;
  final double insuredForAmt;
  final String purchaseDate;
  final double estValue;
  final String expiryDate;
  final String policyNo;
  final int policySrNo;
  final bool isClaim;
  final String oid;
  final String customerName;
  final String mobileNo;
  final String coi;
  final String invoiceName;
  final String pdfUrl;
  final bool isClaimEligible;
  final String calimMsg;

  factory InsuredOrnament.fromJson(Map<String, dynamic> json) =>
      InsuredOrnament(
        srNo: json["SrNo"] ?? 0,
        custSrNo: json["CustSrNo"] ?? 0,
        custOraSrNo: json["CustOraSrNo"] ?? 0,
        itemName: json["ItemName"] ?? "",
        description: json["Description"] ?? "",
        grossWt: json["GrossWt"] ?? "",
        daysToExpire: json["DaysToExpire"] ?? "",
        hallmarked: json["Hallmarked"] ?? "",
        url: json["url"] ?? "",
        ornamentImagesSrNo: json["OrnamentImagesSrNo"] ?? "",
        insuredForAmt: (json["InsuredForAmt"] ?? 0).toDouble(),
        purchaseDate: json["PurchaseDate"] ?? "",
        estValue: (json["EstValue"] ?? 0).toDouble(),
        expiryDate: json["ExpiryDate"] ?? "",
        policyNo: json["PolicyNo"] ?? "",
        policySrNo: json["PolicySrNo"] ?? 0,
        isClaim: json["IsClaim"] ?? false,
        oid: json["OID"] ?? "",
        customerName: json["CustomerName"] ?? "",
        mobileNo: json["MobileNo"] ?? "",
        coi: json["COI"] ?? "",
        invoiceName: json["InvoiceName"] ?? "",
        pdfUrl: json["PdfUrl"] ?? "",
        isClaimEligible: json["IsClaimEligible"] ?? false,
        calimMsg: json["CalimMsg"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "SrNo": srNo,
        "CustSrNo": custSrNo,
        "CustOraSrNo": custOraSrNo,
        "ItemName": itemName,
        "Description": description,
        "GrossWt": grossWt,
        "DaysToExpire": daysToExpire,
        "Hallmarked": hallmarked,
        "url": url,
        "OrnamentImagesSrNo": ornamentImagesSrNo,
        "InsuredForAmt": insuredForAmt,
        "PurchaseDate": purchaseDate,
        "EstValue": estValue,
        "ExpiryDate": expiryDate,
        "PolicyNo": policyNo,
        "PolicySrNo": policySrNo,
        "IsClaim": isClaim,
        "OID": oid,
        "CustomerName": customerName,
        "MobileNo": mobileNo,
        "COI": coi,
        "InvoiceName": invoiceName,
        "PdfUrl": pdfUrl,
        "IsClaimEligible": isClaimEligible,
        "CalimMsg": calimMsg,
      };
}
