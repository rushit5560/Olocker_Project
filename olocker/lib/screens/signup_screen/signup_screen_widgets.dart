import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:olocker/constants/app_colors.dart';
import 'package:olocker/constants/app_images.dart';
import 'package:olocker/controllers/signup_screen_controller.dart';
import 'package:sizer/sizer.dart';

class NameFieldRow extends StatelessWidget {
  NameFieldRow({Key? key}) : super(key: key);

  final signUpScreenController = Get.find<SignUpScreenController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
      ),
      height: 55,
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
                icon: const SizedBox(),
                hint: Text(
                  "${signUpScreenController.namePrefixDDvalue.value}",
                  style: TextStyle(
                    color: AppColors.greyColor,
                    fontSize: 11.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
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
              keyboardType: TextInputType.text,
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
              controller: signUpScreenController.lnameController,
              keyboardType: TextInputType.text,
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
}

class EmailField extends StatelessWidget {
  EmailField({Key? key}) : super(key: key);

  final signUpScreenController = Get.find<SignUpScreenController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
      ),
      height: 55,
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
              decoration: InputDecoration(
                isDense: true,
                isCollapsed: true,
                hintText: "Enter Email",
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
      height: 55,
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
          Image.asset(
            AppIcons.mobileIcon,
            color: AppColors.blackColor,
            height: 24,
            width: 24,
          ),
          SizedBox(width: 5.w),
          Expanded(
            child: TextFormField(
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                isDense: true,
                isCollapsed: true,
                hintText: "Enter Mobile Number",
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
      height: 55,
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
          SvgPicture.asset(
            AppIcons.codeImage,
            color: AppColors.blackColor,
            height: 24,
            width: 24,
          ),
          SizedBox(width: 5.w),
          Expanded(
            child: TextFormField(
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                isDense: true,
                isCollapsed: true,
                hintText: "Enter Code",
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
}
