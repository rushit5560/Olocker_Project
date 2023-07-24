import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:olocker/constants/api_url.dart';

import '../../models/saving_scheme_screens_models/get_saving_scheme_list_models/get_saving_schemes_list_model.dart';

class SavingSchemesExplainerScreenController extends GetxController {
  var savingSchemeSrNo = Get.arguments;
  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;
  int isStatusCode=0;
  final size = Get.size;

  ApiHeader apiHeader = ApiHeader();

  List<GetSavingSchemeData> getSavingSchemesList = [];

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

      GetSavingSchemesListModel getSavingSchemesListModel =
          GetSavingSchemesListModel.fromJson(json.decode(response.body));

      // isSuccessStatus = getSavingSchemesListModel.success.obs;
      isStatusCode=getSavingSchemesListModel.statusCode;
      if (isStatusCode==200) {
        getSavingSchemesList.clear();
        getSavingSchemesList
            .addAll(getSavingSchemesListModel.data.getSavingSchemeList);
        log('getSavingSchemesList ::: ${getSavingSchemesList.length}');
      } else {
        log('getSavingSchemeDetailsFunction false');
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
      log('getSavingSchemeDetailsFunction error:$e');
      rethrow;
    } /*finally {
      isLoading(false);
    }*/

    isLoading(false);
  }

  @override
  void onInit() {
    getSavingSchemeDetailsFunction();
    super.onInit();
  }
}
