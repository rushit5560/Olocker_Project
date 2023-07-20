import 'dart:convert';
import 'dart:developer';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:olocker/constants/api_url.dart';
import '../../models/saving_scheme_screens_models/saving_schemes_success_failure_models/get_transaction_status_details_model.dart';

class MySchemePaymentSuccessScreenController extends GetxController {
  String paymentId = Get.arguments[0];
  int customerPurchaseSavingSchemeNo = Get.arguments[1];
  RxBool isLoading = false.obs;

  // RxBool isSuccessStatus = false.obs;
  int isStatusCode = 0;
  ApiHeader apiHeader = ApiHeader();

  List<TransactionData> transactionsList = [];

  Future<void> getSuccessTransactionsListFunction() async {
    isLoading(true);
    String url =
        "${ApiUrl.getCustomerSavingTransactions}?SavingSchemeSrNo=$customerPurchaseSavingSchemeNo";

    // 10047";
    log('getSuccessTransactionsListFunction Api url : $url');

    try {
      http.Response response = await http.get(
        Uri.parse(url),
        headers: apiHeader.headers,
      );

      log("getTransactionStatusDetailsFunction res body :: ${response.body}");

      GetTransactionStatusDetailsModel getTransactionStatusDetailsModel =
          GetTransactionStatusDetailsModel.fromJson(json.decode(response.body));
      // var isSuccessStatus = getTransactionStatusDetailsModel.success.obs;
      isStatusCode = getTransactionStatusDetailsModel.statusCode;
      if (isStatusCode == 200) {
        List<TransactionData> demoTransList =
            getTransactionStatusDetailsModel.data.transactions;
        for (var item in demoTransList) {
          if (item.paymentId == paymentId) {
            transactionsList.add(item);
          }
        }

        log('transactionsList is :: $transactionsList');
        log('transactionsList len is :: ${transactionsList.length}');
      } else {
        log('getSuccessTransactionsListFunction Else');
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

      // log("response : ${response.body}");
    } catch (e) {
      log('getSuccessTransactionsListFunction Error :$e');
      rethrow;
    } finally {
      isLoading(false);
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    getSuccessTransactionsListFunction();
    super.onInit();
  }
}
