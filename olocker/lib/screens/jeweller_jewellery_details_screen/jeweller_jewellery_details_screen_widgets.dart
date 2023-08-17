import 'dart:developer';
import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:olocker/constants/api_url.dart';
import 'package:olocker/constants/app_colors.dart';
import 'package:olocker/controllers/jeweller_jewellery_details_screen_controller.dart';
import 'package:olocker/utils/extensions.dart';
import 'package:path_provider/path_provider.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:share_plus/share_plus.dart';
import 'package:sizer/sizer.dart';
import 'package:http/http.dart' as http;

class JewellerProductImagesSliderModule extends StatelessWidget {
  JewellerProductImagesSliderModule({Key? key}) : super(key: key);
  final jewelleryDetailsController =
      Get.find<JewellerJewelleryDetailsScreenController>();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 225,
      // width: double.infinity,
      child: Swiper.list(
        autoplay: false,
        loop: false,
        curve: Curves.fastOutSlowIn,
        scrollDirection: Axis.horizontal,
        fade: 0.45,

        viewportFraction: 0.6,
        // this is displaying images size
        scale: 0.35,
        // this is non displaying images size
        physics: const BouncingScrollPhysics(),
        indicatorLayout: PageIndicatorLayout.WARM,

        //image indicator
        pagination: const SwiperPagination(
          alignment: Alignment.bottomRight,
          builder: SwiperPagination.dots,
          margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        ),

        list: jewelleryDetailsController.productDetailsData.productImageList!,
        builder: (context, data, index) {
          // ignore: prefer_interpolation_to_compose_strings
          var singleImage = ApiUrl.apiImagePath +
              jewelleryDetailsController
                  .productDetailsData.productImageList![index].imageLocation
                  .replaceAll(r'\', "/");
          /* + "/" +
              jewelleryDetailsController
                  .productDetailsData.productImageList![index].imageName;
*/
          log("singleImage path si :: $singleImage");
          return GestureDetector(
            onTap: () {
              // show full screen image slider

              Get.to(
                () => ShowFullScreenImagesSliderModule(
                  initialPageViewIndex: index,
                ),
              );
              jewelleryDetailsController.isLoading(true);
              jewelleryDetailsController.fullScreenImageCurrentindex.value =
                  index;
              jewelleryDetailsController.isLoading(false);
            },
            // child: Container(
            //   height: 150,
            //   width: 150,
            //   decoration: BoxDecoration(
            //       border: Border.all(width: 3, color: AppColors.whiteColor),
            //       shape: BoxShape.circle,
            //       color: AppColors.whiteColor),
            //   child: ClipRRect(
            //     borderRadius: const BorderRadius.all(
            //       Radius.circular(200),
            //     ),
            //     child: CachedNetworkImage(
            //       imageUrl: singleImage,
            //       // imageUrl: ApiUrl.apiImagePath +
            //       //     jewelleryDetailsController.productDetailsData
            //       //         .productimages![index].imageLocation,
            //       fit: BoxFit.cover,
            //       errorWidget: (context, url, error) {
            //         return Container(
            //           color: AppColors.whiteColor,
            //           child: const Center(
            //             child: Text(
            //               "no image",
            //               style: TextStyle(fontFamily: "Acephimere"),
            //             ),
            //           ),
            //         );
            //       },
            //     ),
            //   ).commonAllSidePadding(5),
            // ),
            child: Container(
              height: 140,
              width: 140,
              decoration: BoxDecoration(
                // color: Colors.black,
                shape: BoxShape.circle,
                color: AppColors.whiteColor,
                border: Border.all(width: 5, color: AppColors.whiteColor),
                image: DecorationImage(
                  image: NetworkImage(singleImage),
                  fit: BoxFit.cover,
                  onError: (obj, st) {
                    Container(
                      color: AppColors.whiteColor,
                      child: const Center(
                        child: Text(
                          "no image",
                          style: TextStyle(fontFamily: "Acephimere"),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class ShowFullScreenImagesSliderModule extends StatelessWidget {
  ShowFullScreenImagesSliderModule(
      {Key? key, required this.initialPageViewIndex})
      : super(key: key);
  final jewelleryDetailsController =
      Get.find<JewellerJewelleryDetailsScreenController>();

  final int initialPageViewIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomRight,
        children: [
          PhotoViewGallery.builder(
            // scrollPhysics: const BouncingScrollPhysics(),
            gaplessPlayback: true,
            pageController: PageController(
              initialPage: initialPageViewIndex,
            ),
            onPageChanged: (ind) {
              jewelleryDetailsController.isLoading(true);
              jewelleryDetailsController.fullScreenImageCurrentindex.value =
                  ind;
              jewelleryDetailsController.isLoading(false);
            },
            builder: (BuildContext context, int index) {
              var singleImage =
                  "${ApiUrl.apiImagePath}${jewelleryDetailsController.productDetailsData.productImageList![index].imageLocation.replaceAll(r'\', "/")}/${jewelleryDetailsController.productDetailsData.productImageList![index].imageName}";
              return PhotoViewGalleryPageOptions(
                imageProvider: NetworkImage(
                  singleImage,
                  // scale: 1,
                ),
                errorBuilder: (context, error, stackTrace) {
                  return const Center(
                    child: Text(
                      "Image not loaded",
                      style: TextStyle(fontFamily: "Acephimere"),
                    ),
                  );
                },
                // initialScale: 0.32,
                minScale: 0.2,
                tightMode: true,
                basePosition: Alignment.center,
                filterQuality: FilterQuality.high,
              );
            },
            backgroundDecoration: const BoxDecoration(
              color: AppColors.whiteColor,
            ),
            itemCount: jewelleryDetailsController
                .productDetailsData.productImageList!.length,
            loadingBuilder: (context, event) => const Center(
              child: SizedBox(
                width: 20.0,
                height: 20.0,
                child: CircularProgressIndicator(),
              ),
            ),
            allowImplicitScrolling: false,

            scrollDirection: Axis.horizontal,

            // backgroundDecoration: widget.backgroundDecoration,
            // pageController: widget.pageController,
            // onPageChanged: onPageChanged,
          ),
          Obx(
            () => Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: jewelleryDetailsController
                    .productDetailsData.productImageList!
                    .map((url) {
                  int index = jewelleryDetailsController
                      .productDetailsData.productImageList!
                      .indexOf(url);
                  return Container(
                    width: jewelleryDetailsController
                                .fullScreenImageCurrentindex.value ==
                            index
                        ? 14
                        : 10,
                    height: jewelleryDetailsController
                                .fullScreenImageCurrentindex.value ==
                            index
                        ? 14
                        : 10,
                    margin: const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 2.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      // border: Border.all(
                      //     width: 2,
                      //     color: jewelleryDetailsController
                      //                 .fullScreenImageCurrentindex.value ==
                      //             index
                      //         ? AppColors.whiteColor
                      //         : Colors.transparent),
                      color: jewelleryDetailsController
                                  .fullScreenImageCurrentindex.value ==
                              index
                          ? AppColors.accentColor
                          : AppColors.greyTextColor,
                    ),
                  );
                }).toList(),
              ),
            ),
          ).commonOnlyPadding(right: 1.h),
        ],
      ),
    );
  }
}

class JewellerFavouriteButtonModule extends StatelessWidget {
  JewellerFavouriteButtonModule({Key? key}) : super(key: key);

  final jewelleryDetailsController =
      Get.find<JewellerJewelleryDetailsScreenController>();

  // Find Previous screen controller here for Product fav or unFav.
  // final jewellerJewelleryListScreenController = Get.find<JewellerJewelleryListScreenController>();

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 15,
      top: 10,
      child: GestureDetector(
        onTap: () async {
          jewelleryDetailsController.productDetailsData.isFav == true
              ? await jewelleryDetailsController
                  .removeFavouriteProductFunction()
              : await jewelleryDetailsController.addFavouriteProductFunction();
          log("jewelleryDetailsController.productDetailsData.isFav 111:  ${jewelleryDetailsController.productDetailsData.isFav}");
        },
        child: Container(
          decoration: const BoxDecoration(
            color: AppColors.whiteColor,
            shape: BoxShape.circle,
          ),
          padding: const EdgeInsets.all(8),
          child: Icon(
            jewelleryDetailsController.productDetailsData.isFav == true
                ? Icons.favorite_rounded
                : Icons.favorite_border,
            color: AppColors.accentColor,
            size: 24,
          ),
        ),
      ),
    );
  }
}

class JewellerShareButtonModule extends StatelessWidget {
  JewellerShareButtonModule({Key? key}) : super(key: key);

  final jewelleryDetailsController =
      Get.find<JewellerJewelleryDetailsScreenController>();

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 15,
      top: 10,
      child: GestureDetector(
        /* onTap: () async {
          log("share 22");
          String imgUrl = ApiUrl.apiImagePath +
              jewelleryDetailsController.productDetailsData.productImageList
                  .toString();

          final imagePath = Uri.parse(imgUrl);
          final res = await http.get(imagePath);
          final bytes = res.bodyBytes;
          final temp = await getTemporaryDirectory();
          final path = '${temp.path}/image.jpg';
          File(path).writeAsBytesSync(bytes);
          log("path : $path");
          String shareText =
              '''I loved this beautiful jewellery from ${jewelleryDetailsController.partnerDetails!.partnerName.capitalize!} on olocker app.
    You must download this app to witness their excellent jewellery collections, get fabulous deals &
    rewards too. Click here https://olocker.in/DetectOS.aspx and use my referral
    code ${jewelleryDetailsController.userReferaalCode.value}-${jewelleryDetailsController.partnerDetails!.partnerId} on ENTER CODE space on Sign up page https://www.olocker.in/''';

          log("shareText $shareText");
          try {
            log("shareTextshareTextshareText");
            await Share.shareFiles(
              [path],
              text: shareText,
            );
          } catch (e) {
            // Handle the exception or show an error message
            print('Error sharing image: $e');
          }
        },*/
        onTap: () async {
          String imgUrl =
              ApiUrl.apiImagePath + jewelleryDetailsController.productImage;
          final imagePath = Uri.parse(imgUrl);
          final res = await http.get(imagePath);
          final bytes = res.bodyBytes;
          final temp = await getTemporaryDirectory();
          final path = '${temp.path}/image.jpg';
          File(path).writeAsBytesSync(bytes);

          String shareText =
              '''I loved this beautiful jewellery from ${jewelleryDetailsController.partnerDetails!.partnerName.capitalize!} on olocker app. 
    You must download this app to witness their excellent jewellery collections, get fabulous deals & 
    rewards too. Click here https://olocker.in/DetectOS.aspx and use my referral 
    code ${jewelleryDetailsController.userReferaalCode.value}-${jewelleryDetailsController.partnerDetails!.partnerId} on ENTER CODE space on Sign up page https://www.olocker.in/''';
          try {
            await Share.shareFiles(
              text: shareText,
              [path],
            );
          } catch (e) {
            // Handle the exception or show an error message
            print('Error sharing image: $e');
          }

          // await jewelleryDetailsController.shareJewelleryReferFriend();
        },
        child: Container(
          decoration: const BoxDecoration(
            color: AppColors.whiteColor,
            shape: BoxShape.circle,
          ),
          padding: const EdgeInsets.all(8),
          child: const Icon(
            Icons.share_outlined,
            color: AppColors.accentColor,
            size: 24,
          ),
        ),
      ),
    );
  }
}

class JewellerJewelleryApproxPriceModule extends StatelessWidget {
  JewellerJewelleryApproxPriceModule({Key? key}) : super(key: key);
  final jewelleryDetailController =
      Get.find<JewellerJewelleryDetailsScreenController>();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        jewelleryDetailController.productDetailsData.price!.isEmpty
            ? const SizedBox()
            : Text(
                jewelleryDetailController.productDetailsData.price
                        .toString()
                        .contains("PRICE ON REQUEST")
                    ? "PRICE ON REQUEST"
                    : NumberFormat.currency(
                        symbol: '₹ ',
                        locale: "HI",
                        decimalDigits: 2,
                      ).format(double.parse(
                        jewelleryDetailController.productDetailsData.price!)),

                // "₹${jewelleryDetailController.productDetailsData.price.toString()}",
                style: TextStyle(
                  fontFamily: "Acephimere",
                  color: AppColors.whiteColor,
                  fontSize: 11.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
        const SizedBox(width: 5),
        jewelleryDetailController.productDetailsData.price.toString() ==
                "PRICE ON REQUEST"
            ? const SizedBox()
            : Text(
                "(Approximate Price)",
                style: TextStyle(
                  fontFamily: "Acephimere",
                  color: AppColors.whiteColor,
                  fontSize: 11.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
      ],
    ).commonAllSidePadding(10);
  }
}

class JewellerProductDescriptionModule extends StatelessWidget {
  JewellerProductDescriptionModule({Key? key}) : super(key: key);
  final jewelleryDetailController =
      Get.find<JewellerJewelleryDetailsScreenController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 12),
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      decoration: const BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.all(
          Radius.circular(8),
        ),
      ),
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            "product description".toUpperCase(),
            style: TextStyle(
              fontFamily: "Roboto",
              color: AppColors.darkBlack,
              fontSize: 11.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 5),
          ProductDescRow(
            textTitle: "Collection",
            textValue: jewelleryDetailController.jewelleryTypeName,
          ),
          ProductDescRow(
            textTitle: "Stock No",
            textValue: jewelleryDetailController.productDetailsData.productSku!,
          ),
          jewelleryDetailController.productDetailsData.metaldetails!.isEmpty
              ? const SizedBox()
              : ProductDescRow(
                  textTitle: "Metal",
                  textValue:
                      "${jewelleryDetailController.productDetailsData.metaldetails![0].metalType}-${jewelleryDetailController.productDetailsData.metaldetails![0].metalPurity}-${double.parse(jewelleryDetailController.productDetailsData.metaldetails![0].metalWt).toStringAsFixed(2)} ${jewelleryDetailController.productDetailsData.metaldetails![0].unitMetalWt}",
                ),
          jewelleryDetailController
                  .productDetailsData.decorativedetails!.isEmpty
              ? const SizedBox()
              : ProductDescRow(
                  textTitle: "Decorative",
                  textValue:
                      "${jewelleryDetailController.productDetailsData.decorativedetails![0].decorativeItemName} ${double.parse(jewelleryDetailController.productDetailsData.decorativedetails![0].decorativeItemWt).toStringAsFixed(2)} ${jewelleryDetailController.productDetailsData.decorativedetails![0].unitDecoItemWt}",
                ),
          jewelleryDetailController.productDetailsData.stonedetails!.isEmpty
              ? const SizedBox()
              : ProductDescRow(
                  textTitle: "Stone",
                  textValue:
                      "${jewelleryDetailController.productDetailsData.stonedetails![0].stoneName} ${double.parse(jewelleryDetailController.productDetailsData.stonedetails![0].stoneWt).toStringAsFixed(2)} ${jewelleryDetailController.productDetailsData.stonedetails![0].unitStoneWt}",
                ),
          jewelleryDetailController.productDetailsData.diamonddetails!.isEmpty
              ? const SizedBox()
              : ProductDescRow(
                  textTitle: "Diamond",
                  textValue:
                      "${jewelleryDetailController.productDetailsData.diamonddetails![0].stoneName} ${double.parse(jewelleryDetailController.productDetailsData.diamonddetails![0].stoneWt).toStringAsFixed(2)} ${jewelleryDetailController.productDetailsData.diamonddetails![0].unitStoneWt}",
                ),
          ProductDescRow(
            textTitle: "Status",
            textValue: jewelleryDetailController
                .productDetailsData.productStatus!.capitalizeFirst!,
          ),
          // const SizedBox(height: 5),
        ],
      ),
    );
  }
}

class ProductDescRow extends StatelessWidget {
  const ProductDescRow({
    Key? key,
    required this.textTitle,
    required this.textValue,
  }) : super(key: key);

  final String textTitle;
  final String textValue;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 6, horizontal: 4.w),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Text(
              textTitle,
              maxLines: 2,
              style: TextStyle(
                fontFamily: "Roboto",
                color: AppColors.blueDarkColor,
                fontSize: 11.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Text(
            ":  ",
            style: TextStyle(
              fontFamily: "Roboto",
              color: AppColors.blueDarkColor,
              fontSize: 11.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          Expanded(
            flex: 7,
            child: Text(
              textValue,
              maxLines: 2,
              style: TextStyle(
                fontFamily: "Roboto",
                color: AppColors.blueDarkColor,
                fontSize: 11.sp,
                fontWeight: FontWeight.w500,
                // fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class JewellerJewellerFeaturesAvailableModule extends StatelessWidget {
  JewellerJewellerFeaturesAvailableModule({Key? key}) : super(key: key);
  final jewelleryDetailController =
      Get.find<JewellerJewelleryDetailsScreenController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 12),
      padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
      decoration: const BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.all(
          Radius.circular(8),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              Text(
                "what makes us stand out".toUpperCase(),
                style: TextStyle(
                  fontFamily: "Roboto",
                  color: AppColors.darkBlack,
                  fontSize: 11.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.only(top: 8),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
            ),
            itemCount: jewelleryDetailController.specialFeaturesList.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  CachedNetworkImage(
                    imageUrl: ApiUrl.apiImagePath +
                        jewelleryDetailController
                            .specialFeaturesList[index].iconUrl,
                    height: 40,
                    width: 40,
                    color: AppColors.blueDarkColor,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    jewelleryDetailController.specialFeaturesList[index].feature
                        .toUpperCase(),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: "Roboto",
                      color: AppColors.darkBlack,
                      fontSize: 8.5.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
