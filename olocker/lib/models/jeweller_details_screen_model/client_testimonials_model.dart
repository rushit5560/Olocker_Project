import 'dart:convert';

import '../error_info_model/error_info_model.dart';

ClientTestimonialsModel clientTestimonialsModelFromJson(String str) =>
    ClientTestimonialsModel.fromJson(json.decode(str));

class ClientTestimonialsModel {
  int statusCode;
  Data data;

  ClientTestimonialsModel({
    required this.statusCode,
    required this.data,
  });

  factory ClientTestimonialsModel.fromJson(Map<String, dynamic> json) =>
      ClientTestimonialsModel(
        statusCode: json["statusCode"] ?? 0,
        data: Data.fromJson(json["data"] ?? {}),
      );
}

class Data {
  List<Testimonial> testimonials;
  bool success;
  ErrorInfoModel errorInfo;

  Data({
    required this.testimonials,
    required this.success,
    required this.errorInfo,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        testimonials: List<Testimonial>.from(
            (json["testimonials"] ?? []).map((x) => Testimonial.fromJson(x))),
        success: json["success"] ?? false,
        errorInfo: ErrorInfoModel.fromJson(json["error_info"] ?? {}),
      );
}

class Testimonial {
  int srNo;
  int partnerSrNo;
  String clientName;
  String title;
  String testimonials;
  String url;

  Testimonial({
    required this.srNo,
    required this.partnerSrNo,
    required this.clientName,
    required this.title,
    required this.testimonials,
    required this.url,
  });

  factory Testimonial.fromJson(Map<String, dynamic> json) => Testimonial(
        srNo: json["srNo"] ?? 0,
        partnerSrNo: json["partnerSrNo"] ?? 0,
        clientName: json["clientName"] ?? "",
        title: json["title"] ?? "",
        testimonials: json["testimonials"] ?? "",
        url: json["url"] ?? "",
      );
}
