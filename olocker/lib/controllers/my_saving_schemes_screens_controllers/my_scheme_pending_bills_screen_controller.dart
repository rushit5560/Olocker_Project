import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;

import 'package:get/get.dart';
import 'package:olocker/constants/api_url.dart';

import '../../models/my_saving_schemes_models/get_pending_bills_model/get_pending_bills_list_model.dart';

class MySchemePendingBillsScreenController extends GetxController {
  int customerPurchaseSavingSchemeSrNo = Get.arguments[0];
  RxBool isLoading = false.obs;

  // RxBool isSuccessStatus = false.obs;
  int isStatusCode = 0;
  ApiHeader apiHeader = ApiHeader();

  // static int _len = 20;
  // List<bool> isChecked = List.generate(_len, (index) => false);
  // int _currentIndex = 0;

  List<GetPendingBillData> getPendingBillsList = [];
  List<GetPendingBillData> selectedPendingBillsList = [];
  RxString selectedAmountTotal = "0.0".obs;

  Future<void> getPendingBillDetailListApiFunction() async {
    String url =
        "${ApiUrl.getPendingBillDetailListApi}?customerPurchaseSavingSchemeSrNo=$customerPurchaseSavingSchemeSrNo";

    log("getPendingBillDetailListApiFunction url: $url");

    try {
      isLoading(true);
      http.Response response = await http.get(
        Uri.parse(url),
        headers: apiHeader.headers,
      );

      log("getPendingBillDetailListApiFunction st code is : ${response.statusCode}");
      log("getPendingBillDetailListApiFunction res body : ${response.body}");

      // var resBody = jsonDecode(response.body);

      GetPendingBillsListModel getPendingBillsListModel = GetPendingBillsListModel.fromJson(json.decode(response.body));

      // isSuccessStatus.value = getPendingBillsListModel.success;
      isStatusCode = getPendingBillsListModel.statusCode;
      if (isStatusCode == 200) {
        // isLoading(true);

        getPendingBillsList = getPendingBillsListModel.data.getPurchaseSavingSchemeList;

        calculateSelectedRecord();
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

  void calculateSelectedRecord() {
    if (getPendingBillsList.isEmpty) {
      selectedAmountTotal.value = "0.0";
    } else {
      double amount = 0.0;
      for (int i = 0; i < getPendingBillsList.length; i++) {
        amount = amount + getPendingBillsList[i].installmentAmount;
      }
      selectedAmountTotal.value = amount.toString();
    }
  }

  @override
  void onInit() {
    super.onInit();
    getPendingBillDetailListApiFunction();
  }
}
