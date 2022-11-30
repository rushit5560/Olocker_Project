import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import 'package:olocker/constants/api_url.dart';
import 'package:http/http.dart' as http;
import 'package:olocker/constants/payment_keys.dart';
import 'package:olocker/constants/user_details.dart';
import 'package:olocker/screens/saving_schemes_screens/scheme_payment_failure_screen/scheme_payment_failure_screen.dart';
import 'package:olocker/screens/saving_schemes_screens/scheme_payment_success_screen/scheme_payment_success_screen.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

import '../../constants/enum.dart';
import '../../models/saving_scheme_screens_models/payment_saving_scheme_result_models/payment_scheme_result_model.dart';
import '../../models/saving_scheme_screens_models/saving_scheme_enroll_screen_models/add_enroll_saving_scheme_model.dart';
import '../../widgets/common_widgets.dart';

class SchemeChoosePaymentMethodScreenController extends GetxController {
  String schemeImagePath = Get.arguments[0];
  String schemeName = Get.arguments[1];
  String schemeTagLine = Get.arguments[2];
  SavingSchemeDetails savingSchemeDetails = Get.arguments[3];
  PartnerSavingSchemeDetails partnerSavingSchemeDetails = Get.arguments[4];

  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;

  int customerPurchaseSchemeSrNo = 0;

  ApiHeader apiHeader = ApiHeader();

  PaymentTypeEnum? paymentTypeEnum;
  final razorpay = Razorpay();


  Future<void> paymentSavingSchemeFunction() async {
    isLoading(true);
    String url = ApiUrl.paymentSavingSchemeApi;
    log('paymentSavingSchemeFunction Api Url :$url');

    var format = DateFormat("yyyy-MM-dd");
    var now = DateTime.now();
    var transDate = format.format(now);

    // payment type enums
    // paytm, googlepay, amazonpay, visa, cashondelivery

    try {
      Map<String, dynamic> bodyData = {};

      if (paymentTypeEnum == PaymentTypeEnum.paytm) {
        bodyData = {
          "PaymentId": savingSchemeDetails.paymentId,
          "TransUuid": 0,
          "TransactionId": "0",
          "PaymentStatus": "1",
          "Amount": "${savingSchemeDetails.monthlyAmount}",
          "TransactionDate": transDate,
        };
      } else if (paymentTypeEnum == PaymentTypeEnum.googlepay) {
        bodyData = {
          "PaymentId": savingSchemeDetails.paymentId,
          "TransUuid": 0,
          "TransactionId": "0",
          "PaymentStatus": "1",
          "Amount": "${savingSchemeDetails.monthlyAmount}",
          "TransactionDate": transDate,
        };
      } else if (paymentTypeEnum == PaymentTypeEnum.amazonpay) {
        bodyData = {
          "PaymentId": savingSchemeDetails.paymentId,
          "TransUuid": 0,
          "TransactionId": "0",
          "PaymentStatus": "1",
          "Amount": "${savingSchemeDetails.monthlyAmount}",
          "TransactionDate": transDate,
        };
      } /*else if (paymentTypeEnum == PaymentTypeEnum.visa) {
        /// handle razorpay events
        ///
        // bodyData = {
        //   "PaymentId": savingSchemeDetails.paymentId,
        //   "TransUuid": 0,
        //   "TransactionId": "0",
        //   "PaymentStatus": "1",
        //   "Amount": "${savingSchemeDetails.monthlyAmount}",
        //   "TransactionDate": transDate,
        // };
      }*/ else {
        bodyData = {
          "PaymentId": savingSchemeDetails.paymentId,
          "TransUuid": 0,
          "TransactionId": "0",
          "PaymentStatus": "1",
          "Amount": "${savingSchemeDetails.monthlyAmount}",
          "TransactionDate": transDate,
        };
      }

      log('bodyData : $bodyData');

      http.Response response = await http.post(
        Uri.parse(url),
        headers: apiHeader.headers,
        body: jsonEncode(bodyData),
      );

      log('paymentSavingSchemeFunction res body :: ${response.body}');

      PaymentSchemeResultModel paymentSchemeResultModel =
          PaymentSchemeResultModel.fromJson(json.decode(response.body));
      isSuccessStatus.value = paymentSchemeResultModel.success;
      log('isSuccessStatus : ${isSuccessStatus.value}');

      if (isSuccessStatus.value) {
        customerPurchaseSchemeSrNo =
            paymentSchemeResultModel.customerPurchaseSavingSchemeSrNo;

        CommonWidgets().showBorderSnackBar(
          context: Get.context!,
          displayText: "Your payment succesfully done.",
        );

        Get.to(
          () => SchemePaymentSuccessScreen(),
          arguments: [
            schemeImagePath,
            schemeName,
            schemeTagLine,
            savingSchemeDetails,
            partnerSavingSchemeDetails,
            customerPurchaseSchemeSrNo
          ],
        );

        //passing this data to success
        // String schemeImagePath = Get.arguments[0];
        // String schemeName = Get.arguments[1];
        // String schemeTagLine = Get.arguments[2];
        // SavingSchemeDetails savingSchemeDetails = Get.arguments[3];
        // PartnerSavingSchemeDetails partnerSavingSchemeDetails = Get.arguments[4];
        // int savingSchemeSrNo = Get.arguments[5];

      } else {
        // if (paymentSchemeResultModel.errorInfo.description.contains(
        //     "Customer not found matching with email address and mobile number")) {
        // }
        // CommonWidgets().showBorderSnackBar(
        //   context: Get.context!,
        //   displayText: paymentSchemeResultModel.errorInfo.description,
        // );

        Get.to(
          () => SchemePaymentFailureScreen(),
          arguments: [
            schemeImagePath,
            schemeName,
            schemeTagLine,
            savingSchemeDetails,
            partnerSavingSchemeDetails,
          ],
        );
      }
    } catch (e) {
      log('paymentSavingSchemeFunction Error : $e');
      rethrow;
    } finally {
      isLoading(false);
    }
  }

  @override
  void onInit() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
      razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
      razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
    });
    super.onInit();
  }

  /// RazorPay Payment Gateway Moethods
  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    // Do something when payment succeeds
    log('Success Payment Razorpay');

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
      'amount': int.parse(savingSchemeDetails.monthlyAmount.toString()) * 100,
      'name': schemeName,
      'description': schemeTagLine,
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


  Future<void> razorPayPaymentSuccessFunction() async {
    String url = ApiUrl.paymentSavingSchemeApi;
    log('paymentSavingSchemeFunction Api Url :$url');

    var format = DateFormat("yyyy-MM-dd");
    var now = DateTime.now();
    var transDate = format.format(now);

    try {
      Map<String, dynamic> bodyData = {
        "PaymentId": savingSchemeDetails.paymentId,
        "TransUuid": 0,
        "TransactionId": "0",
        "PaymentStatus": "1",
        "Amount": "${savingSchemeDetails.monthlyAmount}",
        "TransactionDate": transDate,
      };

      log('bodyData : $bodyData');

      http.Response response = await http.post(
        Uri.parse(url),
        headers: apiHeader.headers,
        body: jsonEncode(bodyData),
      );

      log('paymentSavingSchemeFunction res body :: ${response.body}');

      PaymentSchemeResultModel paymentSchemeResultModel =
      PaymentSchemeResultModel.fromJson(json.decode(response.body));
      isSuccessStatus.value = paymentSchemeResultModel.success;
      log('isSuccessStatus : ${isSuccessStatus.value}');

      if (isSuccessStatus.value) {
        customerPurchaseSchemeSrNo =
            paymentSchemeResultModel.customerPurchaseSavingSchemeSrNo;

        CommonWidgets().showBorderSnackBar(
          context: Get.context!,
          displayText: "Your payment succesfully done.",
        );

        Get.to(
              () => SchemePaymentSuccessScreen(),
          arguments: [
            schemeImagePath,
            schemeName,
            schemeTagLine,
            savingSchemeDetails,
            partnerSavingSchemeDetails,
            customerPurchaseSchemeSrNo
          ],
        );

        //passing this data to success
        // String schemeImagePath = Get.arguments[0];
        // String schemeName = Get.arguments[1];
        // String schemeTagLine = Get.arguments[2];
        // SavingSchemeDetails savingSchemeDetails = Get.arguments[3];
        // PartnerSavingSchemeDetails partnerSavingSchemeDetails = Get.arguments[4];
        // int savingSchemeSrNo = Get.arguments[5];

      } else {
        // if (paymentSchemeResultModel.errorInfo.description.contains(
        //     "Customer not found matching with email address and mobile number")) {
        // }
        // CommonWidgets().showBorderSnackBar(
        //   context: Get.context!,
        //   displayText: paymentSchemeResultModel.errorInfo.description,
        // );

        Get.to(
              () => SchemePaymentFailureScreen(),
          arguments: [
            schemeImagePath,
            schemeName,
            schemeTagLine,
            savingSchemeDetails,
            partnerSavingSchemeDetails,
          ],
        );
      }

    } catch(e) {
      log('razorPayPaymentSuccessFunction Error :$e');
      rethrow;
    }

  }

  @override
  void dispose() {
    razorpay.clear(); // Removes all listeners
    super.dispose();
  }

}
