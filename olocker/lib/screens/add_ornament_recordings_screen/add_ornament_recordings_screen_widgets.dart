import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:olocker/constants/app_colors.dart';
import 'package:olocker/utils/field_validation.dart';
import 'package:olocker/widgets/common_widgets.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';
import '../../controllers/add_ornament_recordings_screen_controller.dart';

class AddRecordingDetailsFormModule extends StatefulWidget {
  const AddRecordingDetailsFormModule({Key? key}) : super(key: key);

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
          ? AddRecordingsLoadingWidget()
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
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 5),
                            labelText: "SELECT ACTIVITY",
                            labelStyle: TextStyle(
                              color: AppColors.blackColor,
                              fontSize: 10.sp,
                              fontWeight: FontWeight.w400,
                              fontFamily: "Roboto",
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
                                  activityValue.textValue!,
                                  style: TextStyle(
                                    fontFamily: "Roboto",
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
                              addOrnamentRecordingsController.isActivitySelected = true;
                            });
                          },
                        ),
                        SizedBox(height: 1.h),
                        DropdownButtonFormField<FormDDValue>(
                          isExpanded: true,
                          value: addOrnamentRecordingsController
                              .selectedlocationOfJewellery,
                          validator: (value) => FieldValidator()
                              .validateCurrentLocation(value.toString()),
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 5),
                            labelText: "CURRENT LOCATION OF JEWELLERY",
                            labelStyle: TextStyle(
                              fontFamily: "Roboto",
                              color: AppColors.blackColor,
                              fontSize: 10.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          style: TextStyle(
                            fontFamily: "Roboto",
                            color: AppColors.blackColor,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                          ),
                          items: addOrnamentRecordingsController
                              .locationOfJewelleryTypeList
                              .map((FormDDValue value) {
                            return DropdownMenuItem<FormDDValue>(
                              value: value,
                              child: Text(value.textValue!),
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
                                ? TextFormField(
                                    controller: addOrnamentRecordingsController
                                        .otherLocationOfJewelleryController,
                                    textInputAction: TextInputAction.next,
                                    keyboardType: TextInputType.text,
                                    validator: (value) => FieldValidator()
                                        .validateOtherLocation(value!),
                                    decoration: InputDecoration(
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                              horizontal: 16, vertical: 5),
                                      labelText: "Other location of jewellery"
                                          .toUpperCase(),
                                      labelStyle: TextStyle(
                                        fontFamily: "Roboto",
                                        color: AppColors.blackColor,
                                        fontSize: 10.sp,
                                        fontWeight: FontWeight.w400,
                                      ),
                                      hintText: 'Other location of jewellery',
                                      hintStyle: TextStyle(
                                        fontFamily: "Roboto",
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
                          validator: (value) =>
                              FieldValidator().validateActivityDate(value!),
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 5),
                            labelText: 'SELECT ACTIVITY DATE',
                            labelStyle: TextStyle(
                              fontFamily: "Roboto",
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
                                    8
                                ? const SizedBox()
                                : TextFormField(
                                    controller: addOrnamentRecordingsController
                                        .changeAtNameController,
                                    // textInputAction: TextInputAction.next,
                                    // keyboardType: TextInputType.number,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Please Enter ${addOrnamentRecordingsController.selectedActivityTypeName!.id == 1 ? "Exchanged At (Shopkeeper's name)" : addOrnamentRecordingsController.selectedActivityTypeName!.id == 2 ? "Gifted To (Person's Name)" : addOrnamentRecordingsController.selectedActivityTypeName!.id == 3 ? "Given To (Person's Name)" : addOrnamentRecordingsController.selectedActivityTypeName!.id == 4 ? "Given To (broker's Name)" : addOrnamentRecordingsController.selectedActivityTypeName!.id == 5 ? "Given At (Shopkeeper's name)" : addOrnamentRecordingsController.selectedActivityTypeName!.id == 6 ? "received from (name)" : addOrnamentRecordingsController.selectedActivityTypeName!.id == 7 ? "Given To (Person's Name)" : ""}';
                                      }
                                      return null;
                                    },
                                    decoration: InputDecoration(
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                              horizontal: 16, vertical: 5),
                                      labelText: addOrnamentRecordingsController
                                                  .selectedActivityTypeName!
                                                  .id ==
                                              1
                                          ? "Exchanged At (Shopkeeper's name)"
                                              .toUpperCase()
                                          : addOrnamentRecordingsController
                                                      .selectedActivityTypeName!
                                                      .id ==
                                                  2
                                              ? "Gifted To (Person's Name)"
                                                  .toUpperCase()
                                              : addOrnamentRecordingsController
                                                          .selectedActivityTypeName!
                                                          .id ==
                                                      3
                                                  ? "Given To (Person's Name)"
                                                      .toUpperCase()
                                                  : addOrnamentRecordingsController
                                                              .selectedActivityTypeName!
                                                              .id ==
                                                          4
                                                      ? "Given To (broker's Name)"
                                                          .toUpperCase()
                                                      : addOrnamentRecordingsController
                                                                  .selectedActivityTypeName!
                                                                  .id ==
                                                              5
                                                          ? "Given At (Shopkeeper's name)"
                                                              .toUpperCase()
                                                          : addOrnamentRecordingsController
                                                                      .selectedActivityTypeName!
                                                                      .id ==
                                                                  6
                                                              ? "received from (name)"
                                                                  .toUpperCase()
                                                              : addOrnamentRecordingsController
                                                                          .selectedActivityTypeName!
                                                                          .id ==
                                                                      7
                                                                  ? "Given To (Person's Name)"
                                                                      .toUpperCase()
                                                                  : "",
                                      labelStyle: TextStyle(
                                        fontFamily: "Roboto",
                                        color: AppColors.blackColor,
                                        fontSize: 10.sp,
                                        fontWeight: FontWeight.w400,
                                      ),
                                      hintText: 'name',
                                      hintStyle: TextStyle(
                                        fontFamily: "Roboto",
                                        color: AppColors.greyColor,
                                        fontSize: 10.sp,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                        addOrnamentRecordingsController
                                    .selectedActivityTypeName ==
                                null
                            ? const SizedBox()
                            : addOrnamentRecordingsController
                                        .selectedActivityTypeName!.id ==
                                    8
                                ? const SizedBox()
                                : TextFormField(
                                    controller: addOrnamentRecordingsController
                                        .reasonForController,
                                    // textInputAction: TextInputAction.next,
                                    // keyboardType: TextInputType.number,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Please enter ${addOrnamentRecordingsController.selectedActivityTypeName!.id == 1 ? "Reason for an Exchange" : addOrnamentRecordingsController.selectedActivityTypeName!.id == 2 ? "reason for gifting" : addOrnamentRecordingsController.selectedActivityTypeName!.id == 3 ? "Reason for giving/lending" : addOrnamentRecordingsController.selectedActivityTypeName!.id == 4 ? "reason" : addOrnamentRecordingsController.selectedActivityTypeName!.id == 5 ? "reason" : addOrnamentRecordingsController.selectedActivityTypeName!.id == 6 ? "received after" : addOrnamentRecordingsController.selectedActivityTypeName!.id == 7 ? "repair note" : ""}';
                                      }
                                      return null;
                                    },
                                    decoration: InputDecoration(
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                              horizontal: 16, vertical: 5),
                                      labelText: addOrnamentRecordingsController
                                                  .selectedActivityTypeName!
                                                  .id ==
                                              1
                                          ? "Reason for an Exchange"
                                              .toUpperCase()
                                          : addOrnamentRecordingsController
                                                      .selectedActivityTypeName!
                                                      .id ==
                                                  2
                                              ? "reason for gifting"
                                                  .toUpperCase()
                                              : addOrnamentRecordingsController
                                                          .selectedActivityTypeName!
                                                          .id ==
                                                      3
                                                  ? "Reason for giving/lending"
                                                      .toUpperCase()
                                                  : addOrnamentRecordingsController
                                                              .selectedActivityTypeName!
                                                              .id ==
                                                          4
                                                      ? "reason".toUpperCase()
                                                      : addOrnamentRecordingsController
                                                                  .selectedActivityTypeName!
                                                                  .id ==
                                                              5
                                                          ? "reason"
                                                              .toUpperCase()
                                                          : addOrnamentRecordingsController
                                                                      .selectedActivityTypeName!
                                                                      .id ==
                                                                  6
                                                              ? "received after"
                                                                  .toUpperCase()
                                                              : addOrnamentRecordingsController
                                                                          .selectedActivityTypeName!
                                                                          .id ==
                                                                      7
                                                                  ? "repair note"
                                                                      .toUpperCase()
                                                                  : "",
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
                                  ),

                        addOrnamentRecordingsController
                                    .selectedActivityTypeName ==
                                null
                            ? const SizedBox()
                            : addOrnamentRecordingsController
                                            .selectedActivityTypeName!.id ==
                                        5 ||
                                    addOrnamentRecordingsController
                                            .selectedActivityTypeName!.id ==
                                        6 ||
                                    addOrnamentRecordingsController
                                            .selectedActivityTypeName!.id ==
                                        7
                                ? TextFormField(
                                    controller: addOrnamentRecordingsController
                                        .ornamentWeightController,
                                    // textInputAction: TextInputAction.next,
                                    // keyboardType: TextInputType.number,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Please enter ${addOrnamentRecordingsController.selectedActivityTypeName!.id == 5 ? "balance wt. (recd.)" : addOrnamentRecordingsController.selectedActivityTypeName!.id == 6 ? "ornament weight" : addOrnamentRecordingsController.selectedActivityTypeName!.id == 7 ? "ornament weight" : ""}';
                                      }
                                      return null;
                                    },
                                    decoration: InputDecoration(
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                              horizontal: 16, vertical: 5),
                                      labelText: addOrnamentRecordingsController
                                                  .selectedActivityTypeName!
                                                  .id ==
                                              5
                                          ? "balance wt. (recd.)".toUpperCase()
                                          : addOrnamentRecordingsController
                                                      .selectedActivityTypeName!
                                                      .id ==
                                                  6
                                              ? "ornament weight".toUpperCase()
                                              : addOrnamentRecordingsController
                                                          .selectedActivityTypeName!
                                                          .id ==
                                                      7
                                                  ? "ornament weight"
                                                      .toUpperCase()
                                                  : "",
                                      labelStyle: TextStyle(
                                        color: AppColors.blackColor,
                                        fontSize: 10.sp,
                                        fontWeight: FontWeight.w400,
                                      ),
                                      hintText: 'Weight',
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
                                        8
                                ? const SizedBox()
                                : TextFormField(
                                    controller: addOrnamentRecordingsController
                                        .relevantDocumentkeptController,
                                    textInputAction: TextInputAction.next,
                                    // keyboardType: TextInputType.number,
                                    validator: (value) => FieldValidator()
                                        .validateRelevantDocument(value!),
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

                        addOrnamentRecordingsController
                                    .selectedActivityTypeName ==
                                null
                            ? const SizedBox()
                            : addOrnamentRecordingsController
                                        .selectedActivityTypeName!.id ==
                                    4
                                ? TextFormField(
                                    controller: addOrnamentRecordingsController
                                        .rateOfInterestController,
                                    textInputAction: TextInputAction.next,
                                    keyboardType: TextInputType.number,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Please enter applied rate of interest (%)';
                                      }
                                      return null;
                                    },
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
                                      hintText: '0',
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
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Please enter amount';
                                      }
                                      return null;
                                    },
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
                                      hintText: '0',
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
                                validator: (value) =>
                                    FieldValidator().validateNotes(value!),
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
                      onPressed: () {
                        Get.back();
                      },
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
                      onPressed: () async {
                        if (addOrnamentRecordingsController.selectedlocationOfJewellery == null) {
                          CommonWidgets().showBorderSnackBar(
                              context: context,
                              displayText: "Please select location of jewellery type");
                        } else {
                          // if (addOrnamentRecordingsController.ornamentRecordingFormKey.currentState!.validate()) {
                            await addOrnamentRecordingsController.addOrnamentRecordingsFunction();
                          // }
                        }
                        /*if (addOrnamentRecordingsController.selectedActivityTypeName == null) {
                          CommonWidgets().showBorderSnackBar(
                            context: context,
                            displayText: "Please select activity type",
                          );
                        } else {
                          if (addOrnamentRecordingsController.selectedlocationOfJewellery == null) {
                            CommonWidgets().showBorderSnackBar(
                                context: context,
                                displayText: "Please select location of jewellery type");
                          } else {
                            addOrnamentRecordingsController
                                .addOrnamentRecordingsFunction();
                          }
                        }*/
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.accentColor,
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

class AddRecordingsLoadingWidget extends StatelessWidget {
  const AddRecordingsLoadingWidget({Key? key}) : super(key: key);

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
              const SizedBox(height: 10),
              Container(
                height: 50.h,
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
