import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:im_stepper/stepper.dart';
// import 'package:im_stepper/stepper.dart';
import 'package:olocker/constants/app_colors.dart';
import 'package:olocker/controllers/personal_loans_screen_controller.dart';
import 'package:olocker/utils/extensions.dart';
import 'package:olocker/widgets/common_loader.dart';
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
        title: const Text(
          'Jewellery on EMI',
          style: TextStyle(color: AppColors.blackColor),
        ),
        centerTitle: true,
      ),
      body: Obx(
        () => personalLoansScreenController.isLoading.value
            ? CommonLoader().showCircularLoader()
            : SingleChildScrollView(
                child: Column(
                  children: [
                    // Stepper Module
                    /*AnotherStepper(
                stepperList: personalLoansScreenController.stepperData,
                stepperDirection: Axis.horizontal,
                horizontalStepperHeight: personalLoansScreenController.size.height * 0.0090.h,
                activeBarColor: AppColors.accentColor,
                inActiveBarColor: AppColors.whiteColor,
                activeIndex: personalLoansScreenController.currentStep.value,
                barThickness: 4,
                dotWidget: Container(
                  decoration: BoxDecoration(
                    color: AppColors.accentColor,
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
                    NumberStepper(
                      numbers: const [1, 2, 3],
                      activeStep:
                          personalLoansScreenController.currentStep.value,
                      activeStepColor: AppColors.accentColor,
                      stepColor: AppColors.whiteColor,
                      enableNextPreviousButtons: false,
                      activeStepBorderColor: AppColors.accentColor,
                      activeStepBorderWidth: 0,
                      activeStepBorderPadding: 0,
                      enableStepTapping: false,
                      lineLength:
                          personalLoansScreenController.size.width * 0.20,
                      lineColor: AppColors.accentColor,
                      lineDotRadius: 0.1,
                      numberStyle: const TextStyle(fontWeight: FontWeight.w500),
                      onStepReached: (i) {
                        personalLoansScreenController.isLoading(true);
                        personalLoansScreenController.currentStep.value = i;
                        personalLoansScreenController.isLoading(false);
                      },
                    ),

                    // Stepper Step Text Module
                    Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            'Check Eligibility',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: AppColors.accentColor,
                              fontSize: 8.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            'EMI Schedule',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: AppColors.accentColor,
                              fontSize: 8.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            'upload Documents',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: AppColors.accentColor,
                              fontSize: 8.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),

                    // Stepper Details Module
                    Container(
                      decoration: BoxDecoration(
                        color:
                            personalLoansScreenController.currentStep.value == 1
                                ? null
                                : AppColors.whiteColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: personalLoansScreenController.currentStep.value ==
                              0
                          ? StepOneFormModule()
                          : personalLoansScreenController.currentStep.value == 1
                              ? StepTwoFormModule()
                              : StepThreeFormModule(),
                    ).commonAllSidePadding(20),

                    personalLoansScreenController.currentStep.value == 2
                        ? GestureDetector(
                            onTap: () async {
                              if (personalLoansScreenController
                                  .panCardFile.path.isEmpty) {
                                log('Please select Pancard');
                              } else if (personalLoansScreenController
                                  .aadhaarCardFile.path.isEmpty) {
                                log('Please select Aadhaar Card');
                              } else if (personalLoansScreenController
                                  .addressProofFile.path.isEmpty) {
                                log('Please select Address Proof');
                              } else if (personalLoansScreenController
                                  .bankStatementFile.path.isEmpty) {
                                log('Please select Bank Statement');
                              } else if (personalLoansScreenController
                                  .salarySlipsFile.path.isEmpty) {
                                log('Please select Salary Sleep');
                              } else if (personalLoansScreenController
                                  .rentAgreementFile.path.isEmpty) {
                                log('Please select Rent Agreement');
                              } else {
                                await personalLoansScreenController
                                    .uploadEmiDocumentsFunction();
                              }
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: AppColors.accentColor,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: const Center(
                                child: Text(
                                  'SUBMIT',
                                  style: TextStyle(
                                    color: AppColors.whiteColor,
                                  ),
                                ),
                              ).commonSymmetricPadding(vertical: 12),
                            ),
                          ).commonSymmetricPadding(horizontal: 20, vertical: 15)
                        : Container(),
                  ],
                ),
              ),
      ),
    );
  }
}
