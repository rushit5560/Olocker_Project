import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';

import 'package:http/http.dart' as http;
import 'package:olocker/constants/api_url.dart';

import '../../models/my_saving_schemes_models/get_saving_schemes_list_model/get_saving_scheme_list_model.dart';
import '../../models/saving_scheme_screens_models/get_saving_scheme_list_models/get_saving_schemes_list_model.dart';
import '../../models/saving_scheme_screens_models/saving_schemes_success_failure_models/get_transaction_status_details_model.dart';

class MySchemesDetailsScreenController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;
  int savingSchemeSrNo = Get.arguments[0];
  GetCustomerPurchaseSavingSchemeData schemeData = Get.arguments[1];

  ApiHeader apiHeader = ApiHeader();
  GetSavingSchemeData? getSavingSchemeData;

  List<TransactionData>? transactionsDataList;

  Future<void> getMySavingSchemeDetailsFunction() async {
    isLoading(true);

    String url = '${ApiUrl.getSavingSchemeDetailsApi}?SrNo=$savingSchemeSrNo';

    log('getMySavingSchemeDetailsFunction api url  : $url');

    try {
      http.Response response = await http.get(
        Uri.parse(url),
        headers: apiHeader.headers,
      );

      log("getMySavingSchemeDetailsFunction res body :: ${response.body}");

      GetSavingSchemesListModel getSavingSchemesListModel =
          GetSavingSchemesListModel.fromJson(json.decode(response.body));

      isSuccessStatus = getSavingSchemesListModel.success.obs;

      if (isSuccessStatus.value) {
        getSavingSchemeData = getSavingSchemesListModel.getSavingSchemeList[0];
        log('getSavingSchemeData schemeName ::: ${getSavingSchemeData!.schemeName}');
        log('getSavingSchemeData mobile no ::: ${getSavingSchemeData!.mobile}');
      } else {
        log('getMySavingSchemeDetailsFunction false');
      }
    } catch (e) {
      log('getMySavingSchemeDetailsFunction error:$e');
      rethrow;
    } finally {
      // isLoading(false);
      getTransactionsListFunction();
    }
  }

  Future<void> getTransactionsListFunction() async {
    isLoading(true);
    String url =
        "${ApiUrl.getCustomerSavingTransactions}?SavingSchemeSrNo=${schemeData.savingSchemeSrNo}";

    // 10047";
    log('getTransactionsListFunction Api url : $url');

    try {
      http.Response response = await http.get(
        Uri.parse(url),
        headers: apiHeader.headers,
      );

      log("getTransactionsListFunction res body :: ${response.body}");

      GetTransactionStatusDetailsModel getTransactionStatusDetailsModel =
          GetTransactionStatusDetailsModel.fromJson(json.decode(response.body));
      var isSuccessStatus = getTransactionStatusDetailsModel.success.obs;

      if (isSuccessStatus.value) {
        transactionsDataList = getTransactionStatusDetailsModel.transactions;
        log('transactionsDataList : ${transactionsDataList!.length}');
        // log('transactionData.invoiceNo : ${transactionData.invoiceNo}');
      } else {
        log('getTransactionsListFunction Else');
      }

      // log("response : ${response.body}");

    } catch (e) {
      log('getTransactionsListFunction Error :$e');
      rethrow;
    } finally {
      isLoading(false);
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    getMySavingSchemeDetailsFunction();
  }
}
