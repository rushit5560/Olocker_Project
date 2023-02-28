import 'package:flutter/material.dart';
import 'package:get/get.dart';

// import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:olocker/constants/app_colors.dart';
import 'package:olocker/screens/signup_screen/signup_screen_widgets.dart';
import 'package:olocker/utils/extensions.dart';
import 'package:sizer/sizer.dart';
import '../../controllers/signup_screen_controller.dart';
import '../../widgets/common_buttons.dart';
import 'qr_scanner_overlay.dart';

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
            ? SignUpScreenLoadingWidget()
            : /*signUpScreenController.screenOpened.value
                ? Stack(
          alignment: Alignment.bottomCenter,
                    children: [
                      // MobileScanner(
                      //   allowDuplicates: false,
                      //   controller: signUpScreenController.cameraController,
                      //   onDetect:(barcode, args)=> signUpScreenController.foundBarcode(barcode, args),
                      // ),
                      QRScannerOverlay(
                          overlayColour: Colors.black.withOpacity(0.5),
                      ),

                      // RectangleRoundedButton(
                      //   buttonColor: AppColors.accentColor,
                      //   onPressed: () {
                      //     signUpScreenController.screenOpened.value = false;
                      //   },
                      //   centerChild: Text(
                      //     "Close",
                      //     style: TextStyle(
                      //       color: AppColors.whiteColor,
                      //       fontSize: 14.sp,
                      //       fontWeight: FontWeight.w400,
                      //     ),
                      //   ),
                      // ).commonSymmetricPadding(horizontal: 10, vertical: 10),

                    ],
                  )
                : */
            SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: /*signUpScreenController.screenOpened.value
                      ? Column(
                        children: [
                          MobileScanner(
                            allowDuplicates: false,
                            controller: signUpScreenController.cameraController,
                            onDetect: signUpScreenController.foundBarcode,
                          ),
                          QRScannerOverlay(overlayColour: Colors.black.withOpacity(0.5)),
                        ],
                      )
                      : */
                      Column(
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
