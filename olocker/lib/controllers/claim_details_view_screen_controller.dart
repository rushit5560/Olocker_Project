import 'dart:convert';
import 'dart:developer';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../constants/api_url.dart';
import '../models/jewellery_models/claim_details_model.dart';



class ClaimDetailsViewScreenController extends GetxController {
  final String policyNumber = Get.arguments[0];
  final size = Get.size;

  RxBool isLoading = false.obs;

  ClaimDatum? claimdata;

  ApiHeader apiHeader = ApiHeader();

  Future<void> getTrackClaimDetailsFunction() async {
    isLoading(true);
    // String url =
    //     "${ApiUrl.trackClaimApi}?customerId=${UserDetails.customerId}&PolicyNo=$policyNumber";
    String url =
        "${ApiUrl.trackClaimApi}?customerId=939308&PolicyNo=$policyNumber";
    log("getTrackClaimDetailsFunctiont Api Url : $url");

    try {
      http.Response response = await http.get(
        Uri.parse(url),
        headers: apiHeader.headers,
      );

      log("getTrackClaimDetailsFunction res body : ${response.body}");
      ClaimDetailsModel claimDetailsModel =
          ClaimDetailsModel.fromJson(json.decode(response.body));
      var isSuccessStatus = claimDetailsModel.success;

      if (isSuccessStatus) {
        claimdata = claimDetailsModel.claimData[0];
        log('claimdata :: ${claimdata!.claimAmount}');
      } else {
        log('getTrackClaimDetailsFunction Else');
      }
    } catch (e) {
      log("getTrackClaimDetailsFunction Error :$e");
      rethrow;
    } finally {
      isLoading(false);
    }
  }

  @override
  void onInit() {
    getTrackClaimDetailsFunction();
    super.onInit();
  }
}
