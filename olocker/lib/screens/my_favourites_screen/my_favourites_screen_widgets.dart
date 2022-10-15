import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:olocker/constants/api_url.dart';
import 'package:olocker/constants/app_colors.dart';
import 'package:sizer/sizer.dart';

import '../../controllers/my_favourites_controller.dart';

class FavouritesListModule extends StatelessWidget {
  FavouritesListModule({Key? key}) : super(key: key);

  final favouritesController = Get.find<MyFavouritesScreenController>();

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      itemCount: favouritesController.favouriteProductsList.length,
      itemBuilder: (context, index) {
        return FavouriteListItem(
          index: index,
        );
      },
      separatorBuilder: (context, index) {
        return SizedBox(height: 2.h);
      },
    );
  }
}

class FavouriteListItem extends StatelessWidget {
  FavouriteListItem({
    Key? key,
    required this.index,
  }) : super(key: key);

  int index;
  final favouritesController = Get.find<MyFavouritesScreenController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      decoration: const BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.all(
          Radius.circular(12),
        ),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                width: favouritesController.size.width * 0.83,
                decoration: const BoxDecoration(
                  color: AppColors.whiteColor,
                  borderRadius: BorderRadius.all(
                    Radius.circular(12),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.greyTextColor,
                      blurRadius: 5,
                      spreadRadius: 1,
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    SizedBox(
                      width: favouritesController.size.width * 0.12,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 10),
                        Text(
                          favouritesController.favouriteProductsList[index]
                              .productDetails.itemTypeName,
                          style: TextStyle(
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w400,
                            color: AppColors.blackTextColor,
                          ),
                        ),
                        SizedBox(height: 0.3.h),
                        Text(
                          "SKU Code: ${favouritesController.favouriteProductsList[index].productDetails.productSku}",
                          style: TextStyle(
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w500,
                            color: AppColors.blackTextColor,
                          ),
                        ),
                        SizedBox(height: 0.3.h),
                        Text(
                          favouritesController.favouriteProductsList[index]
                              .productDetails.price,
                          style: TextStyle(
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w500,
                            color: AppColors.blackTextColor,
                          ),
                        ),
                        SizedBox(height: 0.3.h),
                        Text(
                          favouritesController.favouriteProductsList[index]
                              .productDetails.partnerName,
                          style: TextStyle(
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w500,
                            color: AppColors.blackTextColor,
                          ),
                        ),
                        const SizedBox(height: 10),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              height: favouritesController.size.height * 0.08,
              width: favouritesController.size.height * 0.08,
              margin: const EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 8,
              ),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.whiteColor,
                boxShadow: [
                  BoxShadow(
                    color: AppColors.greyTextColor,
                    blurRadius: 5,
                    spreadRadius: 1,
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: const BorderRadius.all(
                  Radius.circular(60),
                ),
                child: Image.network(
                  "${ApiUrl.apiImagePath} ${favouritesController.favouriteProductsList[index].productDetails.productImageList[0].imageLocation}",
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Center(
                      child: Text(
                        "No Image",
                        style: TextStyle(
                          fontSize: 8.sp,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () {},
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: Icon(
                      Icons.delete,
                      color: AppColors.greyColor,
                    ),
                  ),
                ),
                SizedBox(height: favouritesController.size.height * 0.02),
                Container(
                  height: favouritesController.size.height * 0.04,
                  width: favouritesController.size.width * 0.22,
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: const BoxDecoration(
                    color: AppColors.accentColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.remove_red_eye_outlined,
                        color: AppColors.whiteColor,
                        size: 15.sp,
                      ),
                      SizedBox(width: 1.5.w),
                      Text(
                        "View",
                        style: TextStyle(
                          color: AppColors.whiteColor,
                          fontSize: 11.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),

      // Text(
      //   favouritesController
      //       .favouriteProductsList[index].productDetails.itemTypeName,
      // ),
    );
  }
}
