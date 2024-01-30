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
                if (screenController.sendMsgController.text.trim().isNotEmpty) {
                  await screenController.sendProductInquiryFunction();
                } else {}
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
      () => Column(
        children: [
          JewelleryDetailModule(),
          screenController.getNotificationList == []
              ? const SizedBox()
              : screenController.isChatLoading.value
                  ? ChatLoadingWidget()
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
    msg.sentBy == 1 ? isSendByMe = false : isSendByMe = true;

    log('------');
    log('msg.customerId : ${msg.customerId}');
    log('UserDetails.customerId : ${UserDetails.customerId}');
    log("msg.message : ${msg.message}");
    log("isSendByMe is :: $isSendByMe");
    log('------');
    var msgTime = DateFormat("HH:mm aa").format(msg.timestamp).toString();

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
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                margin: isSendByMe
                    ? const EdgeInsets.only(left: 30)
                    : const EdgeInsets.only(right: 30),
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
                  crossAxisAlignment: isSendByMe
                      ? CrossAxisAlignment.end
                      : CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      child: Text(
                        msg.message,
                        style: TextStyle(
                          fontSize: 11.sp,
                          fontFamily: "Roboto",
                          color: AppColors.blackColor,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                    Text(
                      msgTime,
                      textAlign:
                          isSendByMe == true ? TextAlign.left : TextAlign.right,
                      style: TextStyle(
                        fontSize: 9.sp,
                        fontFamily: "Roboto",
                        color: AppColors.greyTextColor,
                        fontWeight: FontWeight.normal,
                      ),
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
            height: 80,
            width: 80,
            child: screenController.productDetailsData.productImageList!.isEmpty
                ? Container(color: AppColors.greyTextColor)
                : CachedNetworkImage(
                    imageUrl: ApiUrl.apiMainUrl +
                        screenController.productDetailsData.productImageList![0]
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
                      .productDetailsData.itemTypeName!.capitalizeFirst!,
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: AppColors.blackColor,
                    fontWeight: FontWeight.w400,
                    fontFamily: "Roboto",
                  ),
                ),
                SizedBox(height: 0.25.h),
                Text(
                  screenController.productDetailsData.description!,
                  // "vsdhvfghsd sdbvfsdbs jksdbgvjksdfvbnkjdf kdsbnfvjkdf dfbnvkjdf jksdfnvjkd djfbv dfbkjvb dfjkb fjbv dgfbvbdfbvjdfbvjbdfjhbv dfjhbvjdb",
                  style: TextStyle(
                    fontSize: 8.5.sp,
                    color: AppColors.darkBlack,
                    fontWeight: FontWeight.w400,
                    // overflow: TextOverflow.ellipsis,
                  ),
                ),
                SizedBox(height: 0.25.h),
                Text(
                  "Category : ${screenController.productDetailsData.itemTypeName}",
                  style: TextStyle(
                    fontSize: 8.5.sp,
                    color: AppColors.darkBlack,
                    fontWeight: FontWeight.w400,
                    fontFamily: "Roboto",
                  ),
                ),
                SizedBox(height: 0.25.h),
                Text(
                  "₹${screenController.productDetailsData.price}",
                  style: TextStyle(
                    fontSize: 8.5.sp,
                    color: AppColors.darkBlack,
                    fontWeight: FontWeight.w400,
                    fontFamily: "Roboto",
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
                        color: const Color(0xffa09d9d),
                        fontWeight: FontWeight.w400,
                        fontFamily: "Roboto",
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
        highlightColor: Colors.grey.shade50,
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

class ChatLoadingWidget extends StatelessWidget {
  ChatLoadingWidget({Key? key}) : super(key: key);

  final screenController = Get.find<ProductEnquireScreenController>();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Shimmer.fromColors(
        baseColor: Colors.grey.shade300,
        highlightColor: Colors.grey.shade50,
        child: Column(
          children: [
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  width: screenController.size.width * 0.45,
                  alignment: Alignment.centerLeft,
                  margin:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
                  decoration: const BoxDecoration(
                    color: AppColors.greyColor,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(15),
                      topLeft: Radius.circular(15),
                      bottomRight: Radius.circular(0),
                      bottomLeft: Radius.circular(15),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  width: screenController.size.width * 0.45,
                  alignment: Alignment.centerLeft,
                  margin:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
                  decoration: const BoxDecoration(
                    color: AppColors.greyColor,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(15),
                      topLeft: Radius.circular(15),
                      bottomRight: Radius.circular(0),
                      bottomLeft: Radius.circular(15),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: screenController.size.width * 0.45,
                  alignment: Alignment.centerLeft,
                  margin:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
                  decoration: const BoxDecoration(
                    color: AppColors.greyColor,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(15),
                      topLeft: Radius.circular(15),
                      bottomRight: Radius.circular(15),
                      bottomLeft: Radius.circular(0),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: screenController.size.width * 0.45,
                  alignment: Alignment.centerLeft,
                  margin:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
                  decoration: const BoxDecoration(
                    color: AppColors.greyColor,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(15),
                      topLeft: Radius.circular(15),
                      bottomRight: Radius.circular(15),
                      bottomLeft: Radius.circular(0),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
