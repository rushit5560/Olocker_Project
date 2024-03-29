import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:olocker/constants/user_details.dart';
import 'package:olocker/controllers/index_screen_controller.dart';
import 'package:olocker/screens/index_screen/index_screen.dart';
import 'package:olocker/widgets/common_widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../constants/api_url.dart';
import '../constants/app_colors.dart';
import '../models/user_profile_models/city_state_get_model.dart';
import '../models/user_profile_models/user_profile_get_model.dart';
import '../utils/user_prefs_data.dart';

class ProfileScreenController extends GetxController {
  final size = Get.size;
  RxBool isLoading = false.obs;
  RxBool isEditable = false.obs;
  RxBool isSuccessResult = false.obs;
  RxString userName = "".obs;

  File? apiGetProfileImage;
  File? selectedProfileImage;

  TextEditingController fnameController = TextEditingController();
  TextEditingController lnameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  TextEditingController pinCodeController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController dateofbrithController = TextEditingController();
  // final indexScreenController = Get.put(IndexScreenController());

  final formKey = GlobalKey<FormState>();

  RxString namePrefixDDvalue = 'Mr.'.obs;
  RxString datePassingvalue = ''.obs;
  RxString selectedDobNumber = "Select Date Of Birth".obs;

  var namePrefixItems = [
    'Mr.',
    'Mrs.',
    'Miss',
  ];

  final apiHeader = ApiHeader();

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
                  minimumYear: 1940,
                  maximumYear: DateTime.now().year,
                  onDateTimeChanged: (val) {
                    // 03/11/2019 date format
                    var datePassingFormat = DateFormat('dd-MM-yyyy');
                    var dateFormat = DateFormat('MMM dd yyyy');

                    datePassingvalue.value = datePassingFormat.format(val);
                    var formattedDate = dateFormat.format(val);
                    log("selected Dob date is :: $formattedDate");

                    selectedDobNumber.value = formattedDate;
                    dateofbrithController.text = selectedDobNumber.value;
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

  Future<void> getUserProfileDetailsFunction() async {
    // if (formKey.currentState!.validate()) {

    SharedPreferences prefs = await SharedPreferences.getInstance();

    String url =
        "${ApiUrl.getUserProfileApi}?customerId=${UserDetails.customerId}";
    log(" getUserProfileDetailsFunction url: $url");

    try {
      isLoading(true);
      http.Response response = await http.get(
        Uri.parse(url),
        headers: apiHeader.headers,
      );

      log("getUserProfileDetailsFunction st code is : ${response.statusCode}");
      log("getUserProfileDetailsFunction res body : ${response.body}");

      var resBody = jsonDecode(response.body);

      UserProfileGetModel userProfileGetModel =
          UserProfileGetModel.fromJson(resBody);

      isSuccessResult.value = userProfileGetModel.success;

      if (isSuccessResult.value) {
        log("user profile get success");

        isEditable.value = true;
        apiGetProfileImage = File(ApiUrl.apiImagePath +
            userProfileGetModel.customerProfile.imageLocation);

        userName.value = userProfileGetModel.customerProfile.firstName;
        // namePrefixDDvalue.value = userProfileGetModel.customerProfile.gender == "Male" ? "" :;
        fnameController.text = userProfileGetModel.customerProfile.firstName;
        lnameController.text = userProfileGetModel.customerProfile.lastName;
        emailController.text = userProfileGetModel.customerProfile.userEmail;
        dateofbrithController.text = userProfileGetModel.customerProfile.dob;
        log("getting date is :: ${userProfileGetModel.customerProfile.dob}");
        log("dateofbrithController.text ${dateofbrithController.text}");
        if (userProfileGetModel.customerProfile.dob != "") {
          var dateGetPassing = DateFormat("MMM dd, yyyy")
              .parse(userProfileGetModel.customerProfile.dob);
          log("getting formatted date is :: $dateGetPassing");
          var datePassingFormat = DateFormat("d-MM-yyyy");

          datePassingvalue.value = datePassingFormat.format(dateGetPassing);
        }

        //set user data in prefs data
        prefs.setString(UserPrefsData().customerUserNameKey,
            userProfileGetModel.customerProfile.firstName);

        prefs.setString(UserPrefsData().customerFirstNameKey,
            userProfileGetModel.customerProfile.firstName);
        prefs.setString(UserPrefsData().customerLastNameKey,
            userProfileGetModel.customerProfile.lastName);
        prefs.setString(UserPrefsData().customerUserEmailKey,
            userProfileGetModel.customerProfile.userEmail);
        prefs.setString(UserPrefsData().customerMobileNoKey,
            userProfileGetModel.customerProfile.mobileNo);

        prefs.setString(UserPrefsData().customerAddressKey,
            userProfileGetModel.customerProfile.address1);
        prefs.setString(UserPrefsData().customerCityKey,
            userProfileGetModel.customerProfile.city);
        prefs.setString(UserPrefsData().customerPinKey,
            userProfileGetModel.customerProfile.pin);
        prefs.setString(UserPrefsData().customerStateKey,
            userProfileGetModel.customerProfile.state);
        prefs.setString(UserPrefsData().customerCountryKey,
            userProfileGetModel.customerProfile.country);
        prefs.setString(UserPrefsData().customerDOBKey, datePassingvalue.value);

        log("datePassingvalue.value :: ${datePassingvalue.value}");
        numberController.text = userProfileGetModel.customerProfile.mobileNo;
        pinCodeController.text = userProfileGetModel.customerProfile.pin;
        cityController.text = userProfileGetModel.customerProfile.city;
        stateController.text = userProfileGetModel.customerProfile.state;
        selectedDobNumber.value = userProfileGetModel.customerProfile.dob == ""
            ? "Select Date Of Birth"
            : userProfileGetModel.customerProfile.dob;
      } else {
        log("user profile get not success");
        //do nothing
      }
    } catch (e) {
      log("getUserProfileDetailsFunction Error ::: $e");
      rethrow;
    } finally {
      isLoading(false);
    }
    // }
  }

  Future<void> updateUserProfileDetailsFunction() async {
    // if (formKey.currentState!.validate()) {
    String url = ApiUrl.updateUserProfileApi;
    log(" updateUserProfileDetailsFunction url: $url");

    try {
      isLoading(true);

      if (selectedProfileImage == null) {
        log("without image updating profile::::");
        var genderValue = 0;

        // List<int> imageBytes = selectedProfileImage!.readAsBytesSync();
        // String base64Image = base64Encode(imageBytes);

        if (namePrefixDDvalue.value == "Mr.") {
          genderValue = 1;
        } else if (namePrefixDDvalue.value == "Mrs.") {
          genderValue = 2;
        } else {
          genderValue = 3;
        }

        var requestMap = {
          "firstname": fnameController.text.toString(),
          "lastname": lnameController.text.toString(),
          "useremail": emailController.text.toString(),
          "Gender": genderValue.toString(),
          "Salutation": namePrefixDDvalue.value.replaceAll(".", " "),
          "Country": "",
          "State": stateController.text.toString(),
          "City": cityController.text.toString(),
          "Pin": pinCodeController.text.toString(),
          "Address1": "",
          "DOB": datePassingvalue.value.toString(),
          "IPAddr": "192.0.0.1",
          "CustSrNo": UserDetails.customerId.toString(),
          "ProfileImage_Base64": "",
        };

        log("updateUserProfileDetailsFunction req map : ${UserDetails.customerId}");
        log("updateUserProfileDetailsFunction req map : ${datePassingvalue.value}");

        http.Response response = await http.post(
          Uri.parse(url),
          body: jsonEncode(requestMap),
          headers: apiHeader.headers,
        );

        log("updateUserProfileDetailsFunction st code is : ${response.statusCode}");
        log("updateUserProfileDetailsFunction res body : ${response.body}");

        var resBody = jsonDecode(response.body);

        UserProfileGetModel userProfileGetModel =
            UserProfileGetModel.fromJson(resBody);

        isSuccessResult.value = userProfileGetModel.success;

        if (isSuccessResult.value) {
          log("updateUserProfileDetailsFunction success");
          log("111");
          // prefs.setString(
          //     UserPrefsData().customerMobileNoKey, numberController.text);
          isEditable.value = true;
          CommonWidgets().showBorderSnackBar(
            context: Get.context!,
            displayText: "Profile Updated Successfully.",
          );
          //todo
          await updateProfileUpdateCount();
          Get.offAll(() => IndexScreen());
          // indexScreenController.currentBottomIndex.value = 0;
          // isLoading(true);
          // isLoading(false);
          // log("indexScreenController.currentBottomIndex.value ${indexScreenController.currentBottomIndex.value}");
        } else {
          log("updateUserProfileDetailsFunction not success");
          //do nothing
        }
      } else {
        log("with image updating profile::::");
        var genderValue = 0;

        List<int> imageBytes = selectedProfileImage!.readAsBytesSync();
        String base64Image = base64Encode(imageBytes);

        if (namePrefixDDvalue.value == "Mr.") {
          genderValue = 1;
        } else if (namePrefixDDvalue.value == "Mrs.") {
          genderValue = 2;
        } else {
          genderValue = 3;
        }

        var requestMap = {
          "firstname": fnameController.text.toString(),
          "lastname": lnameController.text.toString(),
          "useremail": emailController.text.toString(),
          "Gender": genderValue.toString(),
          "Salutation": namePrefixDDvalue.value.replaceAll(".", " "),
          "Country": "",
          "State": stateController.text.toString(),
          "City": cityController.text.toString(),
          "Pin": pinCodeController.text.toString(),
          "Address1": "",
          "DOB": datePassingvalue.value.toString(),
          "IPAddr": "192.0.0.1",
          "CustSrNo": UserDetails.customerId.toString(),
          "ProfileImage_Base64": base64Image,
        };

        log("updateUserProfileDetailsFunction req map : ${UserDetails.customerId}");
        log("updateUserProfileDetailsFunction req map : ${datePassingvalue.value}");

        http.Response response = await http.post(
          Uri.parse(url),
          body: jsonEncode(requestMap),
          headers: apiHeader.headers,
        );

        log("updateUserProfileDetailsFunction st code is : ${response.statusCode}");
        log("updateUserProfileDetailsFunction res body : ${response.body}");

        var resBody = jsonDecode(response.body);

        UserProfileGetModel userProfileGetModel =
            UserProfileGetModel.fromJson(resBody);

        isSuccessResult.value = userProfileGetModel.success;

        if (isSuccessResult.value) {
          log("222");

          log("updateUserProfileDetailsFunction success");
          // prefs.setString(
          //     UserPrefsData().customerMobileNoKey, numberController.text);
          isEditable.value = true;
          CommonWidgets().showBorderSnackBar(
            context: Get.context!,
            displayText: "Profile Updated Successfully.",
          );
          await updateProfileUpdateCount();
          Get.offAll(() => IndexScreen());
        } else {
          log("updateUserProfileDetailsFunction not success");
          //do nothing
        }
      }
    } catch (e) {
      log("updateUserProfileDetailsFunction Error ::: $e");
      rethrow;
    } finally {
      isLoading(false);
    }
    // }
  }

  updateProfileUpdateCount() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt(UserPrefsData().updateProfileCountKey, 3);
  }

  Future<void> getCityStateDetailsByPinFunction() async {
    // if (formKey.currentState!.validate()) {
    String url =
        "${ApiUrl.getCityStateByPincodeApi}?pincode=${pinCodeController.text.toString()}";
    log(" getCityStateDetailsByPinFunction url: $url");

    try {
      isLoading(true);
      cityController.clear();
      stateController.clear();
      http.Response response = await http.get(
        Uri.parse(url),
        headers: apiHeader.headers,
      );

      log("getCityStateDetailsByPinFunction st code is : ${response.statusCode}");
      log("getCityStateDetailsByPinFunction res body : ${response.body}");

      var resBody = jsonDecode(response.body);

      CityStateGetModel cityStateGetModel = CityStateGetModel.fromJson(resBody);

      isSuccessResult.value = cityStateGetModel.success;

      if (isSuccessResult.value) {
        log("city state get success");
        cityController.text = cityStateGetModel.stateCityDetails.cityName;
        stateController.text = cityStateGetModel.stateCityDetails.stateName;
      } else {
        cityController.clear();
        stateController.clear();
        log("getCityStateDetailsByPinFunction not success");
        //do nothing
      }
    } catch (e) {
      log("getCityStateDetailsByPinFunction Error ::: $e");
      rethrow;
    } finally {
      isLoading(false);
    }
    // }
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
      selectedProfileImage = File(pickedFile.path);
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
      selectedProfileImage = File(pickedFile.path);
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
    getUserProfileDetailsFunction();
    super.onInit();
  }
}
