import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:olocker/constants/app_colors.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';
import '../../constants/app_images.dart';
import '../../controllers/submit_claim_form_screen_controller.dart';
import '../../utils/field_validation.dart';

class SubmitClaimFormModule extends StatelessWidget {
  SubmitClaimFormModule({Key? key}) : super(key: key);
  final submitClaimController = Get.find<SubmitClaimFormScreenController>();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(alignment: Alignment.bottomCenter, children: [
          Container(
            margin:
                const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 35),
            // margin: const EdgeInsets.symmetric(vertical: 50, horizontal: 10),
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            decoration: const BoxDecoration(
              color: AppColors.whiteColor,
              borderRadius: BorderRadius.all(
                Radius.circular(12),
              ),
            ),
            child: Form(
              key: submitClaimController.claimFormKey,
              child: Column(
                children: [
                  OrnamentDetailsModule(),
                  EventOfLossDetailsModule(),
                  PoliceFirDetailsModule(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        height: submitClaimController.size.height * 0.15,
                        width: submitClaimController.size.width * 0.4,
                        child: submitClaimController.imageFile == null
                            ? Image.asset("assets/images/select-image.png")
                            : Image.file(
                                submitClaimController.imageFile!,
                                fit: BoxFit.cover,
                              ),
                      ),
                      SizedBox(width: 1.w),
                      ElevatedButton(
                        onPressed: () {
                          submitClaimController.showImagePickerBottomSheet(
                              context: context);
                        },
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                          primary: AppColors.blueDarkColor,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(28),
                            ),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Center(
                            child: Text(
                              "Upload File",
                              style: TextStyle(
                                fontFamily: "Roboto",
                                color: AppColors.whiteColor,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 3.h),
                ],
              ),
            ),
          ),
          SubmitCancelButtonModule(),
        ]),
        // SizedBox(height: 1.h),
        // SizedBox(height: 1.h),
      ],
    );
  }
}

class OrnamentDetailsModule extends StatelessWidget {
  OrnamentDetailsModule({Key? key}) : super(key: key);

  final submitClaimController = Get.find<SubmitClaimFormScreenController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const TitleHeaderModule(text: "Ornament Details"),
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "POLICY NO",
                style: TextStyle(
                  fontFamily: "Roboto",
                  color: AppColors.blackColor,
                  fontSize: 10.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 5),
        TextFormField(
          readOnly: true,
          controller: submitClaimController.policyNoController,
          style: TextStyle(
            fontFamily: "Roboto",
            color: AppColors.greyTextColor,
            fontSize: 10.sp,
            fontWeight: FontWeight.w400,
          ),
          decoration: const InputDecoration(
            isDense: true,
            contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 5),
          ),
        ),
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "ITEM NAME",
                style: TextStyle(
                  fontFamily: "Roboto",
                  color: AppColors.blackColor,
                  fontSize: 10.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 5),
        TextFormField(
          readOnly: true,
          controller: submitClaimController.policyNoController,
          style: TextStyle(
            fontFamily: "Roboto",
            color: AppColors.greyTextColor,
            fontSize: 10.sp,
            fontWeight: FontWeight.w400,
          ),
          decoration: const InputDecoration(
            isDense: true,
            contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 5),
          ),
        ),
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "CUSTOMER NAME",
                style: TextStyle(
                  fontFamily: "Roboto",
                  color: AppColors.blackColor,
                  fontSize: 10.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 5),
        TextFormField(
          readOnly: true,
          controller: submitClaimController.customerNameController,
          style: TextStyle(
            fontFamily: "Roboto",
            color: AppColors.greyTextColor,
            fontSize: 10.sp,
            fontWeight: FontWeight.w400,
          ),
          decoration: const InputDecoration(
            isDense: true,
            contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 5),
          ),
        ),
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "MOBILE NO",
                style: TextStyle(
                  fontFamily: "Roboto",
                  color: AppColors.blackColor,
                  fontSize: 10.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 5),
        TextFormField(
          readOnly: true,
          controller: submitClaimController.mobileNoController,
          style: TextStyle(
            fontFamily: "Roboto",
            color: AppColors.greyTextColor,
            fontSize: 10.sp,
            fontWeight: FontWeight.w400,
          ),
          decoration: const InputDecoration(
            isDense: true,
            contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 5),
          ),
        ),
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "INR",
                style: TextStyle(
                  fontFamily: "Roboto",
                  color: AppColors.blackColor,
                  fontSize: 10.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 5),
        TextFormField(
          readOnly: true,
          controller: submitClaimController.inrController,
          style: TextStyle(
            fontFamily: "Roboto",
            color: AppColors.greyTextColor,
            fontSize: 10.sp,
            fontWeight: FontWeight.w400,
          ),
          decoration: const InputDecoration(
            isDense: true,
            contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 5),
          ),
        ),
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "EXPIRY DATE",
                style: TextStyle(
                  fontFamily: "Roboto",
                  color: AppColors.blackColor,
                  fontSize: 10.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 5),
        TextFormField(
          readOnly: true,
          controller: submitClaimController.expiryDateController,
          style: TextStyle(
            fontFamily: "Roboto",
            color: AppColors.greyTextColor,
            fontSize: 10.sp,
            fontWeight: FontWeight.w400,
          ),
          decoration: const InputDecoration(
            isDense: true,
            contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 5),
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}

class EventOfLossDetailsModule extends StatelessWidget {
  EventOfLossDetailsModule({Key? key}) : super(key: key);

  final submitClaimController = Get.find<SubmitClaimFormScreenController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        children: [
          const TitleHeaderModule(text: "Event of loss Details"),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "ENTER LOSS DATE",
                  style: TextStyle(
                    fontFamily: "Roboto",
                    color: AppColors.blackColor,
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              submitClaimController.showDatePicker(context);
            },
            child: Container(
              height: 45,
              width: double.infinity,
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
              color: AppColors.whiteColor,
              child: Text(
                submitClaimController.selectedLossDate.value,
                style: TextStyle(
                  fontFamily: "Roboto",
                  color: AppColors.greyColor,
                  fontSize: 11.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
          const Divider(
            color: AppColors.greyColor,
            height: 2,
          ),
          submitClaimController.isValidate.value
              ? submitClaimController.selectedLossDate.value ==
                      "Select loss Date"
                  ? Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 5),
                          child: Text(
                            "Enter Loss Date",
                            style: TextStyle(
                              color: const Color.fromARGB(255, 201, 0, 0),
                              fontSize: 9.sp,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                      ],
                    )
                  : const SizedBox()
              : const SizedBox(),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "LOCATION OF LOSS",
                  style: TextStyle(
                    fontFamily: "Roboto",
                    color: AppColors.blackColor,
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 5),
          TextFormField(
            controller: submitClaimController.locationOfLossController,
            validator: (value) =>
                FieldValidator().validateLocationOfLoss(value.toString()),
            style: TextStyle(
              fontFamily: "Roboto",
              color: AppColors.blackTextColor,
              fontSize: 10.sp,
              fontWeight: FontWeight.w400,
            ),
            decoration: InputDecoration(
              isDense: true,
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              hintText: "Address",
              hintStyle: TextStyle(
                fontFamily: "Roboto",
                color: AppColors.greyTextColor,
                fontSize: 10.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "DESCRIBE THE EVENT OF LOSS",
                  style: TextStyle(
                    fontFamily: "Roboto",
                    color: AppColors.blackColor,
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 5),
          TextFormField(
            controller: submitClaimController.describeEventOfLossController,
            validator: (value) =>
                FieldValidator().validateEventOfLoss(value.toString()),
            style: TextStyle(
              fontFamily: "Roboto",
              color: AppColors.blackTextColor,
              fontSize: 10.sp,
              fontWeight: FontWeight.w400,
            ),
            decoration: InputDecoration(
              isDense: true,
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              hintText: "Describe the event of loss*",
              hintStyle: TextStyle(
                fontFamily: "Roboto",
                color: AppColors.greyTextColor,
                fontSize: 10.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "SELECT CLAIM TYPE",
                  style: TextStyle(
                    fontFamily: "Roboto",
                    color: AppColors.blackColor,
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 5),
          DropdownButtonFormField<String>(
            isExpanded: true,
            value: submitClaimController.selectedClaimTypeValue.value,
            validator: (value) =>
                FieldValidator().validateCurrentLocation(value.toString()),
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.symmetric(horizontal: 16),
            ),
            style: TextStyle(
              fontFamily: "Roboto",
              color: AppColors.blackTextColor,
              fontSize: 12.sp,
              fontWeight: FontWeight.w400,
            ),
            items: submitClaimController.claimTypeList.map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (val) {
              // setState(() {
              submitClaimController.isLoading(true);
              submitClaimController.selectedClaimTypeValue.value = val!;

              if (submitClaimController.selectedClaimTypeValue.value ==
                  "Claim Full Amount") {
                submitClaimController.claimAmountController.text =
                    submitClaimController.inrAmount;
              } else if (submitClaimController.selectedClaimTypeValue.value ==
                  "Claim Partial Amount") {
                submitClaimController.claimAmountController.clear();
              }

              log("submitClaimController.claimAmountContorller.text :: ${submitClaimController.claimAmountController.text}");

              submitClaimController.isLoading(false);
              // });
            },
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "CLAIM AMOUNT(INR)",
                  style: TextStyle(
                    fontFamily: "Roboto",
                    color: AppColors.blackColor,
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 5),
          TextFormField(
            controller: submitClaimController.claimAmountController,
            validator: (value) =>
                FieldValidator().validateClaimNumber(value.toString()),
            style: TextStyle(
              fontFamily: "Roboto",
              color: AppColors.blackTextColor,
              fontSize: 10.sp,
              fontWeight: FontWeight.w400,
            ),
            decoration: InputDecoration(
              isDense: true,
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              hintText: "Claim Amount(INR)",
              hintStyle: TextStyle(
                fontFamily: "Roboto",
                color: AppColors.greyTextColor,
                fontSize: 10.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}

class PoliceFirDetailsModule extends StatelessWidget {
  PoliceFirDetailsModule({Key? key}) : super(key: key);

  final submitClaimController = Get.find<SubmitClaimFormScreenController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const TitleHeaderModule(text: "Police Fir Details"),
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "ENTER FIR NUMBER",
                style: TextStyle(
                  fontFamily: "Roboto",
                  color: AppColors.blackColor,
                  fontSize: 10.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 5),
        TextFormField(
          controller: submitClaimController.firNumberController,
          validator: (value) =>
              FieldValidator().validateFirNumber(value.toString()),
          style: TextStyle(
            fontFamily: "Roboto",
            color: AppColors.blackTextColor,
            fontSize: 10.sp,
            fontWeight: FontWeight.w400,
          ),
          decoration: InputDecoration(
            isDense: true,
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            hintText: "Enter fir number",
            hintStyle: TextStyle(
              fontFamily: "Roboto",
              color: AppColors.greyTextColor,
              fontSize: 10.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "POLICE STATION ADDRESS",
                style: TextStyle(
                  fontFamily: "Roboto",
                  color: AppColors.blackColor,
                  fontSize: 10.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 5),
        TextFormField(
          controller: submitClaimController.policeStationAddressController,
          validator: (value) =>
              FieldValidator().validatePoliceStationAddress(value.toString()),
          style: TextStyle(
            fontFamily: "Roboto",
            color: AppColors.blackTextColor,
            fontSize: 10.sp,
            fontWeight: FontWeight.w400,
          ),
          decoration: InputDecoration(
            isDense: true,
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            hintText: "Police station address",
            hintStyle: TextStyle(
              fontFamily: "Roboto",
              color: AppColors.greyTextColor,
              fontSize: 10.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}

class TitleHeaderModule extends StatelessWidget {
  const TitleHeaderModule({Key? key, required this.text}) : super(key: key);

  final String text;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Stack(
          alignment: Alignment.centerLeft,
          children: [
            Image.asset(
              AppImages.aboutTileBGImage,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                text,
                style: const TextStyle(
                  fontFamily: "Roboto",
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class SubmitCancelButtonModule extends StatelessWidget {
  SubmitCancelButtonModule({Key? key}) : super(key: key);

  final submitClaimController = Get.find<SubmitClaimFormScreenController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      // padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      // decoration: const BoxDecoration(
      //   color: AppColors.whiteColor,
      //   borderRadius: BorderRadius.all(
      //     Radius.circular(12),
      //   ),
      // ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ElevatedButton(
            onPressed: () {
              Get.back();
            },
            style: ElevatedButton.styleFrom(
              primary: AppColors.blackTextColor.withOpacity(0.9),
              elevation: 0,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(28),
                ),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Center(
                child: Text(
                  "CANCEL",
                  style: TextStyle(
                    fontFamily: "Roboto",
                    color: AppColors.whiteColor,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              submitClaimController.isValidate.value = true;
              submitClaimController.submitFullForm();
            },
            style: ElevatedButton.styleFrom(
              elevation: 0,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(28),
                ),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Center(
                child: Text(
                  "SUBMIT",
                  style: TextStyle(
                    fontFamily: "Roboto",
                    color: AppColors.whiteColor,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SubmitClaimLoadingWidget extends StatelessWidget {
  const SubmitClaimLoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Shimmer.fromColors(
        baseColor: Colors.grey.shade300,
        highlightColor: Colors.grey.shade100,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 85.h,
                width: double.infinity,
                margin:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 12),
                decoration: const BoxDecoration(
                  color: AppColors.greyColor,
                  borderRadius: BorderRadius.all(
                    Radius.circular(12),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
