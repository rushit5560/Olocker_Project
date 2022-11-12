import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:olocker/constants/api_url.dart';
import 'package:olocker/models/jeweller_feedback_screen_models/feedback_form_model.dart';

class JewellerFeedbackScreenController extends GetxController {
  var jewellerId = Get.arguments; // Getting from Jeweller Details screen
  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;

  ApiHeader apiHeader = ApiHeader();

  List<RatingQuestionList> feedBackFormList = [];
  List<List<String>> finalFeedBackAnsList = [];
  List<String> radioButtonValueList = [];


  Future<void> getFeedbackFormFunction() async {
    isLoading(true);
    String url = "${ApiUrl.getFeedbackFormApi}?PartnerSrno=$jewellerId";
    log('getFeedbackFormFunction Api Url : $url');

    try {
      http.Response response = await http.get(
        Uri.parse(url),
        headers: apiHeader.headers,
      );
      log('response : ${response.body}');

      FeedbackFormModel feedbackFormModel = FeedbackFormModel.fromJson(json.decode(response.body));
      isSuccessStatus = feedbackFormModel.success.obs;

      if(isSuccessStatus.value) {
        feedBackFormList.clear();
        feedBackFormList.addAll(feedbackFormModel.ratingQuestionList);
        // log('feedBackFormList : ${feedBackFormList.length}');

        for(int i =0; i < feedBackFormList.length; i++) {
          finalFeedBackAnsList.add([]);

          if(feedbackFormModel.ratingQuestionList[i].questionType == "RadioButton") {
            finalFeedBackAnsList[i] = [feedbackFormModel.ratingQuestionList[i].answer[0].questionAnswer];
          }
          // This is only for update ui
          radioButtonValueList.add(feedbackFormModel.ratingQuestionList[i].answer.isEmpty
              ? "" : feedbackFormModel.ratingQuestionList[i].answer[0].questionAnswer);
        }

        log('finalFeedBackAnsList : $finalFeedBackAnsList');

      } else {
        log('getFeedbackFormFunction Else');
      }

    } catch(e) {
      log('getFeedbackFormFunction Error :$e');
      rethrow;
    }

    isLoading(false);
  }


  @override
  void onInit() {
    getFeedbackFormFunction();
    super.onInit();
  }

}