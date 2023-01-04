import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../constants/api_url.dart';
import '../constants/user_details.dart';
import '../models/ornament_recording_models/get_ornament_recording_model.dart';

class OrnamentRecordingsListScreenController extends GetxController {
  final size = Get.size;
  final ornamentSrNo = Get.arguments[0];
  final customerOraSrNo = Get.arguments[1];
  final coiNumber = Get.arguments[2];

  RxBool isLoading = false.obs;

  ApiHeader apiHeader = ApiHeader();

  List<OrnamentHistoryDetail> ornamentHistoryDetailList = [];
  TrackingDetail? trackingDetail;
  Future<void> getOrnamentRecordingsListFunction() async {
    String url =
        "${ApiUrl.getOrnamentTrackingApi}?customerId=${UserDetails.customerId}&OrnamentSrNo=$ornamentSrNo&CustOraSrNo=$customerOraSrNo";
    // String url =
    //     "${ApiUrl.getOrnamentTrackingApi}?customerId=939308&OrnamentSrNo=$ornamentSrNo&CustOraSrNo=$customerOraSrNo";

    try {
      isLoading(true);
      http.Response response = await http.get(
        Uri.parse(url),
        headers: apiHeader.headers,
      );
      log(" getOrnamentRecordingsListFunction url: ${response.request}");

      log("getOrnamentRecordingsListFunction st code is : ${response.statusCode}");
      log("getOrnamentRecordingsListFunction res body : ${response.body}");

      var resBody = jsonDecode(response.body);

      GetOrnamentRecordingsModel getOrnamentRecordingsModel =
          GetOrnamentRecordingsModel.fromJson(resBody);

      if (response.statusCode == 200) {
        log("getOrnamentRecordingsListFunction get success");

        ornamentHistoryDetailList =
            getOrnamentRecordingsModel.ornamentHistoryDetails;
        trackingDetail = getOrnamentRecordingsModel.trackingDetails[0];
      } else {
        log("getOrnamentRecordingsListFunction not success");
        //do nothing
      }
    } catch (e) {
      log("getOrnamentRecordingsListFunction Error ::: $e");
      rethrow;
    } finally {
      isLoading(false);
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    getOrnamentRecordingsListFunction();
  }
}
