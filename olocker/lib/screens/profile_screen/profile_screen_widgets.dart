import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:olocker/constants/app_colors.dart';
import 'package:olocker/constants/app_images.dart';
import 'package:olocker/controllers/profile_screen_controller.dart';
import 'package:sizer/sizer.dart';

import '../../utils/field_validation.dart';
import '../../widgets/common_loader.dart';

class ProfileDetailsFormModule extends StatelessWidget {
  ProfileDetailsFormModule({Key? key}) : super(key: key);

  final profileScreenController = Get.find<ProfileScreenController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: profileScreenController.size.height * 0.8,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(12),
          topRight: Radius.circular(12),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
        child: Obx(
          () => profileScreenController.isLoading.value
              ? CommonLoader().showCircularLoader()
              : Column(
                  children: [
                    const SizedBox(height: 10),
                    DisplayImageDetailsFieldRow(),
                    const SizedBox(height: 20),
                    NameFieldRow(),
                    const SizedBox(height: 10),
                    EmailFieldRow(),
                    const SizedBox(height: 10),
                    DobFieldRow(),
                    const SizedBox(height: 10),
                    MobileFieldRow(),
                    const SizedBox(height: 10),
                    PinCodeFieldRow(),
                    const SizedBox(height: 10),
                    CityFieldRow(),
                    const SizedBox(height: 10),
                    StateFieldRow(),
                    const SizedBox(height: 30),
                    !profileScreenController.isEditable.value
                        ? SaveProfileButton()
                        : const SizedBox(),
                    const SizedBox(height: 20),
                  ],
                ),
        ),
      ),
    );
  }
}

class DisplayImageDetailsFieldRow extends StatelessWidget {
  DisplayImageDetailsFieldRow({Key? key}) : super(key: key);

  final profileScreenController = Get.find<ProfileScreenController>();
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              AbsorbPointer(
                absorbing: profileScreenController.isEditable.value,
                child: GestureDetector(
                  onTap: () {
                    profileScreenController.showImagePickerBottomSheet(
                        context: context);
                  },
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(200),
                    ),
                    child: profileScreenController.selectedProfileImage != null
                        ? Image.file(
                            profileScreenController.selectedProfileImage!,
                            height: 75,
                            width: 75,
                            fit: BoxFit.cover,
                          )
                        : profileScreenController.apiGetProfileImage != null
                            ? Image.network(
                                profileScreenController
                                    .apiGetProfileImage!.path,
                                height: 75,
                                width: 75,
                                fit: BoxFit.cover,
                              )
                            : Image.asset(
                                AppImages.dealBgImage,
                                height: 75,
                                width: 75,
                                fit: BoxFit.cover,
                              ),
                  ),
                ),
              ),
              const SizedBox(width: 18),
              Text(
                profileScreenController.userName.value,
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
          GestureDetector(
            onTap: () {
              profileScreenController.isEditable.value =
                  !profileScreenController.isEditable.value;

              log("profileScreenController.isEditable.value is :: ${profileScreenController.isEditable.value.toString()}");
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
              decoration: BoxDecoration(
                color: profileScreenController.isEditable.value
                    ? AppColors.accentColor
                    : AppColors.greyTextColor,
                borderRadius: const BorderRadius.all(
                  Radius.circular(28),
                ),
              ),
              child: Text(
                "Edit",
                style: TextStyle(
                  color: AppColors.whiteColor,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class NameFieldRow extends StatelessWidget {
  NameFieldRow({Key? key}) : super(key: key);

  final profileScreenController = Get.find<ProfileScreenController>();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Obx(
          () => Center(
            child: SizedBox(
              height: 5.h,
              width: 18.w,
              child: AbsorbPointer(
                absorbing: !profileScreenController.isEditable.value,
                child: DropdownButton<String>(
                  isDense: true,

                  value: profileScreenController.namePrefixDDvalue.value,
                  alignment: Alignment.center,
                  // hint: Text(
                  //   profileScreenController.namePrefixDDvalue.value,
                  //   style: TextStyle(
                  //     color: AppColors.greyColor,
                  //     fontSize: 11.sp,
                  //     fontWeight: FontWeight.w500,
                  //   ),
                  // ),
                  items: profileScreenController.namePrefixItems
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
                    profileScreenController.namePrefixDDvalue.value = val!;
                  },
                ),
              ),
            ),
          ),
        ),
        SizedBox(width: 2.w),
        Expanded(
          child: SizedBox(
            height: 5.h,
            child: TextFormField(
              controller: profileScreenController.fnameController,
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.text,
              readOnly: profileScreenController.isEditable.value,
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
        ),
        Expanded(
          child: SizedBox(
            height: 5.h,
            child: TextFormField(
              controller: profileScreenController.lnameController,
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.next,
              validator: (value) => FieldValidator().validateLastName(value!),
              readOnly: profileScreenController.isEditable.value,
              style:
                  TextStyle(color: AppColors.blackTextColor, fontSize: 11.sp),
              decoration: InputDecoration(
                hintText: "Last Name",
                hintStyle:
                    TextStyle(color: AppColors.greyColor, fontSize: 11.sp),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class EmailFieldRow extends StatelessWidget {
  EmailFieldRow({Key? key}) : super(key: key);

  final profileScreenController = Get.find<ProfileScreenController>();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: 5.h,
          width: 18.w,
          alignment: Alignment.centerLeft,
          child: Text(
            "Email :",
            style: TextStyle(
              color: AppColors.greyColor,
              fontSize: 11.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        SizedBox(width: 2.w),
        Expanded(
          child: SizedBox(
            height: 5.h,
            child: TextFormField(
              controller: profileScreenController.emailController,
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.text,
              readOnly: profileScreenController.isEditable.value,
              validator: (value) => FieldValidator().validateFirstName(value!),
              style:
                  TextStyle(color: AppColors.blackTextColor, fontSize: 11.sp),
              decoration: InputDecoration(
                hintText: "Enter Email id",
                hintStyle:
                    TextStyle(color: AppColors.greyColor, fontSize: 11.sp),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class DobFieldRow extends StatelessWidget {
  DobFieldRow({Key? key}) : super(key: key);

  final profileScreenController = Get.find<ProfileScreenController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 5.h,
            width: 18.w,
            alignment: Alignment.centerLeft,
            child: Text(
              "DOB :",
              style: TextStyle(
                color: AppColors.greyColor,
                fontSize: 11.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          SizedBox(width: 2.w),
          Expanded(
            child: SizedBox(
              height: 5.h,
              child: AbsorbPointer(
                absorbing: profileScreenController.isEditable.value,
                child: GestureDetector(
                  onTap: () {
                    profileScreenController.showDatePicker(context);
                  },
                  child: Container(
                    height: 45,
                    width: double.infinity,
                    alignment: Alignment.centerLeft,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
                    color: AppColors.whiteColor,
                    child: Text(
                      profileScreenController.selectedDobNumber.value,
                      style: TextStyle(
                        color: AppColors.greyDarkColor,
                        fontSize: 11.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              ),
              // TextFormField(
              //   controller: profileScreenController.fnameController,
              //   textInputAction: TextInputAction.next,
              //   keyboardType: TextInputType.text,
              //   validator: (value) => FieldValidator().validateFirstName(value!),
              //   style:
              //       TextStyle(color: AppColors.blackTextColor, fontSize: 11.sp),
              //   decoration: InputDecoration(
              //     hintText: "Oct 12 1999 date",
              //     hintStyle:
              //         TextStyle(color: AppColors.greyColor, fontSize: 11.sp),
              //   ),
              // ),
            ),
          ),
        ],
      ),
    );
  }
}

class MobileFieldRow extends StatelessWidget {
  MobileFieldRow({Key? key}) : super(key: key);

  final profileScreenController = Get.find<ProfileScreenController>();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: 5.h,
          width: 18.w,
          alignment: Alignment.centerLeft,
          child: Text(
            "Mobile :",
            style: TextStyle(
              color: AppColors.greyColor,
              fontSize: 11.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        SizedBox(width: 2.w),
        Expanded(
          child: SizedBox(
            height: 5.h,
            child: TextFormField(
              controller: profileScreenController.numberController,
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.text,
              readOnly: true,
              validator: (value) => FieldValidator().validateFirstName(value!),
              style: TextStyle(
                color: AppColors.greyColor.withOpacity(0.6),
                fontSize: 11.sp,
              ),
              decoration: InputDecoration(
                hintText: "Enter Mobile Number",
                hintStyle: TextStyle(
                  color: AppColors.greyColor,
                  fontSize: 11.sp,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class PinCodeFieldRow extends StatelessWidget {
  PinCodeFieldRow({Key? key}) : super(key: key);

  final profileScreenController = Get.find<ProfileScreenController>();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: 5.h,
          width: 18.w,
          alignment: Alignment.centerLeft,
          child: Text(
            "Pin Code :",
            style: TextStyle(
              color: AppColors.greyColor,
              fontSize: 11.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        SizedBox(width: 2.w),
        Expanded(
          child: SizedBox(
            height: 5.h,
            child: TextFormField(
              controller: profileScreenController.pinCodeController,
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.text,
              readOnly: profileScreenController.isEditable.value,
              validator: (value) => FieldValidator().validateFirstName(value!),
              style:
                  TextStyle(color: AppColors.blackTextColor, fontSize: 11.sp),
              decoration: InputDecoration(
                hintText: "Enter Pin Code",
                hintStyle:
                    TextStyle(color: AppColors.greyColor, fontSize: 11.sp),
              ),
              onChanged: (val) async {
                if (val.length == 6) {
                  await profileScreenController
                      .getCityStateDetailsByPinFunction();
                }
              },
            ),
          ),
        ),
      ],
    );
  }
}

class CityFieldRow extends StatelessWidget {
  CityFieldRow({Key? key}) : super(key: key);

  final profileScreenController = Get.find<ProfileScreenController>();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: 5.h,
          width: 18.w,
          alignment: Alignment.centerLeft,
          child: Text(
            "City :",
            style: TextStyle(
              color: AppColors.greyColor,
              fontSize: 11.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        SizedBox(width: 2.w),
        Expanded(
          child: SizedBox(
            height: 5.h,
            child: TextFormField(
              controller: profileScreenController.cityController,
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.text,
              readOnly: profileScreenController.isEditable.value,
              validator: (value) => FieldValidator().validateFirstName(value!),
              style:
                  TextStyle(color: AppColors.blackTextColor, fontSize: 11.sp),
              decoration: InputDecoration(
                hintText: "Enter City Name",
                hintStyle:
                    TextStyle(color: AppColors.greyColor, fontSize: 11.sp),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class StateFieldRow extends StatelessWidget {
  StateFieldRow({Key? key}) : super(key: key);

  final profileScreenController = Get.find<ProfileScreenController>();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: 5.h,
          width: 18.w,
          alignment: Alignment.centerLeft,
          child: Text(
            "State :",
            style: TextStyle(
              color: AppColors.greyColor,
              fontSize: 11.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        SizedBox(width: 2.w),
        Expanded(
          child: SizedBox(
            height: 5.h,
            child: TextFormField(
              controller: profileScreenController.stateController,
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.text,
              readOnly: profileScreenController.isEditable.value,
              validator: (value) => FieldValidator().validateFirstName(value!),
              style:
                  TextStyle(color: AppColors.blackTextColor, fontSize: 11.sp),
              decoration: InputDecoration(
                hintText: "state name",
                hintStyle:
                    TextStyle(color: AppColors.greyColor, fontSize: 11.sp),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class SaveProfileButton extends StatelessWidget {
  SaveProfileButton({Key? key}) : super(key: key);

  final profileScreenController = Get.find<ProfileScreenController>();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: 5.h,
          width: 50.w,
          child: ElevatedButton(
            onPressed: () {
              profileScreenController.updateUserProfileDetailsFunction();
            },
            style: ElevatedButton.styleFrom(
              primary: AppColors.pinkBGColor,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(25),
                ),
              ),
            ),
            child: Center(
              child: Text(
                "SAVE PROFILE",
                style: TextStyle(
                  color: AppColors.whiteColor,
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
