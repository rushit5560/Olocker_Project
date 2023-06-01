import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:olocker/constants/app_colors.dart';
import 'package:olocker/constants/app_images.dart';
import 'package:olocker/controllers/signup_screen_controller.dart';
import 'package:olocker/utils/field_validation.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';

class RegisterHeaderModule extends StatelessWidget {
  RegisterHeaderModule({Key? key}) : super(key: key);

  final signUpScreenController = Get.find<SignUpScreenController>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        children: [
          Expanded(
            flex: 7,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Please fill up the form",
                  maxLines: null,
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontFamily: "elephantregular",
                    fontSize: 13.sp,
                    color: AppColors.blackColor,
                    letterSpacing: 0.6,
                  ),
                ),
                Text(
                  "to complete registration",
                  maxLines: 2,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontFamily: "elephantregular",
                    fontSize: 24.sp,
                    color: AppColors.blackColor,
                    height: 0.9,
                    // letterSpacing: 0.8,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 4,
            child: Image.asset(
              AppImages.registrationImage,
            ),
          ),
        ],
      ),
    );
  }
}

class NameFieldRow extends StatelessWidget {
  NameFieldRow({Key? key}) : super(key: key);

  final signUpScreenController = Get.find<SignUpScreenController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      height: 50,
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.greyTextColor.withOpacity(0.3),
        borderRadius: const BorderRadius.all(
          Radius.circular(8),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(
            "assets/svgs/profile.svg",
            color: AppColors.blackColor,
            height: 24,
            width: 24,
          ),
          SizedBox(width: 5.w),
          Obx(
            () => SizedBox(
              width: 15.w,
              child: DropdownButton<String>(
                isDense: true,
                icon: const Icon(Icons.keyboard_arrow_down_rounded),
                iconSize: 14.sp,
                iconEnabledColor: AppColors.accentColor,
                hint: Text(
                  signUpScreenController.namePrefixDDvalue.value,
                  style: TextStyle(
                    color: AppColors.blackTextColor,
                    fontFamily: "Acephimere",
                    fontSize: 11.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                alignment: Alignment.center,
                items: signUpScreenController.namePrefixItems
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
                  signUpScreenController.namePrefixDDvalue.value = val!;
                },
              ),
            ),
          ),
          SizedBox(width: 2.w),
          Expanded(
            child: TextFormField(
              controller: signUpScreenController.fnameController,
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
                    TextStyle(color: AppColors.greyTextColor, fontSize: 11.sp),
              ),
            ),
          ),
          Expanded(
            child: TextFormField(
              controller: signUpScreenController.lnameController,
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
                    TextStyle(color: AppColors.greyTextColor, fontSize: 11.sp),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class EmailField extends StatelessWidget {
  EmailField({Key? key}) : super(key: key);

  final signUpScreenController = Get.find<SignUpScreenController>();

  @override
  Widget build(BuildContext context) {
    /* return TextFormField(
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.next,
      validator: (value) => FieldValidator().validateEmail(value!),
      controller: signUpScreenController.emailController,
      decoration: InputDecoration(
        isDense: true,
        isCollapsed: true,
        hintText: "Enter Email",
        border: InputBorder.none,
        enabledBorder: InputBorder.none,
        focusedBorder: InputBorder.none,
        hintStyle:
        TextStyle(color: AppColors.greyTextColor, fontSize: 11.sp),
        prefixIcon:  SvgPicture.asset(
          "assets/svgs/message.svg",
          color: AppColors.blackColor,
          height: 8,
          width: 8,
        ),
      ),
    ).commonSymmetricPadding(horizontal: 15);*/
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
      ),
      height: 50,
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.greyTextColor.withOpacity(0.3),
        borderRadius: const BorderRadius.all(
          Radius.circular(8),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(
            "assets/svgs/message.svg",
            color: AppColors.blackColor,
            height: 24,
            width: 24,
          ),
          SizedBox(width: 5.w),
          Expanded(
            child: TextFormField(
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.next,
              // validator: (value) => FieldValidator().validateEmail(value!),
              controller: signUpScreenController.emailController,
              decoration: InputDecoration(
                isDense: true,
                isCollapsed: true,
                hintText: "Enter Email",
                border: InputBorder.none,
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                hintStyle:
                    TextStyle(color: AppColors.greyTextColor, fontSize: 11.sp),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MobileNumberField extends StatelessWidget {
  MobileNumberField({Key? key}) : super(key: key);

  final signUpScreenController = Get.find<SignUpScreenController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
      ),
      height: 50,
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.greyTextColor.withOpacity(0.3),
        borderRadius: const BorderRadius.all(
          Radius.circular(8),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: Image.asset(
              AppIcons.mobileIcon,
              color: AppColors.blackColor,
              // height: 24,
              width: 24,
            ),
          ),
          SizedBox(width: 5.w),
          Expanded(
            child: TextFormField(
              keyboardType: TextInputType.number,
              textInputAction: TextInputAction.next,
              validator: (value) =>
                  FieldValidator().validateMobileNumber(value!),
              controller: signUpScreenController.numberController,
              inputFormatters: [
                LengthLimitingTextInputFormatter(10),
              ],
              onChanged: (val) async {
                if (signUpScreenController.numberController.text.length == 10) {
                  await signUpScreenController.checkMobileNumber(context);
                }
              },
              decoration: InputDecoration(
                isDense: true,
                isCollapsed: true,
                hintText: "Enter Mobile Number",
                border: InputBorder.none,
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                hintStyle:
                    TextStyle(color: AppColors.greyTextColor, fontSize: 11.sp),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class EnterCodeField extends StatelessWidget {
  EnterCodeField({Key? key}) : super(key: key);

  final signUpScreenController = Get.find<SignUpScreenController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
      ),
      height: 50,
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.greyTextColor.withOpacity(0.3),
        borderRadius: const BorderRadius.all(
          Radius.circular(8),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            AppIcons.codeIcon,
            color: AppColors.blackColor,
            height: 24,
            width: 24,
          ),
          SizedBox(width: 5.w),
          Expanded(
            child: TextFormField(
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.done,
              validator: (value) =>
                  FieldValidator().validateReferralCodeNumber(value!),
              controller: signUpScreenController.codeController,
              decoration: InputDecoration(
                isDense: true,
                isCollapsed: true,
                hintText: "Enter Code",
                border: InputBorder.none,
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                hintStyle:
                    TextStyle(color: AppColors.greyTextColor, fontSize: 11.sp),
              ),
            ),
          ),
          // SizedBox(width: 5.w),

          GestureDetector(
            onTap: () {
              // signUpScreenController.screenOpened.value = true;
              signUpScreenController.scanQRCode();
            },
            child: Image.asset(
              AppImages.qrImage,
              // color: AppColors.blackColor,
              height: 24,
              width: 24,
            ),
          ),
        ],
      ),
    );
  }
}

class RegisterForm extends StatelessWidget {
  RegisterForm({Key? key}) : super(key: key);

  final signUpScreenController = Get.find<SignUpScreenController>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: signUpScreenController.formKey,
      child: Column(
        children: [
          NameFieldRow(),
          SizedBox(height: 2.h),
          EmailField(),
          SizedBox(height: 2.h),
          MobileNumberField(),
          SizedBox(height: 2.h),
          EnterCodeField(),
        ],
      ),
    );
  }
}

class SignUpScreenLoadingWidget extends StatelessWidget {
  SignUpScreenLoadingWidget({Key? key}) : super(key: key);
  final signUpScreenController = Get.find<SignUpScreenController>();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Shimmer.fromColors(
        baseColor: Colors.grey.shade300,
        highlightColor: Colors.grey.shade50,
        child: SingleChildScrollView(
          child: Column(
            children: [
              RegisterHeaderModule(),
              SizedBox(height: 4.h),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                padding: const EdgeInsets.symmetric(horizontal: 15),
                height: 60,
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: AppColors.greyColor,
                  borderRadius: BorderRadius.all(
                    Radius.circular(8),
                  ),
                ),
              ),
              SizedBox(height: 2.h),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                padding: const EdgeInsets.symmetric(horizontal: 15),
                height: 60,
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: AppColors.greyColor,
                  borderRadius: BorderRadius.all(
                    Radius.circular(8),
                  ),
                ),
              ),
              SizedBox(height: 2.h),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                padding: const EdgeInsets.symmetric(horizontal: 15),
                height: 60,
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: AppColors.greyColor,
                  borderRadius: BorderRadius.all(
                    Radius.circular(8),
                  ),
                ),
              ),
              SizedBox(height: 2.h),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                padding: const EdgeInsets.symmetric(horizontal: 15),
                height: 60,
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: AppColors.greyColor,
                  borderRadius: BorderRadius.all(
                    Radius.circular(8),
                  ),
                ),
              ),
              SizedBox(height: 4.h),
              Container(
                height: 60,
                width: double.infinity,
                margin: EdgeInsets.symmetric(
                  // vertical: 20,
                  horizontal: 6.w,
                ),
                decoration: const BoxDecoration(
                  color: AppColors.greyColor,
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
              ),
              SizedBox(height: 4.h),
            ],
          ),
        ),
      ),
    );
  }
}
