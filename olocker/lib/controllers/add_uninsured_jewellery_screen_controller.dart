import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:olocker/constants/app_colors.dart';
import 'package:olocker/controllers/my_jewellery_portfolio_controller.dart';
import '../constants/api_url.dart';
import '../constants/user_details.dart';
import '../models/jewellery_models/add_jewellery_response_model.dart';
import '../models/portfolio_screen_models/get_all_data_ornament_model.dart';
import '../widgets/common_widgets.dart';

class AddUnInsuredJewelleryScreenController extends GetxController {
  final size = Get.size;

  RxBool isLoading = false.obs;
  RxBool isValidate = false.obs;

  ApiHeader apiHeader = ApiHeader();
  int isStatusCode = 0;

  //ornament text controller
  final productFormKey = GlobalKey<FormState>();
  DecoItemDetail? selectedOrnamentName;
  RxString selectedOrnamentPurchaseDate = "Select Purchased Date".obs;
  TextEditingController ornamentGrossWeightController = TextEditingController();
  TextEditingController ornamentPurchasedFromController =
      TextEditingController();
  TextEditingController ornamentPurchasedDateController =
      TextEditingController();
  TextEditingController ornamentPurchasedPriceController =
      TextEditingController();
  List<DecoItemDetail> ornamentTypeNameList = [];

  //metal text controller
  final metalFormKey = GlobalKey<FormState>();
  DecoItemDetail? selectedMetalName;
  DecoItemDetail? selectedMetalPurity;
  TextEditingController metalWeightController = TextEditingController();
  List<DecoItemDetail> metalTypesList = [];
  List<DecoItemDetail> metalPurityList = [];
  List<Map<String, dynamic>> metalDataMapList = [];

  //stone text controller
  final stoneFormKey = GlobalKey<FormState>();
  DecoItemDetail? selectedStoneName;
  TextEditingController stoneWeightController = TextEditingController();
  RxString selectedStoneUnitOfWeight = "Gms.".obs;
  List<DecoItemDetail> stoneDetailsList = [];
  List<Map<String, dynamic>> stoneDataMapList = [];
  List<String> stoneWeightUnitList = [
    "Gms.",
    "Cts.",
  ];

  //decorativve item text controller
  final decoItemFormKey = GlobalKey<FormState>();
  DecoItemDetail? selectedDecoItemName;
  TextEditingController decoItemWeightController = TextEditingController();
  RxString selectedDecoItemUnitOfWeight = "Gms.".obs;
  List<DecoItemDetail> decoItemsDetailsList = [];
  List<Map<String, dynamic>> decoItemsDataMapList = [];
  List<String> decoItemsWeightUnitList = [
    "Gms.",
    "Cts.",
  ];

  File jewellerySelectedImageFile = File('');

  addMetalToMetalsList() {
    if (metalFormKey.currentState!.validate()) {
      //store to local list call
      log("metal form submitting");
      isLoading(true);
      metalDataMapList.add({
        "netmetalweight": metalWeightController.text,
        "metaltype": selectedMetalName!.value.toString(),
        "purity": selectedMetalPurity!.value.toString()
      });
      log("metalDataMapList is :: ${metalDataMapList.toString()}");
      metalWeightController.clear();
      isLoading(false);
    } else {
      log("metal form not submitting");
    }
  }

  addStoneToStonesList() {
    if (stoneFormKey.currentState!.validate()) {
      //store to local list call
      isLoading(true);
      stoneDataMapList.add({
        "name": selectedStoneName!.value.toString(),
        "wt": stoneWeightController.text.toString(),
        "unitofwt": selectedStoneUnitOfWeight.value.toString()
      });
      log("stoneDataMapList is :: ${stoneDataMapList.toString()}");
      stoneWeightController.clear();
      isLoading(false);
    } else {
      log("metal form not submitting");
    }
  }

  addItemToDecoItemsList() {
    if (decoItemFormKey.currentState!.validate()) {
      //store to local list call
      isLoading(true);
      decoItemsDataMapList.add({
        "name": selectedDecoItemName!.value.toString(),
        "wt": decoItemWeightController.text.toString(),
        "unitofwt": selectedDecoItemUnitOfWeight.value.toString()
      });
      log("decoItems map list is :: ${decoItemsDataMapList.toString()}");
      decoItemWeightController.clear();
      isLoading(false);
    } else {
      log("metal form not submitting");
    }
  }

  submitFullForm() async {
    if (productFormKey.currentState!.validate()) {
      await addOrnamentFunction();

      //api call

      // if (jewellerySelectedImageFile != null) {
      // } else {
      //   CommonWidgets().showBorderSnackBar(
      //     context: Get.context!,
      //     displayText: "Please Upload Jewellery Image.",
      //   );
      // }
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
                    // 03/11/2019 date format
                    var dateFormat = DateFormat('dd/MM/yyyy');

                    var formattedDate = dateFormat.format(val);
                    log("selected op date is : : $formattedDate");

                    selectedOrnamentPurchaseDate.value = formattedDate;
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
      // var isSuccessStatus = getAddDataOrnamentModel.success.obs;
      isStatusCode = getAddDataOrnamentModel.statusCode;
      if (isStatusCode == 200) {
        ornamentTypeNameList.clear();
        metalTypesList.clear();
        metalPurityList.clear();
        stoneDetailsList.clear();
        decoItemsDetailsList.clear();

        //asigning ornamentTypeNameList data
        selectedOrnamentName = getAddDataOrnamentModel.data.productDetails[0];
        for (int i = 0;
            i < getAddDataOrnamentModel.data.productDetails.length;
            i++) {
          ornamentTypeNameList = getAddDataOrnamentModel.data.productDetails;
        }

        selectedMetalName = getAddDataOrnamentModel.data.metalTypes[0];
        //asigning metalTypesList and metalPurityList data
        for (int i = 0;
            i < getAddDataOrnamentModel.data.metalTypes.length;
            i++) {
          metalTypesList = getAddDataOrnamentModel.data.metalTypes;
        }
        selectedMetalPurity = getAddDataOrnamentModel.data.metalPurity[0];
        for (int i = 0;
            i < getAddDataOrnamentModel.data.metalPurity.length;
            i++) {
          metalPurityList = getAddDataOrnamentModel.data.metalPurity;
        }

        selectedStoneName = getAddDataOrnamentModel.data.stoneDetails[0];
        //asigning stoneDetailsList data
        for (int i = 0;
            i < getAddDataOrnamentModel.data.stoneDetails.length;
            i++) {
          stoneDetailsList = getAddDataOrnamentModel.data.stoneDetails;
        }

        selectedDecoItemName = getAddDataOrnamentModel.data.decoItemDetails[0];
        //asigning decoItemsDetailsList data
        for (int i = 0;
            i < getAddDataOrnamentModel.data.decoItemDetails.length;
            i++) {
          decoItemsDetailsList = getAddDataOrnamentModel.data.decoItemDetails;
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

  Future<void> addOrnamentFunction() async {
    isLoading(true);
    String url = ApiUrl.addOrnamentApi;
    log('addOrnamentFunction Api url : $url');

    try {
      Map<String, dynamic> requestMap = {};

      requestMap.addAll({'CustSrNo': UserDetails.customerId});
      requestMap.addAll({'name': selectedOrnamentName!.value});
      requestMap
          .addAll({'grosswt': ornamentGrossWeightController.text.toString()});
      requestMap.addAll(
          {'purchased_from': ornamentPurchasedFromController.text.toString()});
      requestMap.addAll({
        'purchase_date':
            selectedOrnamentPurchaseDate.value == "Select Purchased Date"
                ? ""
                : selectedOrnamentPurchaseDate.toString()
      });
      requestMap.addAll(
          {'purchase_price': ornamentPurchasedPriceController.text.toString().trim().isEmpty ? "0" : ornamentPurchasedPriceController.text.toString().trim()});
      requestMap.addAll({'metaldetails': metalDataMapList});
      requestMap.addAll({'stonedetails': stoneDataMapList});
      requestMap.addAll({'decorativeitem': decoItemsDataMapList});

      if (jewellerySelectedImageFile.path.isNotEmpty) {
        List<int> imageBytes = jewellerySelectedImageFile.readAsBytesSync();
        String base64Image = base64Encode(imageBytes);
        requestMap.addAll({
          'ornamentimage': [
            {"name": "jewelleryImageData", "Base64": base64Image}
          ]
        });
      }

      /*requestMap = {
        // 'CustSrNo': UserDetails.customerId,
        // 'name': selectedOrnamentName!.value,
        // 'grosswt': ornamentGrossWeightController.text.toString(),
        // 'purchased_from': ornamentPurchasedFromController.text.toString(),
        // 'purchase_date':
        //     selectedOrnamentPurchaseDate.value == "Select Purchased Date"
        //         ? ""
        //         : selectedOrnamentPurchaseDate.toString(),
        // 'purchase_price': ornamentPurchasedPriceController.text.toString(),
        // 'ornamentimage': [
        //   {
        //     "name": "jewelleryImageData",
        //     "Base64":   base64Image ,
        //   },
        // ],
        // 'metaldetails': metalDataMapList,
        // 'stonedetails': stoneDataMapList,
        // 'decorativeitem': decoItemsDataMapList,
      };*/

      log("request body passing is :: ${jsonEncode(requestMap)}");

      http.Response response = await http.post(
        Uri.parse(url),
        headers: apiHeader.headers,
        body: jsonEncode(requestMap),
      );

      log('addOrnamentFunction response stcode :: ${response.statusCode}');
      log("addOrnamentFunction res body :: ${response.body}");

      AddOrnamentResponseModel addOrnamentResponseModel =
          AddOrnamentResponseModel.fromJson(jsonDecode(response.body));
      // var isSuccessStatus = addOrnamentResponseModel.success;
      isStatusCode = addOrnamentResponseModel.statusCode;

      if (isStatusCode == 200) {
        // log("CustOraSrNo is a :: ${addOrnamentResponseModel.data.custOraSrNo}");
        CommonWidgets().showBorderSnackBar(
            context: Get.context!, displayText: 'Successfully Add Jewellery');

        Get.back();
        final jewelleryPortFolioScreenController =
            Get.find<MyJewelleryPortFolioScreenController>();

        jewelleryPortFolioScreenController
            .getJewelleryPortFolioDetailsFunction();
      } else {
        log("addOrnamentFunction Else Else");
      }
    } catch (e) {
      log('addOrnamentFunction Error : $e');
      rethrow;
    } finally {
      isLoading(false);
    }
  }

  /// Get from gallery
  getImageFromGallery() async {
    isLoading(true);
    XFile? pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      jewellerySelectedImageFile = File(pickedFile.path);
    }
    isLoading(false);
  }

  /// Get from Camera
  getImageFromCamera() async {
    isLoading(true);
    XFile? pickedFile = await ImagePicker().pickImage(
      source: ImageSource.camera,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      jewellerySelectedImageFile = File(pickedFile.path);
    }
    isLoading(false);
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
                  padding: EdgeInsets.only(left: 25, top: 15, bottom: 15),
                  child: Text(
                    "Albums",
                    style: TextStyle(
                      fontSize: 15,
                      color: AppColors.greyColor,
                    ),
                  ),
                ),
              ],
            ),
            ListTile(
              dense: true,
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 25, vertical: 3),
              leading: const Icon(
                Icons.camera_alt_rounded,
                color: AppColors.greyColor,
                size: 25,
              ),
              title: const Text("Camera"),
              onTap: () {
                Get.back();
                getImageFromCamera();
              },
            ),
            ListTile(
              dense: true,
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 25, vertical: 3),
              leading: const Icon(
                Icons.perm_media_rounded,
                color: AppColors.greyColor,
                size: 25,
              ),
              title: const Text("Library"),
              onTap: () {
                Get.back();
                getImageFromGallery();
              },
            ),
            ListTile(
              dense: true,
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 25, vertical: 3),
              leading: const Icon(
                Icons.close,
                color: AppColors.greyColor,
                size: 25,
              ),
              title: const Text("Cancel"),
              onTap: () {
                Get.back();
              },
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
