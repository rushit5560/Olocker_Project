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
import '../models/jewellery_details_screen_model/get_offer_jewellery_detail_model.dart';

class ProductEnquireScreenController extends GetxController {
  var partnerSrNo = Get.arguments[0]; // Coming from jewellery details screen
  var productSrNo = Get.arguments[1]; // Coming from jewellery details screen
  var notificationSrNo =
      Get.arguments[2]; // Coming from jewellery details screen
  int isStatusCode = 0;
  final size = Get.size;

  RxBool isLoading = false.obs;
  RxBool isChatLoading = false.obs;
  RxBool isSuccessStatus = false.obs;

  TextEditingController sendMsgController = TextEditingController();

  ApiHeader apiHeader = ApiHeader();
  // late ProductDetailsData productDetailsData;
  GetProductModel productDetailsData = GetProductModel();


  RxInt replyMsgId = 0.obs;
  RxInt threadMsgId = 0.obs;

  List<GetNotification> getNotificationList = [];

  var nowDateDisplay =
      DateFormat("E, d MMM yyyy  HH:mm:ss aa").format(DateTime.now());

  Future<void> getProductDetailFunction() async {
    // String url =
    //     "${ApiUrl.getJewelleryDetailApi}?partnerSrNo=$partnerSrNo&productSrno=$productSrNo";
    String url = "${ApiUrl.getOfferJewelleryDetailApi}?partnerSrNo=$partnerSrNo&productSrno=$productSrNo&customerno=${UserDetails.customerId}";
    log("getProductDetailFunction url: $url");

    try {
      isLoading(true);
      http.Response response = await http.get(
        Uri.parse(url),
        headers: apiHeader.headers,
      );
      log(' getJewelleryProductDetailFunction  response : ${response.body}');

      GetOfferFavouriteVendorModel getJewelleryDetailModel =
      GetOfferFavouriteVendorModel.fromJson(json.decode(response.body));


      // isSuccessStatus = getJewelleryDetailModel.success.obs;
isStatusCode=getJewelleryDetailModel.statusCode;
      if (isStatusCode == 200) {
        productDetailsData = getJewelleryDetailModel.data.productDetailsData;

        log('getJewelleryProductDetailFunction productDetailsData item name is  : ${productDetailsData.itemTypeName}');
      } else {
        log('getJewelleryProductDetailFunction Else');
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
    } catch (e) {
      log("getProductDetailFunction Error ::: $e");
      rethrow;
    } finally {
      isLoading(false);
    }
  }

  Future<void> sendProductInquiryFunction() async {
    isChatLoading(true);
    String url = ApiUrl.sendProductInquiryApi;
    log(" sendProductInquiryFunction url: $url");

    log("isChatLoading :: ${isChatLoading.value}");

    try {
      var requestMap = {
        "PartnerSrNo": partnerSrNo,
        "CustomerId": UserDetails.customerId,
        "Title": "",
        "ProductId": productSrNo,
        "Message": sendMsgController.text.trim(),
        "ReplyMsgId": threadMsgId.value == 0 ? null : threadMsgId.value,
      };
      log(' sendProductInquiryFunction request map : $requestMap');
      http.Response response = await http.post(
        Uri.parse(url),
        headers: apiHeader.headers,
        body: jsonEncode(requestMap),
      );
      log(' sendProductInquiryFunction  response : ${response.body}');

      SendMessageModel sendMessageModel =
          SendMessageModel.fromJson(json.decode(response.body));

      // isSuccessStatus = sendMessageModel.success.obs;
      isStatusCode=sendMessageModel.statusCode;

      if (response.statusCode == 200) {
        // threadMsgId.value = sendMessageModel.data.threadId;
        replyMsgId.value = sendMessageModel.data.replyMsgId;
        // notificationSrNo.value = sendMessageModel.msgId;
        getNotificationList.add(
          GetNotification(
            customerId: int.parse(UserDetails.customerId),
            isAdminNotification: false,
            isRead: false,
            message: sendMsgController.text,
            messageType: 1,
            partnerName: "",
            partnerSrNo: int.parse(partnerSrNo.toString()),
            productId: int.parse(productSrNo.toString()),
            replyMsgId: threadMsgId.value,
            sentBy: 0,
            srNo: 0,
            timestamp: DateTime.now(),
            title: "",
          ),
        );
        log('sendProductInquiryFunction getNotificationList is ::: ${getNotificationList.length}');
        sendMsgController.clear();

        log('sendProductInquiryFunction replyMsgId.value is ::: ${replyMsgId.value}');
        if (threadMsgId.value == 0) {
          log('sendProductInquiryFunction threadMsgId.value == 0 ::: ${threadMsgId.value == 0}');
        } else {
          await getAllReplyFunction();
        }
      } else {
        log('sendProductInquiryFunction Else');
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
    } catch (e) {
      log("sendProductInquiryFunction Error ::: $e");
      rethrow;
    } finally {
      isChatLoading(false);
    }
    log("isChatLoading :: ${isChatLoading.value}");
  }

  Future<void> getAllReplyFunction() async {
    String url =
        "${ApiUrl.getNotificationAllReplyApi}?partnerSrNo=$partnerSrNo&notifictionSrNo=${notificationSrNo != "" ? notificationSrNo : threadMsgId.value}";

    log(" getAllReplyFunction url: $url");

    try {
      isChatLoading(true);
      http.Response response = await http.get(
        Uri.parse(url),
        headers: apiHeader.headers,
      );
      log(' getAllReplyFunction response : ${response.body}');

      GetAllMessageModel getAllMessageModel =
          GetAllMessageModel.fromJson(json.decode(response.body));

      // isSuccessStatus = getAllMessageModel.success.obs;
      isStatusCode = getAllMessageModel.statusCode;

      if (isStatusCode == 200) {
        getNotificationList.addAll(getAllMessageModel.data.getNotification);

        log('getAllReplyFunction getNotificationList is  : ${getNotificationList.length}');
      } else {
        log('getAllReplyFunction Else');
      }
    } catch (e) {
      log("getAllReplyFunction Error ::: $e");
      rethrow;
    } finally {
      isChatLoading(false);
    }
  }

  @override
  void onInit() {
    super.onInit();
    getProductDetailFunction();
    if (notificationSrNo != "") {
      getAllReplyFunction();
    }
    // sendProductInquiryFunction();
  }
}
