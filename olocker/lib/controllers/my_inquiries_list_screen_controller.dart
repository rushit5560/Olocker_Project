import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:olocker/constants/user_details.dart';
import '../constants/api_url.dart';
import '../models/enquire_screen_models/get_all_inquiries_list_model.dart';

class MyInquiriesListScreenController extends GetxController {
  var partnerSrNo = Get.arguments[0];

  // List<JewellerData> allJewellersList = Get.arguments[1];

  final size = Get.size;
  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;
  RxInt activeIndex = 0.obs;
  int isStatusCode = 0;
  ApiHeader apiHeader = ApiHeader();

  List<GetInquiryNotification> getInquiryNotificationList = [];

  Future<void> getAllInquiriesListFunction() async {
    String url =
        "${ApiUrl.getAllInquiresApi}?customerId=${UserDetails.customerId}&partnerSrNo=$partnerSrNo";
    log("getAllInquiriesListFunction url: $url");

    try {
      isLoading(true);
      http.Response response = await http.get(
        Uri.parse(url),
        headers: apiHeader.headers,
      );
      log(' getAllInquiriesListFunction response : ${response.body}');

      GetAllInquiriesListModel getAllInquiriesListModel =
          GetAllInquiriesListModel.fromJson(json.decode(response.body));

      // isSuccessStatus = getAllInquiriesListModel.success.obs;
      isStatusCode = getAllInquiriesListModel.statusCode;
      if (isStatusCode == 200) {
        getInquiryNotificationList =
            getAllInquiriesListModel.data.getInquiryNotification;

        log('getAllInquiriesListFunction getInquiryNotificationList len is  : ${getInquiryNotificationList.length}');
      } else {
        log('getAllInquiriesListFunction Else');
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
      log("getAllInquiriesListFunction Error ::: $e");
      rethrow;
    } finally {
      isLoading(false);
    }
  }

  @override
  void onInit() {
    // log('bannerList : ${bannerList.length}');
    // log('allJewellersList : ${allJewellersList.length}');
    super.onInit();
    getAllInquiriesListFunction();
  }
}
