import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:olocker/constants/api_url.dart';
import 'package:olocker/utils/extensions.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../constants/app_colors.dart';
import '../../constants/app_images.dart';
import '../../controllers/about_us_screen_controller.dart';

class AboutUsDetailsModule extends StatelessWidget {
  AboutUsDetailsModule({
    Key? key,
  }) : super(key: key);

  final aboutUsPageController = Get.find<AboutUsPageController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      padding: const EdgeInsets.symmetric(vertical: 12),
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.lightBrownBgColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          SizedBox(
            height: aboutUsPageController.size.height * 0.15,
            width: aboutUsPageController.size.width * 0.3,
            child: aboutUsPageController.aboutUsData!.partnerLogo != null
                ? Image.network(
                    ApiUrl.apiImagePath +
                        aboutUsPageController.aboutUsData!.partnerLogo,
                    fit: BoxFit.cover,
                  )
                : Image.asset(
                    AppImages.noLogoImage,
                    fit: BoxFit.cover,
                  ),
          ),
          SizedBox(height: 1.h),
          TitleAboutModule(text: "About us"),
          SizedBox(height: 1.h),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              aboutUsPageController.aboutUsData!.aboutShowroom,
              style: TextStyle(
                fontSize: 10.sp,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
          SizedBox(height: 1.h),
          TitleAboutModule(text: 'Our Team'),
          SizedBox(height: 1.h),
          OurTeamDetailsListModule(),
          SizedBox(height: 1.h),
          TitleAboutModule(text: "Contact Details"),
          SizedBox(height: 1.h),
          ContactDetailsModule(
            icon: Icons.email_outlined,
            text: aboutUsPageController.aboutUsData!.contactEmail,
            onTap: () async {
              String email = Uri.encodeComponent(
                  aboutUsPageController.aboutUsData!.contactEmail);
              Uri mail = Uri.parse("mailto:$email");

              if (await launchUrl(mail)) {
              } else {}
            },
          ),
          SizedBox(height: 1.h),
          ContactDetailsModule(
            icon: Icons.call,
            text: aboutUsPageController.aboutUsData!.contactPhone,
            onTap: () async {
              Uri phoneno = Uri.parse(
                  "tel:+91${aboutUsPageController.aboutUsData!.contactPhone}");
              log(aboutUsPageController.aboutUsData!.contactPhone);

              if (await launchUrl(phoneno)) {
              } else {}
            },
          ),
          SizedBox(height: 1.h),
          ContactDetailsModule(
            icon: Icons.location_on_outlined,
            text: aboutUsPageController.aboutUsData!.address,
            onTap: () {},
          ),
          SizedBox(height: 1.h),
          TitleAboutModule(text: 'Showroom Details'),
          SizedBox(height: 2.h),
          SliderModule(),
        ],
      ),
    );
  }
}

class ContactDetailsModule extends StatelessWidget {
  IconData icon;
  Color? color;
  String text;
  Function()? onTap;
  ContactDetailsModule({
    Key? key,
    required this.icon,
    this.color = Colors.red,
    required this.text,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Row(
          children: [
            Icon(
              icon,
              color: color,
            ),
            const SizedBox(width: 5),
            Expanded(
                child: Text(
              text,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            )),
          ],
        ),
      ),
    );
  }
}

class CustemAppbarModule extends StatelessWidget with PreferredSizeWidget {
  final aboutUsPageController = Get.find<AboutUsPageController>();
  CustemAppbarModule({
    Key? key,
  }) : super(key: key);
  @override
  Size get preferredSize => const Size.fromHeight(60);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      leading: const Icon(
        Icons.arrow_back_ios,
        color: Colors.black,
      ),
      title: Obx(
        () => aboutUsPageController.isLoading.value
            ? const SizedBox()
            : Text(
                aboutUsPageController.aboutUsData!.ownersName,
                style: const TextStyle(color: Colors.black),
              ),
      ),
      actions: const [
        Icon(
          Icons.email_outlined,
          color: Colors.black,
        ),
      ],
    );
  }
}

class OurTeamDetailsListModule extends StatelessWidget {
  OurTeamDetailsListModule({
    Key? key,
  }) : super(key: key);
  final aboutUsPageController = Get.find<AboutUsPageController>();

  @override
  Widget build(BuildContext context) {
    return aboutUsPageController.teamMembersList.isEmpty
        ? const Center(child: Text("No TeamMember Details"))
        : ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            itemCount: aboutUsPageController.teamMembersList.length,
            itemBuilder: (context, index) {
              return TeamDetailsListItemModule(
                index: index,
              );
            },
            separatorBuilder: (context, index) {
              return SizedBox(height: 2.h);
            },
          );
  }
}

class TeamDetailsListItemModule extends StatelessWidget {
  TeamDetailsListItemModule({
    Key? key,
    required this.index,
  }) : super(key: key);

  final int index;
  final aboutUsPageController = Get.find<AboutUsPageController>();

  @override
  Widget build(BuildContext context) {
    var singleMember = aboutUsPageController.teamMembersList[index];
    return Stack(
      alignment: Alignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
                width: aboutUsPageController.size.width * 0.78,
                height: aboutUsPageController.size.height * 0.12,
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
                    Expanded(flex: 13, child: Container()),
                    Expanded(
                      flex: 87,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            singleMember.ownerName,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            singleMember.ownerDescription,
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(fontSize: 11.sp),
                          ),
                        ],
                      ).commonSymmetricPadding(vertical: 8, horizontal: 10),
                    ),
                  ],
                )),
          ],
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Container(
            height: aboutUsPageController.size.height * 0.08,
            width: aboutUsPageController.size.height * 0.08,
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
              child: CachedNetworkImage(
                imageUrl: singleMember.ownerImage.isEmpty
                    ? ""
                    : "${ApiUrl.apiImagePath}${singleMember.ownerImage}",
                fit: BoxFit.cover,
                placeholder: (context, url) {
                  return Center(
                    child: Text(
                      "No Image",
                      style: TextStyle(
                        fontSize: 8.sp,
                      ),
                    ),
                  );
                },
                errorWidget: (context, url, error) {
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
      ],
    );
  }
}

class SliderModule extends StatelessWidget {
  SliderModule({Key? key}) : super(key: key);

  final aboutUsPageController = Get.find<AboutUsPageController>();

  @override
  Widget build(BuildContext context) {
    return aboutUsPageController.sliderImageList.isEmpty
        ? Center(
            child: Text("No showroom images"),
          )
        : Column(
            children: [
              CarouselSlider.builder(
                itemCount: aboutUsPageController.sliderImageList.length,
                itemBuilder: ((context, index, realIndex) {
                  return Container(
                    height: 150,
                    width: 200,
                    child: Image.network(
                      aboutUsPageController.sliderImageList[index],
                      fit: BoxFit.cover,
                    ),
                  );
                }),
                options: CarouselOptions(
                  onPageChanged: ((index, reason) {
                    aboutUsPageController.currentIndex.value = index;
                  }),
                  aspectRatio: 16 / 9,
                  viewportFraction: 0.8,
                  initialPage: 0,
                  enableInfiniteScroll: true,
                  autoPlayCurve: Curves.fastOutSlowIn,
                ),
              ),
              Obx(
                () => Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: aboutUsPageController.sliderImageList.map((url) {
                    int index =
                        aboutUsPageController.sliderImageList.indexOf(url);
                    return Container(
                      width: aboutUsPageController.currentIndex.value == index
                          ? 14
                          : 10,
                      height: aboutUsPageController.currentIndex.value == index
                          ? 14
                          : 10,
                      margin: const EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 2.0),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                            width: 1,
                            color: aboutUsPageController.currentIndex.value ==
                                    index
                                ? AppColors.whiteColor
                                : AppColors.lightBrownBgColor),
                        color: aboutUsPageController.currentIndex.value == index
                            ? AppColors.lightCoffeeColor
                            : AppColors.greyColor,
                      ),
                    );
                  }).toList(),
                ),
              ).commonOnlyPadding(right: 1.h),
            ],
          );
  }
}

class TitleAboutModule extends StatelessWidget {
  final String text;

  TitleAboutModule({Key? key, required this.text}) : super(key: key);
  final aboutUsPageController = Get.find<AboutUsPageController>();
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Stack(
          alignment: Alignment.centerLeft,
          children: [
            Image.asset(
              AppImages.aboutTileBGImage,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                text,
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
