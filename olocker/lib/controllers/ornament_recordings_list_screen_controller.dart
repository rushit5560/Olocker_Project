import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../constants/api_url.dart';
import '../constants/user_details.dart';

class OrnamentRecordingsListScreenController extends GetxController {
  final size = Get.size;
  final ornamentSrNo = Get.arguments[0];
  final customerOraSrNo = Get.arguments[1];

  RxBool isLoading = false.obs;

  ApiHeader apiHeader = ApiHeader();

  Future<void> getOrnamentRecordingsListFunction() async {
    // if (formKey.currentState!.validate()) {

    log(" ornamentSrNo is ::  ${ornamentSrNo}");
    log(" customerOraSrNo is ::  ${customerOraSrNo}");
    String url =
        "${ApiUrl.getOrnamentTrackingApi}?customerId=${UserDetails.customerId}?OrnamentSrNo=$ornamentSrNo?CustOraSrNo=$customerOraSrNo";
    log(" getOrnamentRecordingsListFunction url: $url");

    try {
      isLoading(true);
      http.Response response = await http.get(
        Uri.parse(
            "https://devappapi.olocker.in/api/User/GetOrnamentTracking?customerId=939308&OrnamentSrNo=53&CustOraSrNo=1007175"),
        headers: apiHeader.headers,
      );

      log("getOrnamentRecordingsListFunction st code is : ${response.statusCode}");
      log("getOrnamentRecordingsListFunction res body : ${response.body}");

      // var resBody = jsonDecode(response.body);

      // UserProfileGetModel userProfileGetModel =
      //     UserProfileGetModel.fromJson(resBody);

      // isSuccessResult.value = userProfileGetModel.success;

      if (response.statusCode == 200) {
        log("getOrnamentRecordingsListFunction get success");
        // prefs.setString(
        //     UserPrefsData().customerMobileNoKey, numberController.text);

        // isEditable.value = true;
        // apiGetProfileImage = File(ApiUrl.apiImagePath +
        //     userProfileGetModel.customerProfile.imageLocation);

        // userName.value = userProfileGetModel.customerProfile.firstName;
        // // namePrefixDDvalue.value = userProfileGetModel.customerProfile.gender == "Male" ? "" :;
        // fnameController.text = userProfileGetModel.customerProfile.firstName;
        // fnameController.text = userProfileGetModel.customerProfile.firstName;
        // lnameController.text = userProfileGetModel.customerProfile.lastName;
        // emailController.text = userProfileGetModel.customerProfile.userEmail;
        // log("getting date is :: ${userProfileGetModel.customerProfile.dob}");
        // var dateGetPassing = DateFormat("MMM dd, yyyy")
        //     .parse(userProfileGetModel.customerProfile.dob);
        // log("getting formatted date is :: $dateGetPassing");
        // var datePassingFormat = DateFormat("d-MM-yyyy");

        // datePassingvalue.value = datePassingFormat.format(dateGetPassing);

        // log("datePassingvalue.value :: ${datePassingvalue.value}");
        // numberController.text = userProfileGetModel.customerProfile.mobileNo;
        // pinCodeController.text = userProfileGetModel.customerProfile.pin;
        // cityController.text = userProfileGetModel.customerProfile.city;
        // stateController.text = userProfileGetModel.customerProfile.state;
        // selectedDobNumber.value = userProfileGetModel.customerProfile.dob == ""
        //     ? "Select Date Of Birth"
        //     : userProfileGetModel.customerProfile.dob;
      } else {
        log("getOrnamentRecordingsListFunction not success");
        //do nothing
      }
    } catch (e) {
      log("getOrnamentRecordingsListFunction Error ::: $e");
      rethrow;
    } 
    // finally {
    //   isLoading(false);
    // }
    // }

    isLoading(false);
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    getOrnamentRecordingsListFunction();
  }
}
