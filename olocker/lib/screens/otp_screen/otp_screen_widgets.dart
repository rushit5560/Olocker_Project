import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:olocker/controllers/otp_screen_controller.dart';
import 'package:olocker/utils/extensions.dart';
import 'package:sizer/sizer.dart';

import '../../constants/app_colors.dart';
import '../../utils/field_validation.dart';

class OtpEnterForm extends StatelessWidget {
  OtpEnterForm({Key? key}) : super(key: key);

  final otpScreenController = Get.find<OtpScreenController>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: otpScreenController.formKey,
      child: TextFormField(
        textAlign: TextAlign.center,
        style: TextStyle(
          color: AppColors.blackColor,
          fontSize: 16.sp,
          fontWeight: FontWeight.w500,
          letterSpacing: 4.w,
        ),
        keyboardType: TextInputType.number,
        inputFormatters: [
          LengthLimitingTextInputFormatter(6),
        ],
        controller: otpScreenController.otpController,
        validator: (value) => FieldValidator().validateOtpNumber(value!),
        autovalidateMode: AutovalidateMode.onUserInteraction,
        autofocus: true,
        decoration: InputDecoration(
          hintText: "Enter Otp",
          hintStyle: TextStyle(
            color: AppColors.greyColor,
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
            letterSpacing: 0,
          ),
        ),
      ).commonSymmetricPadding(
        horizontal: 10.w,
      ),
    );
  }
}
