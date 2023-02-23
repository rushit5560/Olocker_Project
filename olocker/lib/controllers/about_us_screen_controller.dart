import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:olocker/constants/api_url.dart';
import 'package:olocker/constants/user_details.dart';
import '../models/about_us_models/about_us_details_model.dart';
import '../models/about_us_models/owner_detail_model.dart';

class AboutUsPageController extends GetxController {
  var partnerSrno = Get.arguments[0];
  var jewellerName = Get.arguments[1];
  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;
  Size size = Get.size;
  AboutDetailsModel? aboutDetailsModel;

  RxInt currentIndex = 0.obs;

  AboutYourSelf? aboutUsData;

  List<OwnerDetailModel> teamMembersList = [];

  List<String> sliderImageList = [];

  Future<void> getAboutUsDetailsFunction() async {
    isLoading(true);
    String url =
        "${ApiUrl.getAboutUsJewellerDetailsApi}?PartnerSrno=$partnerSrno&CustomerId=${UserDetails.customerId}";

    log("getAboutUsDetailsFunction API URL : $url");

    try {
      http.Response response = await http.get(
        Uri.parse(url),
      );
      log("getAboutUsDetailsFunction Response : ${response.body}");

      AboutDetailsModel aboutDetailsModel =
          AboutDetailsModel.fromJson(jsonDecode(response.body));
      isSuccessStatus.value = aboutDetailsModel.success;

      if (isSuccessStatus.value) {
        aboutUsData = aboutDetailsModel.aboutYourSelf;

        if (aboutUsData!.owner1 != "") {
          teamMembersList.add(OwnerDetailModel(
            ownerName: aboutUsData!.owner1,
            ownerDescription: aboutUsData!.firstOwnerDescription,
            ownerImage: aboutUsData!.ownerImage1,
          ));
        }
        if (aboutUsData!.owner2 != "") {
          teamMembersList.add(OwnerDetailModel(
            ownerName: aboutUsData!.owner2,
            ownerDescription: aboutUsData!.secondOwnerDescription,
            ownerImage: aboutUsData!.ownerImage2,
          ));
        }
        if (aboutUsData!.owner3 != "") {
          teamMembersList.add(OwnerDetailModel(
            ownerName: aboutUsData!.owner3,
            ownerDescription: aboutUsData!.thirdOwnerDescription,
            ownerImage: aboutUsData!.ownerImage3,
          ));
        }

        if (aboutUsData!.showRoomImage1 != "") {
          sliderImageList.add(
              "https://devappapi.olocker.in${aboutUsData!.showRoomImage1}");
        }
        if (aboutUsData!.showRoomImage2 != "") {
          sliderImageList.add(
              "https://devappapi.olocker.in${aboutUsData!.showRoomImage2}");
        }
        if (aboutUsData!.showRoomImage3 != "") {
          sliderImageList.add(
              "https://devappapi.olocker.in${aboutUsData!.showRoomImage3}");
        }

        log("aboutUsPageController.sliderImageList. ${sliderImageList.length}");
      } else {
        log("getAboutUsDetailsFunction Else Else");
      }
    } catch (e) {
      log("getAboutUsDetailsFunction Error ::: $e");
    } finally {
      isLoading(false);
    }
  }

  @override
  void onInit() {
    super.onInit();
    getAboutUsDetailsFunction();
  }
}
