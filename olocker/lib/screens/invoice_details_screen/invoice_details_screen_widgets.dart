import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:olocker/constants/api_url.dart';
import 'package:olocker/constants/app_colors.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';

import '../../controllers/invoice_details_screen_controller.dart';

class InvoiceUploadModule extends StatelessWidget {
  InvoiceUploadModule({Key? key}) : super(key: key);

  final invoiceDetailsScreenController =
      Get.put(InvoiceDetailsScreenController());

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 15),
            Text(
              "Policy Number",
              style: TextStyle(
                color: AppColors.blackColor,
                fontSize: 15.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              invoiceDetailsScreenController.policyNumber,
              style: TextStyle(
                color: AppColors.blackColor,
                fontSize: 15.sp,
                fontWeight: FontWeight.w600,
                letterSpacing: 1,
              ),
            ),
            SizedBox(height: 20.h),
            invoiceDetailsScreenController.invoiceName == ""
                ? GestureDetector(
                    onTap: () {
                      invoiceDetailsScreenController.showImagePickerBottomSheet(
                          context: context);
                    },
                    child: Container(
                      height: 200,
                      width: 200,
                      padding: const EdgeInsets.all(10),
                      decoration: const BoxDecoration(
                        color: AppColors.whiteColor,
                        borderRadius: BorderRadius.all(
                          Radius.circular(12),
                        ),
                      ),
                      child: invoiceDetailsScreenController.invoiceImageFile !=
                              null
                          ? Image.file(
                              invoiceDetailsScreenController.invoiceImageFile!,
                              fit: BoxFit.cover,
                            )
                          : Center(
                              child: Text(
                                "Upload Invoice",
                                style: TextStyle(
                                  color: AppColors.greyTextColor,
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                      // CachedNetworkImage(
                      //     imageUrl: ApiUrl.apiImagePath +
                      //         invoiceDetailsScreenController.invoiceExistingImage
                      //             .substring(1),
                      //     fit: BoxFit.fill,
                      //     errorWidget: (context, error, stackTrace) {
                      //       return Container(
                      //         color: AppColors.greyTextColor.withOpacity(0.5),
                      //         child: Center(
                      //           child: Text(
                      //             "Upload Invoice",
                      //             style: TextStyle(
                      //               color: AppColors.greyTextColor,
                      //               fontSize: 15.sp,
                      //               fontWeight: FontWeight.w500,
                      //             ),
                      //           ),
                      //         ),
                      //       );
                      //     },
                      //   ),
                    ),
                  )
                : Container(
                    height: 200,
                    width: 81.w,
                    child: Stack(
                      alignment: Alignment.bottomLeft,
                      children: [
                        Container(
                          height: 184,
                          width: 76.w,
                          padding: const EdgeInsets.all(10),
                          decoration: const BoxDecoration(
                            color: AppColors.whiteColor,
                            borderRadius: BorderRadius.all(
                              Radius.circular(12),
                            ),
                          ),
                          child: CachedNetworkImage(
                            imageUrl: ApiUrl.apiImagePath +
                                invoiceDetailsScreenController.invoiceName,
                            fit: BoxFit.fill,
                            errorWidget: (context, error, stackTrace) {
                              return Container(
                                color: AppColors.greyTextColor.withOpacity(0.5),
                                child: Center(
                                  child: Text(
                                    "Can't load invoice",
                                    style: TextStyle(
                                      color: AppColors.greyTextColor,
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        GestureDetector(
                          onTap: () async {
                            await invoiceDetailsScreenController
                                .deleteInvoiceApiFunction();
                          },
                          child: Align(
                            alignment: Alignment.topRight,
                            child: Container(
                              height: 30,
                              width: 30,
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                color: Color.fromARGB(255, 226, 2, 2),
                                shape: BoxShape.circle,
                              ),
                              child: Center(
                                child: Icon(
                                  Icons.close,
                                  size: 15.sp,
                                  color: AppColors.whiteColor,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }
}

class InvoiceDetailsLoadingWidget extends StatelessWidget {
  InvoiceDetailsLoadingWidget({Key? key}) : super(key: key);

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
              const SizedBox(height: 15),
              Container(
                height: 25,
                width: 60.w,
                color: AppColors.greyColor,
              ),
              const SizedBox(height: 12),
              Container(
                height: 20,
                width: 65.w,
                color: AppColors.greyColor,
              ),
              SizedBox(height: 20.h),
              Container(
                height: 200,
                width: 200,
                padding: const EdgeInsets.all(10),
                decoration: const BoxDecoration(
                  color: AppColors.greyColor,
                  borderRadius: BorderRadius.all(
                    Radius.circular(12),
                  ),
                ),
                child: Center(
                  child: Text(
                    "Upload Invoice",
                    style: TextStyle(
                      color: AppColors.greyTextColor,
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
