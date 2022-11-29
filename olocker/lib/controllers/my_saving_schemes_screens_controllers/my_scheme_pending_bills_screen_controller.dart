import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;

import 'package:get/get.dart';
import 'package:olocker/constants/api_url.dart';

import '../../models/my_saving_schemes_models/get_pending_bills_model/get_pending_bills_list_model.dart';

class MySchemePendingBillsScreenController extends GetxController {
  int customerPurchaseSavingSchemeSrNo = Get.arguments[0];
  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;

  ApiHeader apiHeader = ApiHeader();

  // static int _len = 20;
  // List<bool> isChecked = List.generate(_len, (index) => false);
  // int _currentindex = 0;

  List<GetPendingBillData> getPendingBillsList = [];
  List<GetPendingBillData> selectedPendingBillsList = [];

  Future<void> getPendingBillDetailListApiFunction() async {
    String url =
        "${ApiUrl.getPendingBillDetailListApi}?customerPurchaseSavingSchemeSrNo=${customerPurchaseSavingSchemeSrNo}";

    // $customerPurchaseSavingSchemeSrNo";

    // 10055 numbeer
    log(" getPendingBillDetailListApiFunction url: $url");

    try {
      isLoading(true);
      http.Response response = await http.get(
        Uri.parse(url),
        headers: apiHeader.headers,
      );

      log("getPendingBillDetailListApiFunction st code is : ${response.statusCode}");
      log("getPendingBillDetailListApiFunction res body : ${response.body}");

      var resBody = jsonDecode(response.body);

      GetPendingBillsListModel getPendingBillsListModel =
          GetPendingBillsListModel.fromJson(resBody);

      isSuccessStatus.value = getPendingBillsListModel.success;

      if (isSuccessStatus.value) {
        // isLoading(true);

        getPendingBillsList =
            getPendingBillsListModel.getPurchaseSavingSchemeList;
        log("getPendingBillsList len is :: ${getPendingBillsList.length}");
        // isLoading(false);
      } else {
        log("getPendingBillDetailListApiFunction not else else");
        //do nothing
      }
    } catch (e) {
      log("getPendingBillDetailListApiFunction Error ::: $e");
      rethrow;
    } finally {
      isLoading(false);
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getPendingBillDetailListApiFunction();
  }
}
