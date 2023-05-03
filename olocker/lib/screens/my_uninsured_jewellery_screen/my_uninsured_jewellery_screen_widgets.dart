import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:olocker/constants/api_url.dart';
import 'package:olocker/constants/app_colors.dart';
import 'package:olocker/constants/app_images.dart';
import 'package:olocker/screens/edit_uninsured_jewellery_screen/edit_uninsured_jewellery_screen.dart';
import 'package:olocker/screens/ornament_recordings_list_screen/ornament_recordings_list_screen.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';
import '../../controllers/my_uninsured_jewellery_screen_controller.dart';

class UnInsuredJewelleryListModule extends StatelessWidget {
  UnInsuredJewelleryListModule({Key? key}) : super(key: key);

  final unInsuredJewelleryController =
      Get.find<MyUnInsuredJewelleryScreenController>();

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: unInsuredJewelleryController.getOrnamentList.length,
      itemBuilder: (context, index) {
        return JewelleryListItem(
          index: index,
        );
      },
      separatorBuilder: (context, index) {
        return const SizedBox(height: 8);
      },
    );
  }
}

class JewelleryListItem extends StatelessWidget {
  JewelleryListItem({Key? key, required this.index}) : super(key: key);

  final int index;

  final unInsuredJewelleryController =
      Get.find<MyUnInsuredJewelleryScreenController>();

  @override
  Widget build(BuildContext context) {
    // var imageUrl = unInsuredJewelleryController.getOrnamentList[index].url
    //     .substring(
    //         2, unInsuredJewelleryController.getOrnamentList[index].url.length);
    // final imagepath = "${ApiUrl.apiImagePath}$imageUrl";

    // log("imag path :: $imagepath");
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 3),
      child: Stack(
        alignment: Alignment.centerRight,
        children: [
          Container(
            width: unInsuredJewelleryController.size.width * 0.82,
            decoration: BoxDecoration(
              color: AppColors.whiteColor,
              border: Border.all(
                color: AppColors.whiteColor,
                width: 1,
              ),
              borderRadius: const BorderRadius.all(
                Radius.circular(8),
              ),
            ),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.only(
                    left: unInsuredJewelleryController.size.width * 0.12,
                    right: unInsuredJewelleryController.size.width * 0.12,
                    top: 10,
                    // bottom: 10,
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              "Item",
                              style: TextStyle(
                                fontFamily: "Roboto",
                                fontSize: 10.sp,
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Text(
                            ":",
                            style: TextStyle(
                              fontFamily: "Roboto",
                              fontSize: 10.sp,
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Text(
                              unInsuredJewelleryController
                                  .getOrnamentList[index].itemName,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 5),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              "Puchased Date",
                              style: TextStyle(
                                fontFamily: "Roboto",
                                fontSize: 10.sp,
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Text(
                            ":",
                            style: TextStyle(
                              fontFamily: "Roboto",
                              fontSize: 10.sp,
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Text(
                              unInsuredJewelleryController
                                  .getOrnamentList[index].purchaseDate
                                  .split(" ")[0],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 5),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              "Weight",
                              style: TextStyle(
                                fontFamily: "Roboto",
                                fontSize: 10.sp,
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Text(
                            ":",
                            style: TextStyle(
                              fontFamily: "Roboto",
                              fontSize: 10.sp,
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Text(
                              unInsuredJewelleryController
                                  .getOrnamentList[index].grossWt,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  height: 30,
                  decoration: const BoxDecoration(
                    color: AppColors.greenButtonColor,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(8),
                      bottomRight: Radius.circular(8),
                    ),
                  ),
                  child: IntrinsicHeight(
                    child: Row(
                      children: [
                        Expanded(
                          child: TextButton(
                            style: TextButton.styleFrom(
                              primary: AppColors.whiteColor,
                            ),
                            onPressed: () {
                              Get.to(
                                () => OrnamentRecordingsListScreen(),
                                arguments: [
                                  unInsuredJewelleryController
                                      .getOrnamentList[index].srNo,
                                  unInsuredJewelleryController
                                      .getOrnamentList[index].custOraSrNo,
                                  "",
                                ],
                              );
                            },
                            child: Text(
                              "TRACKING",
                              style: TextStyle(
                                fontFamily: "Roboto",
                                fontSize: 10.sp,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 25,
                          child: VerticalDivider(
                            color: AppColors.whiteColor,
                            thickness: 1.8,
                          ),
                        ),
                        Expanded(
                          child: TextButton(
                            style: TextButton.styleFrom(
                              primary: AppColors.whiteColor,
                            ),
                            onPressed: () {
                              unInsuredJewelleryController
                                  .showImagePickerBottomSheet(
                                context: context,
                                index: index,
                              );
                            },
                            child: Text(
                              "ADD IMAGE",
                              style: TextStyle(
                                fontFamily: "Roboto",
                                fontSize: 10.sp,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              height: unInsuredJewelleryController.size.width * 0.2,
              width: unInsuredJewelleryController.size.width * 0.2,
              decoration: const BoxDecoration(
                color: AppColors.whiteColor,
                shape: BoxShape.circle,
              ),
              child: Container(
                margin: const EdgeInsets.all(5),
                decoration: const BoxDecoration(
                  color: AppColors.accentBGColor,
                  shape: BoxShape.circle,
                ),
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(200),
                  ),
                  child: Image.network(
                    ApiUrl.apiImagePath +
                        unInsuredJewelleryController.getOrnamentList[index].url
                            .toString()
                            .replaceFirst("~", ""),
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Center(
                        child: Text(
                          "no image ",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: "Roboto",
                            color: AppColors.whiteColor,
                            fontSize: 10.sp,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 0,
            right: 0,
            child: IconButton(
              onPressed: () {
                Get.to(
                  () => EditUnInsuredJewelleryScreen(),
                  arguments: [
                    unInsuredJewelleryController.getOrnamentList[index].srNo
                        .toString(),
                  ],
                );
              },
              icon: SvgPicture.asset(
                AppSvgs.editSvgIcon,
                color: AppColors.accentColor,
                height: 22,
                width: 22,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MyUninsuredLoadingWidget extends StatelessWidget {
  const MyUninsuredLoadingWidget({Key? key}) : super(key: key);

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
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.only(top: 15, bottom: 15, right: 10),
                itemCount: 4,
                itemBuilder: (context, index) {
                  return Stack(
                    alignment: Alignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            width: 88.w,
                            height: 15.h,
                            decoration: const BoxDecoration(
                              color: AppColors.greyColor,
                              borderRadius: BorderRadius.all(
                                Radius.circular(12),
                              ),
                              // boxShadow: [
                              //   BoxShadow(
                              //     color: AppColors.greyTextColor,
                              //     blurRadius: 5,
                              //     spreadRadius: 1,
                              //   ),
                              // ],
                            ),
                          ),
                        ],
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          height: 8.h,
                          width: 8.h,
                          margin: const EdgeInsets.symmetric(
                            vertical: 10,
                            horizontal: 8,
                          ),
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.greyColor,
                          ),
                          child: ClipRRect(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(60),
                            ),
                            child: Container(color: AppColors.greyColor),
                          ),
                        ),
                      ),
                    ],
                  );
                },
                separatorBuilder: (context, index) {
                  return SizedBox(height: 2.h);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
