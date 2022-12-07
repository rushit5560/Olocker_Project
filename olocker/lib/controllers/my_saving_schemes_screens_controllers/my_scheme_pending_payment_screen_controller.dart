import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:olocker/constants/api_url.dart';
import 'package:http/http.dart' as http;
import 'package:olocker/constants/payment_keys.dart';
import 'package:olocker/constants/user_details.dart';
import 'package:olocker/screens/my_saving_schemes_screens/my_scheme_payment_failure_screen/my_scheme_payment_failure_screen.dart';
import 'package:olocker/screens/my_saving_schemes_screens/my_scheme_payment_success_screen/my_scheme_payment_success_screen.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
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
  final razorpay = Razorpay();

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

    // List<String> srNoDemoList = [];

    // for (var item in pendingBillsSelectedList) {
    //   srNoDemoList.add(item.srNo.floor().toString());
    // }

    // var srNoString = srNoDemoList.join(",");

    // log("passing srNoString is :: $srNoString");

    try {
      Map<String, dynamic> bodyData = {};

      List<Map<String, dynamic>> savingSchemeBodyList = [];

      for (var item in pendingBillsSelectedList) {
        savingSchemeBodyList.add(
          {
            "savingSchemeSrNo": item.srNo.floor().toString(),
            "TransUuid": 0,
            "TransactionId": "0",
            "PaymentStatus": "AUTHORISED",
            "Amount": "${item.installmentAmount.floor()}",
            "TransactionDate": transDate,
          },
        );
      }

      bodyData = {
        "listPurchaseSavingSchemeDetail": savingSchemeBodyList,
      };

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

  Future<void> razorPayAfterPaymentApiFunction({
    required String transUuid,
    required String transactionId,
  }) async {
    isLoading(true);
    String url = ApiUrl.mySchemesEMIPaymentsApi;
    log('razorPayAfterPaymentApiFunction Api Url :$url');

    var format = DateFormat("yyyy-MM-dd");
    var now = DateTime.now();
    var transDate = format.format(now);

    try {
      Map<String, dynamic> bodyData = {};

      List<Map<String, dynamic>> savingSchemeBodyList = [];

      for (var item in pendingBillsSelectedList) {
        savingSchemeBodyList.add(
          {
            "savingSchemeSrNo": item.srNo.floor().toString(),
            "TransUuid": transUuid,
            "TransactionId": transactionId,
            "PaymentStatus": "AUTHORISED",
            "Amount": "${item.installmentAmount.floor()}",
            "TransactionDate": transDate,
          },
        );
      }

      bodyData = {
        "listPurchaseSavingSchemeDetail": savingSchemeBodyList,
      };

      log('razorPayAfterPaymentApiFunction body passing is :: $bodyData');

      http.Response response = await http.post(
        Uri.parse(url),
        headers: apiHeader.headers,
        body: jsonEncode(bodyData),
      );

      log('razorPayAfterPaymentApiFunction res body is ::: ${response.body}');

      EmiPaymentResultModel emiPaymentResultModel =
          EmiPaymentResultModel.fromJson(json.decode(response.body));
      isSuccessStatus.value = emiPaymentResultModel.success;
      log('razorPayAfterPaymentApiFunction isSuccessStatus : ${isSuccessStatus.value}');

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
      } else {
        log('razorPayAfterPaymentApiFunction else casee');
        log('false');
        Get.to(
          () => MySchemePaymentFailureScreen(),
        );
      }
    } catch (e) {
      log('razorPayAfterPaymentApiFunction Error : $e');
      rethrow;
    } finally {
      isLoading(false);
    }
  }

  /// RazorPay Payment Gateway Moethods
  Future<void> _handlePaymentSuccess(PaymentSuccessResponse response) async {
    // Do something when payment succeeds

    log("razorpay succes orderId is :: ${response.orderId}");
    log("razorpay succes paymentId is :: ${response.paymentId}");
    log("razorpay succes signature is :: ${response.signature}");
    log('Success Payment Razorpay');

    await razorPayAfterPaymentApiFunction(
      transUuid: response.orderId ?? "",
      transactionId: response.paymentId ?? "",
    );
    Get.to(
      () => MySchemePaymentSuccessScreen(),
      arguments: [
        getPaymentId.value,
        customerPurchaseSchemeSrNo.value,
      ],
    );
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    // Do something when payment fails
    log('Error Payment Razorpay');
    // Get.to(
    //       () => SchemePaymentFailureScreen(),
    //   arguments: [
    //     schemeImagePath,
    //     schemeName,
    //     schemeTagLine,
    //     savingSchemeDetails,
    //     partnerSavingSchemeDetails,
    //   ],
    // );
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    // Do something when an external wallet is selected
    log('External Wallet Payment Razorpay');
    // Get.to(
    //       () => SchemePaymentFailureScreen(),
    //   arguments: [
    //     schemeImagePath,
    //     schemeName,
    //     schemeTagLine,
    //     savingSchemeDetails,
    //     partnerSavingSchemeDetails,
    //   ],
    // );
  }

  void createRazorPaymentSheet() {
    var options = {
      'key': RazorpayPaymentKey.razorPaymentKey,
      'amount': totalEmiPaymentAmount.value * 100,
      'name': "",
      'description': "",
      'retry': {'enabled': true, 'max_count': 1},
      'send_sms_hash': true,
      'prefill': {
        'contact': UserDetails.customerMobileNo,
        'email': UserDetails.customerEmail,
      },
      /*'external': {
        'wallets': ['paytm']
      }*/
    };

    log('options: $options');

    try {
      razorpay.open(options);
    } catch (e) {
      debugPrint('Error: e');
    }
  }

  // Future<void> razorPayPaymentSuccessFunction() async {
  //
  // }

  @override
  void onInit() {
    // TODO: implement onInit
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
      razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
      razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
    });
    totalEmiPaymentAmount.value = (pendingBillsSelectedList.length *
            pendingBillsSelectedList[0].installmentAmount)
        .floor();
    super.onInit();
  }

  @override
  void dispose() {
    razorpay.clear(); // Removes all listeners
    super.dispose();

    pendingBillsSelectedList.clear();
  }
}
