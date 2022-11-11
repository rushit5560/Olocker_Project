import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:olocker/constants/api_url.dart';
import 'package:olocker/models/jeweller_feedback_screen_models/geedback_form_model.dart';

class JewellerFeedbackScreenController extends GetxController {
  var jewellerId = Get.arguments; // Getting from Jeweller Details screen
  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;

  ApiHeader apiHeader = ApiHeader();


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

      } else {
        log('getFeedbackFormFunction Else');
      }

    } catch(e) {
      log('getFeedbackFormFunction Error :$e');
      rethrow;
    }
  }


  @override
  void onInit() {
    getFeedbackFormFunction();
    super.onInit();
  }

}