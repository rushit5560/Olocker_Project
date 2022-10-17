import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../constants/api_url.dart';
import '../models/portfolio_screen_models/get_all_data_ornament_model.dart';

class AddUnInsuredJewelleryScreenController extends GetxController {
  final size = Get.size;

  RxBool isLoading = false.obs;

  ApiHeader apiHeader = ApiHeader();

  //ornament text controller
  RxString selectedOrnamentName = "".obs;
  RxString selectedOrnamentPurchaseDate = "Select Purchased Date".obs;
  TextEditingController ornamentGrossWeightController = TextEditingController();
  TextEditingController ornamentPurchasedFromController =
      TextEditingController();
  TextEditingController ornamentPurchasedDateController =
      TextEditingController();
  TextEditingController ornamentPurchasedPriceController =
      TextEditingController();
  List<SingleItemDetail> ornamentTypeNameList = [];

  //metal text controller
  RxString selectedMetalName = "".obs;
  RxString selectedMetalPurity = "".obs;
  TextEditingController metalWeightController = TextEditingController();
  List<SingleItemDetail> metalTypesList = [];
  List<SingleItemDetail> metalPurityList = [];

  //stone text controller
  RxString selectedStoneName = "".obs;
  TextEditingController stoneWeightController = TextEditingController();
  RxString selectedStoneUnitOfWeight = "".obs;
  List<SingleItemDetail> stoneDetailsList = [];
  List<String> stoneWeightUnitList = [
    "Gms.",
    "Cts.",
  ];

  //decorativve item text controller
  RxString selectedDecoItemName = "".obs;
  TextEditingController decoItemWeightController = TextEditingController();
  RxString selectedDecoItemUnitOfWeight = "".obs;
  List<SingleItemDetail> decoItemsDetailsList = [];
  List<String> decoItemsWeightUnitList = [
    "Gms.",
    "Cts.",
  ];

  File? jewelleryImageFile;

  void showDatePicker(ctx) {
    showCupertinoModalPopup(
      context: ctx,
      builder: (_) => Container(
        height: size.height * 0.4,
        // padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        color: const Color.fromARGB(255, 255, 255, 255),
        child: Column(
          children: [
            SizedBox(
              height: size.height * 0.32,
              child: CupertinoDatePicker(
                  mode: CupertinoDatePickerMode.date,
                  initialDateTime: DateTime.now(),
                  minimumYear: 1950,
                  maximumYear: DateTime.now().year,
                  onDateTimeChanged: (val) {
                    selectedOrnamentPurchaseDate.value =
                        val.toString().split(" ")[0];
                  }),
            ),
            // Close the modal
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Get.back();
              },
            )
          ],
        ),
      ),
    );
  }

  Future<void> getAllDataAddOrnamentFunction() async {
    isLoading(true);
    String url = ApiUrl.getAllDataAddOrnamentApi;
    log('getAllDataAddOrnament Api url : $url');

    try {
      http.Response response = await http.get(
        Uri.parse(url),
        headers: apiHeader.headers,
      );

      log("getAllDataAddOrnament res body :: ${response.body}");

      GetAddDataOrnamentModel getAddDataOrnamentModel =
          GetAddDataOrnamentModel.fromJson(json.decode(response.body));
      var isSuccessStatus = getAddDataOrnamentModel.success.obs;

      if (isSuccessStatus.value) {
        ornamentTypeNameList.clear();
        metalTypesList.clear();
        metalPurityList.clear();
        stoneDetailsList.clear();
        decoItemsDetailsList.clear();

        //asigning ornamentTypeNameList data
        for (int i = 0;
            i < getAddDataOrnamentModel.productDetails.length;
            i++) {
          ornamentTypeNameList = getAddDataOrnamentModel.productDetails;
        }

        //asigning metalTypesList and metalPurityList data
        for (int i = 0; i < getAddDataOrnamentModel.metalTypes.length; i++) {
          metalTypesList = getAddDataOrnamentModel.metalTypes;
        }
        for (int i = 0; i < getAddDataOrnamentModel.metalPurity.length; i++) {
          metalPurityList = getAddDataOrnamentModel.metalPurity;
        }

        //asigning stoneDetailsList data
        for (int i = 0; i < getAddDataOrnamentModel.stoneDetails.length; i++) {
          stoneDetailsList = getAddDataOrnamentModel.stoneDetails;
        }

        //asigning decoItemsDetailsList data
        for (int i = 0;
            i < getAddDataOrnamentModel.decorativeItemDetails.length;
            i++) {
          decoItemsDetailsList = getAddDataOrnamentModel.decorativeItemDetails;
        }
        // favouriteDealsList.addAll(smartDealsOnlineModel.vendorDealsList);
        // log('Length1 : ${smartDealsOnlineModel.vendorDealsList.length}');
        log('getAllDataAddOrnament ');
      } else {
        log('getAllDataAddOrnament Else');
      }

      // log("response : ${response.body}");

    } catch (e) {
      log('getAllDataAddOrnament Error :$e');
      rethrow;
    }
    isLoading(false);
  }

  @override
  void onInit() {
    // TODO: implement onInit
    getAllDataAddOrnamentFunction();
    super.onInit();
  }
}
