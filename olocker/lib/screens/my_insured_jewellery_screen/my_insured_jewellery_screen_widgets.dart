import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../constants/api_url.dart';
import '../../constants/app_colors.dart';
import '../../constants/app_images.dart';
import '../../controllers/my_insured_jewellery_screen_controller.dart';
import '../ornament_recordings_list_screen/ornament_recordings_list_screen.dart';

class InsuredJewelleryListModule extends StatelessWidget {
  InsuredJewelleryListModule({Key? key}) : super(key: key);

  final insuredJewelleryController =
      Get.find<MyInsuredJewelleryScreenController>();

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: insuredJewelleryController.getInsuredOrnamentList.length,
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
  final insuredJewelleryController =
      Get.find<MyInsuredJewelleryScreenController>();

  @override
  Widget build(BuildContext context) {
    // var imageUrl = insuredJewelleryController.getInsuredOrnamentList[index].url
    //     .substring(
    //         2, insuredJewelleryController.getInsuredOrnamentList[index].url.length);
    // final imagepath = "${ApiUrl.apiImagePath}$imageUrl";

    // log("imag path :: $imagepath");
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 3),
      child: Stack(
        alignment: Alignment.centerRight,
        children: [
          Container(
            width: insuredJewelleryController.size.width * 0.82,
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
                    left: insuredJewelleryController.size.width * 0.12,
                    right: insuredJewelleryController.size.width * 0.12,
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
                                fontSize: 10.sp,
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Text(
                            ":",
                            style: TextStyle(
                              fontSize: 10.sp,
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Text(
                              insuredJewelleryController
                                  .getInsuredOrnamentList[index].itemName,
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
                                fontSize: 10.sp,
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Text(
                            ":",
                            style: TextStyle(
                              fontSize: 10.sp,
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Text(
                              insuredJewelleryController
                                  .getInsuredOrnamentList[index].purchaseDate
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
                                fontSize: 10.sp,
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Text(
                            ":",
                            style: TextStyle(
                              fontSize: 10.sp,
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Text(
                              insuredJewelleryController
                                  .getInsuredOrnamentList[index].grossWt,
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
                              Get.to(() => OrnamentRecordingsListScreen());
                            },
                            child: Text(
                              "TRACKING",
                              style: TextStyle(
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
                              insuredJewelleryController
                                  .showImagePickerBottomSheet(
                                context: context,
                                index: index,
                              );
                            },
                            child: Text(
                              "ADD IMAGE",
                              style: TextStyle(
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
              height: insuredJewelleryController.size.width * 0.2,
              width: insuredJewelleryController.size.width * 0.2,
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
                        insuredJewelleryController
                            .getInsuredOrnamentList[index].url
                            .toString()
                            .replaceFirst("~", ""),
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Center(
                        child: Text(
                          "no image ",
                          textAlign: TextAlign.center,
                          style: TextStyle(
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
                // Get.to(
                //   () => EditUnInsuredJewelleryScreen(),
                //   arguments: [
                //     insuredJewelleryController
                //         .getInsuredOrnamentList[index].srNo
                //         .toString(),
                //   ],
                // );
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
