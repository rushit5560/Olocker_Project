import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:olocker/constants/app_colors.dart';
import 'package:olocker/models/portfolio_screen_models/get_all_data_ornament_model.dart';
import 'package:olocker/utils/field_validation.dart';
import 'package:sizer/sizer.dart';

import '../../controllers/add_uninsured_jewellery_screen_controller.dart';

class ProductDetailsFormModule extends StatelessWidget {
  ProductDetailsFormModule({Key? key}) : super(key: key);
  final unInsuredJewelController =
      Get.find<AddUnInsuredJewelleryScreenController>();

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
          Stack(
            alignment: Alignment.center,
            children: [
              Image.asset(
                "assets/images/bg_h.png",
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
            onChanged: (_) {},
          ),
          SizedBox(height: 1.h),
          TextFormField(
            controller: unInsuredJewelController.ornamentGrossWeightController,
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.number,
            validator: (value) => FieldValidator().validateGrossWeight(value!),
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
            keyboardType: TextInputType.number,
            validator: (value) => FieldValidator().validateGrossWeight(value!),
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
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
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
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
              color: AppColors.whiteColor,
              child: Text(
                unInsuredJewelController.selectedOrnamentPurchaseDate.value,
                style: TextStyle(
                  color: AppColors.greyColor,
                  fontSize: 10.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
          SizedBox(height: 1.h),
          TextFormField(
            controller:
                unInsuredJewelController.ornamentPurchasedPriceController,
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.number,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (value) => FieldValidator().validateGrossWeight(value!),
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
        ],
      ),
    );
  }
}

class MetalDetailsFormModule extends StatelessWidget {
  MetalDetailsFormModule({Key? key}) : super(key: key);
  final unInsuredJewelController =
      Get.find<AddUnInsuredJewelleryScreenController>();

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
          Stack(
            alignment: Alignment.center,
            children: [
              Image.asset(
                "assets/images/bg_h.png",
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
            // value: "SELECT PRODUCT NAME",
            decoration: InputDecoration(
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
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
            onChanged: (_) {},
          ),
          SizedBox(height: 1.h),
          DropdownButtonFormField<SingleItemDetail>(
            isExpanded: true,
            // value: "SELECT PRODUCT NAME",
            decoration: InputDecoration(
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
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
            onChanged: (_) {},
          ),
          SizedBox(height: 1.h),
          TextFormField(
            controller: unInsuredJewelController.metalWeightController,
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.number,
            validator: (value) => FieldValidator().validateGrossWeight(value!),
            decoration: InputDecoration(
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
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
              onPressed: () {},
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
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 1.h),
        ],
      ),
    );
  }
}

class StoneDetailsFormModule extends StatelessWidget {
  StoneDetailsFormModule({Key? key}) : super(key: key);
  final unInsuredJewelController =
      Get.find<AddUnInsuredJewelleryScreenController>();

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
          Stack(
            alignment: Alignment.center,
            children: [
              Image.asset(
                "assets/images/bg_h.png",
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
            // value: "SELECT PRODUCT NAME",
            decoration: InputDecoration(
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
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
            onChanged: (_) {},
          ),
          SizedBox(height: 1.h),
          TextFormField(
            controller: unInsuredJewelController.ornamentGrossWeightController,
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.number,
            validator: (value) => FieldValidator().validateGrossWeight(value!),
            decoration: InputDecoration(
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
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
            // value: "SELECT PRODUCT NAME",
            decoration: InputDecoration(
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
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
            onChanged: (_) {},
          ),
          SizedBox(height: 2.h),
          SizedBox(
            height: 35,
            width: unInsuredJewelController.size.width * 0.4,
            child: ElevatedButton(
              onPressed: () {},
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
        ],
      ),
    );
  }
}

class DecorativeItemDetailsFormModule extends StatelessWidget {
  DecorativeItemDetailsFormModule({Key? key}) : super(key: key);
  final unInsuredJewelController =
      Get.find<AddUnInsuredJewelleryScreenController>();

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
          Stack(
            alignment: Alignment.center,
            children: [
              Image.asset(
                "assets/images/bg_h.png",
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
            // value: "SELECT PRODUCT NAME",
            decoration: InputDecoration(
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
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
            onChanged: (_) {},
          ),
          SizedBox(height: 1.h),
          TextFormField(
            controller: unInsuredJewelController.ornamentGrossWeightController,
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.number,
            validator: (value) => FieldValidator().validateGrossWeight(value!),
            decoration: InputDecoration(
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
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
            // value: "SELECT PRODUCT NAME",
            decoration: InputDecoration(
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
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
            onChanged: (_) {},
          ),
          SizedBox(height: 3.h),
          Container(
            height: 35,
            width: unInsuredJewelController.size.width * 0.65,
            child: ElevatedButton(
              onPressed: () {},
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
        ],
      ),
    );
  }
}

class UploadImageFileFormModule extends StatelessWidget {
  UploadImageFileFormModule({Key? key}) : super(key: key);
  final unInsuredJewelController =
      Get.find<AddUnInsuredJewelleryScreenController>();

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
              Container(
                height: unInsuredJewelController.size.height * 0.15,
                width: unInsuredJewelController.size.width * 0.4,
                child: Image.asset("assets/images/select-image.png"),
              ),
              SizedBox(width: 1.w),
              ElevatedButton(
                onPressed: () {},
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
                  padding: EdgeInsets.symmetric(horizontal: 12),
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
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(28),
                    ),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12),
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
