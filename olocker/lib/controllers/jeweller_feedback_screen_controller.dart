import 'dart:convert';
import 'dart:developer';
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
  int isStatusCode = 0;
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
      // isSuccessStatus = feedbackFormModel.success.obs;
      isStatusCode = feedbackFormModel.statusCode;
      if (isStatusCode == 200) {
        feedBackFormList.clear();
        feedBackFormList.addAll(feedbackFormModel.data.ratingQuestionList);
        // log('feedBackFormList : ${feedBackFormList.length}');

        for (int i = 0; i < feedBackFormList.length; i++) {
          finalFeedBackAnsList.add([]);

          if (feedbackFormModel.data.ratingQuestionList[i].questionType ==
              "RadioButton") {
            finalFeedBackAnsList[i] = [
              feedbackFormModel
                  .data.ratingQuestionList[i].answer[0].questionAnswer
            ];
          }
          // This is only for update ui
          radioButtonValueList.add(
              feedbackFormModel.data.ratingQuestionList[i].answer.isEmpty
                  ? ""
                  : feedbackFormModel
                      .data.ratingQuestionList[i].answer[0].questionAnswer);
        }

        log('finalFeedBackAnsList : $finalFeedBackAnsList');
      } else {
        log('getFeedbackFormFunction Else');
        if (isStatusCode == 400) {
          log("BadRequest");
        } else if (isStatusCode == 404) {
          log("NotFound");
        } else if (isStatusCode == 406) {
          log("NotAcceptable");
        } else if (isStatusCode == 417) {
          log("HttpStatusCode.ExpectationFailed");
        }
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
      // isSuccessStatus = addFeedbackFormModel.success.obs;
      isStatusCode = addFeedbackFormModel.statusCode;
      if (isStatusCode == 200) {
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
          displayText: addFeedbackFormModel.data.errorInfo.description,
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
