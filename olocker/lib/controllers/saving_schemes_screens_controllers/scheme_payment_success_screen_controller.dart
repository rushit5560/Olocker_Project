import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:olocker/constants/api_url.dart';

import '../../models/saving_scheme_screens_models/saving_scheme_enroll_screen_models/add_enroll_saving_scheme_model.dart';
import '../../models/saving_scheme_screens_models/saving_schemes_success_failure_models/get_transaction_status_details_model.dart';

class SchemePaymentSuccessScreenController extends GetxController {
  String schemeImagePath = Get.arguments[0];
  String schemeName = Get.arguments[1];
  String schemeTagLine = Get.arguments[2];
  SavingSchemeDetails savingSchemeDetails = Get.arguments[3];
  PartnerSavingSchemeDetails partnerSavingSchemeDetails = Get.arguments[4];
  int savingSchemeSrNo = Get.arguments[5];
  String jewellerLogo = Get.arguments[6];
  String jewellerName = Get.arguments[7];
int isStatusCode=0;
  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;

  ApiHeader apiHeader = ApiHeader();

  late TransactionData transactionData;

  Future<void> getTransactionStatusDetailsFunction() async {
    isLoading(true);
    String url =
        "${ApiUrl.getCustomerSavingTransactions}?SavingSchemeSrNo=$savingSchemeSrNo";

    log('getTransactionStatusDetailsFunction Api url : $url');

    try {
      http.Response response = await http.get(
        Uri.parse(url),
        headers: apiHeader.headers,
      );

      log("getTransactionStatusDetailsFunction res body :: ${response.body}");

      GetTransactionStatusDetailsModel getTransactionStatusDetailsModel =
          GetTransactionStatusDetailsModel.fromJson(json.decode(response.body));
      // var isSuccessStatus = getTransactionStatusDetailsModel.success.obs;
      isStatusCode=getTransactionStatusDetailsModel.statusCode;
      if (isStatusCode==200) {
        transactionData = getTransactionStatusDetailsModel.data.transactions[0];
        log('transactionData.customerPurchaseSavingSchemeSrNo : ${transactionData.customerPurchaseSavingSchemeSrNo}');
        log('transactionData.invoiceNo : ${transactionData.invoiceNo}');
      } else {
        log('getTransactionStatusDetailsFunction Else');
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
      log('getTransactionStatusDetailsFunction Error :$e');
      rethrow;
    } finally {
      isLoading(false);
    }
  }

  @override
  void onInit() {
    getTransactionStatusDetailsFunction();
    super.onInit();
  }
}
