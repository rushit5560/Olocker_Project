import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:olocker/constants/app_colors.dart';
import 'package:olocker/constants/app_images.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';
import '../../../controllers/saving_schemes_screens_controllers/scheme_payment_success_screen_controller.dart';

// class JewellerDetailImageInfoModule extends StatelessWidget {
//   JewellerDetailImageInfoModule({Key? key}) : super(key: key);

//   final screenController =
//       Get.find<SchemeChoosePaymentMethodScreenController>();

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: double.infinity,
//       decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(10), color: Colors.white),
//       child: Row(
//         children: [
//           CachedNetworkImage(
//             imageUrl: ApiUrl.apiImagePath + screenController.schemeImagePath,
//             fit: BoxFit.cover,
//             width: 18.w,
//             errorWidget: (context, url, error) {
//               return Image.asset(
//                 AppImages.diamondsIocn,
//                 fit: BoxFit.cover,
//                 width: 18.w,
//               );
//             },
//           ),
//           SizedBox(width: 2.h),
//           Expanded(
//             flex: 7,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   screenController.schemeName,
//                   style: TextStyle(
//                     fontSize: 13.sp,
//                     color: AppColors.accentColor,
//                     fontWeight: FontWeight.w500,
//                   ),
//                 ),
//                 const SizedBox(height: 4),
//                 Text(
//                   screenController.schemeTagLine,
//                   style: TextStyle(
//                     fontSize: 11.sp,
//                     color: AppColors.greyColor,
//                     fontWeight: FontWeight.w400,
//                   ),
//                 ),
//               ],
//             ),
//           )
//         ],
//       ).commonAllSidePadding(20),
//     );
//   }
// }

// class PaymentDetails extends StatelessWidget {
//   PaymentDetails({Key? key}) : super(key: key);

//   // final screenController =
//   //     Get.find<SchemeChoosePaymentMethodScreenController>();

//   @override
//   Widget build(BuildContext context) {
//     var format = DateFormat("dd MMM yyyy");

//     var startDate =
//         format.format(screenController.partnerSavingSchemeDetails.startDate);
//     var maturityDate =
//         format.format(screenController.partnerSavingSchemeDetails.endDate);
//     return Container(
//       padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(10),
//         color: Colors.white,
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           PaymentDetailsRowWidget(
//             text: "Monthly Installment",
//             textValue:
//                 "₹ ${screenController.savingSchemeDetails.monthlyAmount}",
//           ),
//           SizedBox(height: 1.h),
//           PaymentDetailsRowWidget(
//             text: "Balance payable at maturity",
//             textValue:
//                 "₹ ${screenController.savingSchemeDetails.maturityAmount}",
//           ),
//           SizedBox(height: 1.h),
//           PaymentDetailsRowWidget(
//             text: "Tenure",
//             textValue: "${screenController.savingSchemeDetails.tenure} months",
//           ),
//           SizedBox(height: 1.h),
//           PaymentDetailsRowWidget(
//             text: "Starting Date",
//             textValue: startDate,
//           ),
//           SizedBox(height: 1.h),
//           PaymentDetailsRowWidget(
//             text: "Maturity Date",
//             textValue: maturityDate,
//           ),
//         ],
//       ),
//     );
//   }
// }

class PaymentSuccessDetailsModule extends StatelessWidget {
  PaymentSuccessDetailsModule({Key? key}) : super(key: key);

  final screenController = Get.find<SchemePaymentSuccessScreenController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => screenController.isLoading.value
          ? SizedBox(
              width: double.infinity,
              child: Shimmer.fromColors(
                baseColor: Colors.grey.shade300,
                highlightColor: Colors.grey.shade100,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(height: 10),
                      Container(
                        height: 28.h,
                        width: double.infinity,
                        margin: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 12),
                        padding: const EdgeInsets.symmetric(
                            vertical: 15, horizontal: 12),
                        decoration: const BoxDecoration(
                          color: AppColors.greyColor,
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          : Container(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppColors.whiteColor,
              ),
              child: Column(
                children: [
                  Text(
                    "Your payment is successful !",
                    style: TextStyle(
                      fontSize: 15.sp,
                      color: AppColors.accentColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 3.h),
                  Container(
                    height: 9.h,
                    width: 9.h,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage(AppImages.paymentSuccessimage),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(height: 3.h),
                  Text(
                    "Order date : ${screenController.transactionData.transactionDate.split(" ")[0]}",

                    // 18-06-2021",
                    style: TextStyle(
                      fontSize: 11.sp,
                      color: AppColors.blackColor,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  SizedBox(height: 2.h),
                  Text(
                    "YOUR FOLIO NUMBER",
                    style: TextStyle(
                      fontSize: 11.sp,
                      color: AppColors.blackColor,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  SizedBox(height: 0.5.h),
                  Text(
                    screenController.transactionData.invoiceNo,
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: AppColors.blackColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 3.h),
                  // Text(
                  //   "Next installment date : ${screenController.transactionData.billingDate.split(" ")[0]}",
                  //   style: TextStyle(
                  //     fontSize: 11.sp,
                  //     color: AppColors.blackColor,
                  //     fontWeight: FontWeight.w500,
                  //   ),
                  // ),
                  // SizedBox(height: 4.h),
                  Text(
                    "You can dowanload the receipt and check status of your schemes from MYOLOCKER section on this app.",
                    style: TextStyle(
                      fontSize: 10.5.sp,
                      color: AppColors.blackColor,
                      fontWeight: FontWeight.normal,
                    ),
                  )
                ],
              ),
            ),
    );
  }
}

class GoBackSavingSchemeButton extends StatelessWidget {
  GoBackSavingSchemeButton({Key? key}) : super(key: key);

  final screenController = Get.find<SchemePaymentSuccessScreenController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      height: 48,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          Get.back();
          Get.back();
          Get.back();
          Get.back();
        },
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Center(
          child: Text(
            "GO BACK TO MY SAVING SCHEMES",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontFamily: "Roboto-Medium",
              fontSize: 12.sp,
              color: AppColors.whiteColor,
              fontStyle: FontStyle.italic,
              letterSpacing: 0.6,
            ),
          ),
        ),
      ),
    );
  }
}
