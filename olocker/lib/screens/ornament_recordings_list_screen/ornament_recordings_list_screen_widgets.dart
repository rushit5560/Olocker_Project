import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:olocker/constants/app_colors.dart';
import 'package:olocker/constants/app_images.dart';
import 'package:olocker/controllers/ornament_recordings_list_screen_controller.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';
import '../add_ornament_recordings_screen/add_ornament_recordings_screen.dart';

class OrnamentDetailsModule extends StatelessWidget {
  OrnamentDetailsModule({Key? key}) : super(key: key);

  final ornamentRecordingsController =
      Get.find<OrnamentRecordingsListScreenController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 15),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: const BorderRadius.all(
          Radius.circular(8),
        ),
        border: Border.all(
          color: AppColors.greyColor,
          width: 0.8,
        ),
        boxShadow: const [
          BoxShadow(
            color: AppColors.greyDarkColor,
            spreadRadius: 1,
            blurRadius: 5,
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                "Ornament Details",
                style: TextStyle(
                  fontFamily: "Roboto",
                  color: AppColors.darkBlue,
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Expanded(
                child: Text(
                  ornamentRecordingsController.coiNumber.toString(),
                  style: TextStyle(
                    // fontFamily: "Roboto",
                    fontFamily: "",
                    color: AppColors.greyColor,
                    fontSize: 13.sp,
                  ),
                ),
              ),
              // const SizedBox(width: 20),
              Text(
                ornamentRecordingsController.trackingDetail[0].itemName,
                style: TextStyle(
                  // fontFamily: "Roboto",
                  fontFamily: "",
                  color: AppColors.greyColor,
                  fontSize: 13.sp,
                ),
              ),
              const SizedBox(width: 20),
              Text(
                ornamentRecordingsController.trackingDetail[0].grossWt,
                style: TextStyle(
                  fontFamily: "Roboto",
                  color: AppColors.greyColor,
                  fontSize: 11.sp,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class AddRecordingButton extends StatelessWidget {
  AddRecordingButton({Key? key}) : super(key: key);

  final ornamentRecordingsController =
      Get.find<OrnamentRecordingsListScreenController>();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 38,
        width: ornamentRecordingsController.size.width * 0.8,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: AppColors.accentColor,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(24),
              ),
            ),
          ),
          onPressed: () {
            Get.to(
              () => AddOrnamentRecordingsScreen(),
              arguments: [
                ornamentRecordingsController.customerOraSrNo,
              ],
            );
          },
          child: Text(
            "ADD RECORDINGS",
            style: TextStyle(
              fontSize: 14.sp,
              fontFamily: "Roboto",
              color: AppColors.whiteColor,
            ),
          ),
        ),
      ),
    );
  }
}

class OrnamentRecordingDetailsList extends StatelessWidget {
  OrnamentRecordingDetailsList({Key? key}) : super(key: key);

  final ornamentRecordingsController =
      Get.find<OrnamentRecordingsListScreenController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          alignment: Alignment.centerLeft,
          children: [
            Image.asset(
              AppImages.recordingsTitleBgImage,
              width: ornamentRecordingsController.size.width * 0.8,
              height: 38,
              fit: BoxFit.fill,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Text(
                "Ornament Recording Details",
                style: TextStyle(
                  color: AppColors.whiteColor,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 15),
        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount:
              ornamentRecordingsController.ornamentHistoryDetailList.length,
          itemBuilder: (context, index) {
            return OrnamentRecordingDetailItem(
              index: index,
            );
          },
          separatorBuilder: (context, index) {
            return const Divider(
              color: AppColors.greyColor,
              thickness: 0.8,
              height: 5,
            );
          },
        ),
      ],
    );
  }
}

class OrnamentRecordingDetailItem extends StatelessWidget {
  OrnamentRecordingDetailItem({
    Key? key,
    required this.index,
  }) : super(key: key);

  final int index;

  final ornamentRecordingsController =
      Get.find<OrnamentRecordingsListScreenController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DetailsRowWidget(
          textTitle: "Activity",
          textValue: ornamentRecordingsController
              .ornamentHistoryDetailList[index].activity,
        ),
        DetailsRowWidget(
          textTitle: "Date",
          textValue: ornamentRecordingsController
              .ornamentHistoryDetailList[index].date,
        ),
        DetailsRowWidget(
          textTitle: "Details",
          textValue: ornamentRecordingsController
              .ornamentHistoryDetailList[index].details,
        ),
        DetailsRowWidget(
          textTitle: "Note",
          textValue: ornamentRecordingsController
              .ornamentHistoryDetailList[index].notes,
        ),
        DetailsRowWidget(
          textTitle: "Ornament Location",
          textValue: ornamentRecordingsController
              .ornamentHistoryDetailList[index].ornamentLocation,
        ),
      ],
    );
  }
}

class DetailsRowWidget extends StatelessWidget {
  const DetailsRowWidget(
      {Key? key, required this.textTitle, required this.textValue})
      : super(key: key);

  final String textTitle;
  final String textValue;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 3,
            child: Text(
              textTitle,
              maxLines: 2,
              style: TextStyle(
                color: AppColors.greyDarkColor,
                fontSize: 11.sp,
                fontFamily: "Roboto",
                fontWeight: FontWeight.w500,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
          const Text(
            ": ",
            style: TextStyle(
              color: AppColors.greyDarkColor,
              fontFamily: "Roboto",
            ),
          ),
          Expanded(
            flex: 7,
            child: Text(
              textValue,
              maxLines: 5,
              style: TextStyle(
                color: AppColors.greyDarkColor,
                fontSize: 11.sp,
                fontFamily: "Roboto",
                fontWeight: FontWeight.w400,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class OrnamentRecordingsListLoadingWidget extends StatelessWidget {
  const OrnamentRecordingsListLoadingWidget({Key? key}) : super(key: key);

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
                height: 14.h,
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 40,
                    width: 60.w,
                    decoration: const BoxDecoration(
                      color: AppColors.greyColor,
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                    ),
                  ),
                ],
              ),
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.only(top: 15, bottom: 15),
                itemCount: 2,
                itemBuilder: (context, index) {
                  return Container(
                    height: 24.h,
                    width: double.infinity,
                    margin: const EdgeInsets.symmetric(horizontal: 12),
                    padding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 12),
                    decoration: const BoxDecoration(
                      color: AppColors.greyColor,
                      borderRadius: BorderRadius.all(
                        Radius.circular(12),
                      ),
                    ),
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
