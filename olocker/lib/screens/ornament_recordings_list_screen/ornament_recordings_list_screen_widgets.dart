import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:olocker/constants/app_colors.dart';
import 'package:olocker/constants/app_images.dart';
import 'package:olocker/controllers/ornament_recordings_list_screen_controller.dart';
import 'package:sizer/sizer.dart';

import '../../widgets/common_buttons.dart';
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
                  color: AppColors.blackColor,
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                ornamentRecordingsController.trackingDetail!.itemName,
                style: TextStyle(
                  color: AppColors.greyColor,
                  fontSize: 11.sp,
                ),
              ),
              const SizedBox(width: 20),
              Text(
                ornamentRecordingsController.trackingDetail!.grossWt,
                style: TextStyle(
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
            Get.to(() => AddOrnamentRecordingsScreen());
          },
          child: Text(
            "ADD RECORDINGS",
            style: TextStyle(
              color: AppColors.whiteColor,
              fontSize: 12.sp,
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
                fontWeight: FontWeight.w500,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
          const Text(
            ": ",
            style: TextStyle(
              color: AppColors.greyDarkColor,
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
