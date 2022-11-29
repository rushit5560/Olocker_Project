import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:intl/intl.dart';

import 'package:olocker/constants/api_url.dart';
import 'package:http/http.dart' as http;
import 'package:olocker/screens/my_saving_schemes_screens/my_scheme_payment_failure_screen/my_scheme_payment_failure_screen.dart';
import 'package:olocker/screens/my_saving_schemes_screens/my_scheme_payment_success_screen/my_scheme_payment_success_screen.dart';
import '../../constants/enum.dart';
import '../../models/my_saving_schemes_models/emi_payment_result_model/emi_payment_result_model.dart';
import '../../models/my_saving_schemes_models/get_pending_bills_model/get_pending_bills_list_model.dart';
import '../../widgets/common_widgets.dart';

class MySchemePendingPaymentScreenController extends GetxController {
  List<GetPendingBillData> pendingBillsSelectedList = Get.arguments[0];
  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;

  ApiHeader apiHeader = ApiHeader();
  PaymentTypeEnum paymentTypeEnum = PaymentTypeEnum.paytm;

  RxInt customerPurchaseSchemeSrNo = 0.obs;
  RxString getPaymentId = "".obs;

  RxInt totalEmiPaymentAmount = 0.obs;

  Future<void> makePaymentsApiFunction() async {
    isLoading(true);
    String url = ApiUrl.mySchemesEMIPaymentsApi;
    log('makePaymentsApiFunction Api Url :$url');

    var format = DateFormat("yyyy-MM-dd");
    var now = DateTime.now();
    var transDate = format.format(now);

    List<String> srNoDemoList = [];

    for (var item in pendingBillsSelectedList) {
      srNoDemoList.add(item.srNo.floor().toString());
    }

    var srNoString = srNoDemoList.join(",");

    log("passing srNoString is :: ${srNoString}");

    try {
      Map<String, dynamic> bodyData = {};

      if (paymentTypeEnum == PaymentTypeEnum.paytm) {
        bodyData = {
          "savingSchemeSrNo": srNoString,
          "TransUuid": 0,
          "TransactionId": "0",
          "PaymentStatus": "1",
          "Amount": "${totalEmiPaymentAmount.value}",
          "TransactionDate": transDate,
        };
      } else if (paymentTypeEnum == PaymentTypeEnum.googlepay) {
        bodyData = {
          "savingSchemeSrNo": srNoString,
          "TransUuid": 0,
          "TransactionId": "0",
          "PaymentStatus": "1",
          "Amount": "${totalEmiPaymentAmount.value}",
          "TransactionDate": transDate,
        };
      } else if (paymentTypeEnum == PaymentTypeEnum.amazonpay) {
        bodyData = {
          "savingSchemeSrNo": srNoString,
          "TransUuid": 0,
          "TransactionId": "0",
          "PaymentStatus": "1",
          "Amount": "${totalEmiPaymentAmount.value}",
          "TransactionDate": transDate,
        };
      } else if (paymentTypeEnum == PaymentTypeEnum.visa) {
        /// handle razorpay events
        ///
        bodyData = {
          "savingSchemeSrNo": srNoString,
          "TransUuid": 0,
          "TransactionId": "0",
          "PaymentStatus": "1",
          "Amount": "${totalEmiPaymentAmount.value}",
          "TransactionDate": transDate,
        };
      } else {
        bodyData = {
          "savingSchemeSrNo": srNoString,
          "TransUuid": 0,
          "TransactionId": "0",
          "PaymentStatus": "1",
          "Amount": "${totalEmiPaymentAmount.value}",
          "TransactionDate": transDate,
        };
      }

      log('makePaymentsApiFunction body passing is :: $bodyData');

      http.Response response = await http.post(
        Uri.parse(url),
        headers: apiHeader.headers,
        body: jsonEncode(bodyData),
      );

      log('makePaymentsApiFunction res body is :${response.body}');

      EmiPaymentResultModel emiPaymentResultModel =
          EmiPaymentResultModel.fromJson(json.decode(response.body));
      isSuccessStatus.value = emiPaymentResultModel.success;
      log('makePaymentsApiFunction isSuccessStatus : ${isSuccessStatus.value}');

      if (isSuccessStatus.value) {
        getPaymentId.value = emiPaymentResultModel.paymentId;
        customerPurchaseSchemeSrNo.value =
            emiPaymentResultModel.customerPurchaseSavingSchemeNo;

        CommonWidgets().showBorderSnackBar(
          context: Get.context!,
          displayText: "Your payment succesfully done.",
        );

        Get.to(
          () => MySchemePaymentSuccessScreen(),
          arguments: [
            getPaymentId.value,
            customerPurchaseSchemeSrNo.value,
          ],
        );

        //passing this data to success screen

        // int savingSchemeSrNo = Get.arguments[0];

      } else {
        log('makePaymentsApiFunction else casee');
        log('false');
        Get.to(
          () => MySchemePaymentFailureScreen(),
        );
      }
    } catch (e) {
      log('makePaymentsApiFunction Error : $e');
      rethrow;
    } finally {
      isLoading(false);
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    totalEmiPaymentAmount.value = (pendingBillsSelectedList.length *
            pendingBillsSelectedList[0].installmentAmount)
        .floor();
    super.onInit();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

    pendingBillsSelectedList.clear();
  }
}
