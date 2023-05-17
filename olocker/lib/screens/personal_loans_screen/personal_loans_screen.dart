import 'package:another_stepper/dto/stepper_data.dart';
import 'package:another_stepper/widgets/another_stepper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:olocker/constants/app_colors.dart';
import 'package:olocker/controllers/personal_loans_screen_controller.dart';
import 'package:olocker/utils/appbar_style.dart';
import 'package:olocker/utils/extensions.dart';
import 'package:olocker/widgets/common_widgets.dart';
import 'package:sizer/sizer.dart';
import 'personal_loans_screen_widgets.dart';

class PersonalLoansScreen extends StatelessWidget {
  PersonalLoansScreen({Key? key}) : super(key: key);
  final personalLoansScreenController =
      Get.put(PersonalLoansScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffdac0),
      appBar: AppBar(
        backgroundColor: const Color(0xffffdac0),
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            if (personalLoansScreenController.currentStep.value == 2) {
              personalLoansScreenController.currentStep.value--;
            } else if (personalLoansScreenController.currentStep.value == 1) {
              personalLoansScreenController.currentStep.value--;
            } else if (personalLoansScreenController.currentStep.value == 0) {
              Get.back();
            }
          },
          icon: const Icon(Icons.arrow_back_ios, color: AppColors.blackColor),
        ),
        title: Text(
          'Jewellery on EMI',
          style: TextStyleConfig.appbarTextStyle(),
        ),
        centerTitle: true,
      ),
      body: Obx(
        () => personalLoansScreenController.isLoading.value
            ? JewelleryOnEmiLoadingWidget()
            : SingleChildScrollView(
                child: Column(
                  children: [
                    // Stepper Module
                    /*AnotherStepper(
                stepperList: personalLoansScreenController.stepperData,
                stepperDirection: Axis.horizontal,
                horizontalStepperHeight: personalLoansScreenController.size.height * 0.0090.h,
                activeBarColor: AppColors.accentBGColor,
                inActiveBarColor: AppColors.whiteColor,
                activeIndex: personalLoansScreenController.currentStep.value,
                barThickness: 4,
                dotWidget: Container(
                  decoration: BoxDecoration(
                    color: AppColors.accentBGColor,
                    shape: BoxShape.circle,
                  ),
                  child: Text(
                    ''
                  ).commonAllSidePadding(8),
                ),
                subtitleTextStyle: const TextStyle(
                  fontSize: 0.0,
                  height: 0,
                  decorationThickness: 0,
                ),
                titleTextStyle: const TextStyle(
                  fontSize: 0.0,
                  height: 0,
                  decorationThickness: 0,
                ),
              ),*/
                    // NumberStepper(
                    //   numbers: const [1, 2, 3],
                    //   activeStep:
                    //       personalLoansScreenController.currentStep.value,
                    //   activeStepColor: AppColors.accentBGColor,
                    //   stepColor: AppColors.whiteColor,
                    //   enableNextPreviousButtons: false,
                    //   activeStepBorderColor: AppColors.accentBGColor,

                    //   activeStepBorderWidth: 5,

                    //   activeStepBorderPadding: 0,
                    //   enableStepTapping: false,
                    //   lineLength: 22.w,
                    //   lineColor: AppColors.accentBGColor,
                    //   stepReachedAnimationEffect: Curves.bounceInOut,
                    //   // lineDotRadius: 0,
                    //   numberStyle: TextStyle(
                    //     fontWeight: FontWeight.w500,
                    //     color: AppColors.blackColor,
                    //   ),
                    //   onStepReached: (i) {
                    //     personalLoansScreenController.isLoading(true);
                    //     personalLoansScreenController.currentStep.value = i;
                    //     personalLoansScreenController.isLoading(false);
                    //   },
                    // ),
                    AnotherStepper(
                      iconHeight: 60,
                      iconWidth: 60,
                      // gap: 15.w,
                      // verticalGap: 15.w,
                      barThickness: 5,
                      inverted: true,
                      stepperDirection: Axis.horizontal,
                      activeBarColor: AppColors.accentBGColor,
                      inActiveBarColor: AppColors.accentBGColor,
                      activeIndex:
                          personalLoansScreenController.currentStep.value,
                      stepperList: [
                        StepperData(
                          title: StepperText(
                            'Check Eligibility',
                            textStyle: TextStyle(
                              color: const Color(0xFFEC7773),
                              height: 1.6,
                              fontSize: 9.sp,
                              fontWeight: FontWeight.bold,
                              fontFamily: "Acephimere",
                            ),
                          ),
                          iconWidget: Container(
                            height: 9.h,
                            width: 9.h,
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: AppColors.accentBGColor, width: 4),
                              color: AppColors.accentBGColor,
                              shape: BoxShape.circle,
                            ),
                            child: Center(
                              child: Text(
                                "1",
                                style: TextStyle(
                                  fontFamily: "Roboto",
                                  color: AppColors.whiteColor,
                                  fontSize: 22.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ),
                        StepperData(
                          title: StepperText(
                            'EMI Schedule',
                            textStyle: TextStyle(
                              color: const Color(0xFFEC7773),
                              height: 1.6,
                              fontSize: 9.sp,
                              fontWeight: FontWeight.bold,
                              fontFamily: "Acephimere",
                            ),
                          ),
                          iconWidget: Container(
                            height: 9.h,
                            width: 9.h,
                            decoration: BoxDecoration(
                              color: personalLoansScreenController
                                          .currentStep.value >=
                                      1
                                  ? AppColors.accentBGColor
                                  : AppColors.whiteColor,
                              shape: BoxShape.circle,
                              // border: Border.all(
                              //   color: AppColors.accentBGColor,
                              //   width: 4,
                              // ),
                            ),
                            child: Center(
                              child: Text(
                                "2",
                                style: TextStyle(
                                  fontFamily: "Roboto",
                                  color: personalLoansScreenController
                                              .currentStep.value >=
                                          1
                                      ? AppColors.whiteColor
                                      : AppColors.accentBGColor,
                                  fontSize: 22.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ),
                        StepperData(
                          title: StepperText(
                            'Upload Documents',
                            textStyle: TextStyle(
                              color: const Color(0xFFEC7773),
                              height: 1.6,
                              fontSize: 9.sp,
                              fontWeight: FontWeight.bold,
                              fontFamily: "Acephimere",
                            ),
                          ),
                          iconWidget: Container(
                            height: 9.h,
                            width: 9.h,
                            decoration: BoxDecoration(
                              color: personalLoansScreenController
                                          .currentStep.value ==
                                      2
                                  ? AppColors.accentBGColor
                                  : AppColors.whiteColor,
                              shape: BoxShape.circle,
                              // border: Border.all(
                              //   color: AppColors.accentBGColor,
                              //   width: 4,
                              // ),
                            ),
                            child: Center(
                              child: Text(
                                "3",
                                style: TextStyle(
                                  fontFamily: "Roboto",
                                  color: personalLoansScreenController
                                              .currentStep.value ==
                                          2
                                      ? AppColors.whiteColor
                                      : AppColors.accentBGColor,
                                  fontSize: 22.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ).commonOnlyPadding(left: 10, right: 12),
                    // Stepper Step Text Module
                    // Row(
                    //   // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //   children: [
                    //     Expanded(
                    //       child: Text(
                    //         'Check Eligibility',
                    //         textAlign: TextAlign.center,
                    //         style: TextStyle(
                    //           color: AppColors.accentBGColor,
                    //           fontSize: 8.sp,
                    //           fontWeight: FontWeight.w500,
                    //         ),
                    //       ),
                    //     ),
                    //     Expanded(
                    //       child: Text(
                    //         'EMI Schedule',
                    //         textAlign: TextAlign.center,
                    //         style: TextStyle(
                    //           color: AppColors.accentBGColor,
                    //           fontSize: 8.sp,
                    //           fontWeight: FontWeight.w500,
                    //         ),
                    //       ),
                    //     ),
                    //     Expanded(
                    //       child: Text(
                    //         'Upload Documents',
                    //         textAlign: TextAlign.center,
                    //         style: TextStyle(
                    //           color: AppColors.accentBGColor,
                    //           fontSize: 8.sp,
                    //           fontWeight: FontWeight.w500,
                    //         ),
                    //       ),
                    //     ),
                    //   ],
                    // ),

                    // personalLoansScreenController.currentStep.value == 0
                    //     ? GetLoanContainerModule()
                    //     : const SizedBox(),

                    // Stepper Details Module

                    personalLoansScreenController.currentStep.value == 0
                        ? StepOneFormModule()
                        : personalLoansScreenController.currentStep.value == 1
                            ? StepTwoFormModule()
                            : StepThreeFormModule(),

                    personalLoansScreenController.currentStep.value == 2
                        ? GestureDetector(
                            onTap: () async {
                              if (personalLoansScreenController
                                  .panCardFile.path.isEmpty) {
                                CommonWidgets().showBorderSnackBar(
                                  context: context,
                                  displayText: 'Please select Pancard',
                                );
                              } else if (personalLoansScreenController
                                  .aadhaarCardFile.path.isEmpty) {
                                CommonWidgets().showBorderSnackBar(
                                  context: context,
                                  displayText: 'Please select Aadhaar Card',
                                );
                              } else if (personalLoansScreenController
                                  .addressProofFile.path.isEmpty) {
                                CommonWidgets().showBorderSnackBar(
                                  context: context,
                                  displayText: 'Please select Address Proof',
                                );
                              } else if (personalLoansScreenController
                                  .bankStatementFile.path.isEmpty) {
                                CommonWidgets().showBorderSnackBar(
                                  context: context,
                                  displayText: 'Please select Bank Statement',
                                );
                              } else if (personalLoansScreenController
                                  .salarySlipsFile.path.isEmpty) {
                                CommonWidgets().showBorderSnackBar(
                                  context: context,
                                  displayText: 'Please select Salary Slips',
                                );
                              }

                              // else if (personalLoansScreenController
                              //     .rentAgreementFile.path.isEmpty) {
                              //   CommonWidgets().showBorderSnackBar(
                              //     context: context,
                              //     displayText: 'Please select Rent Agreement',
                              //   );
                              // }
                              else {
                                await personalLoansScreenController
                                    .uploadEmiDocumentsFunction();
                              }
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(vertical: 15),
                              decoration: BoxDecoration(
                                color: AppColors.accentBGColor,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Center(
                                child: Text(
                                  'Submit',
                                  style: TextStyle(
                                    color: AppColors.whiteColor,
                                    fontFamily: "Roboto",
                                    fontSize: 12.sp,
                                  ),
                                ),
                              ),
                            ),
                          ).commonSymmetricPadding(horizontal: 20)
                        : Container(),
                    const SizedBox(height: 20)
                  ],
                ),
              ),
      ),
    );
  }
}
