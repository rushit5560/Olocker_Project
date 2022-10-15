import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:olocker/constants/app_colors.dart';
import 'package:olocker/controllers/online_deals_details_screen_controller.dart';
import 'package:olocker/utils/extensions.dart';

class ActivateDealButtonModule extends StatelessWidget {
  ActivateDealButtonModule({Key? key}) : super(key: key);
  final onlineDealsDetailsScreenController
  = Get.find<OnlineDealsDetailsScreenController>();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () async {
            await onlineDealsDetailsScreenController.addOnlineDealInFavouriteFunction();
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: AppColors.accentColor,
            ),
            child: const Text(
              'ACTIVATE DEAL',
              style: TextStyle(
                color: AppColors.whiteColor,

              ),
            ).commonSymmetricPadding(horizontal: 15, vertical: 12),
          ),
        ),
      ],
    );
  }
}
