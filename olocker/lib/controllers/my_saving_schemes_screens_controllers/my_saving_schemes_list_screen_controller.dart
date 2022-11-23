import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:olocker/constants/api_url.dart';

class MySavingSchemesListScreenController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;

  ApiHeader apiHeader = ApiHeader();

//   List<GetSavingSchemeList> specialofferlist=[];
// //  SpecialOfferModel?specialOfferModel;
// GetSavingSchemeList?getSavingSchemeList;
  Future<void> getSavingSchemesListFunction() async {
    isLoading(true);

    String url = '${ApiUrl.getParterSavinSchemeApi}?partnerSrNo=575';
    log('getSavingSchemesListFunction api url  : $url');

    try {
      http.Response response = await http.get(
        Uri.parse(url),
        headers: apiHeader.headers,
      );

      log("getSavingSchemesListFunction res body :: ${response.body}");
      // SpecialOfferModel specialOfferModel =
      //     SpecialOfferModel.fromJson(json.decode(response.body));
      // log('response body1212: ${response.body}');
      // isSuccessStatus = specialOfferModel.success.obs;

      // if (isSuccessStatus.value) {
      //   specialofferlist.clear();
      //   specialofferlist.addAll(specialOfferModel.getSavingSchemeList);
      //   log('specialofferlist : ${specialofferlist.length}');
      // } else {
      //   log('special_offer_model false');
      // }
    } catch (e) {
      log('getSpecialOfferFunction error:$e');
      // rethrow;
    } finally {
      isLoading(false);
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    getSavingSchemesListFunction();
    super.onInit();
  }
}
