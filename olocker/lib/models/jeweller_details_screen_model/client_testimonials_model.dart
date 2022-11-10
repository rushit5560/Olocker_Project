import 'dart:convert';

ClientTestimonialsModel clientTestimonialsModelFromJson(String str) => ClientTestimonialsModel.fromJson(json.decode(str));

String clientTestimonialsModelToJson(ClientTestimonialsModel data) => json.encode(data.toJson());

class ClientTestimonialsModel {
  ClientTestimonialsModel({
    required this.testimonials,
    required this.success,
    required this.errorInfo,
  });

  List<Testimonial> testimonials;
  bool success;
  ErrorInfo errorInfo;

  factory ClientTestimonialsModel.fromJson(Map<String, dynamic> json) => ClientTestimonialsModel(
    testimonials: List<Testimonial>.from((json["Testimonials"] ?? []).map((x) => Testimonial.fromJson(x ?? {}))),
    success: json["success"] ?? false,
    errorInfo: ErrorInfo.fromJson(json["error_info"] ?? {}),
  );

  Map<String, dynamic> toJson() => {
    "Testimonials": List<dynamic>.from(testimonials.map((x) => x.toJson())),
    "success": success,
    "error_info": errorInfo.toJson(),
  };
}

class ErrorInfo {
  ErrorInfo({
    // this.errorType,
    required this.extraInfo,
    // this.description,
    // this.errorData,
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

class Testimonial {
  Testimonial({
    required this.srNo,
    required this.partnerSrNo,
    required this.clientName,
    required this.title,
    required this.testimonials,
    // required this.url,
  });

  int srNo;
  int partnerSrNo;
  String clientName;
  String title;
  String testimonials;
  // dynamic url;

  factory Testimonial.fromJson(Map<String, dynamic> json) => Testimonial(
    srNo: json["SrNo"] ?? 0,
    partnerSrNo: json["PartnerSrNo"] ?? 0,
    clientName: json["ClientName"] ?? "",
    title: json["Title"] ?? "",
    testimonials: json["Testimonials"] ?? "",
    // url: json["Url"],
  );

  Map<String, dynamic> toJson() => {
    "SrNo": srNo,
    "PartnerSrNo": partnerSrNo,
    "ClientName": clientName,
    "Title": title,
    "Testimonials": testimonials,
    // "Url": url,
  };
}
