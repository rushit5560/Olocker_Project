import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../constants/api_url.dart';
import '../constants/app_colors.dart';

class MyInsuredJewelleryScreenController extends GetxController {
  final size = Get.size;

  RxBool isLoading = false.obs;

  // List<UnInsuredOrnament> getOrnamentList = [];

  ApiHeader apiHeader = ApiHeader();

  File? jewellerySelectedImageFile;

  Future<void> getMyUnInsuredAllJewelleryFunction() async {
    String url = ApiUrl.getAllUnInsuredOrnamentApi;
    log("getMyUnInsuredAllJewelleryFunction Api Url : $url");

    try {
      //   isLoading(true);
      //   var requestMap = {
      //     "CustSrNo": UserDetails.customerId,
      //   };
      //   http.Response response = await http.post(
      //     Uri.parse(url),
      //     body: jsonEncode(requestMap),
      //     headers: apiHeader.headers,
      //   );

      //   log("getMyUnInsuredAllJewelleryFunction api response body :: ${response.body}");
      //   log("getMyUnInsuredAllJewelleryFunction api response st code :: ${response.statusCode}");

      //   GetUnInsuredOrnamentModel getUnInsuredOrnamentModel =
      //       GetUnInsuredOrnamentModel.fromJson(json.decode(response.body));

      //   var isSuccessStatus = getUnInsuredOrnamentModel.success.obs;

      //   if (isSuccessStatus.value) {
      //     // favouriteProductsList = favouritesModel.favProduct;
      //     getOrnamentList = getUnInsuredOrnamentModel.unInsuredOrnament;
      //     log('getMyUnInsuredAllJewelleryFunction list is  : ${getUnInsuredOrnamentModel.unInsuredOrnament.length.toString()}');
      //   } else {
      //     CommonWidgets().showBorderSnackBar(
      //       context: Get.context!,
      //       displayText: getUnInsuredOrnamentModel.errorInfo.extraInfo,
      //     );
      //     log('get getMyUnInsuredAllJewelleryFunction Else');
      //   }
      isLoading(false);
    } catch (e) {
      log("get getMyUnInsuredAllJewelleryFunction Error :$e");
      rethrow;
    }
  }

  Future<void> updateImageOfJewelleryFunction({
    required int ornamentSrNo,
  }) async {
    String url = ApiUrl.updateUnInsuredOrnamentImageApi;
    log("updateImageOfJewelleryFunction Api Url : $url");

    try {
      isLoading(true);
      // final bytes = await File(jewellerySelectedImageFile!.).readAsBytes();
      // // List<int> imageBytes = jewellerySelectedImageFile!.readAsBytesSync();
      // String base64Image = base64Encode(bytes);

      var requestMap = {
        "Base64": base64Encode(jewellerySelectedImageFile!.readAsBytesSync()),
        "OrnamentSrNo": ornamentSrNo,
      };
      // requestMap["Base64"]

      log("updateImageOfJewelleryFunction api req body :: $requestMap");
      http.Response response = await http.post(
        Uri.parse(url),
        body: jsonEncode(requestMap),
        headers: apiHeader.headers,
      );

      log("updateImageOfJewelleryFunction api response body :: ${response.body}");
      log("updateImageOfJewelleryFunction api response st code :: ${response.statusCode}");

      // GetUnInsuredOrnamentModel getUnInsuredOrnamentModel =
      //     GetUnInsuredOrnamentModel.fromJson(json.decode(response.body));

      // var isSuccessStatus = getUnInsuredOrnamentModel.success.obs;

      // if (isSuccessStatus.value) {
      //   // favouriteProductsList = favouritesModel.favProduct;
      //   getOrnamentList = getUnInsuredOrnamentModel.unInsuredOrnament;
      //   log('updateImageOfJewelleryFunction list is  : ${getUnInsuredOrnamentModel.unInsuredOrnament.length.toString()}');
      // } else {
      //   CommonWidgets().showBorderSnackBar(
      //     context: Get.context!,
      //     displayText: getUnInsuredOrnamentModel.errorInfo.extraInfo,
      //   );
      //   log('get updateImageOfJewelleryFunction Else');
      // }
    } catch (e) {
      log("updateImageOfJewelleryFunction Error :$e");
      rethrow;
    } finally {
      isLoading(false);
    }
  }

  /// Get from gallery
  getImageFromGallery({
    required int index,
  }) async {
    // isLoading(true);
    XFile? pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      jewellerySelectedImageFile = File(pickedFile.path);
      // await updateImageOfJewelleryFunction(
      //   ornamentSrNo: getOrnamentList[index].custOraSrNo,
      // ).whenComplete(() {
      //   getMyUnInsuredAllJewelleryFunction();
      // });
    }
    // isLoading(false);
  }

  /// Get from Camera
  getImageFromCamera({
    required int index,
  }) async {
    // isLoading(true);
    XFile? pickedFile = await ImagePicker().pickImage(
      source: ImageSource.camera,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      jewellerySelectedImageFile = File(pickedFile.path);
      // updateImageOfJewelleryFunction(
      //   ornamentSrNo: getOrnamentList[index].custOraSrNo,
      // ).whenComplete(() {
      //   getMyUnInsuredAllJewelleryFunction();
      // });
    }
    // isLoading(false);
  }

  showImagePickerBottomSheet({
    required BuildContext context,
    required int index,
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
                getImageFromCamera(index: index);
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
                getImageFromGallery(index: index);
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
    getMyUnInsuredAllJewelleryFunction();
    super.onInit();
  }
}
