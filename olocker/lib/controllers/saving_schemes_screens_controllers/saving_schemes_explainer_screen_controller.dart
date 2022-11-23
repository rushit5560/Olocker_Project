import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:olocker/constants/api_url.dart';

import '../../models/saving_scheme_screens_models/get_saving_schemes_list_model.dart';

class SavingSchemesExplainerScreenController extends GetxController {
  int savingSchemeSrNo = Get.arguments;
  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;

  final size = Get.size;

  ApiHeader apiHeader = ApiHeader();

  List<GetSavingSchemeData> getSavingSchemesList = [];
// //  SpecialOfferModel?specialOfferModel;
// GetSavingSchemeList?getSavingSchemeList;
  Future<void> getSavingSchemeDetailsFunction() async {
    isLoading(true);

    String url = '${ApiUrl.getSavingSchemeDetailsApi}?SrNo=$savingSchemeSrNo';

    log('getSavingSchemeDetailsFunction api url  : $url');

    try {
      http.Response response = await http.get(
        Uri.parse(url),
        headers: apiHeader.headers,
      );

      log("getSavingSchemeDetailsFunction res body :: ${response.body}");

      // GetSavingSchemesListModel getSavingSchemesListModel =
      //     GetSavingSchemesListModel.fromJson(json.decode(response.body));

      // isSuccessStatus = getSavingSchemesListModel.success.obs;

      // if (isSuccessStatus.value) {
      //   getSavingSchemesList.clear();
      //   getSavingSchemesList
      //       .addAll(getSavingSchemesListModel.getSavingSchemeList);
      //   log('getSavingSchemesList ::: ${getSavingSchemesList.length}');
      // } else {
      //   log('getSavingSchemeDetailsFunction false');
      // }
    } catch (e) {
      log('getSavingSchemeDetailsFunction error:$e');
      rethrow;
    } finally {
      isLoading(false);
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    getSavingSchemeDetailsFunction();
    super.onInit();
  }
}
