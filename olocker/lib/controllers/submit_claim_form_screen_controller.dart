import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:olocker/constants/user_details.dart';
import 'package:olocker/controllers/my_insured_jewellery_screen_controller.dart';
import '../constants/api_url.dart';

import '../constants/app_colors.dart';
import '../models/jewellery_models/claim_details_model.dart';
import '../models/jewellery_models/claim_response_model.dart';
import '../widgets/common_widgets.dart';

class SubmitClaimFormScreenController extends GetxController {
  final String policyNo = Get.arguments[0];
  final String itemName = Get.arguments[1];
  final String customerName = Get.arguments[2];
  final String mobileNo = Get.arguments[3];
  final String inrAmount = Get.arguments[4];
  final String expiryDate = Get.arguments[5];
  final String oID = Get.arguments[6];
  final String ornamentSrNo = Get.arguments[7];
  final String policySrNo = Get.arguments[8];
  final size = Get.size;

  RxString selectedClaimTypeValue = "Claim Full Amount".obs;
  List<String> claimTypeList = [
    "Claim Full Amount",
    "Claim Partial Amount",
  ];

  RxBool isLoading = false.obs;

  ClaimDatum? claimdata;

  File? imageFile;

  RxBool isValidate = false.obs;

  ApiHeader apiHeader = ApiHeader();

  final claimFormKey = GlobalKey<FormState>();

  // submit claim text controller
  TextEditingController policyNoContorller = TextEditingController();
  TextEditingController itemNameContorller = TextEditingController();
  TextEditingController customerNameContorller = TextEditingController();
  TextEditingController mobileNoContorller = TextEditingController();
  TextEditingController inrContorller = TextEditingController();
  TextEditingController expiryDateContorller = TextEditingController();

  RxString selectedLossDate = "Select loss Date".obs;
  TextEditingController locationOfLossContorller = TextEditingController();
  TextEditingController describeEventOfLossContorller = TextEditingController();
  TextEditingController claimAmountContorller = TextEditingController();

  TextEditingController firNumberContorller = TextEditingController();
  TextEditingController policeStationAddressContorller =
      TextEditingController();

  submitFullForm() async {
    if (claimFormKey.currentState!.validate()) {
      //api call

      if (imageFile != null) {
        await addClaimApiFunction();
      } else {
        CommonWidgets().showBorderSnackBar(
          context: Get.context!,
          displayText: "Please Upload Police FIR Image.",
        );
      }
    } else {
      log("full form not submitting");
    }
  }

  Future<void> addClaimApiFunction() async {
    isLoading(true);
    String url = ApiUrl.addClaimApi;
    log('addClaimApiFunction Api url : $url');

    try {
      var now = DateTime.now();
      var dateNow = DateFormat("yyyy-MM-dd").format(now);
      List<int> imageBytes = imageFile!.readAsBytesSync();
      String base64Image = base64Encode(imageBytes);

      var requestMap = {
        'OrnamentSrNo': ornamentSrNo,
        'CustSrNo': "939308",
        // UserDetails.customerId,
        'PolicySrNo': int.parse(policySrNo),
        'ClaimDate': dateNow,
        'OID': oID,
        'COI': policyNo,
        'DateOfLoss': selectedLossDate.value,
        'LossLocation': locationOfLossContorller.text.trim().toString(),
        'DescriptionOfLossEvent':
            describeEventOfLossContorller.text.trim().toString(),
        'ClaimAmount': inrAmount,
        'FIRpoliceStation':
            policeStationAddressContorller.text.trim().toString(),
        'FIRnumber': firNumberContorller.text.trim().toString(),
        'claimimage': [
          {
            "name": "MyImage.png",
            "Base64": base64Image,
          },
        ],
      };

      log("addClaimApiFunction request body is :: ${requestMap}");

      http.Response response = await http.post(
        Uri.parse(url),
        headers: apiHeader.headers,
        body: jsonEncode(requestMap),
      );

      log('addClaimApiFunction response stcode :: ${response.statusCode}');
      log("addClaimApiFunction res body :: ${response.body}");

      ClaimResponseModel claimResponseModel =
          ClaimResponseModel.fromJson(jsonDecode(response.body));
      var isSuccessStatus = claimResponseModel.success;

      if (isSuccessStatus) {
        log("certificateofInsuranceNo is a :: ${claimResponseModel.data.certificateofInsuranceNo}");

        CommonWidgets().showBorderSnackBar(
          context: Get.context!,
          displayText: 'Claim Added Successfully',
        );

        Get.back();
        final insuredJewelleryScreenController =
            Get.find<MyInsuredJewelleryScreenController>();

        insuredJewelleryScreenController.getMyInsuredAllJewelleryFunction();
      } else {
        log("addClaimApiFunction Else Else");
      }
    } catch (e) {
      log('addClaimApiFunction Error : $e');
      rethrow;
    } finally {
      isLoading(false);
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
                    var dateFormat = DateFormat('yyyy-MM-dd');

                    var formattedDate = dateFormat.format(val);

                    selectedLossDate.value = formattedDate;
                  }),
            ),
            // Close the modal
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                log("selectedLossDate is : : ${selectedLossDate.value}");
                Get.back();
              },
            )
          ],
        ),
      ),
    );
  }

  /// Get from gallery
  getImageFromGallery() async {
    XFile? pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      isLoading(true);
      imageFile = File(pickedFile.path);
      isLoading(false);
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
      isLoading(true);
      imageFile = File(pickedFile.path);
      isLoading(false);
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
          ]);
        });
  }

  @override
  void onInit() {
    policyNoContorller.text = policyNo;
    itemNameContorller.text = itemName;
    customerNameContorller.text = customerName;
    mobileNoContorller.text = mobileNo;
    inrContorller.text = inrAmount;
    expiryDateContorller.text = expiryDate;
    super.onInit();
  }
}
