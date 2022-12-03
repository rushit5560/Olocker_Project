import 'package:cached_network_image/cached_network_image.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:olocker/constants/api_url.dart';
import 'package:olocker/constants/app_colors.dart';
import 'package:olocker/controllers/jeweller_jewellery_details_screen_controller.dart';
import 'package:olocker/controllers/jeweller_jewellery_list_screen_controller.dart';
import 'package:olocker/utils/extensions.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:sizer/sizer.dart';


class JewellerProductImagesSliderModule extends StatelessWidget {
  JewellerProductImagesSliderModule({Key? key}) : super(key: key);
  final jewelleryDetailsController =
  Get.find<JewellerJewelleryDetailsScreenController>();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: jewelleryDetailsController.size.height * 0.3,
      width: double.infinity,
      child: Swiper.list(
        autoplay: false,
        loop: false,
        curve: Curves.fastOutSlowIn,
        scrollDirection: Axis.horizontal,
        fade: 0.45,

        viewportFraction: 0.6, // this is displaying images size
        scale: 0.35, // this is non displaying images size
        physics: const BouncingScrollPhysics(),
        indicatorLayout: PageIndicatorLayout.WARM,

        //image indicator
        pagination: const SwiperPagination(
          alignment: Alignment.bottomRight,
          builder: SwiperPagination.dots,
          margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        ),

        list: jewelleryDetailsController.productDetailsData.productimages!,
        builder: (context, data, index) {
          return GestureDetector(
            onTap: () {
              // show full screen image slider

              Get.to(() => ShowFullScreenImagesSliderModule(
                initialPageViewIndex: index,
              ));
            },
            child: Container(
              height: jewelleryDetailsController.size.height * 0.25,
              width: jewelleryDetailsController.size.height * 0.25,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
              ),
              child: ClipRRect(
                borderRadius: const BorderRadius.all(
                  Radius.circular(200),
                ),
                child: CachedNetworkImage(
                  imageUrl: ApiUrl.apiImagePath +
                      jewelleryDetailsController.productDetailsData
                          .productimages![index].imageLocation,
                  fit: BoxFit.cover,
                  errorWidget: (context, url, error) {
                    return Container(
                      color: AppColors.whiteColor,
                      child: const Center(
                        child: Text("no image"),
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
      body: PhotoViewGallery.builder(
        // scrollPhysics: const BouncingScrollPhysics(),
        gaplessPlayback: true,
        pageController: PageController(
          initialPage: initialPageViewIndex,
        ),
        builder: (BuildContext context, int index) {
          return PhotoViewGalleryPageOptions(
            imageProvider: NetworkImage(
              ApiUrl.apiImagePath +
                  jewelleryDetailsController
                      .productDetailsData.productimages![index].imageLocation,
              // scale: 1,
            ),
            errorBuilder: (context, error, stackTrace) {
              return const Center(
                child: Text("Image not loaded"),
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
            .productDetailsData.productimages!.length,
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
              ? await jewelleryDetailsController.removeFavouriteProductFunction()
              : await jewelleryDetailsController.addFavouriteProductFunction();
        },
        child: Container(
          decoration: const BoxDecoration(
            color: AppColors.whiteColor,
            shape: BoxShape.circle,
          ),
          padding: const EdgeInsets.all(8),
          child: Icon(
            jewelleryDetailsController.productDetailsData.isFav == true
                ? Icons.favorite_rounded : Icons.favorite_border,
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
        onTap: () async {
          await jewelleryDetailsController.shareJewelleryReferFriend();
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
        Text(
          jewelleryDetailController.productDetailsData.price
              .toString()
              .contains("PRICE ON REQUEST")
              ? "PRICE ON REQUEST"
              : "₹${jewelleryDetailController.productDetailsData.price.toString()}",
          style: TextStyle(
            color: AppColors.whiteColor,
            fontSize: 13.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
        jewelleryDetailController.productDetailsData.price.toString() ==
            "PRICE ON REQUEST"
            ? const SizedBox()
            : Text(
          "(Approximate Price)",
          style: TextStyle(
            color: AppColors.whiteColor,
            fontSize: 13.sp,
            fontWeight: FontWeight.w500,
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
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "product description".toUpperCase(),
            style: TextStyle(
              color: AppColors.blackColor,
              fontSize: 12.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 2.h),
          ProductDescRow(
            textTitle: "Collection",
            textValue: jewelleryDetailController.jewelleryTypeName,
          ),
          ProductDescRow(
            textTitle: "Stock No",
            textValue: jewelleryDetailController.productDetailsData.productsku!,
          ),
          jewelleryDetailController.productDetailsData.metaldetails!.isEmpty
              ? const SizedBox()
              : ProductDescRow(
            textTitle: "Metal",
            textValue:
            "${jewelleryDetailController.productDetailsData.metaldetails![0].metalType} ${jewelleryDetailController.productDetailsData.metaldetails![0].metalPurity} ${double.parse(jewelleryDetailController.productDetailsData.metaldetails![0].metalWt).toStringAsFixed(2)} ${jewelleryDetailController.productDetailsData.metaldetails![0].unitMetalWt}",
          ),
          jewelleryDetailController.productDetailsData.decorativedetails!.isEmpty
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
          SizedBox(height: 1.h),
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
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Text(
              textTitle,
              maxLines: 2,
              style: TextStyle(
                color: AppColors.blackColor,
                fontSize: 12.sp,
                // fontWeight: FontWeight.w400,
              ),
            ),
          ),
          Text(
            ":  ",
            style: TextStyle(
              color: AppColors.blackColor,
              fontSize: 12.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
          Expanded(
            flex: 7,
            child: Text(
              textValue,
              maxLines: 2,
              style: TextStyle(
                color: AppColors.blackColor,
                fontSize: 12.sp,
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
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      decoration: const BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.all(
          Radius.circular(8),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "what makes us stand out".toUpperCase(),
            style: TextStyle(
              color: AppColors.blackColor,
              fontSize: 12.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.only(top: 20),
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
                    height: 55,
                    width: 55,
                    color: AppColors.blueDarkColor,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    jewelleryDetailController.specialFeaturesList[index].feature
                        .toUpperCase(),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: AppColors.blackColor,
                      fontSize: 8.5.sp,
                      fontWeight: FontWeight.w500,
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

