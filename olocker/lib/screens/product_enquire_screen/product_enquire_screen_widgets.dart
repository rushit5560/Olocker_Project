import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:olocker/constants/api_url.dart';
import 'package:olocker/constants/app_colors.dart';
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
                ),
              ),
            ),

            // Container(),
            TextButton(
              style: TextButton.styleFrom(
                primary: AppColors.whiteColor,
                backgroundColor: AppColors.accentColor,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(
                      0,
                    ),
                  ),
                ),
              ),
              onPressed: () async {
                await screenController.sendProductInquiryFunction();
              },
              child: Center(
                child: Text(
                  "send".toUpperCase(),
                  style: TextStyle(
                    fontSize: 11.sp,
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
    Widget messageList({
      required int index,
    }) {
      // ignore: unrelated_type_equality_checks
      return screenController.getNotificationList[index].customerId ==
              UserDetails.customerId
          ? Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Container(
                width: screenController.size.width * 0.45,
                padding: const EdgeInsets.all(12),
                decoration: const BoxDecoration(color: AppColors.whiteColor),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //const SizedBox(width: 50),
                    Expanded(
                      flex: 1,
                      child: Container(),
                    ),
                    Expanded(
                      flex: 3,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Column(
                              //mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  screenController
                                      .getNotificationList[index].message,
                                  style: const TextStyle(fontSize: 12),
                                ),
                                const SizedBox(height: 10),
                                // screenController
                                //         .getNotificationList[index]
                                //         .file
                                //         .isNotEmpty
                                //     ? SizedBox(
                                //         height: 80,
                                //         width: 80,
                                //         // decoration: BoxDecoration(
                                //         //     borderRadius: BorderRadius.circular(10.0),
                                //         //     //border: Border.all(color: AppColors.colorLightGrey),
                                //         //     boxShadow: [
                                //         //       BoxShadow(
                                //         //           blurRadius: 1,
                                //         //           blurStyle: BlurStyle.outer,
                                //         //           color: Colors.grey.shade500
                                //         //       )
                                //         //     ]
                                //         // ),
                                //         child: ClipRRect(
                                //           borderRadius:
                                //               BorderRadius.circular(10.0),
                                //           child: Image.network(
                                //             "https://squadgame.omdemo.co.in/asset/uploads/chat/" +
                                //                 screenController
                                //                     .getNotificationList[
                                //                         index]
                                //                     .file,
                                //             //     height: 150, width: 150, fit: BoxFit.cover),
                                //           ),
                                //         ))
                                //     : Container()
                              ],
                            ),
                          ),
                          const SizedBox(width: 10),
                          // Container(
                          //   // height: 150, width: 150,
                          //   // decoration: BoxDecoration(
                          //   //     borderRadius: BorderRadius.circular(10.0),
                          //   //     //border: Border.all(color: AppColors.colorLightGrey),
                          //   //     boxShadow: [
                          //   //       BoxShadow(
                          //   //           blurRadius: 1,
                          //   //           blurStyle: BlurStyle.outer,
                          //   //           color: Colors.grey.shade500
                          //   //       )
                          //   //     ]
                          //   // ),
                          //   child: ClipRRect(
                          //     borderRadius: BorderRadius.circular(30.0),
                          //     child: screenController
                          //             .getNotificationList[index]
                          //             .profile
                          //             .isNotEmpty
                          //         ? Image.network(
                          //             "https://squadgame.omdemo.co.in/asset/uploads/" +
                          //                 screenController
                          //                     .getNotificationList[
                          //                         index]
                          //                     .profile,
                          //             fit: BoxFit.cover,
                          //             height: 40,
                          //             width: 40)
                          //         : Container(),
                          //   ),
                          // )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          : Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Container(
                width: screenController.size.width * 0.45,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: AppColors.whiteColor,
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 3,
                      blurStyle: BlurStyle.outer,
                      color: AppColors.greyColor,
                    ),
                  ],
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(15),
                    topLeft: Radius.circular(15),
                    bottomRight: Radius.circular(15),
                    bottomLeft: Radius.circular(15),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 3,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Container(
                          //   // height: 150, width: 150,
                          //   // decoration: BoxDecoration(
                          //   //     borderRadius: BorderRadius.circular(10.0),
                          //   //     //border: Border.all(color: AppColors.colorLightGrey),
                          //   //     boxShadow: [
                          //   //       BoxShadow(
                          //   //           blurRadius: 1,
                          //   //           blurStyle: BlurStyle.outer,
                          //   //           color: Colors.grey.shade500
                          //   //       )
                          //   //     ]
                          //   // ),
                          //   child: ClipRRect(
                          //     borderRadius: BorderRadius.circular(30.0),
                          //     child: screenController
                          //             .getNotificationList[index]
                          //             .profile
                          //             .isNotEmpty
                          //         ? Image.network(
                          //             "https://squadgame.omdemo.co.in/asset/uploads/" +
                          //                 screenController
                          //                     .getNotificationList[index]
                          //                     .profile,
                          //             fit: BoxFit.cover,
                          //             height: 40,
                          //             width: 40)
                          //         : Container(),
                          //   ),
                          // ),
                          const SizedBox(width: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                screenController
                                    .getNotificationList[index].message,
                                style: const TextStyle(fontSize: 12),
                              ),
                              const SizedBox(height: 10),
                              // screenController.getNotificationList[index]
                              //         .file.isNotEmpty
                              //     ? SizedBox(
                              //         height: 80,
                              //         width: 80,
                              //         // decoration: BoxDecoration(
                              //         //     borderRadius: BorderRadius.circular(10.0),
                              //         //     //border: Border.all(color: AppColors.colorLightGrey),
                              //         //     boxShadow: [
                              //         //       BoxShadow(
                              //         //           blurRadius: 1,
                              //         //           blurStyle: BlurStyle.outer,
                              //         //           color: Colors.grey.shade500
                              //         //       )
                              //         //     ]
                              //         // ),
                              //         child: ClipRRect(
                              //           borderRadius:
                              //               BorderRadius.circular(10.0),
                              //           child: Image.network(
                              //             "https://squadgame.omdemo.co.in/asset/uploads/chat/" +
                              //                 screenController
                              //                     .getNotificationList[
                              //                         index]
                              //                     .file,
                              //             //     height: 150, width: 150, fit: BoxFit.cover),
                              //           ),
                              //         ))
                              //     : Container()
                            ],
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(),
                    ),
                  ],
                ),
              ),
            );
    }

    return SingleChildScrollView(
      child: Column(
        children: [
          JewelleryDetailModule(),
          screenController.getNotificationList.isEmpty
              ? const Center(child: Text("No message"))
              : ListView.builder(
                  // controller: screenController.scrollController,
                  // reverse: true,
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  itemCount: screenController.getNotificationList.length,
                  shrinkWrap: true,

                  physics: const AlwaysScrollableScrollPhysics(),
                  itemBuilder: (context, ind) {
                    /// For reverse get message list and scrolling messages
                    // int index =
                    //     screenController.getNotificationList.length - 1 - i;
                    // log('screenController.getNotificationList[i].userid: ${screenController.getNotificationList[i].userid}');
                    // log('UserDetails.userId: ${UserDetails.userId}');
                    /*return SingleMessageBubble(
              isSendByMe: screenController.userChatList[i].isSendByMe,
              message: screenController.userChatList[i].message,
            );*/
                    return messageList(
                      index: ind,
                    );
                  },
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
            child: CachedNetworkImage(
              imageUrl: ApiUrl.apiImagePath +
                  screenController
                      .productDetailsData.productImageList[0].imageLocation,
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
                    fontSize: 13.sp,
                    color: AppColors.blackColor,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(height: 0.25.h),
                Text(
                  screenController.productDetailsData.description,
                  maxLines: 1,
                  style: TextStyle(
                    fontSize: 9.sp,
                    color: AppColors.blackColor,
                    fontWeight: FontWeight.w400,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                SizedBox(height: 0.25.h),
                Text(
                  "Category : ${screenController.productDetailsData.itemTypeName}",
                  style: TextStyle(
                    fontSize: 9.sp,
                    color: AppColors.blackColor,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(height: 0.25.h),
                Text(
                  "₹${screenController.productDetailsData.price}",
                  style: TextStyle(
                    fontSize: 9.sp,
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
                        fontSize: 9.sp,
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
