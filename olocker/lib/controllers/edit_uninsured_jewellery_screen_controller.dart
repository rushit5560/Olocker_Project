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
import 'package:olocker/controllers/my_uninsured_jewellery_screen_controller.dart';
import '../constants/api_url.dart';
import '../constants/user_details.dart';
import '../models/jewellery_models/add_jewellery_response_model.dart';
import '../models/jewellery_models/get_ornament_details_model.dart';
import '../models/portfolio_screen_models/get_all_data_ornament_model.dart';
import '../widgets/common_widgets.dart';

class EditUnInsuredJewelleryScreenController extends GetxController {
  final size = Get.size;
  final String ornamentSrNo = Get.arguments[0];

  RxBool isLoading = false.obs;
  RxBool isValidate = false.obs;
  int isStatusCode = 0;
  ApiHeader apiHeader = ApiHeader();

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

  //decorative item text controller
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

  File? apiJewelleryImageFile;
  File? jewellerySelectedImageFile;

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
        "name": selectedDecoItemName!.id.toString(),
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
      //api call

      await updateOrnamentFunction();
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

      // log("getAllDataAddOrnament res body :: ${response.body}");

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

        //assigning ornamentTypeNameList data
        selectedOrnamentName = getAddDataOrnamentModel.data.productDetails[0];
        for (int i = 0;
            i < getAddDataOrnamentModel.data.productDetails.length;
            i++) {
          ornamentTypeNameList = getAddDataOrnamentModel.data.productDetails;
        }

        selectedMetalName = getAddDataOrnamentModel.data.metalTypes[0];
        //assigning metalTypesList and metalPurityList data
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
        //assigning stoneDetailsList data
        for (int i = 0;
            i < getAddDataOrnamentModel.data.stoneDetails.length;
            i++) {
          stoneDetailsList = getAddDataOrnamentModel.data.stoneDetails;
        }

        selectedDecoItemName = getAddDataOrnamentModel.data.decoItemDetails[0];
        //assigning decoItemsDetailsList data
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
    } finally {
      await getOrnamentDetailFunction();
    }
    // isLoading(false);
  }

  Future<void> getOrnamentDetailFunction() async {
    isLoading(true);
    String url = "${ApiUrl.getOrnamentDetailApi}?Id=$ornamentSrNo";
    log('getOrnamentDetailFunction Api url : $url');

    try {
      http.Response response =
          await http.get(Uri.parse(url), headers: apiHeader.headers);

      log('getOrnamentDetailFunction response stcode :: ${response.statusCode}');
      log("getOrnamentDetailFunction res body :: ${response.body}");

      GetOrnamentDetailsModel getOrnamentDetailsModel = GetOrnamentDetailsModel.fromJson(jsonDecode(response.body));
      // var isSuccessStatus = getOrnamentDetailsModel.success;
      isStatusCode = getOrnamentDetailsModel.statusCode;
      if (isStatusCode == 200) {
        // log("ornament name is a :: ${getOrnamentDetailsModel.name}");

        for (int i = 0; i < ornamentTypeNameList.length; i++) {
          if (ornamentTypeNameList[i].value ==
              getOrnamentDetailsModel.data.name) {
            selectedOrnamentName = ornamentTypeNameList[i];
          }
        }

        log('getOrnamentDetailsModel.data.grosswt :${getOrnamentDetailsModel.data.grosswt}');

        ornamentGrossWeightController.text = getOrnamentDetailsModel.data.grosswt;
        ornamentPurchasedFromController.text = getOrnamentDetailsModel.data.purchasedFrom;

        log("getOrnamentDetailsModel.purchaseDate :: ${getOrnamentDetailsModel.data.purchaseDate}");

        if(getOrnamentDetailsModel.data.purchaseDate.toString() != "") {
          String purchasedDate = getOrnamentDetailsModel.data.purchaseDate.split(" ")[0];

          List<String> dateList = purchasedDate.toString().split("/");
          for(int i=0; i < dateList.length; i++) {
            log('dateList :${dateList[i]}');
          }
          selectedOrnamentPurchaseDate.value = "${dateList[1]}/${dateList[0]}/${dateList[2]}";
          // DateTime purchasedDate = DateTime.parse(getOrnamentDetailsModel.data.purchaseDate.split(" ")[0]);
          // String outputDate = "${purchasedDate.day}/${purchasedDate.month}/${purchasedDate.year}";
          // var outputDate = DateFormat("dd/MM/yyyy").parse(purchasedDate.toString());
          // log('outputDate :$outputDate');

          // String purDate = getOrnamentDetailsModel.data.purchaseDate.split(" ")[0];


          // DateTime finalDate = DateTime.parse(getOrnamentDetailsModel.data.purchaseDate.toString());
          // log('Final Date : ${finalDate.day}/${finalDate.month}/${finalDate.year}');

          // log('purDate :$purDate');
          // var dateFormat = DateFormat('dd-MM-yyyy');
          // var parsedDate = dateFormat.parse(purDate);

          // var parsedDate = dateFormat.parse(purDate.trim()).toString();

          // var dateFormatSet = DateFormat('dd-MM-yyyy');
          // var formattedDate = dateFormatSet.format(DateTime.parse(parsedDate));

          // selectedOrnamentPurchaseDate.value = formattedDate.replaceAll("-", "/");
          // selectedOrnamentPurchaseDate.value = "${finalDate.day}/${finalDate.month}/${finalDate.year}";
          log("selectedOrnamentPurchaseDate.value is : : ${selectedOrnamentPurchaseDate.value}");
        }

        // selectedOrnamentPurchaseDate.value =
        //     getOrnamentDetailsModel.purchaseDate.toString().split(" ")[0];

        ornamentPurchasedPriceController.text = getOrnamentDetailsModel.data.purchasePrice.toString().split(".")[0];
        log('ornamentPurchasedPriceController ::${ornamentPurchasedPriceController.text}');
        apiJewelleryImageFile = File(ApiUrl.apiImagePath + getOrnamentDetailsModel.data.ornamentimage.path);

        if (getOrnamentDetailsModel.data.metaldetails != []) {
          for (int i = 0;
              i < getOrnamentDetailsModel.data.metaldetails.length;
              i++) {
            metalDataMapList.add({
              "netmetalweight":
                  getOrnamentDetailsModel.data.metaldetails[i].netmetalweight,
              "metaltype":
                  getOrnamentDetailsModel.data.metaldetails[i].metaltype,
              "purity": getOrnamentDetailsModel.data.metaldetails[i].purity
            });
          }
        }
        if (getOrnamentDetailsModel.data.stonedetails != []) {
          for (int i = 0;
              i < getOrnamentDetailsModel.data.stonedetails.length;
              i++) {
            stoneDataMapList.add({
              "name": getOrnamentDetailsModel.data.stonedetails[i].name,
              "wt": getOrnamentDetailsModel.data.stonedetails[i].wt,
              "unitofwt": getOrnamentDetailsModel.data.stonedetails[i].unitofwt
            });
          }
        }
        if (getOrnamentDetailsModel.data.decorativeitem != []) {
          for (int i = 0;
              i < getOrnamentDetailsModel.data.decorativeitem.length;
              i++) {
            decoItemsDataMapList.add({
              "name": getOrnamentDetailsModel.data.decorativeitem[i].name,
              "wt": getOrnamentDetailsModel.data.decorativeitem[i].wt,
              "unitofwt":
                  getOrnamentDetailsModel.data.decorativeitem[i].unitofwt,
            });
          }
        }

        log("selectedOrnamentName is :: ${selectedOrnamentName!.value.toString()}");
        // CommonWidgets().showBorderSnackBar(
        //     context: Get.context!, displayText: 'Successfully Add Jewellery');

        // Get.back();
      } else {
        log("getOrnamentDetailFunction Else Else");
      }
    } catch (e) {
      log('getOrnamentDetailFunction Error : $e');
      rethrow;
    } finally {
      isLoading(false);
    }
  }

  Future<void> updateOrnamentFunction() async {
    isLoading(true);
    String url = ApiUrl.updateOrnamentApi;
    log('addOrnamentFunction Api url : $url');

    try {
      var requestMap = {
        'custsrno': UserDetails.customerId,
        'name': selectedOrnamentName!.value,
        'grosswt': ornamentGrossWeightController.text.toString(),
        'purchased_from': ornamentPurchasedFromController.text.toString(),
        'purchase_date': selectedOrnamentPurchaseDate.toString(),
        'purchase_price': ornamentPurchasedPriceController.text.trim() == ""
            ? "0"
            : ornamentPurchasedPriceController.text.trim(),
        'ornamentimage': jewellerySelectedImageFile == null
            ? []
            : [
                jewellerySelectedImageFile!.path,
              ],
        'metaldetails': metalDataMapList,
        'stonedetails': stoneDataMapList,
        'decorativeitem': decoItemsDataMapList,
        "OrnamentSrNo": ornamentSrNo,
      };
      log("ornamentPurchasedPriceController.text.toString() ${ornamentPurchasedPriceController.text.toString()}");
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
          context: Get.context!,
          displayText: 'Jewellery Updated Successfully.',
        );

        final myUnInsuredJewelleryScreenController =
            Get.find<MyUnInsuredJewelleryScreenController>();

        Get.back();
        myUnInsuredJewelleryScreenController
            .getMyUnInsuredAllJewelleryFunction();
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
    getAllDataAddOrnamentFunction();
    super.onInit();
  }
}
