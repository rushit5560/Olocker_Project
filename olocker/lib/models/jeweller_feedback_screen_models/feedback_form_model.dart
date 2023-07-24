// import 'dart:convert';
//
// FeedbackFormModel feedbackFormModelFromJson(String str) => FeedbackFormModel.fromJson(json.decode(str));
//
// String feedbackFormModelToJson(FeedbackFormModel data) => json.encode(data.toJson());
//
// class FeedbackFormModel {
//   FeedbackFormModel({
//     required this.ratingQuestionList,
//     required this.success,
//     required this.errorInfo,
//   });
//
//   List<RatingQuestionList> ratingQuestionList;
//   bool success;
//   ErrorInfo errorInfo;
//
//   factory FeedbackFormModel.fromJson(Map<String, dynamic> json) => FeedbackFormModel(
//     ratingQuestionList: List<RatingQuestionList>.from((json["RatingQuestionList"] ?? []).map((x) => RatingQuestionList.fromJson(x))),
//     success: json["success"] ?? false,
//     errorInfo: ErrorInfo.fromJson(json["error_info"] ?? {}),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "RatingQuestionList": List<dynamic>.from(ratingQuestionList.map((x) => x.toJson())),
//     "success": success,
//     "error_info": errorInfo.toJson(),
//   };
// }
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
// class RatingQuestionList {
//   RatingQuestionList({
//     required this.srNo,
//     required this.question,
//     required this.questionType,
//     required this.answer,
//   });
//
//   int srNo;
//   String question;
//   String questionType;
//   List<Answer> answer;
//
//   factory RatingQuestionList.fromJson(Map<String, dynamic> json) => RatingQuestionList(
//     srNo: json["SrNo"] ?? 0,
//     question: json["Question"] ?? "",
//     questionType: json["QuestionType"] ?? "",
//     answer: List<Answer>.from((json["Answer"] ?? []).map((x) => Answer.fromJson(x))),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "SrNo": srNo,
//     "Question": question,
//     "QuestionType": questionType,
//     "Answer": List<dynamic>.from(answer.map((x) => x.toJson())),
//   };
// }
//
// class Answer {
//   Answer({
//     required this.srNo,
//     required this.questionAnswer,
//     required this.isSelected,
//
//   });
//
//   int srNo;
//   String questionAnswer;
//   bool isSelected;
//
//   factory Answer.fromJson(Map<String, dynamic> json) => Answer(
//     srNo: json["SrNo"] ?? 0,
//     questionAnswer: json["QuestionAnswer"] ?? "",
//     isSelected : false,
//   );
//
//   Map<String, dynamic> toJson() => {
//     "SrNo": srNo,
//     "QuestionAnswer": questionAnswer,
//   };
// }
//
//
//

import 'dart:convert';

import '../error_info_model/error_info_model.dart';

FeedbackFormModel feedbackFormModelFromJson(String str) =>
    FeedbackFormModel.fromJson(json.decode(str));

class FeedbackFormModel {
  int statusCode;
  Data data;

  FeedbackFormModel({
    required this.statusCode,
    required this.data,
  });

  factory FeedbackFormModel.fromJson(Map<String, dynamic> json) =>
      FeedbackFormModel(
        statusCode: json["statusCode"] ?? false,
        data: Data.fromJson(json["data"] ?? {}),
      );
}

class Data {
  List<RatingQuestionList> ratingQuestionList;
  bool success;
  ErrorInfoModel errorInfo;

  Data({
    required this.ratingQuestionList,
    required this.success,
    required this.errorInfo,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        ratingQuestionList: List<RatingQuestionList>.from(
            (json["ratingQuestionList"] ?? [])
                .map((x) => RatingQuestionList.fromJson(x))),
        success: json["success"] ?? false,
        errorInfo: ErrorInfoModel.fromJson(json["error_info"] ?? {}),
      );
}

class RatingQuestionList {
  RatingQuestionList({
    required this.srNo,
    required this.question,
    required this.questionType,
    required this.answer,
  });

  int srNo;
  String question;
  String questionType;
  List<Answer> answer;

  factory RatingQuestionList.fromJson(Map<String, dynamic> json) =>
      RatingQuestionList(
        srNo: json["srNo"] ?? 0,
        question: json["question"] ?? "",
        questionType: json["questionType"] ?? "",
        answer: List<Answer>.from(
            (json["answer"] ?? []).map((x) => Answer.fromJson(x))),
      );
}

class Answer {
  Answer({
    required this.srNo,
    required this.questionAnswer,
    required this.isSelected,
  });

  int srNo;
  String questionAnswer;
  bool isSelected;

  factory Answer.fromJson(Map<String, dynamic> json) => Answer(
        srNo: json["srNo"] ?? 0,
        questionAnswer: json["questionAnswer"] ?? "",
        isSelected: false,
      );
}
