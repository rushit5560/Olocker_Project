import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:olocker/constants/api_url.dart';
import 'package:olocker/constants/user_details.dart';

import '../../models/my_saving_schemes_models/get_saving_schemes_list_model/get_saving_scheme_list_model.dart';

class MySavingSchemesListScreenController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;
  int isStatusCode = 0;

  ApiHeader apiHeader = ApiHeader();

  List<GetCustomerPurchaseSavingSchemeData> getCustomerSchemeslist = [];
// //  SpecialOfferModel?specialOfferModel;
// GetSavingSchemeList?getSavingSchemeList;
  Future<void> getCustomerSavingSchemesListFunction() async {
    isLoading(true);
    String url = '${ApiUrl.getCustomerSavingSchemeApi}?customerSrNo=${UserDetails.customerId}';
    log('getCustomerSavingSchemesListFunction api url  : $url');

    try {
      http.Response response = await http.get(
        Uri.parse(url),
        headers: apiHeader.headers,
      );

      log("getCustomerSavingSchemesListFunction res body :: ${response.body}");
      GetCustomerSchemeslistModel getCustomerSchemeslistModel =
          GetCustomerSchemeslistModel.fromJson(json.decode(response.body));

      // isSuccessStatus = getCustomerSchemeslistModel.success.obs;
      isStatusCode = getCustomerSchemeslistModel.statusCode;

      if (isStatusCode == 200) {
        getCustomerSchemeslist.clear();
        getCustomerSchemeslist.addAll(
            getCustomerSchemeslistModel.data.getCustomerPurchaseSavingSchemeList);
        log('getCustomerSchemeslist lentgh is ::: ${getCustomerSchemeslist.length}');
      } else {
        log('getCustomerSavingSchemesListFunction false');
      }
    } catch (e) {
      log('getCustomerSavingSchemesListFunction error:$e');
      rethrow;
    } finally {
      isLoading(false);
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    getCustomerSavingSchemesListFunction();
    super.onInit();
  }
}
