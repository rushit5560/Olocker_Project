import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:olocker/constants/api_url.dart';
import 'package:olocker/models/user_profile_models/city_state_get_model.dart';
import 'package:olocker/widgets/common_widgets.dart';

import '../../models/saving_scheme_screens_models/get_saving_scheme_list_models/get_saving_schemes_list_model.dart';
import '../../models/saving_scheme_screens_models/saving_scheme_enroll_screen_models/add_enroll_saving_scheme_model.dart';
import '../../screens/saving_schemes_screens/saving_scheme_confirmation_screen/saving_scheme_confirmation_screen.dart';

class SavingSchemeEnrollScreenController extends GetxController {
  // Getting from Saving Scheme List Screen
  GetSavingSchemeData savingSchemeData = Get.arguments;

  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController monthlyAmountFieldController = TextEditingController();
  RxString ourContributionAmount = "".obs;
  RxInt maturityAmount = 0.obs;

  ApiHeader apiHeader = ApiHeader();

  // Temp Variable
  RxInt selectedGridItem = 0.obs;
  final size = Get.size;

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

  late SavingSchemeDetails savingSchemeDetails;
  late PartnerSavingSchemeDetails partnerSavingSchemeDetails;

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

  Future<void> addEnrollSavingSchemeFunction() async {
    isLoading(true);
    String url = ApiUrl.addEnrollSavingSchemeApi;
    log('addEnrollSavingSchemeFunction Api Url :$url');

    try {
      Map<String, dynamic> bodyData = getBodyData();
      log('bodyData : $bodyData');

      http.Response response = await http.post(
        Uri.parse(url),
        headers: apiHeader.headers,
        body: jsonEncode(bodyData),
      );

      log('Body1212 :${response.body}');

      AddEnrollSavingSchemeModel addEnrollSavingSchemeModel =
          AddEnrollSavingSchemeModel.fromJson(json.decode(response.body));
      isSuccessStatus.value = addEnrollSavingSchemeModel.success;
      log('isSuccessStatus : ${isSuccessStatus.value}');

      if (isSuccessStatus.value) {
        savingSchemeDetails = addEnrollSavingSchemeModel.savingSchemeDetails;

        partnerSavingSchemeDetails =
            addEnrollSavingSchemeModel.partnerSavingSchemeDetails;
        Get.to(
          () => SavingSchemeConfirmationScreen(),
          arguments: [
            savingSchemeData.imagePath,
            savingSchemeData.schemeName,
            savingSchemeData.schemeTagLine,
            savingSchemeDetails,
            partnerSavingSchemeDetails,
          ],
        );

        // Get.to(
        //   () => SavingSchemesExplainerScreen(),
        //   arguments: [
        //     savingSchemeData,
        //     monthlyAmountFieldController.text.trim().toString(),
        //     ourContributionAmount.value,
        //     maturityAmount.value.toString(),
        //   ],
        // );

      } else {
        if (addEnrollSavingSchemeModel.errorInfo.description.contains(
            "Customer not found matching with email address and mobile number")) {
          CommonWidgets().showBorderSnackBar(
              context: Get.context!,
              displayText: addEnrollSavingSchemeModel.errorInfo.description);
        } else {
          CommonWidgets().showBorderSnackBar(
            context: Get.context!,
            displayText: addEnrollSavingSchemeModel.errorInfo.extraInfo,
          );
        }
      }
    } catch (e) {
      log('addEnrollSavingSchemeFunction Error : $e');
      rethrow;
    } finally {
      isLoading(false);
    }
  }

  Map<String, dynamic> getBodyData() {
    Map<String, dynamic> bodyData = {
      "MonthlyAmount": monthlyAmountFieldController.text.trim(),
      "Tenure": savingSchemeData.tenor.floor().toString(),
      "OurContribution": ourContributionAmount.value,
      "MaturityAmount": maturityAmount.toString(),
      "PartnerSavingSchemeSrNo": savingSchemeData.srNo.toString(),
      "Customer": {
        "Salutation": namePrefixDDValue.value,
        "FirstName": fNameController.text.trim(),
        "LastName": lNameController.text.trim(),
        "PanNumber": panCardController.text.trim(),
        "AdharNumber": aadhaarCardController.text.trim(),
        "MobileNumber": mobileNumberController.text.trim(),
        "EmailId": emailIdController.text.trim(),
        "Address": addressController.text.trim(),
        "Pincode": pincodeController.text.trim(),
        "City": cityController.text.trim(),
        "State": stateController.text.trim(),
        "Country": "india"
      }
    };
    return bodyData;
  }
}
