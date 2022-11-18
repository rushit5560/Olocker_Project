import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:olocker/screens/product_enquire_screen/product_enquire_screen.dart';
import 'package:sizer/sizer.dart';

import '../../constants/api_url.dart';
import '../../constants/app_colors.dart';
import '../../controllers/my_inquiries_list_screen_controller.dart';
import '../jewellery_details_screen/jewellery_details_screen.dart';

class InquiriesListModule extends StatelessWidget {
  InquiriesListModule({Key? key}) : super(key: key);

  final inquiriesListScreenController =
      Get.find<MyInquiriesListScreenController>();

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      itemCount:
          inquiriesListScreenController.getInquiryNotificationList.length,
      itemBuilder: (context, index) {
        return InquiryListItem(
          index: index,
        );
      },
      separatorBuilder: (context, index) {
        return SizedBox(height: 2.h);
      },
    );
  }
}

class InquiryListItem extends StatelessWidget {
  InquiryListItem({
    Key? key,
    required this.index,
  }) : super(key: key);

  int index;
  final inquiriesListScreenController =
      Get.find<MyInquiriesListScreenController>();

  @override
  Widget build(BuildContext context) {
    var singleInquiry =
        inquiriesListScreenController.getInquiryNotificationList[index];
    var imgPath = "${ApiUrl.apiImagePath}${singleInquiry.imgeUrl.substring(3)}";

    // log("imgPath :: $imgPath");
    return Stack(
      alignment: Alignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 5),
              width: inquiriesListScreenController.size.width * 0.84,
              decoration: const BoxDecoration(
                color: AppColors.whiteColor,
                borderRadius: BorderRadius.all(
                  Radius.circular(12),
                ),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.greyTextColor,
                    blurRadius: 5,
                    spreadRadius: 1,
                  ),
                ],
              ),
              child: Row(
                children: [
                  SizedBox(
                    width: inquiriesListScreenController.size.width * 0.12,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: inquiriesListScreenController.size.width * 0.7,
                          child: Text(
                            singleInquiry.itemDesc,
                            maxLines: 1,
                            style: TextStyle(
                              fontSize: 10.sp,
                              fontWeight: FontWeight.w400,
                              color: AppColors.blackTextColor,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                        SizedBox(height: 0.5.h),
                        SizedBox(
                          width: inquiriesListScreenController.size.width * 0.5,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Category : ${singleInquiry.itemName}",
                                style: TextStyle(
                                  fontSize: 10.sp,
                                  fontWeight: FontWeight.normal,
                                  color: AppColors.blackTextColor,
                                ),
                              ),
                              SizedBox(height: 0.5.h),
                              Text(
                                "₹${singleInquiry.productsPrice.toString()}",
                                style: TextStyle(
                                  fontSize: 10.sp,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.blackTextColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 0.5.h),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Container(
            height: inquiriesListScreenController.size.height * 0.08,
            width: inquiriesListScreenController.size.height * 0.08,
            margin: const EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 8,
            ),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.whiteColor,
              // boxShadow: [
              //   BoxShadow(
              //     color: AppColors.greyTextColor,
              //     blurRadius: 5,
              //     spreadRadius: 1,
              //   ),
              // ],
            ),
            child: ClipRRect(
              borderRadius: const BorderRadius.all(
                Radius.circular(60),
              ),
              child: CachedNetworkImage(
                imageUrl: imgPath,
                fit: BoxFit.cover,
                placeholder: (context, url) {
                  return Center(
                    child: Text(
                      "No Image",
                      style: TextStyle(
                        fontSize: 8.sp,
                      ),
                    ),
                  );
                },
                errorWidget: (context, url, error) {
                  return Center(
                    child: Text(
                      "No Image",
                      style: TextStyle(
                        fontSize: 8.sp,
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: () {
                  Get.to(
                    () => ProductEnquireScreen(),
                    arguments: [
                      inquiriesListScreenController
                          .getInquiryNotificationList[index].partnerSrNo,
                      inquiriesListScreenController
                          .getInquiryNotificationList[index].productId,
                      inquiriesListScreenController
                          .getInquiryNotificationList[index].srNo,
                    ],
                  );
                },
                child: Container(
                  height: inquiriesListScreenController.size.height * 0.04,
                  width: inquiriesListScreenController.size.width * 0.22,
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: const BoxDecoration(
                    color: AppColors.accentColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12),
                      bottomLeft: Radius.circular(12),
                      bottomRight: Radius.circular(12),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.remove_red_eye_outlined,
                        color: AppColors.whiteColor,
                        size: 15.sp,
                      ),
                      SizedBox(width: 1.5.w),
                      Text(
                        "View",
                        style: TextStyle(
                          color: AppColors.whiteColor,
                          fontSize: 11.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
