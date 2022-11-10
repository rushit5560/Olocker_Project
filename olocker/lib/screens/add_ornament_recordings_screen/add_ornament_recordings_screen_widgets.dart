import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:olocker/constants/app_colors.dart';
import 'package:olocker/constants/app_images.dart';
import 'package:olocker/models/portfolio_screen_models/get_all_data_ornament_model.dart';
import 'package:olocker/utils/field_validation.dart';
import 'package:olocker/widgets/common_loader.dart';
import 'package:sizer/sizer.dart';

import '../../controllers/add_ornament_recordings_screen_controller.dart';
import '../../controllers/add_uninsured_jewellery_screen_controller.dart';

class AddRecordingDetailsFormModule extends StatefulWidget {
  AddRecordingDetailsFormModule({Key? key}) : super(key: key);

  @override
  State<AddRecordingDetailsFormModule> createState() =>
      _AddRecordingDetailsFormModuleState();
}

class _AddRecordingDetailsFormModuleState
    extends State<AddRecordingDetailsFormModule> {
  final addOrnamentRecordingsController =
      Get.find<AddOrnamentRecordingsScreenController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => addOrnamentRecordingsController.isLoading.value
          ? CommonLoader().showCircularLoader()
          : Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Container(
                  margin: const EdgeInsets.only(
                      left: 10, right: 10, top: 10, bottom: 24),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 12),
                  decoration: const BoxDecoration(
                    color: AppColors.whiteColor,
                    borderRadius: BorderRadius.all(
                      Radius.circular(12),
                    ),
                  ),
                  child: Form(
                    key: addOrnamentRecordingsController
                        .ornamentRecordingFormKey,
                    child: Column(
                      children: [
                        // SizedBox(height: 2.h),
                        DropdownButtonFormField<FormDDValue>(
                          isExpanded: true,

                          value: addOrnamentRecordingsController
                              .selectedActivityTypeName,

                          // validator: (value) => FieldValidator()
                          //     .validateProductName(value.toString()),
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 5),
                            labelText: "SELECT ACTIVITY",
                            labelStyle: TextStyle(
                              color: AppColors.blackColor,
                              fontSize: 10.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          style: TextStyle(
                            color: AppColors.blackColor,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                          ),
                          items: addOrnamentRecordingsController
                              .selectActivityTypeList
                              .map(
                            (FormDDValue activityValue) {
                              return DropdownMenuItem<FormDDValue>(
                                value: activityValue,
                                child: Text(
                                  activityValue.textValue,
                                  style: TextStyle(
                                    fontSize: 11.sp,
                                  ),
                                ),
                              );
                            },
                          ).toList(),
                          onChanged: (val) {
                            setState(() {
                              addOrnamentRecordingsController
                                  .selectedActivityTypeName = val!;
                            });
                          },
                        ),
                        SizedBox(height: 1.h),
                        DropdownButtonFormField<FormDDValue>(
                          isExpanded: true,

                          value: addOrnamentRecordingsController
                              .selectedlocationOfJewellery,
                          // validator: (value) => FieldValidator()
                          //     .validateProductName(value.toString()),
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 5),
                            labelText: "CURRENT LOCATION OF JEWELLERY",
                            labelStyle: TextStyle(
                              color: AppColors.blackColor,
                              fontSize: 10.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          style: TextStyle(
                            color: AppColors.blackColor,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                          ),
                          items: addOrnamentRecordingsController
                              .locationOfJewelleryTypeList
                              .map((FormDDValue value) {
                            return DropdownMenuItem<FormDDValue>(
                              value: value,
                              child: Text(value.textValue),
                            );
                          }).toList(),
                          onChanged: (val) {
                            setState(() {
                              addOrnamentRecordingsController
                                  .selectedlocationOfJewellery = val!;
                            });
                          },
                        ),
                        addOrnamentRecordingsController
                                    .selectedlocationOfJewellery ==
                                null
                            ? const SizedBox()
                            : addOrnamentRecordingsController
                                        .selectedlocationOfJewellery!.id ==
                                    3
                                ? SizedBox(height: 1.h)
                                : const SizedBox(),

                        addOrnamentRecordingsController
                                    .selectedlocationOfJewellery ==
                                null
                            ? const SizedBox()
                            : addOrnamentRecordingsController
                                        .selectedlocationOfJewellery!.id ==
                                    3
                                ? TextFormField(
                                    controller: addOrnamentRecordingsController
                                        .otherLocationOfJewelleryController,
                                    // textInputAction: TextInputAction.next,
                                    // keyboardType: TextInputType.number,
                                    // validator: (value) =>
                                    //     FieldValidator().validateGrossWeight(value!),
                                    decoration: InputDecoration(
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                              horizontal: 16, vertical: 5),
                                      labelText: "Other location of jewellery"
                                          .toUpperCase(),
                                      labelStyle: TextStyle(
                                        color: AppColors.blackColor,
                                        fontSize: 10.sp,
                                        fontWeight: FontWeight.w400,
                                      ),
                                      hintText: 'Other location of jewellery',
                                      hintStyle: TextStyle(
                                        color: AppColors.greyColor,
                                        fontSize: 10.sp,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  )
                                : const SizedBox(),
                        SizedBox(height: 1.h),

                        TextFormField(
                          readOnly: true,
                          onTap: () {
                            addOrnamentRecordingsController
                                .showDatePicker(context);
                          },
                          controller: addOrnamentRecordingsController
                              .activityDateController,
                          // textInputAction: TextInputAction.next,
                          // keyboardType: TextInputType.number,
                          // validator: (value) =>
                          //     FieldValidator().validateGrossWeight(value!),
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 5),
                            labelText: 'SELECT ACTIVITY DATE',
                            labelStyle: TextStyle(
                              color: AppColors.blackColor,
                              fontSize: 10.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),

                        // SizedBox(height: 1.h),
                        addOrnamentRecordingsController
                                    .selectedActivityTypeName ==
                                null
                            ? const SizedBox()
                            : addOrnamentRecordingsController
                                        .selectedActivityTypeName!.id ==
                                    1
                                ? TextFormField(
                                    controller: addOrnamentRecordingsController
                                        .exchangedAtShopNameController,
                                    // textInputAction: TextInputAction.next,
                                    // keyboardType: TextInputType.number,
                                    validator: (value) => FieldValidator()
                                        .validateGrossWeight(value!),
                                    decoration: InputDecoration(
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                              horizontal: 16, vertical: 5),
                                      labelText:
                                          "Exchanged At (Shopkeeper's name)"
                                              .toUpperCase(),
                                      labelStyle: TextStyle(
                                        color: AppColors.blackColor,
                                        fontSize: 10.sp,
                                        fontWeight: FontWeight.w400,
                                      ),
                                      hintText: 'name',
                                      hintStyle: TextStyle(
                                        color: AppColors.greyColor,
                                        fontSize: 10.sp,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  )
                                : const SizedBox(),
                        addOrnamentRecordingsController
                                    .selectedActivityTypeName ==
                                null
                            ? const SizedBox()
                            : addOrnamentRecordingsController
                                        .selectedActivityTypeName!.id ==
                                    1
                                ? TextFormField(
                                    controller: addOrnamentRecordingsController
                                        .reasonForController,
                                    // textInputAction: TextInputAction.next,
                                    // keyboardType: TextInputType.number,
                                    validator: (value) => FieldValidator()
                                        .validateGrossWeight(value!),
                                    decoration: InputDecoration(
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                              horizontal: 16, vertical: 5),
                                      labelText: "Reason for an Exchange"
                                          .toUpperCase(),
                                      labelStyle: TextStyle(
                                        color: AppColors.blackColor,
                                        fontSize: 10.sp,
                                        fontWeight: FontWeight.w400,
                                      ),
                                      hintText: 'Reason',
                                      hintStyle: TextStyle(
                                        color: AppColors.greyColor,
                                        fontSize: 10.sp,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  )
                                : const SizedBox(),
                        addOrnamentRecordingsController
                                    .selectedActivityTypeName ==
                                null
                            ? const SizedBox()
                            : addOrnamentRecordingsController
                                        .selectedActivityTypeName!.id ==
                                    2
                                ? TextFormField(
                                    controller: addOrnamentRecordingsController
                                        .exchangedAtShopNameController,
                                    // textInputAction: TextInputAction.next,
                                    // keyboardType: TextInputType.number,
                                    validator: (value) => FieldValidator()
                                        .validateGrossWeight(value!),
                                    decoration: InputDecoration(
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                              horizontal: 16, vertical: 5),
                                      labelText: "Gifted To (Person's Name)"
                                          .toUpperCase(),
                                      labelStyle: TextStyle(
                                        color: AppColors.blackColor,
                                        fontSize: 10.sp,
                                        fontWeight: FontWeight.w400,
                                      ),
                                      hintText: 'name',
                                      hintStyle: TextStyle(
                                        color: AppColors.greyColor,
                                        fontSize: 10.sp,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  )
                                : const SizedBox(),
                        addOrnamentRecordingsController
                                    .selectedActivityTypeName ==
                                null
                            ? const SizedBox()
                            : addOrnamentRecordingsController
                                        .selectedActivityTypeName!.id ==
                                    2
                                ? TextFormField(
                                    controller: addOrnamentRecordingsController
                                        .exchangedAtShopNameController,
                                    // textInputAction: TextInputAction.next,
                                    // keyboardType: TextInputType.number,
                                    validator: (value) => FieldValidator()
                                        .validateGrossWeight(value!),
                                    decoration: InputDecoration(
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                              horizontal: 16, vertical: 5),
                                      labelText:
                                          "reason for gifting".toUpperCase(),
                                      labelStyle: TextStyle(
                                        color: AppColors.blackColor,
                                        fontSize: 10.sp,
                                        fontWeight: FontWeight.w400,
                                      ),
                                      hintText: 'reason',
                                      hintStyle: TextStyle(
                                        color: AppColors.greyColor,
                                        fontSize: 10.sp,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  )
                                : const SizedBox(),
                        addOrnamentRecordingsController
                                    .selectedActivityTypeName ==
                                null
                            ? const SizedBox()
                            : addOrnamentRecordingsController
                                        .selectedActivityTypeName!.id ==
                                    3
                                ? TextFormField(
                                    controller: addOrnamentRecordingsController
                                        .exchangedAtShopNameController,
                                    // textInputAction: TextInputAction.next,
                                    // keyboardType: TextInputType.number,
                                    validator: (value) => FieldValidator()
                                        .validateGrossWeight(value!),
                                    decoration: InputDecoration(
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                              horizontal: 16, vertical: 5),
                                      labelText: "Given To (Person's Name)"
                                          .toUpperCase(),
                                      labelStyle: TextStyle(
                                        color: AppColors.blackColor,
                                        fontSize: 10.sp,
                                        fontWeight: FontWeight.w400,
                                      ),
                                      hintText: 'name',
                                      hintStyle: TextStyle(
                                        color: AppColors.greyColor,
                                        fontSize: 10.sp,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  )
                                : const SizedBox(),
                        addOrnamentRecordingsController
                                    .selectedActivityTypeName ==
                                null
                            ? const SizedBox()
                            : addOrnamentRecordingsController
                                        .selectedActivityTypeName!.id ==
                                    4
                                ? TextFormField(
                                    controller: addOrnamentRecordingsController
                                        .exchangedAtShopNameController,
                                    // textInputAction: TextInputAction.next,
                                    // keyboardType: TextInputType.number,
                                    validator: (value) => FieldValidator()
                                        .validateGrossWeight(value!),
                                    decoration: InputDecoration(
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                              horizontal: 16, vertical: 5),
                                      labelText: "Given To (broker's Name)"
                                          .toUpperCase(),
                                      labelStyle: TextStyle(
                                        color: AppColors.blackColor,
                                        fontSize: 10.sp,
                                        fontWeight: FontWeight.w400,
                                      ),
                                      hintText: 'name',
                                      hintStyle: TextStyle(
                                        color: AppColors.greyColor,
                                        fontSize: 10.sp,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  )
                                : const SizedBox(),
                        addOrnamentRecordingsController
                                    .selectedActivityTypeName ==
                                null
                            ? const SizedBox()
                            : addOrnamentRecordingsController
                                        .selectedActivityTypeName!.id ==
                                    5
                                ? TextFormField(
                                    controller: addOrnamentRecordingsController
                                        .exchangedAtShopNameController,
                                    // textInputAction: TextInputAction.next,
                                    // keyboardType: TextInputType.number,
                                    validator: (value) => FieldValidator()
                                        .validateGrossWeight(value!),
                                    decoration: InputDecoration(
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                              horizontal: 16, vertical: 5),
                                      labelText: "Given To (shopkeeper's Name)"
                                          .toUpperCase(),
                                      labelStyle: TextStyle(
                                        color: AppColors.blackColor,
                                        fontSize: 10.sp,
                                        fontWeight: FontWeight.w400,
                                      ),
                                      hintText: 'name',
                                      hintStyle: TextStyle(
                                        color: AppColors.greyColor,
                                        fontSize: 10.sp,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  )
                                : const SizedBox(),
                        addOrnamentRecordingsController
                                    .selectedActivityTypeName ==
                                null
                            ? const SizedBox()
                            : addOrnamentRecordingsController
                                            .selectedActivityTypeName!.id ==
                                        4 ||
                                    addOrnamentRecordingsController
                                            .selectedActivityTypeName!.id ==
                                        5
                                ? TextFormField(
                                    controller: addOrnamentRecordingsController
                                        .exchangedAtShopNameController,
                                    // textInputAction: TextInputAction.next,
                                    // keyboardType: TextInputType.number,
                                    validator: (value) => FieldValidator()
                                        .validateGrossWeight(value!),
                                    decoration: InputDecoration(
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                              horizontal: 16, vertical: 5),
                                      labelText: "Reason".toUpperCase(),
                                      labelStyle: TextStyle(
                                        color: AppColors.blackColor,
                                        fontSize: 10.sp,
                                        fontWeight: FontWeight.w400,
                                      ),
                                      hintText: 'reason',
                                      hintStyle: TextStyle(
                                        color: AppColors.greyColor,
                                        fontSize: 10.sp,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  )
                                : const SizedBox(),

                        addOrnamentRecordingsController
                                    .selectedActivityTypeName ==
                                null
                            ? const SizedBox()
                            : addOrnamentRecordingsController
                                        .selectedActivityTypeName!.id ==
                                    6
                                ? TextFormField(
                                    controller: addOrnamentRecordingsController
                                        .exchangedAtShopNameController,
                                    // textInputAction: TextInputAction.next,
                                    // keyboardType: TextInputType.number,
                                    validator: (value) => FieldValidator()
                                        .validateGrossWeight(value!),
                                    decoration: InputDecoration(
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                              horizontal: 16, vertical: 5),
                                      labelText:
                                          "received from (name)".toUpperCase(),
                                      labelStyle: TextStyle(
                                        color: AppColors.blackColor,
                                        fontSize: 10.sp,
                                        fontWeight: FontWeight.w400,
                                      ),
                                      hintText: 'name',
                                      hintStyle: TextStyle(
                                        color: AppColors.greyColor,
                                        fontSize: 10.sp,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  )
                                : const SizedBox(),
                        addOrnamentRecordingsController
                                    .selectedActivityTypeName ==
                                null
                            ? const SizedBox()
                            : addOrnamentRecordingsController
                                        .selectedActivityTypeName!.id ==
                                    5
                                ? TextFormField(
                                    controller: addOrnamentRecordingsController
                                        .exchangedAtShopNameController,
                                    // textInputAction: TextInputAction.next,
                                    // keyboardType: TextInputType.number,
                                    validator: (value) => FieldValidator()
                                        .validateGrossWeight(value!),
                                    decoration: InputDecoration(
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                              horizontal: 16, vertical: 5),
                                      labelText:
                                          "balance wt. (recd.)".toUpperCase(),
                                      labelStyle: TextStyle(
                                        color: AppColors.blackColor,
                                        fontSize: 10.sp,
                                        fontWeight: FontWeight.w400,
                                      ),
                                      hintText: 'weight',
                                      hintStyle: TextStyle(
                                        color: AppColors.greyColor,
                                        fontSize: 10.sp,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  )
                                : const SizedBox(),
                        addOrnamentRecordingsController
                                    .selectedActivityTypeName ==
                                null
                            ? const SizedBox()
                            : addOrnamentRecordingsController
                                        .selectedActivityTypeName!.id ==
                                    3
                                ? TextFormField(
                                    controller: addOrnamentRecordingsController
                                        .exchangedAtShopNameController,
                                    // textInputAction: TextInputAction.next,
                                    // keyboardType: TextInputType.number,
                                    validator: (value) => FieldValidator()
                                        .validateGrossWeight(value!),
                                    decoration: InputDecoration(
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                              horizontal: 16, vertical: 5),
                                      labelText: "Reason for giving/lending"
                                          .toUpperCase(),
                                      labelStyle: TextStyle(
                                        color: AppColors.blackColor,
                                        fontSize: 10.sp,
                                        fontWeight: FontWeight.w400,
                                      ),
                                      hintText: 'reason',
                                      hintStyle: TextStyle(
                                        color: AppColors.greyColor,
                                        fontSize: 10.sp,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  )
                                : const SizedBox(),

                        addOrnamentRecordingsController
                                    .selectedActivityTypeName ==
                                null
                            ? const SizedBox()
                            : addOrnamentRecordingsController
                                            .selectedActivityTypeName!.id ==
                                        3 ||
                                    addOrnamentRecordingsController
                                            .selectedActivityTypeName!.id ==
                                        7
                                ? const SizedBox()
                                : TextFormField(
                                    controller: addOrnamentRecordingsController
                                        .relevantDocumentkeptController,
                                    // textInputAction: TextInputAction.next,
                                    // keyboardType: TextInputType.number,
                                    validator: (value) => FieldValidator()
                                        .validateGrossWeight(value!),
                                    decoration: InputDecoration(
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                              horizontal: 16, vertical: 5),
                                      labelText: "Relevant document's kept at"
                                          .toUpperCase(),
                                      labelStyle: TextStyle(
                                        color: AppColors.blackColor,
                                        fontSize: 10.sp,
                                        fontWeight: FontWeight.w400,
                                      ),
                                      hintText:
                                          'Document Type (Invoice/Recpt/Challan) & Kept at',
                                      hintStyle: TextStyle(
                                        color: AppColors.greyColor,
                                        fontSize: 10.sp,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                        // SizedBox(height: 1.h),
                        addOrnamentRecordingsController
                                    .selectedActivityTypeName ==
                                null
                            ? const SizedBox()
                            : addOrnamentRecordingsController
                                        .selectedActivityTypeName!.id ==
                                    4
                                ? TextFormField(
                                    controller: addOrnamentRecordingsController
                                        .amountController,
                                    textInputAction: TextInputAction.next,
                                    keyboardType: TextInputType.number,
                                    validator: (value) => FieldValidator()
                                        .validateGrossWeight(value!),
                                    decoration: InputDecoration(
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                              horizontal: 16, vertical: 5),
                                      labelText: "applied rate of interest (%)"
                                          .toUpperCase(),
                                      labelStyle: TextStyle(
                                        color: AppColors.blackColor,
                                        fontSize: 10.sp,
                                        fontWeight: FontWeight.w400,
                                      ),
                                      hintText:
                                          'Document Type (Invoice/Recpt/Challan) & Kept at',
                                      hintStyle: TextStyle(
                                        color: AppColors.greyColor,
                                        fontSize: 10.sp,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  )
                                : const SizedBox(),
                        addOrnamentRecordingsController
                                    .selectedActivityTypeName ==
                                null
                            ? const SizedBox()
                            : addOrnamentRecordingsController
                                            .selectedActivityTypeName!.id ==
                                        3 ||
                                    addOrnamentRecordingsController
                                            .selectedActivityTypeName!.id ==
                                        6 ||
                                    addOrnamentRecordingsController
                                            .selectedActivityTypeName!.id ==
                                        7 ||
                                    addOrnamentRecordingsController
                                            .selectedActivityTypeName!.id ==
                                        8
                                ? const SizedBox()
                                : TextFormField(
                                    controller: addOrnamentRecordingsController
                                        .amountController,
                                    textInputAction: TextInputAction.next,
                                    keyboardType: TextInputType.number,
                                    validator: (value) => FieldValidator()
                                        .validateGrossWeight(value!),
                                    decoration: InputDecoration(
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                              horizontal: 16, vertical: 5),
                                      labelText: "amount".toUpperCase(),
                                      labelStyle: TextStyle(
                                        color: AppColors.blackColor,
                                        fontSize: 10.sp,
                                        fontWeight: FontWeight.w400,
                                      ),
                                      hintText:
                                          'Document Type (Invoice/Recpt/Challan) & Kept at',
                                      hintStyle: TextStyle(
                                        color: AppColors.greyColor,
                                        fontSize: 10.sp,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),

                        // SizedBox(height: 1.h),
                        addOrnamentRecordingsController
                                    .selectedActivityTypeName ==
                                null
                            ? const SizedBox()
                            : TextFormField(
                                controller: addOrnamentRecordingsController
                                    .notesController,
                                // textInputAction: TextInputAction.next,
                                // keyboardType: TextInputType.number,
                                validator: (value) => FieldValidator()
                                    .validateGrossWeight(value!),
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 16, vertical: 5),
                                  labelText: "NOTES (IF ANY)",
                                  labelStyle: TextStyle(
                                    color: AppColors.blackColor,
                                    fontSize: 10.sp,
                                    fontWeight: FontWeight.w400,
                                  ),
                                  hintText:
                                      'Detailed remarks/comments/description/story',
                                  hintStyle: TextStyle(
                                    color: AppColors.greyColor,
                                    fontSize: 10.sp,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                        SizedBox(height: 4.h),
                      ],
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        primary: AppColors.blackTextColor,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(24),
                          ),
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 3.w),
                        child: Text(
                          "cancel".toUpperCase(),
                        ),
                      ),
                    ),
                    SizedBox(width: 5.w),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        primary: AppColors.accentColor,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(24),
                          ),
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 3.w),
                        child: Text(
                          "save detail".toUpperCase(),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
    );
  }
}
