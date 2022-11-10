import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:olocker/constants/api_url.dart';
import 'package:olocker/constants/user_details.dart';
import 'package:http/http.dart' as http;
import 'package:olocker/models/personal_loans_screen_model/check_availability_model.dart';
import 'package:olocker/models/personal_loans_screen_model/emi_schedule_model.dart';
import 'package:olocker/models/personal_loans_screen_model/upload_emi_document_model.dart';
import 'package:olocker/widgets/common_widgets.dart';

class PersonalLoansScreenController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;

  RxInt currentStep = 0.obs;
  // RxInt textColorStep = 0.obs;
  Size size = Get.size;
  ApiHeader apiHeader = ApiHeader();

  GlobalKey<FormState> stepOneFormKey = GlobalKey<FormState>();

  TextEditingController fnameController = TextEditingController();
  TextEditingController lnameController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  TextEditingController mobileNoController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController pinCodeController = TextEditingController();
  TextEditingController panCardController = TextEditingController();
  RxDouble loanAmount = 0.0.obs;
  TextEditingController monthlyIncomeController = TextEditingController();
  TextEditingController employerNameController = TextEditingController();
  TextEditingController currentTotalEmiController = TextEditingController();
  TextEditingController whichBankController = TextEditingController();

  String tempSelectedDate = "";
  RxString salariedValue = "Salaried".obs;
  RxString homeLoanValue = "no".obs;
  int tempSelectedYear = 0;
  String apiDobDate = "";

  RxString namePrefixDDValue = 'Mr.'.obs;
  int namePrefixNumberValue = 1;
  var namePrefixItems = [
    'Mr.',
    'Mrs.',
    'Miss',
  ];

  int emiSrNo = 0;
  String selectedMonth = "";
  String selectedEligibleEmiAmount = "";
  List<EmiTenorOption> emiScheduleList = [];
  int selectedListItem = 0;

  File panCardFile = File('');
  File aadhaarCardFile = File('');
  File addressProofFile = File('');
  File bankStatementFile = File('');
  File salarySlipsFile = File('');
  File rentAgreementFile = File('');

  /// Check Eligibility Api Function - Step 1
  Future<void> checkEligibilityFunction() async {
    isLoading(true);
    String url = ApiUrl.checkEligibilityApi;
    log('Check Eligibility Api Url : $url');

    try {
      Map<String, dynamic> bodyData = {
        "titleid": "$namePrefixNumberValue",
        "firstname": fnameController.text.trim(),
        "lastname": lnameController.text.trim(),
        "dob": apiDobDate,
        "mobile": mobileNoController.text.trim(),
        "email": emailController.text.trim().toLowerCase(),
        "Pincode": pinCodeController.text.trim(),
        "PANNumber": panCardController.text.trim(),
        "LoanAmount": loanAmount.value.toInt().toString(),
        "EmploymentType": salariedValue.value,
        "NetSalaryMonthly": monthlyIncomeController.text.trim(),
        "EMIAmountPaid": currentTotalEmiController.text.trim(),
        "IPAddr": "",
        "UserSrNo": UserDetails.customerId,
        "NameOfEmployer": employerNameController.text.trim(),
        "BankName": whichBankController.text.trim(),
        "IsHomeLoan": homeLoanValue.value == "yes" ? "true" : "false"
      };

      log('BodyData : $bodyData');

      http.Response response = await http.post(
        Uri.parse(url),
        body: jsonEncode(bodyData),
        headers: apiHeader.headers,
      );

      log('response : ${response.body}');

      CheckEligibilityModel checkEligibilityModel =
          CheckEligibilityModel.fromJson(json.decode(response.body));
      isSuccessStatus = checkEligibilityModel.success.obs;

      if (isSuccessStatus.value) {
        emiScheduleList.clear();
        emiScheduleList.addAll(checkEligibilityModel.emiTenorOptions);
        emiSrNo = checkEligibilityModel.emiSrNo;
        selectedMonth = emiScheduleList[0].tenorMonth;
        selectedEligibleEmiAmount = emiScheduleList[0].emiEligibleAmount;
        log('emiScheduleList : ${emiScheduleList.length}');
        // Go to next Step
        currentStep++;
      } else {
        log('checkEligibilityFunction Else');
      }
    } catch (e) {
      log('checkEligibilityFunction Error :$e');
      rethrow;
    }

    isLoading(false);
  }

  /// EMI Schedule Api Function - Step 2
  Future<void> emiScheduleFunction() async {
    isLoading(true);
    String url = ApiUrl.emiScheduleApi;
    log('Emi Schedule Api Url : $url');

    try {
      Map<String, dynamic> bodyData = {
        "EMISrNo": emiSrNo,
        "SelectedTenorMonth": selectedMonth,
        "EMIEligibleAmount": selectedEligibleEmiAmount
      };
      log('bodyData : $bodyData');

      http.Response response = await http.post(
        Uri.parse(url),
        headers: apiHeader.headers,
        body: jsonEncode(bodyData),
      );

      log('response : ${response.body}');

      EmiScheduleModel emiScheduleModel =
          EmiScheduleModel.fromJson(json.decode(response.body));
      isSuccessStatus = emiScheduleModel.success.obs;
      if (isSuccessStatus.value) {
        currentStep++;
      } else {
        log('emiScheduleFunction Else');
      }
    } catch (e) {
      log('emiScheduleFunction Error : $e');
      rethrow;
    }
    isLoading(false);
  }

  /// Upload Document Api Function - Step 3
  Future<void> uploadEmiDocumentsFunction() async {
    isLoading(true);
    String url = ApiUrl.uploadDocumentApi;
    log('Upload Emi Documents Api Url : $url');

    try {
      /*Map<String, String> headers = <String, String>{
        'Content-Type': "application/json",
        'MobileAppKey': "EED26D5A-711D-49BD-8999-38D8A60329C5",
      };*/

      // List<int> imageBytes = selectedProfileImage!.readAsBytesSync();
      // String base64Image = base64Encode(imageBytes);

      var requestMap = {
        "emiSrNo": "$emiSrNo",
        "PanCard_Base64": base64Encode(panCardFile.readAsBytesSync()),
        "AadharCard_Base64": base64Encode(aadhaarCardFile.readAsBytesSync()),
        "AddressProof_Base64": base64Encode(addressProofFile.readAsBytesSync()),
        "BankStatement_Base64":
            base64Encode(bankStatementFile.readAsBytesSync()),
        "SalarySlip_Base64": base64Encode(salarySlipsFile.readAsBytesSync()),
        "RentAgreement_Base64":
            base64Encode(rentAgreementFile.readAsBytesSync()),
      };
      // requestMap["Base64"]

      // log("uploadEmiDocumentsFunction api req body :: $requestMap");
      http.Response response = await http.post(
        Uri.parse(url),
        body: jsonEncode(requestMap),
        headers: {
          'Content-Type': "application/json",
          'MobileAppKey': "EED26D5A-711D-49BD-8999-38D8A60329C5",
        },
      );

      log("uploadEmiDocumentsFunction api response body :: ${response.body}");
      log("uploadEmiDocumentsFunction api response st code :: ${response.statusCode}");

      var resbody = jsonDecode(response.body);

      UploadEmiDocumentModel uploadEmiDocumentModel =
          UploadEmiDocumentModel.fromJson(resbody);
      isSuccessStatus.value = uploadEmiDocumentModel.success;
      if (isSuccessStatus.value) {
        log('uploadEmiDocumentsFunction success call ::: ${uploadEmiDocumentModel.message}');
        CommonWidgets().showBorderSnackBar(
          context: Get.context!,
          displayText: uploadEmiDocumentModel.message,
        );
        Get.back();
      }
    } catch (e) {
      log('uploadEmiDocumentsFunction Error :$e');
      rethrow;
    }

    isLoading(false);
  }

  loadUI() {
    isLoading(true);
    isLoading(false);
  }
}
