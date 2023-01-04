import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:olocker/constants/api_url.dart';
import 'package:olocker/constants/app_colors.dart';
import 'package:olocker/models/enquire_screen_models/get_all_message_model.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';

import '../../constants/user_details.dart';
import '../../controllers/product_enquire_screen_controller.dart';
import '../../widgets/common_loader.dart';

class SendMessageTextField extends StatelessWidget {
  SendMessageTextField({Key? key}) : super(key: key);

  final screenController = Get.find<ProductEnquireScreenController>();

  @override
  Widget build(BuildContext context) {
    var border = const OutlineInputBorder(
      borderSide: BorderSide(
        color: Color.fromARGB(255, 255, 135, 157),
        width: 1,
      ),
    );
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: 55,
        padding: const EdgeInsets.all(8),
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 255, 213, 227),
        ),
        child: Row(
          children: [
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: AppColors.whiteColor,
                ),
                child: TextFormField(
                  controller: screenController.sendMsgController,
                  decoration: InputDecoration(
                    hintText: "Add your message, comments",
                    hintStyle: TextStyle(
                      fontFamily: "Roboto",
                      fontSize: 11.sp,
                    ),
                    border: border,
                    focusedBorder: border,
                    enabledBorder: border,
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 10,
                    ),
                  ),
                  onFieldSubmitted: (val) async {
                    if (screenController.sendMsgController.text.isNotEmpty) {
                      await screenController.sendProductInquiryFunction();
                    }
                  },
                ),
              ),
            ),
            const SizedBox(width: 5),
            TextButton(
              style: TextButton.styleFrom(
                primary: AppColors.whiteColor,
                backgroundColor: AppColors.accentColor,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(5),
                  ),
                ),
              ),
              onPressed: () async {
                if (screenController.sendMsgController.text.isNotEmpty) {
                  await screenController.sendProductInquiryFunction();
                }
              },
              child: Center(
                child: Text(
                  "send".toUpperCase(),
                  style: TextStyle(
                    fontSize: 11.sp,
                    fontFamily: "Roboto",
                    letterSpacing: 0.4,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ChatDisplayModule extends StatelessWidget {
  ChatDisplayModule({Key? key}) : super(key: key);

  final screenController = Get.find<ProductEnquireScreenController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => screenController.isChatLoading.value
          ? Padding(
              padding: EdgeInsets.symmetric(vertical: 10.h),
              child: CommonLoader().showCircularLoader(),
            )
          : Column(
              children: [
                JewelleryDetailModule(),
                screenController.getNotificationList == []
                    ? const SizedBox()
                    : ListView.builder(
                        shrinkWrap: true,
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        itemCount: screenController.getNotificationList.length,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, i) {
                          GetNotification singleMsg =
                              screenController.getNotificationList[i];
                          log('single Msg is ::: $singleMsg');
                          return SingleMessageModule(
                            msg: singleMsg,
                          );
                        },
                      ),
                const SizedBox(height: 10),
              ],
            ),
    );
  }
}

class SingleMessageModule extends StatelessWidget {
  SingleMessageModule({
    Key? key,
    required this.msg,
  }) : super(key: key);

  final GetNotification msg;

  final screenController = Get.find<ProductEnquireScreenController>();

  @override
  Widget build(BuildContext context) {
    bool isSendByMe;

    // ignore: unrelated_type_equality_checks
    msg.customerId == UserDetails.customerId
        ? isSendByMe = false
        : isSendByMe = true;

    var msgTime = DateFormat("HH:mm aa").format(msg.timestamp).toString();

    log("isSendByMe is :: $isSendByMe");
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Column(
            mainAxisAlignment:
                isSendByMe ? MainAxisAlignment.end : MainAxisAlignment.start,
            crossAxisAlignment:
                isSendByMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
            children: [
              Container(
                width: screenController.size.width * 0.45,
                alignment: Alignment.centerLeft,
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                decoration: BoxDecoration(
                  color: isSendByMe
                      ? AppColors.creamBgColor
                      : AppColors.whiteColor,
                  borderRadius: BorderRadius.only(
                    topRight: const Radius.circular(15),
                    topLeft: const Radius.circular(15),
                    bottomRight: Radius.circular(isSendByMe ? 0 : 15),
                    bottomLeft: Radius.circular(isSendByMe ? 15 : 0),
                  ),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: isSendByMe
                          ? MainAxisAlignment.start
                          : MainAxisAlignment.end,
                      children: [
                        SizedBox(
                          width: screenController.size.width * 0.38,
                          child: Text(
                            msg.message,
                            maxLines: 3,
                            style: TextStyle(
                              fontSize: 11.sp,
                              fontFamily: "Roboto",
                              color: AppColors.blackColor,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 3),
                    Row(
                      mainAxisAlignment: isSendByMe
                          ? MainAxisAlignment.end
                          : MainAxisAlignment.start,
                      children: [
                        Text(
                          msgTime,
                          style: TextStyle(
                            fontSize: 9.sp,
                            fontFamily: "Roboto",
                            color: AppColors.greyTextColor,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class JewelleryDetailModule extends StatelessWidget {
  JewelleryDetailModule({Key? key}) : super(key: key);

  final screenController = Get.find<ProductEnquireScreenController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: const BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.all(
          Radius.circular(8),
        ),
      ),
      child: Row(
        children: [
          SizedBox(
            height: 75,
            width: 75,
            child: screenController.productDetailsData.productImageList.isEmpty
                ? Container(color: AppColors.greyTextColor)
                : CachedNetworkImage(
                    imageUrl: ApiUrl.apiImagePath +
                        screenController.productDetailsData.productImageList[0]
                            .imageLocation,
                    fit: BoxFit.cover,
                  ),
            // Image.asset(
            //   "",
            //   height: 75,
            //   width: 75,
            // ),
          ),
          SizedBox(width: 5.w),
          Expanded(
            flex: 8,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  screenController
                      .productDetailsData.itemTypeName.capitalizeFirst!,
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: AppColors.blackColor,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(height: 0.25.h),
                Text(
                  screenController.productDetailsData.description,
                  maxLines: 1,
                  style: TextStyle(
                    fontSize: 8.5.sp,
                    color: AppColors.blackColor,
                    fontWeight: FontWeight.w400,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                SizedBox(height: 0.25.h),
                Text(
                  "Category : ${screenController.productDetailsData.itemTypeName}",
                  style: TextStyle(
                    fontSize: 8.5.sp,
                    color: AppColors.blackColor,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(height: 0.25.h),
                Text(
                  "₹${screenController.productDetailsData.price}",
                  style: TextStyle(
                    fontSize: 8.5.sp,
                    color: AppColors.blackColor,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(height: 0.5.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      screenController.nowDateDisplay,
                      style: TextStyle(
                        fontSize: 8.5.sp,
                        color: AppColors.greyColor,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class EnquireScreenLoadingWidget extends StatelessWidget {
  EnquireScreenLoadingWidget({Key? key}) : super(key: key);

  final screenController = Get.find<ProductEnquireScreenController>();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Shimmer.fromColors(
        baseColor: Colors.grey.shade300,
        highlightColor: Colors.grey.shade100,
        child: Stack(
          children: [
            const SizedBox(height: 10),
            Container(
              height: 15.h,
              margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: const BoxDecoration(
                color: AppColors.greyColor,
                borderRadius: BorderRadius.all(
                  Radius.circular(8),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 55,
                width: double.infinity,
                color: AppColors.greyColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
