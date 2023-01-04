import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import '../constants/api_url.dart';
import '../constants/app_colors.dart';
import '../constants/user_details.dart';
import '../models/jewellery_models/claim_details_model.dart';
import '../models/jewellery_models/delete_invoice_model.dart';
import '../models/jewellery_models/invoice_response_model.dart';
import '../widgets/common_widgets.dart';

class InvoiceDetailsScreenController extends GetxController {
  final String policyNumber = Get.arguments[0];
  final String ornamentSrNo = Get.arguments[1];
  String invoiceName = Get.arguments[2];
  final size = Get.size;

  RxBool isLoading = false.obs;

  ClaimDatum? claimdata;
  File? invoiceImageFile;
  ApiHeader apiHeader = ApiHeader();

  Future<void> deleteInvoiceApiFunction() async {
    String url =
        "${ApiUrl.deleteInvoiceApi}?OrnamentSrNo=$ornamentSrNo&customerId=${UserDetails.customerId}";

    log("deleteInvoiceApiFunction Api Url : $url");

    try {
      isLoading(true);

      http.Response response = await http.get(
        Uri.parse(url),
        headers: apiHeader.headers,
      );

      log("deleteInvoiceApiFunction api response body :: ${response.body}");
      log("deleteInvoiceApiFunction api response st code :: ${response.statusCode}");

      DeleteInvoiceModel deleteInvoiceModel =
          DeleteInvoiceModel.fromJson(json.decode(response.body));

      var isSuccessStatus = deleteInvoiceModel.success;

      if (isSuccessStatus) {
        // favouriteProductsList = favouritesModel.favProduct;
        invoiceName = "";

        invoiceImageFile = null;
        CommonWidgets().showBorderSnackBar(
          context: Get.context!,
          displayText: "Invoice Deleted Successfully",
        );

        log('isSuccessStatus : $isSuccessStatus');
      } else {
        CommonWidgets().showBorderSnackBar(
          context: Get.context!,
          displayText: deleteInvoiceModel.errorInfo.extraInfo,
        );
        log('get deleteInvoiceApiFunction Else');
      }
    } catch (e) {
      log("get deleteInvoiceApiFunction Error :$e");
      rethrow;
    } finally {
      isLoading(false);
    }
  }

  Future<void> invoiceUploadApiFunction() async {
    String url = ApiUrl.updateInvoiceApi;
    log("invoiceUploadApiFunction Api Url : $url");

    try {
      isLoading(true);
      List<int> imageBytes = invoiceImageFile!.readAsBytesSync();
      String base64Image = base64Encode(imageBytes);
      var requestMap = {
        "OrnamentSrNo": ornamentSrNo,
        "CustomerId": UserDetails.customerId,
        // "939308",
        "InvoiceImage_Base64": base64Image,
      };

      log("requestMap : $requestMap");
      http.Response response = await http.post(
        Uri.parse(url),
        body: jsonEncode(requestMap),
        headers: apiHeader.headers,
      );

      log("invoiceUploadApiFunction api response body :: ${response.body}");
      log("invoiceUploadApiFunction api response st code :: ${response.statusCode}");

      InvoiceResponseModel invoiceResponseModel =
          InvoiceResponseModel.fromJson(json.decode(response.body));

      var isSuccessStatus = invoiceResponseModel.success;

      if (isSuccessStatus) {
        // favouriteProductsList = favouritesModel.favProduct;

        invoiceName = invoiceResponseModel.uploadInvoiceData.imageurl;
        CommonWidgets().showBorderSnackBar(
          context: Get.context!,
          displayText: "Invoice Added Successfully",
        );

        log('isSuccessStatus : $isSuccessStatus');
      } else {
        CommonWidgets().showBorderSnackBar(
          context: Get.context!,
          displayText: invoiceResponseModel.errorInfo.extraInfo,
        );
        log('get invoiceUploadApiFunction Else');
      }
    } catch (e) {
      log("get invoiceUploadApiFunction Error :$e");
      rethrow;
    } finally {
      isLoading(false);
    }
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
      invoiceImageFile = File(pickedFile.path);
      invoiceUploadApiFunction();
      // isLoading(false);
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
      invoiceImageFile = File(pickedFile.path);
      invoiceUploadApiFunction();
      // isLoading(false);
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
    // getTrackClaimDetailsFunction();
    super.onInit();
  }
}
