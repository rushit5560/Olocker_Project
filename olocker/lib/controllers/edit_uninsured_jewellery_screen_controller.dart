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
  List<Map<String, dynamic>> metalDataMapList = [];

  //stone text controller
  final stoneFormKey = GlobalKey<FormState>();
  SingleItemDetail? selectedStoneName;
  TextEditingController stoneWeightController = TextEditingController();
  RxString selectedStoneUnitOfWeight = "Gms.".obs;
  List<SingleItemDetail> stoneDetailsList = [];
  List<Map<String, dynamic>> stoneDataMapList = [];
  List<String> stoneWeightUnitList = [
    "Gms.",
    "Cts.",
  ];

  //decorative item text controller
  final decoItemFormKey = GlobalKey<FormState>();
  SingleItemDetail? selectedDecoItemName;
  TextEditingController decoItemWeightController = TextEditingController();
  RxString selectedDecoItemUnitOfWeight = "Gms.".obs;
  List<SingleItemDetail> decoItemsDetailsList = [];
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

        //assigning ornamentTypeNameList data
        selectedOrnamentName = getAddDataOrnamentModel.productDetails[0];
        for (int i = 0;
            i < getAddDataOrnamentModel.productDetails.length;
            i++) {
          ornamentTypeNameList = getAddDataOrnamentModel.productDetails;
        }

        selectedMetalName = getAddDataOrnamentModel.metalTypes[0];
        //assigning metalTypesList and metalPurityList data
        for (int i = 0; i < getAddDataOrnamentModel.metalTypes.length; i++) {
          metalTypesList = getAddDataOrnamentModel.metalTypes;
        }
        selectedMetalPurity = getAddDataOrnamentModel.metalPurity[0];
        for (int i = 0; i < getAddDataOrnamentModel.metalPurity.length; i++) {
          metalPurityList = getAddDataOrnamentModel.metalPurity;
        }

        selectedStoneName = getAddDataOrnamentModel.stoneDetails[0];
        //assigning stoneDetailsList data
        for (int i = 0; i < getAddDataOrnamentModel.stoneDetails.length; i++) {
          stoneDetailsList = getAddDataOrnamentModel.stoneDetails;
        }

        selectedDecoItemName = getAddDataOrnamentModel.decorativeItemDetails[0];
        //assigning decoItemsDetailsList data
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
    } finally {
      await getOrnamentDetailFunction();
    }
    // isLoading(false);
  }

  Future<void> getOrnamentDetailFunction() async {
    isLoading(true);
    String url = "${ApiUrl.getOrnamentDetailApi}?UserOraSrNo=$ornamentSrNo";
    log('getOrnamentDetailFunction Api url : $url');

    try {
      http.Response response = await http.get(
        Uri.parse(url),
        headers: apiHeader.headers,
      );

      log('getOrnamentDetailFunction response stcode :: ${response.statusCode}');
      log("getOrnamentDetailFunction res body :: ${response.body}");

      GetOrnamentDetailsModel getOrnamentDetailsModel =
          GetOrnamentDetailsModel.fromJson(jsonDecode(response.body));
      var isSuccessStatus = getOrnamentDetailsModel.success;

      if (isSuccessStatus) {
        // log("ornament name is a :: ${getOrnamentDetailsModel.name}");

        for (int i = 0; i < ornamentTypeNameList.length; i++) {
          if (ornamentTypeNameList[i].value == getOrnamentDetailsModel.name) {
            selectedOrnamentName = ornamentTypeNameList[i];
          }
        }

        ornamentGrossWeightController.text = getOrnamentDetailsModel.grosswt;
        ornamentPurchasedFromController.text =
            getOrnamentDetailsModel.purchasedFrom;

        log("getOrnamentDetailsModel.purchaseDate :: ${getOrnamentDetailsModel.purchaseDate}");

        var dateFormat = DateFormat('dd-MM-yyyy');

        var parsedDate = dateFormat
            .parse(getOrnamentDetailsModel.purchaseDate.trim())
            .toString();

        // log("get parsedDate is : : $parsedDate");

        var dateFormatSet = DateFormat('dd-MM-yyyy');
        var formattedDate = dateFormatSet.format(DateTime.parse(parsedDate));

        selectedOrnamentPurchaseDate.value = formattedDate.replaceAll("-", "/");
        log("selectedOrnamentPurchaseDate.value is : : ${selectedOrnamentPurchaseDate.value}");

        // selectedOrnamentPurchaseDate.value =
        //     getOrnamentDetailsModel.purchaseDate.toString().split(" ")[0];
        ornamentPurchasedPriceController.text =
            getOrnamentDetailsModel.purchasePrice.toString().split(".")[0];
        apiJewelleryImageFile = File(ApiUrl.apiImagePath +
            getOrnamentDetailsModel.ornamentimage.path);

        if (getOrnamentDetailsModel.metaldetails != []) {
          for (int i = 0;
              i < getOrnamentDetailsModel.metaldetails.length;
              i++) {
            metalDataMapList.add({
              "netmetalweight":
                  getOrnamentDetailsModel.metaldetails[i].netmetalweight,
              "metaltype": getOrnamentDetailsModel.metaldetails[i].metaltype,
              "purity": getOrnamentDetailsModel.metaldetails[i].purity
            });
          }
        }
        if (getOrnamentDetailsModel.stonedetails != []) {
          for (int i = 0;
              i < getOrnamentDetailsModel.stonedetails.length;
              i++) {
            stoneDataMapList.add({
              "name": getOrnamentDetailsModel.stonedetails[i].name,
              "wt": getOrnamentDetailsModel.stonedetails[i].wt,
              "unitofwt": getOrnamentDetailsModel.stonedetails[i].unitofwt
            });
          }
        }
        if (getOrnamentDetailsModel.decorativeitem != []) {
          for (int i = 0;
              i < getOrnamentDetailsModel.decorativeitem.length;
              i++) {
            decoItemsDataMapList.add({
              "name": getOrnamentDetailsModel.decorativeitem[i].name,
              "wt": getOrnamentDetailsModel.decorativeitem[i].wt,
              "unitofwt": getOrnamentDetailsModel.decorativeitem[i].unitofwt,
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
        'CustSrNo': UserDetails.customerId,
        'name': selectedOrnamentName!.value,
        'grosswt': ornamentGrossWeightController.text.toString(),
        'purchased_from': ornamentPurchasedFromController.text.toString(),
        'purchase_date': selectedOrnamentPurchaseDate.toString(),
        'purchase_price': ornamentPurchasedPriceController.text.toString(),
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
      var isSuccessStatus = addOrnamentResponseModel.success;

      if (isSuccessStatus) {
        log("CustOraSrNo is a :: ${addOrnamentResponseModel.data.custOraSrNo}");
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
    // TODO: implement onInit
    getAllDataAddOrnamentFunction();

    super.onInit();
  }
}
