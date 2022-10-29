import 'dart:developer';
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:olocker/constants/app_colors.dart';
import 'package:olocker/controllers/personal_loans_screen_controller.dart';
import 'package:olocker/models/personal_loans_screen_model/check_availability_model.dart';
import 'package:olocker/utils/extensions.dart';
import 'package:olocker/utils/field_validation.dart';
import 'package:sizer/sizer.dart';



class StepOneFormModule extends StatelessWidget {
  StepOneFormModule({Key? key}) : super(key: key);
  final screenController = Get.find<PersonalLoansScreenController>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: screenController.stepOneFormKey,
      child: Column(
        children: [
          Text(
            'Your personal data',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 13.sp,
            ),
          ),
          SizedBox(height: screenController.size.height * 0.0015.h),
          Text(
            'Your personal data will be shared with the relevant jeweller who will offer EMI option to buy jewellery',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 8.5.sp,
            ),
          ),
          SizedBox(height: screenController.size.height * 0.0030.h),
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
          const SizedBox(height: 10),
          Text(
            'Kindly note: Your salary must be coming directly to your bank account via bank transfer',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 8.5.sp,
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
    );
  }

  Widget _fLNameModule() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      height: 45,
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.greyColor.withOpacity(0.3),
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
                icon: const SizedBox(),
                hint: Text(
                  screenController.namePrefixDDValue.value,
                  style: TextStyle(
                    color: AppColors.greyColor,
                    fontSize: 11.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                items: screenController.namePrefixItems
                    .map((item) => DropdownMenuItem<String>(
                          value: item,
                          child: Text(
                            item,
                            style: const TextStyle(
                              fontSize: 14,
                            ),
                          ),
                        ))
                    .toList(),
                onChanged: (val) {
                  screenController.namePrefixDDValue.value = val!;
                  if(screenController.namePrefixDDValue.value == "Mr.") {
                    screenController.namePrefixNumberValue = 1;
                  } else if(screenController.namePrefixDDValue.value == "Mrs.") {
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
              validator: (value) => FieldValidator().validateFirstName(value!),
              decoration: InputDecoration(
                isDense: true,
                isCollapsed: true,
                hintText: "First Name",
                border: InputBorder.none,
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                hintStyle:
                    TextStyle(color: AppColors.greyColor, fontSize: 11.sp),
              ),
            ),
          ),
          Expanded(
            child: TextFormField(
              controller: screenController.lnameController,
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.next,
              validator: (value) => FieldValidator().validateLastName(value!),
              decoration: InputDecoration(
                isDense: true,
                isCollapsed: true,
                hintText: "Last Name",
                border: InputBorder.none,
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                hintStyle:
                    TextStyle(color: AppColors.greyColor, fontSize: 11.sp),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _birthDateModule(BuildContext context) {
    return GestureDetector(
      onTap: () {
        log('value');
        showDatePicker(context);
      },
      child: Container(
        height: 45,
        padding: const EdgeInsets.symmetric(horizontal: 15),
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColors.greyColor.withOpacity(0.3),
          borderRadius: const BorderRadius.all(Radius.circular(8)),
        ),
        child: Center(
          child: TextFormField(
            controller: screenController.dobController,
            readOnly: true,
            validator: (value) => FieldValidator().validateDob(value!),
            decoration: InputDecoration(
              isDense: true,
              isCollapsed: true,
              hintText: "Birthdate (DD/MM/YYYY)",
              border: InputBorder.none,
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              hintStyle: TextStyle(color: AppColors.greyColor, fontSize: 11.sp),
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
                          color: AppColors.blueColor,
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
                        style: TextStyle(color: AppColors.blueColor),
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

                    screenController.apiDobDate = "${value.year}-${value.month}-${value.day}";

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
      height: 45,
      padding: const EdgeInsets.symmetric(horizontal: 15),
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.greyColor.withOpacity(0.3),
        borderRadius: const BorderRadius.all(Radius.circular(8)),
      ),
      child: Center(
        child: TextFormField(
          controller: screenController.mobileNoController,
          textInputAction: TextInputAction.next,
          keyboardType: TextInputType.phone,
          maxLength: 10,
          validator: (value) => FieldValidator().validateMobileNumber(value!),
          decoration: InputDecoration(
            isDense: true,
            isCollapsed: true,
            counterText: '',
            hintText: "Mobile Number",
            border: InputBorder.none,
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
            hintStyle: TextStyle(color: AppColors.greyColor, fontSize: 11.sp),
          ),
        ),
      ),
    );
  }

  Widget _emailIdModule() {
    return Container(
      height: 45,
      padding: const EdgeInsets.symmetric(horizontal: 15),
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.greyColor.withOpacity(0.3),
        borderRadius: const BorderRadius.all(Radius.circular(8)),
      ),
      child: Center(
        child: TextFormField(
          controller: screenController.emailController,
          textInputAction: TextInputAction.next,
          keyboardType: TextInputType.emailAddress,
          validator: (value) => FieldValidator().validateEmail(value!),
          decoration: InputDecoration(
            isDense: true,
            isCollapsed: true,
            hintText: "Email ID",
            border: InputBorder.none,
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
            hintStyle: TextStyle(color: AppColors.greyColor, fontSize: 11.sp),
          ),
        ),
      ),
    );
  }

  Widget _residentialPinCodeModule() {
    return Container(
      height: 45,
      padding: const EdgeInsets.symmetric(horizontal: 15),
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.greyColor.withOpacity(0.3),
        borderRadius: const BorderRadius.all(Radius.circular(8)),
      ),
      child: Center(
        child: TextFormField(
          controller: screenController.pinCodeController,
          textInputAction: TextInputAction.next,
          keyboardType: TextInputType.number,
          validator: (value) => FieldValidator().validatePinCode(value!),
          decoration: InputDecoration(
            isDense: true,
            isCollapsed: true,
            hintText: "Residential PinCode",
            border: InputBorder.none,
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
            hintStyle: TextStyle(color: AppColors.greyColor, fontSize: 11.sp),
          ),
        ),
      ),
    );
  }

  Widget _panNumberModule() {
    return Container(
      height: 45,
      padding: const EdgeInsets.symmetric(horizontal: 15),
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.greyColor.withOpacity(0.3),
        borderRadius: const BorderRadius.all(Radius.circular(8)),
      ),
      child: Center(
        child: TextFormField(
          controller: screenController.panCardController,
          textInputAction: TextInputAction.next,
          keyboardType: TextInputType.text,
          textCapitalization: TextCapitalization.characters,
          validator: (value) => FieldValidator().validatePanCard(value!),
          decoration: InputDecoration(
            isDense: true,
            isCollapsed: true,
            hintText: "Pan number",
            border: InputBorder.none,
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
            hintStyle: TextStyle(color: AppColors.greyColor, fontSize: 11.sp),
          ),
        ),
      ),
    );
  }

  Widget _loanNeededModule() {
    return Container(
      height: 45,
      padding: const EdgeInsets.symmetric(horizontal: 15),
      width: double.infinity,
      // decoration: BoxDecoration(
      //   color: AppColors.greyColor.withOpacity(0.3),
      //   borderRadius: const BorderRadius.all(Radius.circular(8)),
      // ),
      child: Row(
        children: [
          Expanded(
            flex: 35,
            child: Text(
              'Loan Needed',
              style: TextStyle(
                fontSize: 10.sp,
                color: AppColors.greyColor,
              ),
            ),
          ),
          Expanded(
            flex: 65,
            child: Container(
              height: 45,
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
      // padding: const EdgeInsets.symmetric(horizontal: 15),
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '₹ 0',
                style: TextStyle(fontSize: 9.sp),
              ),
              Text(
                '₹15 L',
                style: TextStyle(fontSize: 9.sp),
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

  Widget _monthlyIncomeModule() {
    return Container(
      height: 45,
      padding: const EdgeInsets.symmetric(horizontal: 15),
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.greyColor.withOpacity(0.3),
        borderRadius: const BorderRadius.all(Radius.circular(8)),
      ),
      child: Center(
        child: TextFormField(
          controller: screenController.monthlyIncomeController,
          textInputAction: TextInputAction.next,
          keyboardType: TextInputType.number,
          validator: (value) => FieldValidator().validateMonthlyIncome(value!),
          decoration: InputDecoration(
            isDense: true,
            isCollapsed: true,
            hintText: "Your estimated monthly net income (INR)",
            border: InputBorder.none,
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
            hintStyle: TextStyle(color: AppColors.greyColor, fontSize: 11.sp),
          ),
        ),
      ),
    );
  }

  Widget _employerNameModule() {
    return Container(
      height: 45,
      padding: const EdgeInsets.symmetric(horizontal: 15),
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.greyColor.withOpacity(0.3),
        borderRadius: const BorderRadius.all(Radius.circular(8)),
      ),
      child: Center(
        child: TextFormField(
          controller: screenController.employerNameController,
          textInputAction: TextInputAction.next,
          keyboardType: TextInputType.text,
          validator: (value) => FieldValidator().validateEmployerName(value!),
          decoration: InputDecoration(
            isDense: true,
            isCollapsed: true,
            hintText: "Your employer's name",
            border: InputBorder.none,
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
            hintStyle: TextStyle(color: AppColors.greyColor, fontSize: 11.sp),
          ),
        ),
      ),
    );
  }

  Widget _currentTotalEmiModule() {
    return Container(
      height: 45,
      padding: const EdgeInsets.symmetric(horizontal: 15),
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.greyColor.withOpacity(0.3),
        borderRadius: const BorderRadius.all(Radius.circular(8)),
      ),
      child: Center(
        child: TextFormField(
          controller: screenController.currentTotalEmiController,
          textInputAction: TextInputAction.next,
          keyboardType: TextInputType.number,
          validator: (value) => FieldValidator().validateCurrentTotalEmi(value!),
          decoration: InputDecoration(
            isDense: true,
            isCollapsed: true,
            hintText: "Your current total EMI ( if you pay any )",
            border: InputBorder.none,
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
            hintStyle: TextStyle(color: AppColors.greyColor, fontSize: 11.sp),
          ),
        ),
      ),
    );
  }

  Widget _whichBankModule() {
    return Container(
      height: 45,
      padding: const EdgeInsets.symmetric(horizontal: 15),
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.greyColor.withOpacity(0.3),
        borderRadius: const BorderRadius.all(Radius.circular(8)),
      ),
      child: Center(
        child: TextFormField(
          controller: screenController.whichBankController,
          textInputAction: TextInputAction.next,
          keyboardType: TextInputType.text,

          validator: (value) => FieldValidator().validateWhichBank(value!),
          decoration: InputDecoration(
            isDense: true,
            isCollapsed: true,
            hintText: "Your bank account is with which bank",
            border: InputBorder.none,
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
            hintStyle: TextStyle(color: AppColors.greyColor, fontSize: 11.sp),
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

            if(tempYear - screenController.tempSelectedYear < 21) {
              const snackBar = SnackBar(
                content: Text('Minimum age should be 21 years'),
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            } else if(tempYear - screenController.tempSelectedYear > 58) {
              const snackBar = SnackBar(
                content: Text('Maximum age should be 58 years'),
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            }
            else {
              await screenController.checkEligibilityFunction();
            }
          }
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
    );
  }
}

class StepTwoFormModule extends StatelessWidget {
  StepTwoFormModule({Key? key}) : super(key: key);
  final screenController = Get.find<PersonalLoansScreenController>();

  @override
  Widget build(BuildContext context) {
    return Column(
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
                screenController.selectedMonth = singleItem.tenorMonth.toString();
                screenController.selectedEligibleEmiAmount = singleItem.emiEligibleAmount.toString();
                screenController.isLoading(false);
              },
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.whiteColor,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: screenController.selectedListItem == i ? AppColors.accentColor : Colors.transparent,
                    width: screenController.selectedListItem == i ? 2 : 0,
                  ),
                ),
                child: Stack(
                  alignment: Alignment.topRight,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          'LOAN AMOUNT ₹ ${singleItem.emiEligibleAmount}',
                          style: TextStyle(
                            color: AppColors.accentColor,
                            fontSize: 7.5.sp,
                          ),
                        ),
                        Text(
                          'YOUR EMI',
                          style: TextStyle(
                            color: AppColors.greyColor,
                            fontSize: 5.sp,
                          ),
                        ).commonSymmetricPadding(vertical: 3),
                        Text(
                          '₹ ${singleItem.emiMonthlyLow} - ₹ ${singleItem.emiMonthlyHigh}',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12.sp,
                          ),
                        ),
                      ],
                    ).commonAllSidePadding(16),
                    Container(
                      decoration: const BoxDecoration(
                          color: Color(0xff052a47),
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(8),
                            bottomLeft: Radius.circular(8),
                          )),
                      child: Column(
                        children: [
                          Text(
                            singleItem.tenorMonth,
                            style: TextStyle(
                              color: AppColors.whiteColor,
                              fontSize: 8.sp,
                            ),
                          ),
                          Text(
                            'MONTHS',
                            style: TextStyle(
                              color: AppColors.whiteColor,
                              fontSize: 6.sp,
                            ),
                          ),
                        ],
                      ).commonAllSidePadding(8),
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
        ),
      ],
    );
  }
}

class StepThreeFormModule extends StatelessWidget {
  StepThreeFormModule({Key? key}) : super(key: key);
  final screenController = Get.find<PersonalLoansScreenController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'For quick processing kindly upload your documents online. '
          'Documents needed - PAN card, Aadhaar card, Proof of address, '
          'Salary slips, Bank statement.',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 8.5.sp,
            fontStyle: FontStyle.italic,
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
    ).commonAllSidePadding(16);
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
              const Text('Pan Card'),
            ],
          ),
        ),
        Expanded(
          child: screenController.panCardFile.path.isNotEmpty
              ? const Text(
                  'Successful',
                  style: TextStyle(
                    color: AppColors.greenColor,
                  ),
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
              const Text('Aadhaar Card'),
            ],
          ),
        ),
        Expanded(
          child: screenController.aadhaarCardFile.path.isNotEmpty
              ? const Text(
                  'Successful',
                  style: TextStyle(
                    color: AppColors.greenColor,
                  ),
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
              const Text('Address Proof'),
            ],
          ),
        ),
        Expanded(
          child: screenController.addressProofFile.path.isNotEmpty
              ? const Text(
                  'Successful',
                  style: TextStyle(
                    color: AppColors.greenColor,
                  ),
                )
              : GestureDetector(
            onTap: () async => await selectAddressProofFromGalleryFunction(),
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
                      const Text('Bank Statement'),
                      Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: Text(
                          'Last 6 months',
                          style: TextStyle(fontSize: 8.sp),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: screenController.bankStatementFile.path.isNotEmpty
                  ? const Text(
                      'Successful',
                      style: TextStyle(
                        color: AppColors.greenColor,
                      ),
                    )
                  : GestureDetector(
                onTap: () async => await selectBankStatementFromStorageFunction(),
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
                      const Text('Salary Slips'),
                      Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: Text(
                          'Last 3 months',
                          style: TextStyle(fontSize: 8.sp),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: screenController.salarySlipsFile.path.isNotEmpty
                  ? const Text(
                      'Successful',
                      style: TextStyle(
                        color: AppColors.greenColor,
                      ),
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
              const Text('Rent Agreement'),
            ],
          ),
        ),
        Expanded(
          child: screenController.rentAgreementFile.path.isNotEmpty
              ? const Text(
            'Successful',
            style: TextStyle(
              color: AppColors.greenColor,
            ),
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
