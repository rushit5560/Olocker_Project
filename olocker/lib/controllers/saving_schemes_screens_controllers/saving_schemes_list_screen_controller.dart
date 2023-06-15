import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:olocker/constants/api_url.dart';

import '../../models/saving_scheme_screens_models/get_saving_scheme_list_models/get_saving_schemes_list_model.dart';

class SavingSchemesListScreenController extends GetxController {
  var jewellerId = Get.arguments[0];
  String jewellerName = Get.arguments[1];
  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;

  final size = Get.size;

  ApiHeader apiHeader = ApiHeader();
  String jewellerLogo = "";

  List<GetSavingSchemeData> getSavingSchemesList = [];
// //  SpecialOfferModel?specialOfferModel;
// GetSavingSchemeList?getSavingSchemeList;
  Future<void> getSavingSchemesListFunction() async {
    isLoading(true);

    String url = '${ApiUrl.getParterSavinSchemeApi}?partnerSrNo=$jewellerId';
    // String url = '${ApiUrl.getParterSavinSchemeApi}?partnerSrNo=575';
    log('getSavingSchemesListFunction api url  : $url');

    try {
      http.Response response = await http.get(
        Uri.parse(url),
        headers: apiHeader.headers,
      );

      log("getSavingSchemesListFunction res body :: ${response.body}");

      GetSavingSchemesListModel getSavingSchemesListModel =
          GetSavingSchemesListModel.fromJson(json.decode(response.body));

      isSuccessStatus = getSavingSchemesListModel.success.obs;

      if (isSuccessStatus.value) {
        getSavingSchemesList.clear();
        getSavingSchemesList
            .addAll(getSavingSchemesListModel.getSavingSchemeList);
        jewellerLogo = ApiUrl.apiMainPath + getSavingSchemesListModel.partnerLogo;
        log('jewellerLogo : $jewellerLogo');
        log('getSavingSchemesList ::: ${getSavingSchemesList.length}');
      } else {
        log('getSavingSchemesListFunction false');
      }
    } catch (e) {
      log('getSavingSchemesListFunction error:$e');
      rethrow;
    } finally {
      isLoading(false);
    }
  }

  @override
  void onInit() {
    initMethod();
    super.onInit();
  }

  initMethod() async {
    await getSavingSchemesListFunction();
  }
}
