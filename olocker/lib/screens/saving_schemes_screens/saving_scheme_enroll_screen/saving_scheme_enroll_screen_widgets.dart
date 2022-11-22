import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:olocker/constants/app_colors.dart';
import 'package:olocker/controllers/saving_schemes_screens_controllers/saving_scheme_enroll_screen_controller.dart';
import 'package:olocker/utils/extensions.dart';
import 'package:olocker/utils/field_validation.dart';
import 'package:sizer/sizer.dart';

class HeaderModule extends StatelessWidget {
  HeaderModule({Key? key}) : super(key: key);
  final screenController = Get.find<SavingSchemeEnrollScreenController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 25,
            child: Container(),
          ),
          Expanded(
            flex: 75,
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Senco Gold',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: AppColors.accentColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 14.sp,
                    ),
                  ),
                  Text(
                    'Swaarna Sanchay Scheme',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      // color: AppColors.accentColor,
                      // fontWeight: FontWeight.bold,
                      fontSize: 14.sp,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ).commonSymmetricPadding(horizontal: 15, vertical: 20),
    ).commonSymmetricPadding(vertical: 10, horizontal: 15);
  }
}

class MonthlyAmountModule extends StatelessWidget {
  MonthlyAmountModule({Key? key}) : super(key: key);
  final screenController = Get.find<SavingSchemeEnrollScreenController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Monthly amount',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14.sp,
            ),
          ),
          TextFormField(
            controller: screenController.monthlyAmountFieldController,
            keyboardType: TextInputType.number,
            onChanged: (value) {
              log(value);
              screenController.isLoading(true);

              if(value.isNotEmpty) {
                screenController.isShow.value = true;
              } else {
                screenController.isShow.value = false;
              }

              screenController.isLoading(false);
            },
            style: TextStyle(
              fontSize: 22.sp,
              color: AppColors.greyColor,
              fontWeight: FontWeight.w600,
            ),
            decoration: InputDecoration(
              prefix: Text(
                '₹ ',
                style: TextStyle(
                  fontSize: 22.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Text(
            'Choose your tenure',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14.sp,
            ),
          ).commonSymmetricPadding(vertical: 15),
          GridView.builder(
            itemCount: 3,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 1,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
            ),
            itemBuilder: (context, i) {
              return GestureDetector(
                onTap: () {
                  screenController.isLoading(true);
                  screenController.selectedGridItem.value = i;
                  screenController.isLoading(false);
                },
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: screenController.selectedGridItem.value == i
                            ? AppColors.accentColor
                            : AppColors.greyTextColor.withOpacity(0.4),
                      ),
                      child: Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              '12',
                              maxLines: 1,
                              style: TextStyle(
                                color: AppColors.whiteColor,
                                fontSize: 26.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'months',
                              style: TextStyle(
                                color: AppColors.whiteColor,
                                fontSize: 11.sp,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      top: 5,
                      right: 5,
                      child: screenController.selectedGridItem.value == i
                          ? Container(
                              decoration: const BoxDecoration(
                                color: AppColors.whiteColor,
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                Icons.check_rounded,
                                color: AppColors.accentColor,
                                size: 12.sp,
                              ).commonAllSidePadding(1),
                            )
                          : Container(),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ).commonSymmetricPadding(horizontal: 15, vertical: 20),
    ).commonSymmetricPadding(horizontal: 15);
  }
}

class MaturityAmountModule extends StatelessWidget {
  MaturityAmountModule({Key? key}) : super(key: key);
  final screenController = Get.find<SavingSchemeEnrollScreenController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.accentColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          _singleModule(heading: 'Our Contribution', value: '2500'),
          _singleModule(heading: 'Maturity Amount', value: '32500'),
        ],
      ).commonSymmetricPadding(vertical: 20, horizontal: 8),
    ).commonSymmetricPadding(horizontal: 15, vertical: 10);
  }

  Widget _singleModule({required String heading, required String value}) {
    return Expanded(
      child: Column(
        children: [
          Text(
            heading,
            style: TextStyle(
              color: AppColors.whiteColor,
              fontSize: 13.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            NumberFormat.currency(
              symbol: '₹ ',
              locale: "HI",
              decimalDigits: 0,
            ).format(double.parse(value)),
            style: TextStyle(
              color: AppColors.whiteColor,
              fontSize: 20.sp,
              fontWeight: FontWeight.bold,
            ),
          ).commonOnlyPadding(top: 10),
        ],
      ),
    );
  }
}

class CustomerDetailsFormModule extends StatelessWidget {
  CustomerDetailsFormModule({Key? key}) : super(key: key);
  final screenController = Get.find<SavingSchemeEnrollScreenController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Customer Details',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14.sp,
            ),
          ).commonOnlyPadding(bottom: 15, top: 5),

          _nameFieldsRowModule(),
          _panNumberModule(),
          _aadhaarNumberModule(),
          _mobileNumberModule(),
          _emailIdModule(),
          _addressModule(),
          _pincodeModule(),
          _cityModule(),
          _stateModule(),

        ],
      ).commonAllSidePadding(10),
    ).commonSymmetricPadding(horizontal: 15, vertical: 10);
  }

  Widget _nameFieldsRowModule() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Obx(
          () => Center(
            child: SizedBox(
              height: 3.h,
              width: 18.w,
              child: DropdownButton<String>(
                isDense: true,
                value: screenController.namePrefixDDValue.value,
                alignment: Alignment.center,
                items: screenController.namePrefixItems
                    .map((item) => DropdownMenuItem<String>(
                          value: item,
                          child: Text(
                            item,
                            style: const TextStyle(
                              fontSize: 15,
                            ),
                          ),
                        ))
                    .toList(),
                onChanged: (val) {
                  screenController.namePrefixDDValue.value = val!;
                },
              ),
            ),
          ),
        ),
        SizedBox(width: 2.w),
        Expanded(
          child: TextFormField(
            controller: screenController.fNameController,
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.text,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (value) => FieldValidator().validateFirstName(value!),
            style:
                TextStyle(color: AppColors.blackTextColor, fontSize: 11.sp),
            decoration: InputDecoration(
              hintText: "First Name",
              hintStyle:
                  TextStyle(color: AppColors.greyColor, fontSize: 11.sp),
            ),
          ),
        ),
        SizedBox(width: 2.w),
        Expanded(
          child: TextFormField(
            controller: screenController.lNameController,
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.next,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (value) => FieldValidator().validateLastName(value!),
            style:
                TextStyle(color: AppColors.blackTextColor, fontSize: 11.sp),
            decoration: InputDecoration(
              hintText: "Last Name",
              hintStyle:
                  TextStyle(color: AppColors.greyColor, fontSize: 11.sp),
            ),
          ),
        ),
      ],
    );
  }

  Widget _panNumberModule() {
    return TextFormField(
      controller: screenController.panCardController,
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.text,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      textCapitalization: TextCapitalization.characters,
      maxLength: 10,
      validator: (value) => FieldValidator().validatePanCard(value!),
      style:
      TextStyle(color: AppColors.blackTextColor, fontSize: 11.sp),
      decoration: InputDecoration(
        hintText: "Pan number",
        counterText: '',
        hintStyle:
        TextStyle(color: AppColors.greyColor, fontSize: 11.sp),
      ),
    );
  }

  Widget _aadhaarNumberModule() {
    return TextFormField(
      controller: screenController.aadhaarCardController,
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.number,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      maxLength: 12,
      // textCapitalization: TextCapitalization.characters,
      validator: (value) => FieldValidator().validateAadhaarCard(value!),
      style:
      TextStyle(color: AppColors.blackTextColor, fontSize: 11.sp),
      decoration: InputDecoration(
        hintText: "Aadhaar number",
        counterText: '',
        hintStyle:
        TextStyle(color: AppColors.greyColor, fontSize: 11.sp),
      ),
    );
  }

  Widget _mobileNumberModule() {
    return TextFormField(
      controller: screenController.mobileNumberController,
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.phone,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      // textCapitalization: TextCapitalization.characters,
      validator: (value) => FieldValidator().validateMobileNumber(value!),
      style:
      TextStyle(color: AppColors.blackTextColor, fontSize: 11.sp),
      decoration: InputDecoration(
        hintText: "Mobile number",
        hintStyle:
        TextStyle(color: AppColors.greyColor, fontSize: 11.sp),
      ),
    );
  }

  Widget _emailIdModule() {
    return TextFormField(
      controller: screenController.emailIdController,
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.emailAddress,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      // textCapitalization: TextCapitalization.characters,
      validator: (value) => FieldValidator().validateEmail(value!),
      style:
      TextStyle(color: AppColors.blackTextColor, fontSize: 11.sp),
      decoration: InputDecoration(
        hintText: "Email ID",
        hintStyle:
        TextStyle(color: AppColors.greyColor, fontSize: 11.sp),
      ),
    );
  }

  Widget _addressModule() {
    return TextFormField(
      controller: screenController.addressController,
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.text,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      // textCapitalization: TextCapitalization.characters,
      validator: (value) => FieldValidator().validateAddress(value!),
      style:
      TextStyle(color: AppColors.blackTextColor, fontSize: 11.sp),
      decoration: InputDecoration(
        hintText: "Address",
        hintStyle:
        TextStyle(color: AppColors.greyColor, fontSize: 11.sp),
      ),
    );
  }

  Widget _pincodeModule() {
    return TextFormField(
      controller: screenController.pincodeController,
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.number,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      // textCapitalization: TextCapitalization.characters,
      validator: (value) => FieldValidator().validatePinCode(value!),
      onChanged: (val) async {
        if (val.length == 6) {

          await screenController
              .getCityStateDetailsByPinFunction();
        }
      },
      style:
      TextStyle(color: AppColors.blackTextColor, fontSize: 11.sp),
      decoration: InputDecoration(
        hintText: "Pincode",
        hintStyle:
        TextStyle(color: AppColors.greyColor, fontSize: 11.sp),
      ),
    );
  }

  Widget _cityModule() {
    return TextFormField(
      controller: screenController.cityController,
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.text,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (value) => FieldValidator().validateCity(value!),
      style:
      TextStyle(color: AppColors.blackTextColor, fontSize: 11.sp),
      decoration: InputDecoration(
        hintText: "City",
        hintStyle:
        TextStyle(color: AppColors.greyColor, fontSize: 11.sp),
      ),
    );
  }

  Widget _stateModule() {
    return TextFormField(
      controller: screenController.stateController,
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.text,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (value) => FieldValidator().validateState(value!),
      style:
      TextStyle(color: AppColors.blackTextColor, fontSize: 11.sp),
      decoration: InputDecoration(
        hintText: "State",
        hintStyle:
        TextStyle(color: AppColors.greyColor, fontSize: 11.sp),
      ),
    );
  }

}


class SaveAndMakePaymentButtonModule extends StatelessWidget {
  SaveAndMakePaymentButtonModule({Key? key}) : super(key: key);
  final screenController = Get.find<SavingSchemeEnrollScreenController>();

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        if(screenController.customerFormKey.currentState!.validate()) {}
      },
      style: ElevatedButton.styleFrom(
        primary: AppColors.accentColor,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
        ),
      ),
      child: Center(
        child: Text(
          "Save & Make Payment".toUpperCase(),
          style: TextStyle(
            fontSize: 13.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
      ).commonSymmetricPadding(vertical: 15, horizontal: 5),
    ).commonSymmetricPadding(horizontal: 15, vertical: 10);
  }
}
