import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:olocker/constants/app_colors.dart';
import 'package:olocker/controllers/jeweller_jewellery_list_screen_controller.dart';
import 'package:olocker/utils/extensions.dart';


class JewelleryGridviewModule extends StatelessWidget {
  JewelleryGridviewModule({Key? key}) : super(key: key);
  final screenController = Get.find<JewellerJewelleryListScreenController>();

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: /*screenController.jewelleryList.length*/2,
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
        childAspectRatio: 0.85,
      ),
      itemBuilder: (context, i) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: AppColors.whiteColor,
          ),
          child: Container(),
        );
      },
    ).commonAllSidePadding(10);
  }
}
