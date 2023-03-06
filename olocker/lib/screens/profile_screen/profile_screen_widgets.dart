import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:olocker/constants/api_url.dart';
import 'package:olocker/constants/app_colors.dart';
import 'package:olocker/constants/app_images.dart';
import 'package:olocker/controllers/profile_screen_controller.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';
import '../../utils/field_validation.dart';

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
              ? ProfileScreenLoadingWidget()
              : Form(
                  key: profileScreenController.formKey,
                  child: Column(
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
              GestureDetector(
                onTap: () {
                  if (!profileScreenController.isEditable.value) {
                    profileScreenController.showImagePickerBottomSheet(
                        context: context);
                  }
                },
                child: Container(
                  height: 75,
                  width: 75,
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.greyColor),
                    shape: BoxShape.circle,
                  ),
                  child: ClipRRect(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(200),
                      ),
                      child: profileScreenController.selectedProfileImage !=
                              null
                          ? Container(
                              decoration: BoxDecoration(
                              color: Colors.black,
                              shape: BoxShape.circle,
                              // border: Border.all(
                              //     color: AppColors.whiteColor, width: 3),
                              image: DecorationImage(
                                image: FileImage(
                                  profileScreenController.selectedProfileImage!,
                                ),
                                fit: BoxFit.cover,
                              ),
                              // child: Image.file(
                              //     profileScreenController.selectedProfileImage!,
                              //     height: 75,
                              //     width: 75,
                              //     fit: BoxFit.cover,
                              //   ),
                            ))
                          : Container(
                              decoration: const BoxDecoration(
                                color: Colors.black,
                                shape: BoxShape.circle,
                                // border: Border.all(
                                //     color: AppColors.whiteColor, width: 3),
                                image: DecorationImage(
                                  image: NetworkImage(
                                    "${ApiUrl.apiImagePath}/images/JewelleryApp/2020/5/9e926966718148acaedc690e4a55d5f8_1.png",
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            )),
                ),
              ),
              const SizedBox(width: 18),
              Text(
                profileScreenController.userName.value,
                style: TextStyle(
                  fontFamily: "Roboto",
                  fontSize: 18.sp,
                  color: AppColors.darkBlue,
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
                  fontFamily: "Roboto",
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
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Obx(
          () => SizedBox(
            height: 3.8.h,
            width: 18.w,
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
                            fontFamily: "Roboto",
                            fontSize: 15,
                          ),
                        ),
                      ))
                  .toList(),
              onChanged: (val) {
                if (!profileScreenController.isEditable.value) {
                  profileScreenController.namePrefixDDvalue.value = val!;
                }
              },
            ),
          ),
        ),
        SizedBox(width: 2.w),
        Expanded(
          child: SizedBox(
            // height: 5.h,
            child: TextFormField(
              controller: profileScreenController.fnameController,
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.text,
              readOnly: profileScreenController.isEditable.value,
              validator: (value) => FieldValidator().validateFirstName(value!),
              style: TextStyle(
                color: AppColors.darkBlue,
                fontSize: 11.sp,
                fontFamily: "Roboto",
              ),
              decoration: InputDecoration(
                isDense: true,
                hintText: "First Name",
                hintStyle: TextStyle(
                  color: AppColors.greyColor,
                  fontSize: 11.sp,
                  fontFamily: "Roboto",
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: SizedBox(
            // height: 5.h,
            child: TextFormField(
              controller: profileScreenController.lnameController,
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.next,
              validator: (value) => FieldValidator().validateLastName(value!),
              readOnly: profileScreenController.isEditable.value,
              style: TextStyle(
                color: AppColors.darkBlue,
                fontSize: 11.sp,
                fontFamily: "Roboto",
              ),
              decoration: InputDecoration(
                isDense: true,
                hintText: "Last Name",
                hintStyle: TextStyle(
                  color: AppColors.greyColor,
                  fontSize: 11.sp,
                  fontFamily: "Roboto",
                ),
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
          // height: 5.h,
          width: 18.w,
          alignment: Alignment.centerLeft,
          child: Text(
            "Email :",
            style: TextStyle(
              color: AppColors.greyColor,
              fontSize: 11.sp,
              fontWeight: FontWeight.w500,
              fontFamily: "Roboto",
            ),
          ),
        ),
        SizedBox(width: 2.w),
        Expanded(
          child: SizedBox(
            // height: 5.h,
            child: TextFormField(
              controller: profileScreenController.emailController,
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.text,
              readOnly: profileScreenController.isEditable.value,
              validator: (value) => FieldValidator().validateFirstName(value!),
              style: TextStyle(
                color: AppColors.darkBlue,
                fontSize: 11.sp,
                fontFamily: "Roboto",
              ),
              decoration: InputDecoration(
                isDense: true,
                hintText: "Enter Email id",
                hintStyle: TextStyle(
                  color: AppColors.greyColor,
                  fontSize: 11.sp,
                  fontFamily: "Roboto",
                ),
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
            // height: 5.h,
            width: 18.w,
            alignment: Alignment.centerLeft,
            child: Text(
              "DOB :",
              style: TextStyle(
                color: AppColors.greyColor,
                fontSize: 11.sp,
                fontWeight: FontWeight.w500,
                fontFamily: "Roboto",
              ),
            ),
          ),
          SizedBox(width: 2.w),
          Expanded(
              child: AbsorbPointer(
            absorbing: profileScreenController.isEditable.value,
            child: TextFormField(
              readOnly: true,
              controller: profileScreenController.dateofbrithController,
              // maxLength: 10,
              style: TextStyle(
                color: AppColors.darkBlue,
                fontFamily: "Roboto",
                fontSize: 11.sp,
                fontWeight: FontWeight.w400,
              ),
              onTap: () {
                profileScreenController.showDatePicker(context);
              },
              decoration: InputDecoration(
                isDense: true,
                hintText: "Enter dob brith",
                hintStyle: TextStyle(
                  color: AppColors.greyColor,
                  fontSize: 11.sp,
                  fontFamily: "Roboto",
                ),
              ),
            ),
          )

              //  AbsorbPointer(
              //   absorbing: profileScreenController.isEditable.value,
              //   child: GestureDetector(
              //     onTap: () {
              //       profileScreenController.showDatePicker(context);
              //     },
              //     child: Text(
              //       profileScreenController.selectedDobNumber.value,
              //       style: TextStyle(
              //         color: AppColors.darkBlue,
              //         fontFamily: "Roboto",
              //         fontSize: 11.sp,
              //         fontWeight: FontWeight.w400,
              //       ),
              //     ),
              //   ),
              // ),
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
          // height: 5.h,
          width: 18.w,
          alignment: Alignment.centerLeft,
          child: Text(
            "Mobile :",
            style: TextStyle(
              fontFamily: "Roboto",
              color: AppColors.greyColor,
              fontSize: 11.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        SizedBox(width: 2.w),
        Expanded(
          child: SizedBox(
            // height: 5.h,
            child: TextFormField(
              controller: profileScreenController.numberController,
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.text,
              readOnly: true,
              validator: (value) => FieldValidator().validateFirstName(value!),
              style: TextStyle(
                fontFamily: "Roboto",
                color: AppColors.greyColor.withOpacity(0.6),
                fontSize: 11.sp,
              ),
              decoration: InputDecoration(
                isDense: true,
                hintText: "Enter Mobile Number",
                hintStyle: TextStyle(
                  fontFamily: "Roboto",
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
          // height: 5.h,
          width: 18.w,
          alignment: Alignment.centerLeft,
          child: Text(
            "Pin Code :",
            style: TextStyle(
              fontFamily: "Roboto",
              color: AppColors.greyColor,
              fontSize: 11.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        SizedBox(width: 2.w),
        Expanded(
          child: SizedBox(
            // height: 5.h,
            child: TextFormField(
              controller: profileScreenController.pinCodeController,
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.number,
              readOnly: profileScreenController.isEditable.value,
              validator: (value) => FieldValidator().validatePinCode(value!),
              style: TextStyle(
                color: AppColors.darkBlue,
                fontSize: 11.sp,
                fontFamily: "Roboto",
              ),
              decoration: InputDecoration(
                isDense: true,
                hintText: "Enter Pin Code",
                hintStyle: TextStyle(
                  color: AppColors.greyColor,
                  fontSize: 11.sp,
                  fontFamily: "Roboto",
                ),
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
          // height: 5.h,
          width: 18.w,
          alignment: Alignment.centerLeft,
          child: Text(
            "City :",
            style: TextStyle(
              fontFamily: "Roboto",
              color: AppColors.greyColor,
              fontSize: 11.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        SizedBox(width: 2.w),
        Expanded(
          child: SizedBox(
            // height: 5.h,
            child: TextFormField(
              controller: profileScreenController.cityController,
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.text,
              readOnly: profileScreenController.isEditable.value,
              validator: (value) => FieldValidator().validateCity(value!),
              style: TextStyle(
                color: AppColors.darkBlue,
                fontSize: 11.sp,
                fontFamily: "Roboto",
              ),
              decoration: InputDecoration(
                isDense: true,
                hintText: "Enter City Name",
                hintStyle: TextStyle(
                  color: AppColors.greyColor,
                  fontSize: 11.sp,
                  fontFamily: "Roboto",
                ),
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
          // height: 5.h,
          width: 18.w,
          alignment: Alignment.centerLeft,
          child: Text(
            "State :",
            style: TextStyle(
              color: AppColors.greyColor,
              fontSize: 11.sp,
              fontWeight: FontWeight.w500,
              fontFamily: "Roboto",
            ),
          ),
        ),
        SizedBox(width: 2.w),
        Expanded(
          child: SizedBox(
            // height: 5.h,
            child: TextFormField(
              controller: profileScreenController.stateController,
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.text,
              readOnly: profileScreenController.isEditable.value,
              validator: (value) => FieldValidator().validateState(value!),
              style: TextStyle(
                color: AppColors.darkBlue,
                fontSize: 11.sp,
                fontFamily: "Roboto",
              ),
              decoration: InputDecoration(
                isDense: true,
                hintText: "Enter state name",
                hintStyle: TextStyle(
                  color: AppColors.greyColor,
                  fontSize: 11.sp,
                  fontFamily: "Roboto",
                ),
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
          // height: 5.h,
          width: 50.w,
          child: ElevatedButton(
            onPressed: () {
              if (profileScreenController.formKey.currentState!.validate()) {
                profileScreenController.updateUserProfileDetailsFunction();
              }
            },
            style: ElevatedButton.styleFrom(
              primary: AppColors.accentColor,
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
                  fontFamily: "Roboto",
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

class ProfileScreenLoadingWidget extends StatelessWidget {
  ProfileScreenLoadingWidget({Key? key}) : super(key: key);
  final profileScreenController = Get.find<ProfileScreenController>();

  @override
  Widget build(BuildContext context) {
    textFieldRow({required String text}) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            // height: 5.h,
            width: 18.w,
            alignment: Alignment.centerLeft,
            child: Text(
              text,
              style: TextStyle(
                color: AppColors.greyColor,
                fontSize: 11.sp,
                fontWeight: FontWeight.w500,
                fontFamily: "Roboto",
              ),
            ),
          ),
          SizedBox(width: 2.w),
          Expanded(
            child: Container(
              height: 40,
              color: AppColors.greyColor,
            ),
          ),
        ],
      );
    }

    return SizedBox(
      width: double.infinity,
      child: Shimmer.fromColors(
        baseColor: Colors.grey.shade300,
        highlightColor: Colors.grey.shade100,
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Container(
                        height: 75,
                        width: 75,
                        decoration: BoxDecoration(
                          border: Border.all(color: AppColors.greyColor),
                          shape: BoxShape.circle,
                        ),
                        child: const ClipRRect(
                          borderRadius: BorderRadius.all(
                            Radius.circular(200),
                          ),
                        ),
                      ),
                      const SizedBox(width: 18),
                      Container(
                        height: 20,
                        width: 40.w,
                        color: AppColors.greyColor,
                      ),
                    ],
                  ),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
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
                        fontFamily: "Roboto",
                        color: AppColors.whiteColor,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    height: 40,
                    width: 18.w,
                    color: AppColors.greyColor,
                  ),
                  SizedBox(width: 2.w),
                  Expanded(
                    child: Container(
                      height: 40,
                      color: AppColors.greyColor,
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 40,
                      color: AppColors.greyColor,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              textFieldRow(text: "Email :"),
              const SizedBox(height: 10),
              textFieldRow(text: "DOB :"),
              const SizedBox(height: 10),
              textFieldRow(text: "Mobile :"),
              const SizedBox(height: 10),
              textFieldRow(text: "Pin Code :"),
              const SizedBox(height: 10),
              textFieldRow(text: "City :"),
              const SizedBox(height: 10),
              textFieldRow(text: "State :"),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
