import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:another_stepper/dto/stepper_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:olocker/constants/api_url.dart';
import 'package:olocker/constants/app_colors.dart';
import 'package:olocker/constants/user_details.dart';
import 'package:http/http.dart' as http;
import 'package:olocker/models/personal_loans_screen_model/check_availability_model.dart';
import 'package:olocker/models/personal_loans_screen_model/emi_schedule_model.dart';
import 'package:olocker/models/personal_loans_screen_model/upload_emi_document_model.dart';
import 'package:olocker/widgets/common_widgets.dart';
import 'package:sizer/sizer.dart';

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

  // List<StepperData> stepperData = [
  //   StepperData(
  //     title: StepperText(
  //       'Check Eligibility',
  //       textStyle: TextStyle(
  //         color: AppColors.accentColor,
  //         fontSize: 9.5.sp,
  //         fontWeight: FontWeight.w500,
  //       ),
  //     ),
  //     iconWidget: Container(
  //       padding: const EdgeInsets.all(25),
  //       decoration: const BoxDecoration(
  //         color: currentStep.value == 0 ? : AppColors.accentColor,
  //         shape: BoxShape.circle,
  //       ),
  //       child: Center(
  //         child: Text(
  //           "1",
  //           style: TextStyle(
  //             color: AppColors.whiteColor,
  //             fontSize: 14.sp,
  //             fontWeight: FontWeight.w500,
  //           ),
  //         ),
  //       ),
  //     ),
  //   ),
  //   StepperData(
  //     title: StepperText(
  //       'EMI Schedule',
  //       textStyle: TextStyle(
  //         color: AppColors.accentColor,
  //         fontSize: 9.5.sp,
  //         fontWeight: FontWeight.w500,
  //       ),
  //     ),
  //     iconWidget: Container(
  //       padding: const EdgeInsets.all(25),
  //       decoration: const BoxDecoration(
  //         color: AppColors.accentColor,
  //         shape: BoxShape.circle,
  //       ),
  //       child: Center(
  //         child: Text(
  //           "2",
  //           style: TextStyle(
  //             color: AppColors.whiteColor,
  //             fontSize: 14.sp,
  //             fontWeight: FontWeight.w500,
  //           ),
  //         ),
  //       ),
  //     ),
  //   ),
  //   StepperData(
  //     title: StepperText(
  //       'Upload Documents',
  //       textStyle: TextStyle(
  //         color: AppColors.accentColor,
  //         fontSize: 9.5.sp,
  //         fontWeight: FontWeight.w500,
  //       ),
  //     ),
  //     iconWidget: Container(
  //       padding: const EdgeInsets.all(25),
  //       decoration: const BoxDecoration(
  //         color: AppColors.accentColor,
  //         shape: BoxShape.circle,
  //       ),
  //       child: Center(
  //         child: Text(
  //           "3",
  //           style: TextStyle(
  //             color: AppColors.whiteColor,
  //             fontSize: 14.sp,
  //             fontWeight: FontWeight.w500,
  //           ),
  //         ),
  //       ),
  //     ),
  //   ),
  // ];

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
    String url = ApiUrl.checkEligibilityApi;
    log('Check Eligibility Api Url : $url');

    try {
      isLoading(true);
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
      log('statusCode : ${response.statusCode}');

      var resultBody = json.decode(response.body);
      isSuccessStatus.value = resultBody['success'];

      if (isSuccessStatus.value) {
        CheckEligibilityModel checkEligibilityModel =
            CheckEligibilityModel.fromJson(json.decode(response.body));
        // isSuccessStatus = checkEligibilityModel.success.obs;

        emiScheduleList.clear();
        emiScheduleList.addAll(checkEligibilityModel.emiTenorOptions);
        emiSrNo = checkEligibilityModel.emiSrNo;
        selectedMonth = emiScheduleList[0].tenorMonth;
        selectedEligibleEmiAmount = emiScheduleList[0].emiEligibleAmount;
        log('emiScheduleList : ${emiScheduleList.length}');
        // Go to next Step
        currentStep.value++;
        log("currentStep.value is :: ${currentStep.value}");
      } else {
        log('checkEligibilityFunction Else');
        var resultBody = json.decode(response.body);
        CommonWidgets().showBorderSnackBar(
          context: Get.context!,
          displayText: "${resultBody['error_info']['description']}",
        );
      }
    } catch (e) {
      log('checkEligibilityFunction Error :$e');
      rethrow;
    } finally {
      isLoading(false);
    }

    // isLoading(false);
  }

  /// EMI Schedule Api Function - Step 2
  Future<void> emiScheduleFunction() async {
    String url = ApiUrl.emiScheduleApi;
    log('Emi Schedule Api Url : $url');

    try {
      isLoading(true);
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
        currentStep.value++;
        log("currentStep.value is :: ${currentStep.value}");
      } else {
        log('emiScheduleFunction Else');
      }
    } catch (e) {
      log('emiScheduleFunction Error : $e');
      rethrow;
    } finally {
      isLoading(false);
    }
  }

  /// Upload Document Api Function - Step 3
  Future<void> uploadEmiDocumentsFunction() async {
    String url = ApiUrl.uploadDocumentApi;
    log('Upload Emi Documents Api Url : $url');

    try {
      isLoading(true);

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
        headers: apiHeader.headers,
      );

      log("uploadEmiDocumentsFunction api response body :: ${response.body}");
      log("uploadEmiDocumentsFunction api response st code :: ${response.statusCode}");

      var resBody = jsonDecode(response.body);
      isSuccessStatus.value = resBody['success'];

      // isSuccessStatus.value = uploadEmiDocumentModel.success;
      if (isSuccessStatus.value) {
        UploadEmiDocumentModel uploadEmiDocumentModel =
            UploadEmiDocumentModel.fromJson(resBody);
        log('uploadEmiDocumentsFunction success call ::: ${uploadEmiDocumentModel.message}');
        CommonWidgets().showBorderSnackBar(
          context: Get.context!,
          displayText: uploadEmiDocumentModel.message,
        );
        Get.back();
      } else {
        log('uploadEmiDocumentsFunction Else');
        var resultBody = json.decode(response.body);
        CommonWidgets().showBorderSnackBar(
          context: Get.context!,
          displayText: "${resultBody['error_info']['description']}",
        );
      }
    } catch (e) {
      log('uploadEmiDocumentsFunction Error :$e');
      rethrow;
    } finally {
      isLoading(false);
    }
  }

  loadUI() {
    isLoading(true);
    isLoading(false);
  }
}
