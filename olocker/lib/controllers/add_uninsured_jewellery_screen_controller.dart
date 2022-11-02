import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import '../constants/api_url.dart';
import '../models/portfolio_screen_models/get_all_data_ornament_model.dart';

class AddUnInsuredJewelleryScreenController extends GetxController {
  final size = Get.size;

  RxBool isLoading = false.obs;
  RxBool isValidate = false.obs;

  ApiHeader apiHeader = ApiHeader();

  //ornament text controller
  final productFormKey = GlobalKey<FormState>();
  SingleItemDetail? selectedOrnamentName;
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
  final metalFormKey = GlobalKey<FormState>();
  SingleItemDetail? selectedMetalName;
  SingleItemDetail? selectedMetalPurity;
  TextEditingController metalWeightController = TextEditingController();
  List<SingleItemDetail> metalTypesList = [];
  List<SingleItemDetail> metalPurityList = [];

  //stone text controller
  final stoneFormKey = GlobalKey<FormState>();
  SingleItemDetail? selectedStoneName;
  TextEditingController stoneWeightController = TextEditingController();
  RxString selectedStoneUnitOfWeight = "Gms.".obs;
  List<SingleItemDetail> stoneDetailsList = [];
  List<String> stoneWeightUnitList = [
    "Gms.",
    "Cts.",
  ];

  //decorativve item text controller
  final decoItemFormKey = GlobalKey<FormState>();
  SingleItemDetail? selectedDecoItemName;
  TextEditingController decoItemWeightController = TextEditingController();
  RxString selectedDecoItemUnitOfWeight = "Gms.".obs;
  List<SingleItemDetail> decoItemsDetailsList = [];
  List<String> decoItemsWeightUnitList = [
    "Gms.",
    "Cts.",
  ];

  File? jewellerySelectedImageFile;

  addMetalToMetalsList() {
    if (metalFormKey.currentState!.validate()) {
      //store to local list call

      log("metal form submitting");
    } else {
      log("metal form not submitting");
    }
  }

  addStoneToStonesList() {
    if (stoneFormKey.currentState!.validate()) {
      //store to local list call

    } else {
      log("metal form not submitting");
    }
  }

  addItemToDecoItemsList() {
    if (decoItemFormKey.currentState!.validate()) {
      //store to local list call

    } else {
      log("metal form not submitting");
    }
  }

  submitFullForm() {
    if (productFormKey.currentState!.validate()) {
      //api call

    } else {
      log("full form not submitting");
    }
  }

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
        selectedOrnamentName = getAddDataOrnamentModel.productDetails[0];
        for (int i = 0;
            i < getAddDataOrnamentModel.productDetails.length;
            i++) {
          ornamentTypeNameList = getAddDataOrnamentModel.productDetails;
        }

        selectedMetalName = getAddDataOrnamentModel.metalTypes[0];
        //asigning metalTypesList and metalPurityList data
        for (int i = 0; i < getAddDataOrnamentModel.metalTypes.length; i++) {
          metalTypesList = getAddDataOrnamentModel.metalTypes;
        }
        selectedMetalPurity = getAddDataOrnamentModel.metalPurity[0];
        for (int i = 0; i < getAddDataOrnamentModel.metalPurity.length; i++) {
          metalPurityList = getAddDataOrnamentModel.metalPurity;
        }

        selectedStoneName = getAddDataOrnamentModel.stoneDetails[0];
        //asigning stoneDetailsList data
        for (int i = 0; i < getAddDataOrnamentModel.stoneDetails.length; i++) {
          stoneDetailsList = getAddDataOrnamentModel.stoneDetails;
        }

        selectedDecoItemName = getAddDataOrnamentModel.decorativeItemDetails[0];
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

  /// Get from gallery
  getImageFromGallery() async {
    XFile? pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      jewellerySelectedImageFile = File(pickedFile.path);
    }
  }

  /// Get from Camera
  getImageFromCamera() async {
    XFile? pickedFile = await ImagePicker().pickImage(
      source: ImageSource.camera,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      jewellerySelectedImageFile = File(pickedFile.path);
    }
  }

  showImagePickerBottomSheet({
    required BuildContext context,
  }) {
    showModalBottomSheet<dynamic>(
        isScrollControlled: true,
        context: context,
        builder: (BuildContext bc) {
          return Wrap(children: <Widget>[
            Column(
              children: const [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25, vertical: 25),
                  child: Text(
                    "Albums",
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                ),
              ],
            ),
            // Container(
            //        child: Container(
            //         decoration: new BoxDecoration(
            //           color: forDialog ? Color(0xFF737373) : Colors.white,
            //           borderRadius: new BorderRadius.only(
            //                 topLeft: const Radius.circular(25.0),
            //                 topRight: const Radius.circular(25.0))),
            //           child: yourWidget(),
            //        ),
            //     )
          ]);
        });
  }

  @override
  void onInit() {
    // TODO: implement onInit
    getAllDataAddOrnamentFunction();
    super.onInit();
  }
}
