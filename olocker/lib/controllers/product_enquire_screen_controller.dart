import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:olocker/constants/api_url.dart';
import 'package:olocker/constants/user_details.dart';
import 'package:olocker/models/enquire_screen_models/get_all_message_model.dart';

import '../models/enquire_screen_models/send_message_model.dart';
import '../models/jewellery_details_screen_model/get_jewellery_detail_model.dart';

class ProductEnquireScreenController extends GetxController {
  var partnerSrNo = Get.arguments[0]; // Coming from jewellery details screen
  var productSrNo = Get.arguments[1]; // Coming from jewellery details screen
  final size = Get.size;

  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;

  TextEditingController sendMsgController = TextEditingController();

  ApiHeader apiHeader = ApiHeader();
  late ProductDetailsData productDetailsData;

  RxInt notificationSrNo = 0.obs;
  RxInt replyMsgId = 0.obs;

  List<GetNotification> getNotificationList = [];

  var nowDateDisplay =
      DateFormat("E, d MMM yyyy  HH:mm:ss aa").format(DateTime.now());

  Future<void> getProductDetailFunction() async {
    String url =
        "${ApiUrl.getJewelleryDetailApi}?partnerSrNo=$partnerSrNo&productSrno=$productSrNo";
    log(" getProductDetailFunction url: $url");

    try {
      isLoading(true);
      http.Response response = await http.get(
        Uri.parse(url),
        headers: apiHeader.headers,
      );
      log(' getJewelleryProductDetailFunction  response : ${response.body}');

      GetJewelleryDetailModel getJewelleryDetailModel =
          GetJewelleryDetailModel.fromJson(json.decode(response.body));

      isSuccessStatus = getJewelleryDetailModel.success.obs;

      if (response.statusCode == 200) {
        productDetailsData = getJewelleryDetailModel.productDetailsData;

        log('getJewelleryProductDetailFunction productDetailsData item name is  : ${productDetailsData.itemTypeName}');
      } else {
        log('getJewelleryProductDetailFunction Else');
      }
    } catch (e) {
      log("getProductDetailFunction Error ::: $e");
      rethrow;
    } finally {
      isLoading(false);
    }
  }

  Future<void> sendProductInquiryFunction() async {
    String url = ApiUrl.sendProductInquiryApi;
    log(" sendProductInquiryFunction url: $url");

    try {
      // isLoading(true);

      var requestMap = {
        "PartnerSrNo": partnerSrNo,
        "CustomerId": UserDetails.customerId,
        "Title": "",
        "ProductId": productSrNo,
        "Message": sendMsgController.text.trim(),
        "ReplyMsgId": replyMsgId.value == 0 ? null : replyMsgId.value,
      };
      log(' sendProductInquiryFunction  request map : ${requestMap}');
      http.Response response = await http.post(
        Uri.parse(url),
        headers: apiHeader.headers,
        body: jsonEncode(requestMap),
      );
      log(' sendProductInquiryFunction  response : ${response.body}');

      SendMessageModel sendMessageModel =
          SendMessageModel.fromJson(json.decode(response.body));

      isSuccessStatus = sendMessageModel.success.obs;

      if (response.statusCode == 200) {
        replyMsgId.value = sendMessageModel.msgId;
        notificationSrNo.value = sendMessageModel.threadId;
        getNotificationList.add(
          GetNotification(
            customerId: int.parse(UserDetails.customerId),
            isAdminNotification: false,
            isRead: false,
            message: sendMsgController.text,
            messageType: 1,
            partnerName: "",
            partnerSrNo: partnerSrNo,
            productId: productSrNo,
            replyMsgId: replyMsgId.value,
            sentBy: 0,
            srNo: 0,
            timestamp: DateTime.now(),
            title: "",
          ),
        );
        sendMsgController.clear();

        log('sendProductInquiryFunction notificationSrNo.value is ::: ${notificationSrNo.value}');
        if (replyMsgId.value == 0) {
          log('sendProductInquiryFunction replyMsgId.value == 0 ::: ${replyMsgId.value == 0}');
        } else {
          await getAllReplyFunction();
        }
      } else {
        log('sendProductInquiryFunction Else');
      }
    } catch (e) {
      log("sendProductInquiryFunction Error ::: $e");
      rethrow;
    } finally {
      // isLoading(false);
    }
  }

  Future<void> getAllReplyFunction() async {
    String url =
        "${ApiUrl.getNotificationAllReplyApi}?partnerSrNo=$partnerSrNo&notifictionSrNo=${notificationSrNo.value}";

    log(" getAllReplyFunction url: $url");

    try {
      // isLoading(true);
      http.Response response = await http.get(
        Uri.parse(url),
        headers: apiHeader.headers,
      );
      log(' getAllReplyFunction response : ${response.body}');

      GetAllMessageModel getAllMessageModel =
          GetAllMessageModel.fromJson(json.decode(response.body));

      isSuccessStatus = getAllMessageModel.success.obs;

      if (response.statusCode == 200) {
        getNotificationList = getAllMessageModel.getNotification;

        log('getAllReplyFunction getNotificationList is  : ${getNotificationList.length}');
      } else {
        log('getAllReplyFunction Else');
      }
    } catch (e) {
      log("getAllReplyFunction Error ::: $e");
      rethrow;
    } finally {
      // isLoading(false);
    }
  }

  @override
  void onInit() {
    super.onInit();
    getProductDetailFunction();
  }

  @override
  void dispose() {
    super.dispose();
  }
}
