import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:olocker/constants/api_url.dart';
import 'package:olocker/constants/user_details.dart';
import 'package:olocker/controllers/jeweller_details_screen_controller.dart';
import 'package:olocker/models/jeweller_feedback_screen_models/add_feedback_form_model.dart';
import 'package:olocker/models/jeweller_feedback_screen_models/feedback_form_model.dart';
import 'package:olocker/widgets/common_widgets.dart';

class JewellerFeedbackScreenController extends GetxController {
  var jewellerId = Get.arguments; // Getting from Jeweller Details screen
  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;

  final jewellerDetailsScreenController =
      Get.find<JewellerDetailsScreenController>();

  ApiHeader apiHeader = ApiHeader();

  List<RatingQuestionList> feedBackFormList = [];
  List<List<String>> finalFeedBackAnsList = [];
  List<String> radioButtonValueList = [];

  // RxBool allDataValid = true.obs;
  RxBool allDataValid = true.obs;

  // Get Feedback Form From Api
  Future<void> getFeedbackFormFunction() async {
    isLoading(true);
    String url = "${ApiUrl.getFeedbackFormApi}?PartnerSrno=$jewellerId";
    log('getFeedbackFormFunction Api Url : $url');

    try {
      http.Response response = await http.get(
        Uri.parse(url),
        headers: apiHeader.headers,
      );
      log('response1111 : ${response.body}');

      FeedbackFormModel feedbackFormModel =
          FeedbackFormModel.fromJson(json.decode(response.body));
      isSuccessStatus = feedbackFormModel.success.obs;

      if (isSuccessStatus.value) {
        feedBackFormList.clear();
        feedBackFormList.addAll(feedbackFormModel.ratingQuestionList);
        // log('feedBackFormList : ${feedBackFormList.length}');

        for (int i = 0; i < feedBackFormList.length; i++) {
          finalFeedBackAnsList.add([]);

          if (feedbackFormModel.ratingQuestionList[i].questionType ==
              "RadioButton") {
            finalFeedBackAnsList[i] = [
              feedbackFormModel.ratingQuestionList[i].answer[0].questionAnswer
            ];
          }
          // This is only for update ui
          radioButtonValueList.add(
              feedbackFormModel.ratingQuestionList[i].answer.isEmpty
                  ? ""
                  : feedbackFormModel
                      .ratingQuestionList[i].answer[0].questionAnswer);
        }

        log('finalFeedBackAnsList : $finalFeedBackAnsList');
      } else {
        log('getFeedbackFormFunction Else');
      }
    } catch (e) {
      log('getFeedbackFormFunction Error :$e');
      rethrow;
    }

    isLoading(false);
  }

  // Set Feedback Form Api
  Future<void> setFeedbackFormFunction() async {
    isLoading(true);
    String url = ApiUrl.setFeedbackFormApi;
    log('Set Feedback Form Api Url : $url');

    try {
      List<Map<String, dynamic>> questionList = [];
      questionList = makeBodyDataList();
      // log('questionList123 : $questionList');

      Map<String, String> headers = <String, String>{
        'Content-Type': "application/json"
        // 'MobileAppKey': "EED26D5A-711D-49BD-8999-38D8A60329C5"
      };

      Map<String, dynamic> bodyData = {
        "CustomerSrNo": UserDetails.customerId,
        "PartnerSrNo": "$jewellerId",
        "Question": questionList
      };
      log('bodyData :$bodyData');

      http.Response response = await http.post(Uri.parse(url),
          headers: apiHeader.headers, body: jsonEncode(bodyData));
      log('response1212 : ${response.body}');

      AddFeedbackFormModel addFeedbackFormModel =
          AddFeedbackFormModel.fromJson(json.decode(response.body));
      isSuccessStatus = addFeedbackFormModel.success.obs;

      if (isSuccessStatus.value) {
        jewellerDetailsScreenController.isFeedbackValue = true.obs;
        Get.back();
        CommonWidgets().showBorderSnackBar(
          context: Get.context!,
          displayText: "Feedback given successfully",
        );
      } else {
        log('setFeedbackFormFunction Else');
        CommonWidgets().showBorderSnackBar(
          context: Get.context!,
          displayText: addFeedbackFormModel.errorInfo.description,
        );
      }
    } catch (e) {
      log('setFeedbackFormFunction Error :$e');
      rethrow;
    } finally {
      isLoading(false);
    }
  }

  makeBodyDataList() {
    List<Map<String, dynamic>> questionList = [];

    for (int i = 0; i < feedBackFormList.length; i++) {
      Map<String, dynamic> singleData = {
        "QuestionId": "${feedBackFormList[i].srNo}",
        "Answers": finalFeedBackAnsList[i]
      };

      questionList.add(singleData);
    }

    // log('questionList : $questionList');
    return questionList;
  }

  @override
  void onInit() {
    getFeedbackFormFunction();
    super.onInit();
  }
}
