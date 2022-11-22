import 'package:flutter/material.dart';
import 'package:olocker/constants/app_colors.dart';
import 'package:olocker/constants/app_images.dart';
import 'package:olocker/utils/extensions.dart';
import 'package:sizer/sizer.dart';

class SencoConfirmationImageModule extends StatelessWidget {
  const SencoConfirmationImageModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Colors.white),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: SizedBox(
              child: Image.asset(AppSvgs.diamondsIocn),
            ),
          ),
          SizedBox(
            width: 1.h,
          ),
          Expanded(
            flex: 7,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Senco Gold",
                  style: TextStyle(fontSize: 13.sp, color: AppColors.redColor),
                ),
                Text(
                  "Senco Gold dfd gsd ghd h",
                  style: TextStyle(
                    fontSize: 13.sp,
                  ),
                ),
              ],
            ),
          )
        ],
      ).commonAllSidePadding(20),
    );
  }
}

class AmountContainerCustom extends StatelessWidget {
  const AmountContainerCustom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColors.whiteColor),
              child: Column(
                children: [
                  Text('Thank You jbb ujb uihuh uhuih uihuih fgeg ewgergb weg ',
                      style: TextStyle(
                          fontSize: 13.sp, color: AppColors.blackColor)),
                  SizedBox(height: 3.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(" Monthly Amount",
                            style: TextStyle(
                                fontSize: 14.sp,
                                color: AppColors.blueDarkColor,
                                fontWeight: FontWeight.bold)),
                      ),
                      Expanded(
                        child: Text(" Monthly Amount",
                            style: TextStyle(
                                fontSize: 14.sp,
                                color: AppColors.blueDarkColor,
                                fontWeight: FontWeight.bold)),
                      ),
                    ],
                  ),
                  SizedBox(height: 11.sp),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            Text("₹ 2200",
                                style: TextStyle(
                                    fontSize: 20.sp,
                                    color: AppColors.redColor)),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            Text(" 12",
                                style: TextStyle(
                                    fontSize: 20.sp,
                                    color: AppColors.redColor)),
                            SizedBox(height: 11.sp),
                            Text("Month",
                                style: TextStyle(
                                    fontSize: 11.sp, color: AppColors.redColor))
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ).commonSymmetricPadding(horizontal: 20, vertical: 10),
            ),
            SizedBox(height: 0.2.h),
            Container(
              width: double.infinity,
              decoration: const BoxDecoration(color: AppColors.whiteColor),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Text(" Monthly Amount",
                              style: TextStyle(
                                  fontSize: 14.sp,
                                  color: AppColors.blueDarkColor,
                                  fontWeight: FontWeight.bold)),
                          SizedBox(
                            height: 11.sp,
                          ),
                          Text("₹ 2200",
                              style: TextStyle(
                                  fontSize: 20.sp, color: AppColors.redColor))
                        ],
                      ),
                      Column(
                        children: [
                          Text(" Monthly Amount",
                              style: TextStyle(
                                  fontSize: 14.sp,
                                  color: AppColors.blueDarkColor,
                                  fontWeight: FontWeight.bold)),
                          SizedBox(
                            height: 11.sp,
                          ),
                          Text("₹ 2200",
                              style: TextStyle(
                                  fontSize: 20.sp, color: AppColors.redColor))
                        ],
                      )
                    ],
                  )
                ],
              ).commonSymmetricPadding(horizontal: 20, vertical: 10),
            ),
          ],
        ),
      ),
    );
  }
}

class BottomButtonModule extends StatelessWidget {
  const BottomButtonModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool _isChecked = true;

    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 25,
              width: 25,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(color: AppColors.blackColor, width: 2)),
              child: Checkbox(
                  activeColor: AppColors.lightBrownBgColor,
                  checkColor: AppColors.blackColor,
                  value: _isChecked,
                  onChanged: (value) {
                    _isChecked = value!;
                  }),
            ),
            SizedBox(width: 2.w),
            Expanded(
              flex: 9,
              child: Text(
                "Thank You jbb ujb uihuh uhuih uihuih fgeg ewgergb weg  Thank You jbb ujb uihuh uhuih uihuih fgeg ewgergb weg  Thank You jbb ujb uihuh uhuih uihuih fgeg ewgergb weg ",
                overflow: TextOverflow.clip,
                maxLines: 3,
                style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
            )
          ],
        ),
        SizedBox(height: 3.h),
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10), color: Colors.redAccent),
          child: Center(
            child: Text(
              "PROCEED TO PAY",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16.sp,
                  color: AppColors.whiteColor),
            ).commonSymmetricPadding(vertical: 15),
          ),
        )
      ],
    );
  }
}
