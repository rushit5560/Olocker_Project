import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../constants/api_url.dart';
import '../../constants/app_colors.dart';
import '../../controllers/my_insured_jewellery_screen_controller.dart';
import '../../models/jewellery_models/get_all_insured_jewellery_model.dart';
import '../claim_details_view_screen/claim_details_view_screen.dart';
import '../invoice_details_screen/invoice_details_screen.dart';
import '../ornament_recordings_list_screen/ornament_recordings_list_screen.dart';
import '../submit_claim_form_screen/submit_claim_form_screen.dart';

class InsuredJewelleryListModule extends StatelessWidget {
  InsuredJewelleryListModule({Key? key}) : super(key: key);

  final insuredJewelleryController =
      Get.find<MyInsuredJewelleryScreenController>();

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: insuredJewelleryController.getInsuredOrnamentList.length,
      itemBuilder: (context, index) {
        var singleItem =
            insuredJewelleryController.getInsuredOrnamentList[index];
        return JewelleryListItem(
          insuredItem: singleItem,
        );
      },
      separatorBuilder: (context, index) {
        return const SizedBox(height: 8);
      },
    );
  }
}

class JewelleryListItem extends StatelessWidget {
  JewelleryListItem({Key? key, required this.insuredItem}) : super(key: key);

  final InsuredOrnament insuredItem;

  final insuredJewelleryController =
      Get.find<MyInsuredJewelleryScreenController>();

  @override
  Widget build(BuildContext context) {
    // var imageUrl = insuredJewelleryController.getInsuredOrnamentList[index].url
    //     .substring(
    //         2, insuredJewelleryController.getInsuredOrnamentList[index].url.length);
    // final imagepath = "${ApiUrl.apiImagePath}$imageUrl";

    // log("imag path :: $imagepath");
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
      child: Stack(
        alignment: Alignment.centerRight,
        children: [
          Container(
            width: insuredJewelleryController.size.width * 0.855,
            decoration: BoxDecoration(
              color: AppColors.whiteColor,
              border: Border.all(
                color: AppColors.whiteColor,
                width: 1,
              ),
              borderRadius: const BorderRadius.all(
                Radius.circular(8),
              ),
            ),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.only(
                    left: insuredJewelleryController.size.width * 0.12,
                    right: 10,
                    top: 15,
                    // bottom: 10,
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              "Policy No.",
                              style: TextStyle(
                                fontFamily: "Roboto",
                                fontSize: 10.sp,
                                color: AppColors.greyColor,
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Text(
                            ":",
                            style: TextStyle(
                              fontFamily: "Roboto",
                              fontSize: 10.sp,
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: GestureDetector(
                              onTap: () async {
                                if (insuredItem.pdfUrl.isNotEmpty) {
                                  await launchUrl(
                                      Uri.parse(insuredItem.pdfUrl));
                                }

                                // Get.to(
                                //   () => PdfViewerScreen(),
                                //   arguments: [
                                //     insuredItem.pdfUrl,
                                //   ],
                                // );
                              },
                              child: Text(
                                insuredItem.policyNo,
                                style: TextStyle(
                                  fontFamily: "Roboto",
                                  fontSize: 10.sp,
                                  color: AppColors.blackTextColor,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 5),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              "Insured Amount",
                              style: TextStyle(
                                fontSize: 10.sp,
                                fontFamily: "Roboto",
                                color: AppColors.greyColor,
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Text(
                            ":",
                            style: TextStyle(
                              fontSize: 10.sp,
                              fontFamily: "Roboto",
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Text(
                              NumberFormat.currency(
                                symbol: '₹ ',
                                locale: "HI",
                                decimalDigits: 2,
                              ).format(insuredItem.insuredForAmt),
                              style: TextStyle(
                                fontFamily: "Roboto",
                                fontSize: 10.sp,
                                color: AppColors.blackTextColor,
                              ),
                              // insuredJewelleryController
                              //     .getInsuredOrnamentList[index].purchaseDate
                              // .split(" ")[0],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 4.h),
                ItemSummaryDetailsTable(insuredItem: insuredItem),
                const SizedBox(height: 10),
                Container(
                  height: 30,
                  decoration: const BoxDecoration(
                    color: AppColors.greenButtonColor,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(8),
                      bottomRight: Radius.circular(8),
                    ),
                  ),
                  child: IntrinsicHeight(
                    child: Row(
                      children: [
                        Expanded(
                          child: TextButton(
                            style: TextButton.styleFrom(
                              primary: AppColors.whiteColor,
                            ),
                            onPressed: () {
                              if (insuredItem.isClaim) {
                                Get.to(
                                  () => ClaimDetailsScreen(),
                                  arguments: [
                                    insuredItem.policyNo,
                                  ],
                                );
                              } else {
                                Get.to(
                                  () => SubmitClaimFormScreen(),
                                  arguments: [
                                    insuredItem.policyNo.toString(),
                                    insuredItem.itemName.toString(),
                                    insuredItem.customerName.toString(),
                                    insuredItem.mobileNo.toString(),
                                    insuredItem.insuredForAmt
                                        .toInt()
                                        .toString(),
                                    insuredItem.expiryDate.toString(),
                                    insuredItem.oid.toString(),
                                    insuredItem.srNo.toString(),
                                    insuredItem.policySrNo.toString(),
                                  ],
                                );
                              }
                              // insuredJewelleryController
                              //     .showImagePickerBottomSheet(
                              //   context: context,
                              //   index: index,
                              // );
                            },
                            child: Text(
                              insuredItem.isClaim
                                  ? "Track Your Claim"
                                  : "Submit Claim",
                              style: TextStyle(
                                fontSize: 9.sp,
                                fontFamily: "Roboto",
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 25,
                          child: VerticalDivider(
                            color: AppColors.whiteColor,
                            thickness: 1,
                            width: 1,
                          ),
                        ),
                        Expanded(
                          child: TextButton(
                            style: TextButton.styleFrom(
                              primary: AppColors.whiteColor,
                            ),
                            onPressed: () {
                              Get.to(
                                () => InvoiceDetailsScreen(),
                                arguments: [
                                  insuredItem.policyNo.toString(),
                                  insuredItem.srNo.toString(),
                                  insuredItem.invoiceName == ""
                                      ? ""
                                      : insuredItem.invoiceName
                                          .substring(1)
                                          .toString(),
                                ],
                              );
                            },
                            child: Text(
                              "Invoice",
                              style: TextStyle(
                                fontSize: 9.sp,
                                fontFamily: "Roboto",
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 25,
                          child: VerticalDivider(
                            color: AppColors.whiteColor,
                            thickness: 1,
                            width: 1,
                          ),
                        ),
                        Expanded(
                          child: TextButton(
                            style: TextButton.styleFrom(
                              primary: AppColors.whiteColor,
                            ),
                            onPressed: () {
                              Get.to(
                                () => OrnamentRecordingsListScreen(),
                                arguments: [
                                  insuredItem.srNo,
                                  insuredItem.custOraSrNo,
                                  insuredItem.coi,
                                ],
                              );
                            },
                            child: Text(
                              "Tracking",
                              style: TextStyle(
                                fontSize: 9.sp,
                                fontFamily: "Roboto",
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            left: 0,
            top: 8,
            // alignment: Alignment.topLeft,
            child: GestureDetector(
              onTap: () {
                log("image is : ${ApiUrl.apiImagePath + insuredItem.url.toString().replaceFirst("~", "")}");
              },
              child: Container(
                height: insuredJewelleryController.size.width * 0.19,
                width: insuredJewelleryController.size.width * 0.19,
                decoration: const BoxDecoration(
                  color: AppColors.whiteColor,
                  shape: BoxShape.circle,
                ),
                child: Container(
                  margin: const EdgeInsets.all(4),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(200),
                    ),
                    child: Image.network(
                      ApiUrl.apiImagePath +
                          insuredItem.url.toString().replaceFirst("~", ""),
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          color: AppColors.accentColor,
                          child: Center(
                            child: Text(
                              "no image ",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: AppColors.whiteColor,
                                fontSize: 10.sp,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ItemSummaryDetailsTable extends StatelessWidget {
  ItemSummaryDetailsTable({Key? key, required this.insuredItem})
      : super(key: key);

  final InsuredOrnament insuredItem;

  final insuredJewelleryController =
      Get.put(MyInsuredJewelleryScreenController());

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: const BoxDecoration(color: AppColors.lightBrownBgColor),
          padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 6),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Text(
                  "Item",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: "Roboto",
                    color: AppColors.blackTextColor,
                    fontSize: 9.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Expanded(
                child: Text(
                  "Purchase Date",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: "Roboto",
                    color: AppColors.blackTextColor,
                    fontSize: 9.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Expanded(
                child: Text(
                  "Expiry Date",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: "Roboto",
                    color: AppColors.blackTextColor,
                    fontSize: 9.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Expanded(
                child: Text(
                  "Weight",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: "Roboto",
                    color: AppColors.blackTextColor,
                    fontSize: 9.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 5),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Text(
                  insuredItem.itemName,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppColors.blackTextColor,
                    fontSize: 9.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Expanded(
                child: Text(
                  insuredItem.purchaseDate,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: "Roboto",
                    color: AppColors.blackTextColor,
                    fontSize: 9.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Expanded(
                child: Text(
                  insuredItem.expiryDate,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: "Roboto",
                    color: AppColors.blackTextColor,
                    fontSize: 9.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Expanded(
                child: Text(
                  insuredItem.grossWt,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: "Roboto",
                    color: AppColors.blackTextColor,
                    fontSize: 9.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}

class InsuredLoadingWidget extends StatelessWidget {
  InsuredLoadingWidget({Key? key}) : super(key: key);

  final insuredJewelleryController =
      Get.find<MyInsuredJewelleryScreenController>();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Shimmer.fromColors(
        baseColor: Colors.grey.shade300,
        highlightColor: Colors.grey.shade100,
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 10),
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                // padding: const EdgeInsets.only(top: 15, bottom: 15, right: 10),
                itemCount: 3,
                itemBuilder: (context, index) {
                  return Container(
                    margin:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                    child: Stack(
                      alignment: Alignment.centerRight,
                      children: [
                        Container(
                          width: insuredJewelleryController.size.width * 0.855,
                          height: 20.h,
                          decoration: const BoxDecoration(
                            color: AppColors.greyColor,
                            borderRadius: BorderRadius.all(
                              Radius.circular(8),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 0,
                          top: 8,
                          // alignment: Alignment.topLeft,
                          child: Container(
                            height:
                                insuredJewelleryController.size.width * 0.19,
                            width: insuredJewelleryController.size.width * 0.19,
                            decoration: const BoxDecoration(
                              color: AppColors.greyColor,
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return SizedBox(height: 2.h);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
