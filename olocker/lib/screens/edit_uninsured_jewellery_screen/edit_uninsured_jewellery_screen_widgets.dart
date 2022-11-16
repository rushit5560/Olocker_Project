import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:olocker/constants/app_colors.dart';
import 'package:olocker/constants/app_images.dart';
import 'package:olocker/controllers/edit_uninsured_jewellery_screen_controller.dart';
import 'package:olocker/models/portfolio_screen_models/get_all_data_ornament_model.dart';
import 'package:olocker/utils/field_validation.dart';
import 'package:olocker/widgets/common_loader.dart';
import 'package:sizer/sizer.dart';

import '../../controllers/add_uninsured_jewellery_screen_controller.dart';

class ProductDetailsFormModule extends StatelessWidget {
  ProductDetailsFormModule({Key? key}) : super(key: key);
  final unInsuredJewelController =
      Get.find<EditUnInsuredJewelleryScreenController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Form(
        key: unInsuredJewelController.productFormKey,
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
          decoration: const BoxDecoration(
            color: AppColors.whiteColor,
            borderRadius: BorderRadius.all(
              Radius.circular(12),
            ),
          ),
          child: Column(
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  Image.asset(
                    AppImages.addOrnamentTitleBGImage,
                    width: double.infinity,
                    height: 35,
                    fit: BoxFit.fill,
                  ),
                  Center(
                    child: Text(
                      "Product Details (Ornament)",
                      style: TextStyle(
                        color: AppColors.blackColor,
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 2.h),
              DropdownButtonFormField<SingleItemDetail>(
                isExpanded: true,
                // value: "SELECT PRODUCT NAME",
                value: unInsuredJewelController.selectedOrnamentName,
                validator: (value) =>
                    FieldValidator().validateProductName(value.toString()),
                decoration: InputDecoration(
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
                  labelText: "SELECT PRODUCT NAME",
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
                items: unInsuredJewelController.ornamentTypeNameList
                    .map((SingleItemDetail prodName) {
                  return DropdownMenuItem<SingleItemDetail>(
                    value: prodName,
                    child: Text(prodName.value),
                  );
                }).toList(),
                onChanged: (val) {
                  unInsuredJewelController.selectedOrnamentName = val;
                },
              ),
              SizedBox(height: 1.h),
              TextFormField(
                controller:
                    unInsuredJewelController.ornamentGrossWeightController,
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.number,
                validator: (value) =>
                    FieldValidator().validateGrossWeight(value!),
                decoration: InputDecoration(
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
                  labelText: 'GROSS WEIGHT',
                  labelStyle: TextStyle(
                    color: AppColors.blackColor,
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              SizedBox(height: 1.h),
              TextFormField(
                controller:
                    unInsuredJewelController.ornamentPurchasedFromController,
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.text,
                validator: (value) =>
                    FieldValidator().validatePurchasedFrom(value!),
                decoration: InputDecoration(
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
                  labelText: 'PURCHASED FROM (SHOP/STORE NAME)',
                  labelStyle: TextStyle(
                    color: AppColors.blackColor,
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              SizedBox(height: 1.h),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "PURCHASED DATE",
                      style: TextStyle(
                        color: AppColors.blackColor,
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  unInsuredJewelController.showDatePicker(context);
                },
                child: Container(
                  height: 45,
                  width: double.infinity,
                  alignment: Alignment.centerLeft,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
                  color: AppColors.whiteColor,
                  child: Text(
                    unInsuredJewelController.selectedOrnamentPurchaseDate.value,
                    style: TextStyle(
                      color: AppColors.greyDarkColor,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
              Divider(
                color: AppColors.blackColor.withOpacity(0.4),
                height: 1,
                thickness: 1,
              ),
              unInsuredJewelController.isValidate.value
                  ? unInsuredJewelController
                              .selectedOrnamentPurchaseDate.value ==
                          "Select Purchased Date"
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 5),
                              child: Text(
                                "Enter Purchased Date",
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.red.shade600,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ],
                        )
                      : const SizedBox()
                  : const SizedBox(),
              SizedBox(height: 1.h),
              TextFormField(
                controller:
                    unInsuredJewelController.ornamentPurchasedPriceController,
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.number,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) =>
                    FieldValidator().validatePurchasedPrice(value!),
                decoration: InputDecoration(
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
                  labelText: 'PURCHASED PRICE (INR)',
                  labelStyle: TextStyle(
                    color: AppColors.blackColor,
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              SizedBox(height: 1.h),
            ],
          ),
        ),
      ),
    );
  }
}

class MetalDetailsFormModule extends StatelessWidget {
  MetalDetailsFormModule({Key? key}) : super(key: key);
  final unInsuredJewelController =
      Get.find<EditUnInsuredJewelleryScreenController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => unInsuredJewelController.isLoading.value
          ? CommonLoader().showCircularLoader()
          : Form(
              key: unInsuredJewelController.metalFormKey,
              child: Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                decoration: const BoxDecoration(
                  color: AppColors.whiteColor,
                  borderRadius: BorderRadius.all(
                    Radius.circular(12),
                  ),
                ),
                child: Column(
                  children: [
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        Image.asset(
                          AppImages.addOrnamentTitleBGImage,
                          width: double.infinity,
                          height: 35,
                          fit: BoxFit.fill,
                        ),
                        Center(
                          child: Text(
                            "Metal Details",
                            style: TextStyle(
                              color: AppColors.blackColor,
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 2.h),
                    DropdownButtonFormField<SingleItemDetail>(
                      isExpanded: true,
                      value: unInsuredJewelController.selectedMetalName,
                      validator: (value) =>
                          FieldValidator().validateMetalType(value.toString()),
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 5),
                        labelText: "SELECT METAL TYPE",
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
                      items: unInsuredJewelController.metalTypesList
                          .map((SingleItemDetail metalType) {
                        return DropdownMenuItem<SingleItemDetail>(
                          value: metalType,
                          child: Text(metalType.value),
                        );
                      }).toList(),
                      onChanged: (val) {
                        unInsuredJewelController.selectedMetalName = val;
                      },
                    ),
                    SizedBox(height: 1.h),
                    DropdownButtonFormField<SingleItemDetail>(
                      isExpanded: true,
                      value: unInsuredJewelController.selectedMetalPurity,
                      validator: (value) =>
                          FieldValidator().validateMetalPurity(value!.value),
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 5),
                        labelText: "SELECT PURITY",
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
                      items: unInsuredJewelController.metalPurityList
                          .map((SingleItemDetail purityValue) {
                        return DropdownMenuItem<SingleItemDetail>(
                          value: purityValue,
                          child: Text(purityValue.value),
                        );
                      }).toList(),
                      onChanged: (val) {
                        unInsuredJewelController.selectedMetalPurity = val;
                      },
                    ),
                    SizedBox(height: 1.h),
                    TextFormField(
                      controller:
                          unInsuredJewelController.metalWeightController,
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.number,
                      validator: (value) =>
                          FieldValidator().validateUnitOfWeight(value!),
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 5),
                        labelText: 'METAL WEIGHT',
                        labelStyle: TextStyle(
                          color: AppColors.blackColor,
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    SizedBox(height: 2.h),
                    SizedBox(
                      height: 35,
                      width: unInsuredJewelController.size.width * 0.4,
                      child: ElevatedButton(
                        onPressed: () {
                          unInsuredJewelController.addMetalToMetalsList();
                        },
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(28),
                            ),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            "ADD METAL",
                            style: TextStyle(
                              color: AppColors.whiteColor,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 1.h),
                    unInsuredJewelController.metalDataMapList.isNotEmpty
                        ? Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 6, vertical: 5),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: AppColors.greyTextColor,
                                width: 0.8,
                              ),
                            ),
                            child: ListView.separated(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: unInsuredJewelController
                                  .metalDataMapList.length,
                              itemBuilder: (context, index) {
                                return Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        unInsuredJewelController
                                                .metalDataMapList[index]
                                            ["metaltype"],
                                        textAlign: TextAlign.center,
                                        style: TextStyle(fontSize: 10.sp),
                                      ),
                                    ),
                                    Expanded(
                                      child: Text(
                                        unInsuredJewelController
                                            .metalDataMapList[index]["purity"],
                                        style: TextStyle(fontSize: 10.sp),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    Expanded(
                                      child: Text(
                                        unInsuredJewelController
                                                .metalDataMapList[index]
                                            ["netmetalweight"],
                                        textAlign: TextAlign.center,
                                        style: TextStyle(fontSize: 10.sp),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        unInsuredJewelController
                                            .isLoading(true);
                                        unInsuredJewelController
                                            .metalDataMapList
                                            .removeAt(index);
                                        unInsuredJewelController
                                            .isLoading(false);
                                      },
                                      child: const Icon(
                                        Icons.cancel,
                                        color: AppColors.redColor,
                                        size: 25,
                                      ),
                                    ),
                                  ],
                                );
                              },
                              separatorBuilder: (context, index) {
                                return SizedBox(height: 8);
                              },
                            ),
                          )
                        : const SizedBox(),
                    // SizedBox(height: 1.h),
                  ],
                ),
              ),
            ),
    );
  }
}

class StoneDetailsFormModule extends StatelessWidget {
  StoneDetailsFormModule({Key? key}) : super(key: key);
  final unInsuredJewelController =
      Get.find<EditUnInsuredJewelleryScreenController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => unInsuredJewelController.isLoading.value
          ? CommonLoader().showCircularLoader()
          : Container(
              margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
              decoration: const BoxDecoration(
                color: AppColors.whiteColor,
                borderRadius: BorderRadius.all(
                  Radius.circular(12),
                ),
              ),
              child: Form(
                key: unInsuredJewelController.stoneFormKey,
                child: Column(
                  children: [
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        Image.asset(
                          AppImages.addOrnamentTitleBGImage,
                          width: double.infinity,
                          height: 35,
                          fit: BoxFit.fill,
                        ),
                        Center(
                          child: Text(
                            "Stone Details",
                            style: TextStyle(
                              color: AppColors.blackColor,
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 2.h),
                    DropdownButtonFormField<SingleItemDetail>(
                      isExpanded: true,
                      value: unInsuredJewelController.selectedStoneName,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 5),
                        labelText: "SELECT STONE NAME",
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
                      items: unInsuredJewelController.stoneDetailsList
                          .map((SingleItemDetail stoneName) {
                        return DropdownMenuItem<SingleItemDetail>(
                          value: stoneName,
                          child: Text(stoneName.value),
                        );
                      }).toList(),
                      onChanged: (val) {
                        unInsuredJewelController.selectedStoneName = val;
                      },
                    ),
                    SizedBox(height: 1.h),
                    TextFormField(
                      controller:
                          unInsuredJewelController.stoneWeightController,
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.number,
                      validator: (value) =>
                          FieldValidator().validateGrossWeight(value!),
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 5),
                        labelText: 'STONE WT',
                        labelStyle: TextStyle(
                          color: AppColors.blackColor,
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    SizedBox(height: 1.h),
                    DropdownButtonFormField<String>(
                      isExpanded: true,
                      value: unInsuredJewelController
                          .selectedStoneUnitOfWeight.value,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 5),
                        labelText: "SELECT UNIT OF WT",
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
                      items: unInsuredJewelController.stoneWeightUnitList
                          .map((String weight) {
                        return DropdownMenuItem<String>(
                          value: weight,
                          child: Text(weight),
                        );
                      }).toList(),
                      onChanged: (val) {
                        unInsuredJewelController
                            .selectedStoneUnitOfWeight.value = val!;
                      },
                    ),
                    SizedBox(height: 2.h),
                    SizedBox(
                      height: 35,
                      width: unInsuredJewelController.size.width * 0.4,
                      child: ElevatedButton(
                        onPressed: () {
                          unInsuredJewelController.addStoneToStonesList();
                        },
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(28),
                            ),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            "ADD STONE",
                            style: TextStyle(
                              color: AppColors.whiteColor,
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 1.h),
                    unInsuredJewelController.stoneDataMapList.isNotEmpty
                        ? Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 6, vertical: 5),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: AppColors.greyTextColor,
                                width: 0.8,
                              ),
                            ),
                            child: ListView.separated(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: unInsuredJewelController
                                  .stoneDataMapList.length,
                              itemBuilder: (context, index) {
                                return Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        unInsuredJewelController
                                            .stoneDataMapList[index]["name"],
                                        textAlign: TextAlign.center,
                                        style: TextStyle(fontSize: 10.sp),
                                      ),
                                    ),
                                    Expanded(
                                      child: Text(
                                        unInsuredJewelController
                                            .stoneDataMapList[index]["wt"],
                                        style: TextStyle(fontSize: 10.sp),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    Expanded(
                                      child: Text(
                                        unInsuredJewelController
                                                .stoneDataMapList[index]
                                            ["unitofwt"],
                                        textAlign: TextAlign.center,
                                        style: TextStyle(fontSize: 10.sp),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        unInsuredJewelController
                                            .isLoading(true);
                                        unInsuredJewelController
                                            .stoneDataMapList
                                            .removeAt(index);
                                        unInsuredJewelController
                                            .isLoading(false);
                                      },
                                      child: const Icon(
                                        Icons.cancel,
                                        color: AppColors.redColor,
                                        size: 25,
                                      ),
                                    ),
                                  ],
                                );
                              },
                              separatorBuilder: (context, index) {
                                return SizedBox(height: 8);
                              },
                            ),
                          )
                        : const SizedBox(),
                  ],
                ),
              ),
            ),
    );
  }
}

class DecorativeItemDetailsFormModule extends StatelessWidget {
  DecorativeItemDetailsFormModule({Key? key}) : super(key: key);
  final unInsuredJewelController =
      Get.find<EditUnInsuredJewelleryScreenController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => unInsuredJewelController.isLoading.value
          ? CommonLoader().showCircularLoader()
          : Container(
              margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
              decoration: const BoxDecoration(
                color: AppColors.whiteColor,
                borderRadius: BorderRadius.all(
                  Radius.circular(12),
                ),
              ),
              child: Form(
                key: unInsuredJewelController.decoItemFormKey,
                child: Column(
                  children: [
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        Image.asset(
                          AppImages.addOrnamentTitleBGImage,
                          width: double.infinity,
                          height: 35,
                          fit: BoxFit.fill,
                        ),
                        Center(
                          child: Text(
                            "Decorative Item Details",
                            style: TextStyle(
                              color: AppColors.blackColor,
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 2.h),
                    DropdownButtonFormField<SingleItemDetail>(
                      isExpanded: true,
                      value: unInsuredJewelController.selectedDecoItemName,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 5),
                        labelText: "SELECT DECORATIVE ITEM NAME",
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
                      items: unInsuredJewelController.decoItemsDetailsList
                          .map((SingleItemDetail decoItem) {
                        return DropdownMenuItem<SingleItemDetail>(
                          value: decoItem,
                          child: Text(decoItem.value),
                        );
                      }).toList(),
                      onChanged: (val) {
                        unInsuredJewelController.selectedDecoItemName = val;
                      },
                    ),
                    SizedBox(height: 1.h),
                    TextFormField(
                      controller:
                          unInsuredJewelController.decoItemWeightController,
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.number,
                      validator: (value) =>
                          FieldValidator().validateGrossWeight(value!),
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 5),
                        labelText: 'DECORATIVE ITEM WT',
                        labelStyle: TextStyle(
                          color: AppColors.blackColor,
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    SizedBox(height: 1.h),
                    DropdownButtonFormField<String>(
                      isExpanded: true,
                      value: unInsuredJewelController
                          .selectedDecoItemUnitOfWeight.value,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 5),
                        labelText: "SELECT UNIT OF WT.",
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
                      items: unInsuredJewelController.decoItemsWeightUnitList
                          .map((String weight) {
                        return DropdownMenuItem<String>(
                          value: weight,
                          child: Text(weight),
                        );
                      }).toList(),
                      onChanged: (val) {
                        unInsuredJewelController
                            .selectedDecoItemUnitOfWeight.value = val!;
                      },
                    ),
                    SizedBox(height: 3.h),
                    SizedBox(
                      height: 35,
                      width: unInsuredJewelController.size.width * 0.65,
                      child: ElevatedButton(
                        onPressed: () {
                          unInsuredJewelController.addItemToDecoItemsList();
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
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Center(
                            child: Text(
                              "ADD DECORATIVE ITEM",
                              style: TextStyle(
                                color: AppColors.whiteColor,
                                fontSize: 13.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 1.h),
                    unInsuredJewelController.decoItemsDataMapList.isNotEmpty
                        ? Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 6, vertical: 5),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: AppColors.greyTextColor,
                                width: 0.8,
                              ),
                            ),
                            child: ListView.separated(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: unInsuredJewelController
                                  .decoItemsDataMapList.length,
                              itemBuilder: (context, index) {
                                return Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        unInsuredJewelController
                                                .decoItemsDataMapList[index]
                                            ["name"],
                                        textAlign: TextAlign.center,
                                        style: TextStyle(fontSize: 10.sp),
                                      ),
                                    ),
                                    Expanded(
                                      child: Text(
                                        unInsuredJewelController
                                            .decoItemsDataMapList[index]["wt"],
                                        style: TextStyle(fontSize: 10.sp),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    Expanded(
                                      child: Text(
                                        unInsuredJewelController
                                                .decoItemsDataMapList[index]
                                            ["unitofwt"],
                                        textAlign: TextAlign.center,
                                        style: TextStyle(fontSize: 10.sp),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        unInsuredJewelController
                                            .isLoading(true);
                                        unInsuredJewelController
                                            .decoItemsDataMapList
                                            .removeAt(index);
                                        log("decoItems map list is :: ${unInsuredJewelController.decoItemsDataMapList.toString()}");
                                        unInsuredJewelController
                                            .isLoading(false);
                                      },
                                      child: const Icon(
                                        Icons.cancel,
                                        color: AppColors.redColor,
                                        size: 25,
                                      ),
                                    ),
                                  ],
                                );
                              },
                              separatorBuilder: (context, index) {
                                return SizedBox(height: 8);
                              },
                            ),
                          )
                        : const SizedBox()
                  ],
                ),
              ),
            ),
    );
  }
}

class UploadImageFileFormModule extends StatelessWidget {
  UploadImageFileFormModule({Key? key}) : super(key: key);
  final unInsuredJewelController =
      Get.find<EditUnInsuredJewelleryScreenController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      decoration: const BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.all(
          Radius.circular(12),
        ),
      ),
      child: Column(
        children: [
          SizedBox(height: 3.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                height: unInsuredJewelController.size.height * 0.15,
                width: unInsuredJewelController.size.width * 0.4,
                child: unInsuredJewelController.apiJewelleryImageFile == null
                    ? unInsuredJewelController.jewellerySelectedImageFile ==
                            null
                        ? Image.asset(
                            "assets/images/select-image.png",
                            fit: BoxFit.cover,
                          )
                        : Image.file(
                            unInsuredJewelController
                                .jewellerySelectedImageFile!,
                            fit: BoxFit.cover,
                          )
                    : Image.network(
                        unInsuredJewelController.apiJewelleryImageFile!.path,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            color: AppColors.greyTextColor.withOpacity(0.5),
                            child: const Center(
                              child: Text("Image Not Loaded"),
                            ),
                          );
                        },
                      ),
              ),
              SizedBox(width: 1.w),
              ElevatedButton(
                onPressed: () {
                  unInsuredJewelController.showImagePickerBottomSheet(
                      context: context);
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
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Center(
                    child: Text(
                      "Upload File",
                      style: TextStyle(
                        color: AppColors.whiteColor,
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 3.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {},
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
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Center(
                    child: Text(
                      "CANCEL",
                      style: TextStyle(
                        color: AppColors.whiteColor,
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  unInsuredJewelController.isValidate.value = true;
                  unInsuredJewelController.submitFullForm();
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
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Center(
                    child: Text(
                      "SUBMIT",
                      style: TextStyle(
                        color: AppColors.whiteColor,
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          // SizedBox(height: 1.h),
        ],
      ),
    );
  }
}
