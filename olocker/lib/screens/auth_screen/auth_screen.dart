import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:olocker/constants/app_colors.dart';
import 'package:olocker/constants/app_images.dart';
import 'package:olocker/controllers/auth_screen_controller.dart';
import 'package:olocker/utils/extensions.dart';
import 'package:sizer/sizer.dart';

import '../../widgets/common_buttons.dart';
import '../mobile_number_screen/mobile_number_screen.dart';
import '../signup_screen/signup_screen.dart';

class AuthScreen extends StatelessWidget {
  AuthScreen({Key? key}) : super(key: key);

  final authScreenController = Get.put(AuthScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(
                top: 12.h,
                left: 6.w,
                right: 6.w,
                bottom: 5.h,
              ),
              height: authScreenController.size.height * 0.50,
              width: authScreenController.size.width,
              color: AppColors.accentBGColor,
              child: Image.asset(
                AppImages.loginTopBgImage,
                fit: BoxFit.cover,
              ),
            ),
            Image.asset(
              AppImages.loginLogoImage,
              fit: BoxFit.cover,
            ).commonOnlyPadding(
              top: 4.h,
              bottom: 5.h,
              left: 16.w,
              right: 10.w,
            ),
            // SizedBox(height: 4.h),
            RectangleRoundedButton(
              buttonColor: AppColors.accentColor,
              onPressed: () {
                Get.to(
                  () => MobileNumberScreen(),
                );
              },
              centerChild: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    AppIcons.mobileIcon,
                    color: AppColors.whiteColor,
                    height: 18.sp,
                  ),
                  SizedBox(width: 6.w),
                  Text(
                    "Login With Mobile",
                    style: TextStyle(
                      color: AppColors.whiteColor,
                      fontFamily: "Acephimere",
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ).commonSymmetricPadding(
              horizontal: 3.w,
              vertical: 1.5.h,
            ),
            RectangleRoundedButton(
              buttonColor: AppColors.greyColor.withOpacity(0.35),
              onPressed: () {
                Get.to(
                  () => SignUpScreen(),
                );
              },
              centerChild: Text(
                "Sign Up",
                style: TextStyle(
                  color: AppColors.blackColor,
                  fontFamily: "Acephimere",
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ).commonSymmetricPadding(
              horizontal: 3.w,
              vertical: 1.5.h,
            ),
          ],
        ),
      ),
    );
  }
}
