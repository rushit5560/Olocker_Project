import 'package:flutter/material.dart';
import 'package:olocker/constants/app_colors.dart';
import 'package:olocker/utils/extensions.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';

class FavouritesDealsListLoadingWidget extends StatelessWidget {
  const FavouritesDealsListLoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Shimmer.fromColors(
        baseColor: Colors.grey.shade300,
        highlightColor: Colors.grey.shade100,
        child: GridView.builder(
          shrinkWrap: true,
          itemCount: 6,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 18,
            crossAxisSpacing: 18,
          ),
          itemBuilder: (context, i) {
            return Container(
              height: 16.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppColors.greyColor,
              ),
            );
          },
        ).commonAllSidePadding(10),
      ),
    );
  }
}
