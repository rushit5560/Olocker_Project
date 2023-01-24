import 'dart:developer';
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:olocker/constants/app_colors.dart';
import 'package:olocker/constants/app_images.dart';
import 'package:olocker/controllers/personal_loans_screen_controller.dart';
import 'package:olocker/models/personal_loans_screen_model/check_availability_model.dart';
import 'package:olocker/utils/extensions.dart';
import 'package:olocker/utils/field_validation.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';

class GetLoanContainerModule extends StatelessWidget {
  GetLoanContainerModule({Key? key}) : super(key: key);
  final screenController = Get.find<PersonalLoansScreenController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          padding: EdgeInsets.symmetric(horizontal: 8.w),
          decoration:const BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
            color: AppColors.whiteColor,
          ),
          child: Row(
            children: [
              Expanded(
                flex: 70,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "CASH GIFTS",
                      style: TextStyle(
                        color: AppColors.whiteColor,
                        fontSize: 20.sp,
                        fontFamily: "latoregular",
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "FOR ₹1L JEWELLERY",
                      style: TextStyle(
                        color: AppColors.whiteColor,
                        fontSize: 12.sp,
                        fontFamily: "latoregular",
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 30,
                child: Image.asset(
                  AppImages.joyWomenImage,
                  height: 10.h,
                ),
              )
            ],
          ),
        ),
        SizedBox(height: 2.h),
      ],
    );
  }
}

class StepOneFormModule extends StatelessWidget {
  StepOneFormModule({Key? key}) : super(key: key);
  final screenController = Get.find<PersonalLoansScreenController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Container(
        //   margin: const EdgeInsets.all(20),
        //   padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 15),
        //   decoration: BoxDecoration(
        //     color: AppColors.whiteColor,
        //     borderRadius: BorderRadius.circular(10),
        //   ),
        //   child: Row(
        //     crossAxisAlignment: CrossAxisAlignment.center,
        //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //     children: [
        //       Image.asset(
        //         AppImages.walletImage,
        //         height: 45,
        //         width: 40,
        //       ),
        //       SizedBox(width: 4.w),
        //       Column(
        //         crossAxisAlignment: CrossAxisAlignment.start,
        //         mainAxisAlignment: MainAxisAlignment.center,
        //         children: [
        //           Text(
        //             "Your Pre approved loan is",
        //             textAlign: TextAlign.center,
        //             style: TextStyle(
        //               fontSize: 11.5.sp,
        //               color: AppColors.greyColor,
        //               fontWeight: FontWeight.w500,
        //             ),
        //           ),
        //           Row(
        //             children: [
        //               Text(
        //                 "₹ 100000",
        //                 textAlign: TextAlign.center,
        //                 style: TextStyle(
        //                   fontSize: 24.sp,
        //                   color: AppColors.accentColor,
        //                   fontWeight: FontWeight.bold,
        //                 ),
        //               ),
        //               SizedBox(width: 20),
        //               ElevatedButton(
        //                 onPressed: () {},
        //                 style: ElevatedButton.styleFrom(
        //                   shape: RoundedRectangleBorder(
        //                     borderRadius: BorderRadius.circular(8),
        //                   ),
        //                 ),
        //                 child: Text(
        //                   "GET LOAN",
        //                   style: TextStyle(
        //                     fontSize: 11.sp,
        //                     fontFamily: "Roboto",
        //                     color: AppColors.whiteColor,
        //                   ),
        //                 ),
        //               ),
        //             ],
        //           ),
        //         ],
        //       ),
        //     ],
        //   ),
        // ),
      const  SizedBox(height: 20),
        Container(
          margin: const EdgeInsets.only(bottom: 20, left: 20, right: 20),
          // .all(20),
          // padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: screenController.currentStep.value == 1
                ? null
                : AppColors.whiteColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            children: [
              Form(
                key: screenController.stepOneFormKey,
                child: Column(
                  children: [
                    Text(
                      'Your personal data',
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontFamily: "Roboto",
                        fontWeight: FontWeight.bold,
                        color: AppColors.blueDarkColor,
                      ),
                    ),
                    SizedBox(height: 1.5.h),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        'Your personal data will be shared with the relevant jeweller who will offer EMI option to buy jewellery',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 11.sp,
                          fontFamily: "Roboto",
                          color: AppColors.greyColor,
                        ),
                      ),
                    ),
                    SizedBox(height: 2.5.h),
                    _fLNameModule(),
                    const SizedBox(height: 10),
                    _birthDateModule(context),
                    const SizedBox(height: 10),
                    _mobileNumberModule(),
                    const SizedBox(height: 10),
                    _emailIdModule(),
                    const SizedBox(height: 10),
                    _residentialPinCodeModule(),
                    const SizedBox(height: 10),
                    _panNumberModule(),
                    const SizedBox(height: 10),
                    _loanNeededModule(),
                    const SizedBox(height: 15),
                    _loanAmountSliderModule(),
                    const SizedBox(height: 10),
                    _salariedModule(),
                    // Row(
                    //   children: [
                    //     _salariedModule(),
                    //     _selfEmployedModule(),
                    //   ],
                    // ),
                    const SizedBox(height: 10),
                    Text(
                      'Kindly note : Your salary must be coming directly to your bank account via bank transfer',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 9.5.sp,
                        fontFamily: "Roboto",
                        color: AppColors.greyColor,
                      ),
                    ),
                    SizedBox(height: screenController.size.height * 0.0030.h),
                    _monthlyIncomeModule(),
                    const SizedBox(height: 10),
                    _employerNameModule(),
                    const SizedBox(height: 10),
                    _currentTotalEmiModule(),
                    const SizedBox(height: 10),
                    _whichBankModule(),
                    const SizedBox(height: 10),
                    _homeLoanModule(),
                    const SizedBox(height: 20),
                    _submitButton(context),
                    const SizedBox(height: 10),
                  ],
                ).commonAllSidePadding(16),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _fLNameModule() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
      // height: 45,
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.greyColor.withOpacity(0.2),
        borderRadius: const BorderRadius.all(
          Radius.circular(8),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Obx(
            () => SizedBox(
              width: 15.w,
              child: DropdownButton<String>(
                isDense: true,
                icon: Icon(
                  Icons.keyboard_arrow_down_rounded,
                  color: AppColors.accentColor,
                  size: 18.sp,
                ),
                hint: Text(
                  screenController.namePrefixDDValue.value,
                  style: TextStyle(
                    fontFamily: "Roboto",
                    color: AppColors.greyColor,
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                items: screenController.namePrefixItems
                    .map((item) => DropdownMenuItem<String>(
                          value: item,
                          child: Text(
                            item,
                            style: TextStyle(
                              fontFamily: "Roboto",
                              color: AppColors.greyColor,
                              fontSize: 10.sp,
                            ),
                          ),
                        ))
                    .toList(),
                onChanged: (val) {
                  screenController.namePrefixDDValue.value = val!;
                  if (screenController.namePrefixDDValue.value == "Mr.") {
                    screenController.namePrefixNumberValue = 1;
                  } else if (screenController.namePrefixDDValue.value ==
                      "Mrs.") {
                    screenController.namePrefixNumberValue = 2;
                  } else {
                    screenController.namePrefixNumberValue = 3;
                  }
                },
              ),
            ),
          ),
          SizedBox(width: 2.w),
          Expanded(
            child: TextFormField(
              controller: screenController.fnameController,
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.text,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (value) => FieldValidator().validateFirstName(value!),
              decoration: InputDecoration(
                isDense: true,
                isCollapsed: true,
                hintText: "First Name",
                border: InputBorder.none,
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                errorMaxLines: 2,
                hintStyle: TextStyle(
                  fontSize: 10.sp,
                  fontFamily: "Roboto",
                  color: AppColors.greyColor,
                ),
              ),
            ),
          ),
          Expanded(
            child: TextFormField(
              controller: screenController.lnameController,
              keyboardType: TextInputType.text,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              textInputAction: TextInputAction.next,
              validator: (value) => FieldValidator().validateLastName(value!),
              decoration: InputDecoration(
                isDense: true,
                isCollapsed: true,
                hintText: "Last Name",
                border: InputBorder.none,
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                errorMaxLines: 2,
                hintStyle: TextStyle(
                  color: AppColors.greyColor,
                  fontSize: 10.sp,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _birthDateModule(BuildContext context) {
    return Container(
      // height: 45,
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.greyColor.withOpacity(0.2),
        borderRadius: const BorderRadius.all(Radius.circular(8)),
      ),
      child: Center(
        child: TextFormField(
          controller: screenController.dobController,
          readOnly: true,
          onTap: () {
            showDatePicker(context);
          },
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: (value) => FieldValidator().validateDob(value!),
          decoration: InputDecoration(
            isDense: true,
            isCollapsed: true,
            hintText: "Birthdate (DD/MM/YYYY)",
            border: InputBorder.none,
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
            hintStyle: TextStyle(
              color: AppColors.greyColor,
              fontSize: 10.sp,
            ),
          ),
        ),
      ),
    );
  }

  void showDatePicker(BuildContext context) {
    showCupertinoModalPopup(
      context: context,
      builder: (BuildContext builder) {
        return Material(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                height: screenController.size.height * 0.05,
                color: AppColors.whiteColor,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {
                        // screenController.dobController.clear();
                        // screenController.tempSelectedDate = "";
                        Get.back();
                      },
                      child: const Text(
                        'CANCEL',
                        style: TextStyle(
                          fontFamily: "Roboto",
                          color: AppColors.blueDarkColor,
                        ),
                      ),
                    ),
                    const SizedBox(width: 20),
                    GestureDetector(
                      onTap: () {
                        if (screenController.tempSelectedDate == "") {
                          Get.back();
                          const snackBar = SnackBar(
                            content: Text('Please select birthdate first'),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        } else {
                          screenController.dobController.text =
                              screenController.tempSelectedDate;
                          Get.back();
                        }
                      },
                      child: const Text(
                        'DONE',
                        style: TextStyle(
                          color: AppColors.blueDarkColor,
                          fontFamily: "Roboto",
                        ),
                      ),
                    ),
                  ],
                ).commonSymmetricPadding(horizontal: 15),
              ),
              Container(
                height: screenController.size.height * 0.35,
                color: AppColors.whiteColor,
                child: CupertinoDatePicker(
                  mode: CupertinoDatePickerMode.date,
                  initialDateTime: DateTime.now(),
                  maximumDate: DateTime.now(),
                  onDateTimeChanged: (DateTime value) {
                    screenController.tempSelectedDate =
                        "${value.day}/${value.month}/${value.year}";
                    // log('value : ${screenController.tempSelectedDate}');

                    screenController.apiDobDate =
                        "${value.year}-${value.month}-${value.day}";

                    screenController.tempSelectedYear = value.year;
                    log('tempSelectedYear :${screenController.tempSelectedYear}');
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _mobileNumberModule() {
    return Container(
      // height: 45,
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.greyColor.withOpacity(0.2),
        borderRadius: const BorderRadius.all(Radius.circular(8)),
      ),
      child: Center(
        child: TextFormField(
          controller: screenController.mobileNoController,
          textInputAction: TextInputAction.next,
          keyboardType: TextInputType.phone,
          maxLength: 10,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: (value) => FieldValidator().validateMobileNumber(value!),
          decoration: InputDecoration(
            isDense: true,
            isCollapsed: true,
            counterText: '',
            hintText: "Mobile Number",
            border: InputBorder.none,
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
            hintStyle: TextStyle(color: AppColors.greyColor, fontSize: 10.sp),
          ),
        ),
      ),
    );
  }

  Widget _emailIdModule() {
    return Container(
      // height: 45,
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.greyColor.withOpacity(0.2),
        borderRadius: const BorderRadius.all(Radius.circular(8)),
      ),
      child: Center(
        child: TextFormField(
          controller: screenController.emailController,
          textInputAction: TextInputAction.next,
          keyboardType: TextInputType.emailAddress,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: (value) => FieldValidator().validateEmail(value!),
          decoration: InputDecoration(
            isDense: true,
            isCollapsed: true,
            hintText: "Email ID",
            border: InputBorder.none,
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
            hintStyle: TextStyle(color: AppColors.greyColor, fontSize: 10.sp),
          ),
        ),
      ),
    );
  }

  Widget _residentialPinCodeModule() {
    return Container(
      // height: 45,
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.greyColor.withOpacity(0.2),
        borderRadius: const BorderRadius.all(Radius.circular(8)),
      ),
      child: Center(
        child: TextFormField(
          controller: screenController.pinCodeController,
          textInputAction: TextInputAction.next,
          keyboardType: TextInputType.number,
          inputFormatters: [
            LengthLimitingTextInputFormatter(6),
          ],
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: (value) => FieldValidator().validatePinCode(value!),
          decoration: InputDecoration(
            isDense: true,
            isCollapsed: true,
            hintText: "Residential PinCode",
            counterText: '',
            border: InputBorder.none,
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
            hintStyle: TextStyle(color: AppColors.greyColor, fontSize: 10.sp),
          ),
        ),
      ),
    );
  }

  Widget _panNumberModule() {
    return Container(
      // height: 45,
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.greyColor.withOpacity(0.2),
        borderRadius: const BorderRadius.all(Radius.circular(8)),
      ),
      child: Center(
        child: TextFormField(
          controller: screenController.panCardController,
          textInputAction: TextInputAction.next,
          keyboardType: TextInputType.text,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          textCapitalization: TextCapitalization.characters,
          validator: (value) => FieldValidator().validatePanCard(value!),
          decoration: InputDecoration(
            isDense: true,
            isCollapsed: true,
            hintText: "Pan Card Number",
            border: InputBorder.none,
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
            hintStyle: TextStyle(color: AppColors.greyColor, fontSize: 10.sp),
          ),
        ),
      ),
    );
  }

  Widget _loanNeededModule() {
    return Container(
      // height: 45,
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
      width: double.infinity,
      // decoration: BoxDecoration(
      //   color: AppColors.greyColor.withOpacity(0.2),
      //   borderRadius: const BorderRadius.all(Radius.circular(8)),
      // ),
      child: Row(
        children: [
          Expanded(
            flex: 55,
            child: Text(
              'Loan Needed',
              style: TextStyle(
                fontSize: 11.sp,
                color: AppColors.greyColor,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Expanded(
            flex: 50,
            child: Container(
              // height: 45,
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.grey.shade500),
              ),
              child: Row(
                children: [
                  const Expanded(
                    flex: 20,
                    child: Text(
                      '₹',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: AppColors.accentColor,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 60,
                    child: Text(
                      '${screenController.loanAmount.value.toInt()}',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: AppColors.accentColor,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 20,
                    child: Container(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _loanAmountSliderModule() {
    return SizedBox(
      // height: 30,
      // padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 12),
      width: double.infinity,
      child: Column(
        children: [
          SizedBox(
            height: 20,
            child: Slider(
              min: 0,
              max: 1500000,
              divisions: 150,
              value: screenController.loanAmount.value,
              thumbColor: AppColors.accentColor,
              activeColor: AppColors.accentColor,
              inactiveColor: AppColors.greyColor,
              onChanged: (value) {
                screenController.isLoading(true);
                screenController.loanAmount.value = value;
                screenController.isLoading(false);
              },
            ),
          ),
          SizedBox(height: 1.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '₹ 0',
                style: TextStyle(
                  fontSize: 10.sp,
                  color: AppColors.greyColor,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                '₹15 L',
                style: TextStyle(
                  fontSize: 10.sp,
                  color: AppColors.greyColor,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ).commonSymmetricPadding(horizontal: 20),
        ],
      ),
    );
  }

  Widget _salariedModule() {
    return RadioListTile(
      title: const Text("Salaried"),
      value: "Salaried",
      groupValue: screenController.salariedValue.value,
      onChanged: (value) {
        screenController.isLoading(true);
        screenController.salariedValue.value = value.toString();
        screenController.isLoading(false);
      },
    );
  }

  // Widget _selfEmployedModule() {
  //   return Expanded(
  //     child: RadioListTile(
  //       title: const Text("Self Employed"),
  //       value: "SelfEmployed",
  //       groupValue: screenController.salariedValue.value,
  //       onChanged: (value) {
  //         screenController.isLoading(true);
  //         screenController.salariedValue.value = value.toString();
  //         screenController.isLoading(false);
  //       },
  //     ),
  //   );
  // }

  Widget _monthlyIncomeModule() {
    return Container(
      // height: 45,
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.greyColor.withOpacity(0.2),
        borderRadius: const BorderRadius.all(Radius.circular(8)),
      ),
      child: Center(
        child: TextFormField(
          controller: screenController.monthlyIncomeController,
          textInputAction: TextInputAction.next,
          keyboardType: TextInputType.number,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: (value) => FieldValidator().validateMonthlyIncome(value!),
          decoration: InputDecoration(
            isDense: true,
            isCollapsed: true,
            hintText: "Your estimated monthly net income (INR)",
            border: InputBorder.none,
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
            hintStyle: TextStyle(color: AppColors.greyColor, fontSize: 10.sp),
          ),
        ),
      ),
    );
  }

  Widget _employerNameModule() {
    return Container(
      // height: 45,
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.greyColor.withOpacity(0.2),
        borderRadius: const BorderRadius.all(Radius.circular(8)),
      ),
      child: Center(
        child: TextFormField(
          controller: screenController.employerNameController,
          textInputAction: TextInputAction.next,
          keyboardType: TextInputType.text,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: (value) => FieldValidator().validateEmployerName(value!),
          decoration: InputDecoration(
            isDense: true,
            isCollapsed: true,
            hintText: "Your employer's name",
            border: InputBorder.none,
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
            hintStyle: TextStyle(color: AppColors.greyColor, fontSize: 10.sp),
          ),
        ),
      ),
    );
  }

  Widget _currentTotalEmiModule() {
    return Container(
      // height: 45,
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.greyColor.withOpacity(0.2),
        borderRadius: const BorderRadius.all(Radius.circular(8)),
      ),
      child: Center(
        child: TextFormField(
          controller: screenController.currentTotalEmiController,
          textInputAction: TextInputAction.next,
          keyboardType: TextInputType.number,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: (value) =>
              FieldValidator().validateCurrentTotalEmi(value!),
          decoration: InputDecoration(
            isDense: true,
            isCollapsed: true,
            hintText: "Your current total EMI amount(if you pay any)",
            border: InputBorder.none,
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
            hintStyle: TextStyle(color: AppColors.greyColor, fontSize: 10.sp),
          ),
        ),
      ),
    );
  }

  Widget _whichBankModule() {
    return Container(
      // height: 45,
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.greyColor.withOpacity(0.2),
        borderRadius: const BorderRadius.all(Radius.circular(8)),
      ),
      child: Center(
        child: TextFormField(
          controller: screenController.whichBankController,
          textInputAction: TextInputAction.next,
          keyboardType: TextInputType.text,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: (value) => FieldValidator().validateWhichBank(value!),
          decoration: InputDecoration(
            isDense: true,
            isCollapsed: true,
            hintText: "Your bank account is with which bank",
            border: InputBorder.none,
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
            hintStyle: TextStyle(color: AppColors.greyColor, fontSize: 10.sp),
          ),
        ),
      ),
    );
  }

  Widget _homeLoanModule() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Do you have home loan ?'),
        Row(
          children: [
            Expanded(
              child: RadioListTile(
                title: const Text("Yes"),
                value: "yes",
                groupValue: screenController.homeLoanValue.value,
                onChanged: (value) {
                  screenController.isLoading(true);
                  screenController.homeLoanValue.value = value.toString();
                  screenController.isLoading(false);
                },
              ),
            ),
            Expanded(
              child: RadioListTile(
                title: const Text("No"),
                value: "no",
                groupValue: screenController.homeLoanValue.value,
                onChanged: (value) {
                  screenController.isLoading(true);
                  screenController.homeLoanValue.value = value.toString();
                  screenController.isLoading(false);
                },
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _submitButton(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        if (screenController.stepOneFormKey.currentState!.validate()) {
          if (screenController.loanAmount.value == 0.0) {
            const snackBar = SnackBar(
              content: Text('LoanAmount can no be empty'),
            );
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          } else {
            DateTime date = DateTime.now();
            int tempYear = date.year;

            if (tempYear - screenController.tempSelectedYear < 21) {
              const snackBar = SnackBar(
                content: Text('Minimum age should be 21 years'),
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            } else if (tempYear - screenController.tempSelectedYear > 58) {
              const snackBar = SnackBar(
                content: Text('Maximum age should be 58 years'),
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            } else {
              await screenController.checkEligibilityFunction();
            }
          }
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
            'SUBMIT',
            style: TextStyle(
              color: AppColors.whiteColor,
              fontFamily: "Roboto",
              fontSize: 12.sp,
            ),
          ),
        ),
      ),
    );
  }
}

class StepTwoFormModule extends StatelessWidget {
  StepTwoFormModule({Key? key}) : super(key: key);
  final screenController = Get.find<PersonalLoansScreenController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      // padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: screenController.currentStep.value == 1
            ? null
            : AppColors.whiteColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          ListView.builder(
            itemCount: screenController.emiScheduleList.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, i) {
              EmiTenorOption singleItem = screenController.emiScheduleList[i];
              return GestureDetector(
                onTap: () {
                  screenController.isLoading(true);
                  screenController.selectedListItem = i;
                  screenController.selectedMonth =
                      singleItem.tenorMonth.toString();
                  screenController.selectedEligibleEmiAmount =
                      singleItem.emiEligibleAmount.toString();
                  screenController.isLoading(false);
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColors.whiteColor,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: screenController.selectedListItem == i
                          ? AppColors.accentColor
                          : Colors.transparent,
                      width: screenController.selectedListItem == i ? 3 : 0,
                    ),
                  ),
                  child: Stack(
                    alignment: Alignment.topRight,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 13),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text(
                              'LOAN AMOUNT ₹ ${singleItem.emiEligibleAmount}',
                              style: TextStyle(
                                color: AppColors.accentColor,
                                fontSize: 9.sp,
                              ),
                            ),
                            Text(
                              'YOUR EMI',
                              style: TextStyle(
                                color: AppColors.greyColor,
                                fontSize: 7.sp,
                              ),
                            ).commonSymmetricPadding(vertical: 3),
                            Text(
                              '₹ ${singleItem.emiMonthlyLow} - ₹ ${singleItem.emiMonthlyHigh}',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 13.sp,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 3),
                        decoration: const BoxDecoration(
                          color: Color(0xff052a47),
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(8),
                            bottomLeft: Radius.circular(8),
                          ),
                        ),
                        child: Column(
                          children: [
                            Text(
                              singleItem.tenorMonth,
                              style: TextStyle(
                                color: AppColors.whiteColor,
                                fontSize: 12.sp,
                              ),
                            ),
                            const SizedBox(height: 2),
                            Text(
                              'MONTHS',
                              style: TextStyle(
                                color: AppColors.whiteColor,
                                fontSize: 6.sp,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ).commonSymmetricPadding(vertical: 8),
              );
            },
          ),
          SizedBox(height: screenController.size.height * 0.003.h),
          GestureDetector(
            onTap: () async {
              await screenController.emiScheduleFunction();
            },
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 15),
              decoration: BoxDecoration(
                color: AppColors.accentBGColor,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Center(
                child: Text(
                  'SUBMIT',
                  style: TextStyle(
                    color: AppColors.whiteColor,
                    fontFamily: "Roboto",
                    fontSize: 12.sp,
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

class StepThreeFormModule extends StatelessWidget {
  StepThreeFormModule({Key? key}) : super(key: key);
  final screenController = Get.find<PersonalLoansScreenController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      // padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: screenController.currentStep.value == 1
            ? null
            : AppColors.whiteColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              'For quick processing kindly upload your documents online. '
              'Documents needed - PAN card, Aadhaar card, Proof of address, '
              'Salary slips, Bank statement.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 10.sp,
                fontStyle: FontStyle.italic,
                color: AppColors.greyDarkColor,
                fontFamily: "Roboto",
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          SizedBox(height: screenController.size.height * 0.005.h),
          _panCardModule(),
          SizedBox(height: screenController.size.height * 0.005.h),
          _aadhaarCardModule(),
          SizedBox(height: screenController.size.height * 0.005.h),
          _addressProofModule(),
          SizedBox(height: screenController.size.height * 0.005.h),
          _bankStatementModule(),
          SizedBox(height: screenController.size.height * 0.005.h),
          _salarySlipsModule(),
          SizedBox(height: screenController.size.height * 0.005.h),
          _rentAgreementModule(),
          SizedBox(height: screenController.size.height * 0.005.h),
        ],
      ).commonAllSidePadding(16),
    );
  }

  Widget _panCardModule() {
    return Row(
      children: [
        Expanded(
          child: Row(
            children: [
              screenController.panCardFile.path.isNotEmpty
                  ? Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Container(
                        width: screenController.size.width * 0.032,
                        height: screenController.size.width * 0.032,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.greenColor,
                        ),
                        child: const Center(
                          child: Icon(
                            Icons.check_rounded,
                            color: AppColors.whiteColor,
                            size: 10,
                          ),
                        ),
                      ),
                    )
                  : Container(),
              RichText(
                text: TextSpan(
                  text: "Pan Card ",
                  style: TextStyle(
                    color: AppColors.blackColor,
                    fontSize: 10.sp,
                    fontFamily: "Roboto",
                  ),
                  children: [
                    TextSpan(
                      text: "*",
                      style: TextStyle(
                        color: AppColors.redColor,
                        fontSize: 12.sp,
                        fontFamily: "Roboto",
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: screenController.panCardFile.path.isNotEmpty
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'SUCCESSFUL',
                      style: TextStyle(
                        color: AppColors.greenColor,
                        fontFamily: "Roboto",
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        screenController.panCardFile = File('');
                        screenController.loadUI();
                      },
                      child: const Icon(
                        Icons.close_rounded,
                        color: AppColors.redColor,
                      ),
                    ),
                    // IconButton(onPressed: (){}, icon: const Icon(Icons.close_rounded),),
                  ],
                )
              : GestureDetector(
                  onTap: () async {
                    await selectPanCardFromGalleryFunction();
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColors.accentColor,
                    ),
                    child: Center(
                      child: Text(
                        'IMAGE/PHOTO UPLOAD',
                        style: TextStyle(
                          fontFamily: "Roboto",
                          color: AppColors.whiteColor,
                          fontSize: 8.sp,
                        ),
                      ).commonSymmetricPadding(vertical: 12),
                    ),
                  ),
                ),
        ),
      ],
    );
  }

  Future<void> selectPanCardFromGalleryFunction() async {
    final pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );

    if (pickedFile != null) {
      screenController.panCardFile = File(pickedFile.path);
      screenController.loadUI();
    } else {}
  }

  Widget _aadhaarCardModule() {
    return Row(
      children: [
        Expanded(
          child: Row(
            children: [
              screenController.aadhaarCardFile.path.isNotEmpty
                  ? Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Container(
                        width: screenController.size.width * 0.032,
                        height: screenController.size.width * 0.032,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.greenColor,
                        ),
                        child: const Center(
                          child: Icon(
                            Icons.check_rounded,
                            color: AppColors.whiteColor,
                            size: 10,
                          ),
                        ),
                      ),
                    )
                  : Container(),
              RichText(
                text: TextSpan(
                  text: "Aadhaar Card ",
                  style: TextStyle(
                    fontFamily: "Roboto",
                    color: AppColors.blackColor,
                    fontSize: 10.sp,
                  ),
                  children: [
                    TextSpan(
                      text: "*",
                      style: TextStyle(
                        fontFamily: "Roboto",
                        color: AppColors.redColor,
                        fontSize: 12.sp,
                      ),
                    ),
                  ],
                ),
              ),
              // const Text('Aadhaar Card'),
            ],
          ),
        ),
        Expanded(
          child: screenController.aadhaarCardFile.path.isNotEmpty
              ? Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'SUCCESSFUL',
                style: TextStyle(
                  color: AppColors.greenColor,
                  fontFamily: "Roboto",
                  fontWeight: FontWeight.bold,
                ),
              ),
              GestureDetector(
                onTap: () {
                  screenController.aadhaarCardFile = File('');
                  screenController.loadUI();
                },
                child: const Icon(
                  Icons.close_rounded,
                  color: AppColors.redColor,
                ),
              ),
              // IconButton(onPressed: (){}, icon: const Icon(Icons.close_rounded),),
            ],
          )
              : GestureDetector(
                  onTap: () async =>
                      await selectAadhaarCardFromGalleryFunction(),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColors.accentColor,
                    ),
                    child: Center(
                      child: Text(
                        'IMAGE/PHOTO UPLOAD',
                        style: TextStyle(
                          fontFamily: "Roboto",
                          color: AppColors.whiteColor,
                          fontSize: 8.sp,
                        ),
                      ).commonSymmetricPadding(vertical: 12),
                    ),
                  ),
                ),
        ),
      ],
    );
  }

  Future<void> selectAadhaarCardFromGalleryFunction() async {
    final pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );

    if (pickedFile != null) {
      screenController.aadhaarCardFile = File(pickedFile.path);
      screenController.loadUI();
    } else {}
  }

  Widget _addressProofModule() {
    return Row(
      children: [
        Expanded(
          child: Row(
            children: [
              screenController.addressProofFile.path.isNotEmpty
                  ? Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Container(
                        width: screenController.size.width * 0.032,
                        height: screenController.size.width * 0.032,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.greenColor,
                        ),
                        child: const Center(
                          child: Icon(
                            Icons.check_rounded,
                            color: AppColors.whiteColor,
                            size: 10,
                          ),
                        ),
                      ),
                    )
                  : Container(),
              RichText(
                text: TextSpan(
                  text: "Address Proof",
                  style: TextStyle(
                    color: AppColors.blackColor,
                    fontFamily: "Roboto",
                    fontSize: 10.sp,
                  ),
                  children: [
                    TextSpan(
                      text: "*",
                      style: TextStyle(
                        color: AppColors.redColor,
                        fontFamily: "Roboto",
                        fontSize: 12.sp,
                      ),
                    ),
                  ],
                ),
              ),
              // const Text('Address Proof'),
            ],
          ),
        ),
        Expanded(
          child: screenController.addressProofFile.path.isNotEmpty
              ? Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'SUCCESSFUL',
                style: TextStyle(
                  color: AppColors.greenColor,
                  fontFamily: "Roboto",
                  fontWeight: FontWeight.bold,
                ),
              ),
              GestureDetector(
                onTap: () {
                  screenController.addressProofFile = File('');
                  screenController.loadUI();
                },
                child: const Icon(
                  Icons.close_rounded,
                  color: AppColors.redColor,
                ),
              ),
              // IconButton(onPressed: (){}, icon: const Icon(Icons.close_rounded),),
            ],
          )
              : GestureDetector(
                  onTap: () async =>
                      await selectAddressProofFromGalleryFunction(),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColors.accentColor,
                    ),
                    child: Center(
                      child: Text(
                        'IMAGE/PHOTO UPLOAD',
                        style: TextStyle(
                          color: AppColors.whiteColor,
                          fontFamily: "Roboto",
                          fontSize: 8.sp,
                        ),
                      ).commonSymmetricPadding(vertical: 12),
                    ),
                  ),
                ),
        ),
      ],
    );
  }

  Future<void> selectAddressProofFromGalleryFunction() async {
    final pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );

    if (pickedFile != null) {
      screenController.addressProofFile = File(pickedFile.path);
      screenController.loadUI();
    } else {}
  }

  Widget _bankStatementModule() {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Row(
                children: [
                  screenController.bankStatementFile.path.isNotEmpty
                      ? Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Container(
                            width: screenController.size.width * 0.032,
                            height: screenController.size.width * 0.032,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColors.greenColor,
                            ),
                            child: const Center(
                              child: Icon(
                                Icons.check_rounded,
                                color: AppColors.whiteColor,
                                size: 10,
                              ),
                            ),
                          ),
                        )
                      : Container(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                        text: TextSpan(
                          text: "Bank Statement ",
                          style: TextStyle(
                            color: AppColors.blackColor,
                            fontFamily: "Roboto",
                            fontSize: 10.sp,
                          ),
                          children: [
                            TextSpan(
                              text: "*",
                              style: TextStyle(
                                color: AppColors.redColor,
                                fontFamily: "Roboto",
                                fontSize: 12.sp,
                              ),
                            ),
                          ],
                        ),
                      ),
                      // const Text('Bank Statement'),
                      Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: Text(
                          'Last 6 months',
                          style: TextStyle(
                            fontSize: 8.sp,
                            fontFamily: "Roboto",
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: screenController.bankStatementFile.path.isNotEmpty
                  ? Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'SUCCESSFUL',
                    style: TextStyle(
                      color: AppColors.greenColor,
                      fontFamily: "Roboto",
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      screenController.bankStatementFile = File('');
                      screenController.loadUI();
                    },
                    child: const Icon(
                      Icons.close_rounded,
                      color: AppColors.redColor,
                    ),
                  ),
                  // IconButton(onPressed: (){}, icon: const Icon(Icons.close_rounded),),
                ],
              )
                  : GestureDetector(
                      onTap: () async =>
                          await selectBankStatementFromStorageFunction(),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: AppColors.accentColor,
                        ),
                        child: Center(
                          child: Text(
                            'DOCUMENT UPLOAD',
                            style: TextStyle(
                              color: AppColors.whiteColor,
                              fontFamily: "Roboto",
                              fontSize: 8.sp,
                            ),
                          ).commonSymmetricPadding(vertical: 12),
                        ),
                      ),
                    ),
            ),
          ],
        ),
        screenController.bankStatementFile.path.isEmpty
            ? Row(
                children: [
                  Expanded(child: Container()),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 4),
                      child: Text(
                        '(Only PDF allowed)',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: "Roboto",
                          fontStyle: FontStyle.italic,
                          fontSize: 8.sp,
                          color: AppColors.greyColor,
                        ),
                      ),
                    ),
                  ),
                ],
              )
            : Container(),
      ],
    );
  }

  Future<void> selectBankStatementFromStorageFunction() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      allowedExtensions: ['pdf'],
      type: FileType.custom,
    );
    if (result != null) {
      File file = File("${result.files.single.path}");
      screenController.bankStatementFile = file;
      log('bankStatementFile : ${screenController.bankStatementFile.path}');
      screenController.loadUI();
    } else {
      // User canceled the picker
    }
  }

  Widget _salarySlipsModule() {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Row(
                children: [
                  screenController.salarySlipsFile.path.isNotEmpty
                      ? Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Container(
                            width: screenController.size.width * 0.032,
                            height: screenController.size.width * 0.032,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColors.greenColor,
                            ),
                            child: const Center(
                              child: Icon(
                                Icons.check_rounded,
                                color: AppColors.whiteColor,
                                size: 10,
                              ),
                            ),
                          ),
                        )
                      : Container(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                        text: TextSpan(
                          text: "Salary Slips ",
                          style: TextStyle(
                            color: AppColors.blackColor,
                            fontFamily: "Roboto",
                            fontSize: 10.sp,
                          ),
                          children: [
                            TextSpan(
                              text: "*",
                              style: TextStyle(
                                color: AppColors.redColor,
                                fontFamily: "Roboto",
                                fontSize: 12.sp,
                              ),
                            ),
                          ],
                        ),
                      ),
                      // const Text('Salary Slips'),
                      Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: Text(
                          'Last 3 months',
                          style: TextStyle(
                            fontSize: 8.sp,
                            fontFamily: "Roboto",
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: screenController.salarySlipsFile.path.isNotEmpty
                  ? Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'SUCCESSFUL',
                    style: TextStyle(
                      color: AppColors.greenColor,
                      fontFamily: "Roboto",
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      screenController.salarySlipsFile = File('');
                      screenController.loadUI();
                    },
                    child: const Icon(
                      Icons.close_rounded,
                      color: AppColors.redColor,
                    ),
                  ),
                  // IconButton(onPressed: (){}, icon: const Icon(Icons.close_rounded),),
                ],
              )
                  : GestureDetector(
                      onTap: () async =>
                          await selectSalarySlipsFromStorageFunction(),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: AppColors.accentColor,
                        ),
                        child: Center(
                          child: Text(
                            'DOCUMENT UPLOAD',
                            style: TextStyle(
                              color: AppColors.whiteColor,
                              fontFamily: "Roboto",
                              fontSize: 8.sp,
                            ),
                          ).commonSymmetricPadding(vertical: 12),
                        ),
                      ),
                    ),
            ),
          ],
        ),
        screenController.salarySlipsFile.path.isEmpty
            ? Row(
                children: [
                  Expanded(child: Container()),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 4),
                      child: Text(
                        '(Only PDF allowed)',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontStyle: FontStyle.italic,
                          fontFamily: "Roboto",
                          fontSize: 8.sp,
                          color: AppColors.greyColor,
                        ),
                      ),
                    ),
                  ),
                ],
              )
            : Container(),
      ],
    );
  }

  Future<void> selectSalarySlipsFromStorageFunction() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      allowedExtensions: ['pdf'],
      type: FileType.custom,
    );
    if (result != null) {
      File file = File("${result.files.single.path}");
      screenController.salarySlipsFile = file;
      log('salarySlipsFile : ${screenController.salarySlipsFile.path}');
      screenController.loadUI();
    } else {
      // User canceled the picker
    }
  }

  Widget _rentAgreementModule() {
    return Row(
      children: [
        Expanded(
          child: Row(
            children: [
              screenController.rentAgreementFile.path.isNotEmpty
                  ? Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Container(
                        width: screenController.size.width * 0.032,
                        height: screenController.size.width * 0.032,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.greenColor,
                        ),
                        child: const Center(
                          child: Icon(
                            Icons.check_rounded,
                            color: AppColors.whiteColor,
                            size: 10,
                          ),
                        ),
                      ),
                    )
                  : Container(),
              RichText(
                text: TextSpan(
                  text: "Rent Agreement ",
                  style: TextStyle(
                    fontFamily: "Roboto",
                    color: AppColors.blackColor,
                    fontSize: 10.sp,
                  ),
                  children: [
                    TextSpan(
                      text: "*",
                      style: TextStyle(
                        fontFamily: "Roboto",
                        color: AppColors.redColor,
                        fontSize: 12.sp,
                      ),
                    ),
                  ],
                ),
              ),
              // const Text('Rent Agreement'),
            ],
          ),
        ),
        Expanded(
          child: screenController.rentAgreementFile.path.isNotEmpty
              ? Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'SUCCESSFUL',
                style: TextStyle(
                  color: AppColors.greenColor,
                  fontFamily: "Roboto",
                  fontWeight: FontWeight.bold,
                ),
              ),
              GestureDetector(
                onTap: () {
                  screenController.rentAgreementFile = File('');
                  screenController.loadUI();
                },
                child: const Icon(
                  Icons.close_rounded,
                  color: AppColors.redColor,
                ),
              ),
              // IconButton(onPressed: (){}, icon: const Icon(Icons.close_rounded),),
            ],
          )
              : GestureDetector(
                  onTap: () async =>
                      await selectRentAgreementFromGalleryFunction(),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColors.accentColor,
                    ),
                    child: Center(
                      child: Text(
                        'IMAGE/PHOTO UPLOAD',
                        style: TextStyle(
                          fontFamily: "Roboto",
                          color: AppColors.whiteColor,
                          fontSize: 8.sp,
                        ),
                      ).commonSymmetricPadding(vertical: 12),
                    ),
                  ),
                ),
        ),
      ],
    );
  }

  Future<void> selectRentAgreementFromGalleryFunction() async {
    final pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );

    if (pickedFile != null) {
      screenController.rentAgreementFile = File(pickedFile.path);
      screenController.loadUI();
    } else {}
  }
}

class JewelleryOnEmiLoadingWidget extends StatelessWidget {
  JewelleryOnEmiLoadingWidget({Key? key}) : super(key: key);

  final screenController = Get.find<PersonalLoansScreenController>();

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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Container(
                        height: 9.h,
                        width: 9.h,
                        decoration: const BoxDecoration(
                          color: AppColors.greyColor,
                          shape: BoxShape.circle,
                        ),
                      ),
                     const SizedBox(height: 10),
                      Container(
                        height: 10,
                        width: 80,
                        color: AppColors.greyColor,
                      ),
                    ],
                  ),
                  SizedBox(width: 12.w),
                  Column(
                    children: [
                      Container(
                        height: 9.h,
                        width: 9.h,
                        decoration:const BoxDecoration(
                          color: AppColors.greyColor,
                          shape: BoxShape.circle,
                        ),
                      ),
                  const    SizedBox(height: 10),
                      Container(
                        height: 10,
                        width: 80,
                        color: AppColors.greyColor,
                      ),
                    ],
                  ),
                  SizedBox(width: 12.w),
                  Column(
                    children: [
                      Container(
                        height: 9.h,
                        width: 9.h,
                        decoration:const BoxDecoration(
                          color: AppColors.greyColor,
                          shape: BoxShape.circle,
                        ),
                      ),
                  const    SizedBox(height: 10),
                      Container(
                        height: 10,
                        width: 80,
                        color: AppColors.greyColor,
                      ),
                    ],
                  ),
                ],
              ),
            const  SizedBox(height: 20),
              Container(
                height: 62.h,
                width: double.infinity,
                margin:const EdgeInsets.symmetric(horizontal: 20),
                decoration: const BoxDecoration(
                  color: AppColors.greyColor,
                  borderRadius: BorderRadius.all(
                    Radius.circular(12),
                  ),
                ),
              ),
           const   SizedBox(height: 20),
              Container(
                height: 60,
                width: double.infinity,
                margin: const EdgeInsets.symmetric(horizontal: 20),
                decoration:const BoxDecoration(
                  color: AppColors.greyColor,
                  borderRadius: BorderRadius.all(
                    Radius.circular(12),
                  ),
                ),
              ),
             const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
