import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:olocker/constants/api_url.dart';
import 'package:olocker/constants/app_colors.dart';
import 'package:olocker/controllers/jeweller_jewellery_list_screen_controller.dart';
import 'package:olocker/models/jeweller_jewellery_list_screen_model/all_jewellery_model.dart';
import 'package:olocker/screens/jewellery_details_screen/jewellery_details_screen.dart';
import 'package:olocker/utils/extensions.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';

class JewelleryGridviewModule extends StatelessWidget {
  JewelleryGridviewModule({Key? key}) : super(key: key);
  final screenController = Get.find<JewellerJewelleryListScreenController>();

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: screenController.jewelleryList.length,
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
        childAspectRatio: 0.82,
      ),
      itemBuilder: (context, i) {
        SearchProductListDatum singleItem = screenController.jewelleryList[i];
        return _jewelleryListTile(singleItem, i);
      },
    ).commonAllSidePadding(10);
  }

  Widget _jewelleryListTile(SearchProductListDatum singleItem, int i) {
    String imgUrl = ApiUrl.apiImagePath + singleItem.productImage;
    return GestureDetector(
      onTap: () {
        Get.to(
          () => JewelleryDetailsScreen(),
          arguments: [
            screenController.jewellerId,
            singleItem.productSrNo,
            singleItem.productName,
            i,
          ],
        )!
            .then((value) {
          screenController.isLoading(true);
          screenController.isLoading(false);
        });
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColors.whiteColor,
        ),
        child: Column(
          children: [
            Expanded(
              flex: 60,
              child: Container(
                width: double.infinity,
                margin: const EdgeInsets.only(bottom: 8),
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(10),
                    topLeft: Radius.circular(10),
                  ),
                  child: CachedNetworkImage(
                    imageUrl: imgUrl,
                    fit: BoxFit.cover,
                    errorWidget: (context, url, error) {
                      return Container(
                        color: AppColors.greyTextColor.withOpacity(0.25),
                        child: Center(
                          child: Text(
                            'No Image',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 12.sp,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 35,
              child: Column(
                children: [
                  // Price Show Module
                  Container(
                    width: Get.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColors.accentColor,
                    ),
                    child: singleItem.productsPrice == "PRICE ON REQUEST"
                        ? Text(
                            singleItem.productsPrice,
                            textAlign: TextAlign.center,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontFamily: "Roboto",
                              color: AppColors.whiteColor,
                              fontSize: 12.sp,
                            ),
                          ).commonSymmetricPadding(vertical: 5)
                        : Text(
                            NumberFormat.currency(
                              symbol: '₹ ',
                              locale: "HI",
                              decimalDigits: 0,
                            ).format(double.parse(singleItem.productsPrice == ""
                                ? "0"
                                : singleItem.productsPrice)),
                            textAlign: TextAlign.center,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontFamily: "Roboto",
                              color: AppColors.whiteColor,
                              fontSize: 12.sp,
                            ),
                          ).commonSymmetricPadding(vertical: 5),
                  ).commonSymmetricPadding(horizontal: 5),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () async {
                          singleItem.isFav == false
                              ? await screenController
                                  .addFavouriteProductFunction(
                                  productSrNo:
                                      singleItem.productSrNo.toString(),
                                  singleProduct: singleItem,
                                )
                              : await screenController
                                  .removeFavouriteProductListFunction(
                                  productSrNo:
                                      singleItem.productSrNo.toString(),
                                  singleProduct: singleItem,
                                );
                        },
                        icon: Icon(
                          singleItem.isFav == true
                              ? Icons.favorite_rounded
                              : Icons.favorite_outline_rounded,
                          color: AppColors.accentColor,
                          size: 18.sp,
                        ),
                      ),
                      IconButton(
                        onPressed: () async {
                          await screenController.shareJewelleryReferFriend();
                        },
                        icon: Icon(
                          Icons.share_rounded,
                          color: AppColors.accentColor,
                          size: 18.sp,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class JewelleryListScreenLoadingWidget extends StatelessWidget {
  JewelleryListScreenLoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Shimmer.fromColors(
        baseColor: Colors.grey.shade300,
        highlightColor: Colors.grey.shade100,
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 10),
              GridView.builder(
                itemCount: 8,
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                  childAspectRatio: 0.82,
                ),
                itemBuilder: (context, i) {
                  return Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColors.greyColor,
                    ),
                  );
                },
              ).commonAllSidePadding(10),
            ],
          ),
        ),
      ),
    );
  }
}
