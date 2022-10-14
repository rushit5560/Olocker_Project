import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:olocker/constants/app_colors.dart';
import 'package:olocker/constants/app_images.dart';
import 'package:olocker/screens/index_screen/index_screen.dart';
import 'package:olocker/screens/signup_screen/signup_screen_widgets.dart';
import 'package:olocker/widgets/common_loader.dart';

import 'package:sizer/sizer.dart';

import '../../controllers/signup_screen_controller.dart';
import '../../widgets/common_buttons.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key}) : super(key: key);

  final signUpScreenController = Get.put(SignUpScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back_ios_rounded,
            color: AppColors.accentColor,
          ),
        ),
      ),
      body: Obx(
        () => signUpScreenController.isLoading.value
            ? CommonLoader().showCircularLoader()
            : SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    children: [
                      RegisterHeaderModule(),
                      SizedBox(height: 4.h),
                      RegisterForm(),
                      SizedBox(height: 3.h),
                      RectangleRoundedButton(
                        buttonColor: AppColors.accentColor,
                        onPressed: () async {
                          await signUpScreenController
                              .userRegisterFunction(context);
                          // Get.to(() => IndexScreen());
                        },
                        centerChild: Text(
                          "Sign up",
                          style: TextStyle(
                            color: AppColors.whiteColor,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      SizedBox(height: 2.h),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
