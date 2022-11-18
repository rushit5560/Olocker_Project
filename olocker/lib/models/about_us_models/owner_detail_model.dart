class OwnerDetailModel {
  OwnerDetailModel({
    required this.ownerName,
    required this.ownerDescription,
    required this.ownerImage,
  });

  final String ownerName;
  final String ownerDescription;
  final String ownerImage;

  factory OwnerDetailModel.fromJson(Map<String, dynamic> json) =>
      OwnerDetailModel(
       ownerName: json["ownerName"] ?? "",
       ownerDescription: json["ownerDescription"] ?? "",
       ownerImage: json["ownerImage"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "ownerName":ownerName,
        "ownerDescription": ownerDescription,
        "ownerImage": ownerImage,
       
      };
}
