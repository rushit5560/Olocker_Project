import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:olocker/constants/api_url.dart';
import 'package:olocker/models/user_profile_models/city_state_get_model.dart';

class SavingSchemeEnrollScreenController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController monthlyAmountFieldController = TextEditingController();
  ApiHeader apiHeader = ApiHeader();

  // Temp Variable
  RxInt selectedGridItem = 0.obs;
  //

  RxBool isShow = false.obs;
  GlobalKey<FormState> customerFormKey = GlobalKey<FormState>();
  var namePrefixItems = ['Mr.', 'Mrs.', 'Miss'];
  RxString namePrefixDDValue = 'Mr.'.obs;
  TextEditingController fNameController = TextEditingController();
  TextEditingController lNameController = TextEditingController();
  TextEditingController panCardController = TextEditingController();
  TextEditingController aadhaarCardController = TextEditingController();
  TextEditingController mobileNumberController = TextEditingController();
  TextEditingController emailIdController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController pincodeController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController stateController = TextEditingController();



  Future<void> getCityStateDetailsByPinFunction() async {
    // SharedPreferences prefs = await SharedPreferences.getInstance();

    // if (formKey.currentState!.validate()) {
    String url =
        "${ApiUrl.getCityStateByPincodeApi}?pincode=${pincodeController.text.toString()}";
    log(" getCityStateDetailsByPinFunction url: $url");

    try {
      // isLoading(true);
      http.Response response = await http.get(
        Uri.parse(url),
        headers: apiHeader.headers,
      );

      log("getCityStateDetailsByPinFunction st code is : ${response.statusCode}");
      log("getCityStateDetailsByPinFunction res body : ${response.body}");

      var resBody = jsonDecode(response.body);

      CityStateGetModel cityStateGetModel = CityStateGetModel.fromJson(resBody);

      isSuccessStatus.value = cityStateGetModel.success;

      if (isSuccessStatus.value) {
        isLoading(true);
        log("city state get success");
        cityController.clear();
        stateController.clear();

        cityController.text = cityStateGetModel.stateCityDetails.cityName;
        stateController.text = cityStateGetModel.stateCityDetails.stateName;
        isLoading(false);
      } else {
        log("getCityStateDetailsByPinFunction not success");
        isLoading(true);
        cityController.clear();
        stateController.clear();
        isLoading(false);
        //do nothing
      }
    } catch (e) {
      log("getCityStateDetailsByPinFunction Error ::: $e");
      rethrow;
    } finally {
      // isLoading(false);
    }
    // }
  }



}