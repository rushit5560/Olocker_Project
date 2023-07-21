import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:olocker/constants/api_url.dart';
import 'package:olocker/constants/user_details.dart';
import 'package:http/http.dart' as http;
import 'package:olocker/models/personal_loans_screen_model/check_availability_model.dart';
import 'package:olocker/models/personal_loans_screen_model/emi_schedule_model.dart';
import 'package:olocker/models/personal_loans_screen_model/upload_emi_document_model.dart';
import 'package:olocker/widgets/common_widgets.dart';
import '../constants/app_colors.dart';
import '../screens/index_screen/index_screen.dart';

class PersonalLoansScreenController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;
  int isStatusCode = 0;
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
  TextEditingController lastDrawnSalaryController = TextEditingController();
  TextEditingController monthlyIncomeController = TextEditingController();
  TextEditingController employerNameController = TextEditingController();
  TextEditingController currentTotalEmiController = TextEditingController();
  TextEditingController whichBankController = TextEditingController();
  TextEditingController loanAmountController = TextEditingController();

  String tempSelectedDate = "";
  RxString salariedValue = "Salaried".obs;
  RxString homeLoanValue = "no".obs;
  int tempSelectedYear = 0;
  final DateFormat formatter = DateFormat('yyyy-MM-dd');

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
        // "titleid": "$namePrefixNumberValue",
        "FirstName": fnameController.text.trim(),
        "LastName": lnameController.text.trim(),
        "DOB": apiDobDate,
        "Mobile": mobileNoController.text.trim(),
        "Email": emailController.text.trim().toLowerCase(),
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
      CheckEligibilityModel checkEligibilityModel =
          CheckEligibilityModel.fromJson(json.decode(response.body));
      // isSuccessStatus.value = resultBody['success'];
      isStatusCode = checkEligibilityModel.statusCode;
      if (isStatusCode == 200) {
        // isSuccessStatus = checkEligibilityModel.success.obs;

        emiScheduleList.clear();
        emiScheduleList.addAll(checkEligibilityModel.data.emiTenorOptions);
        emiSrNo = checkEligibilityModel.data.emiSrNo;
        selectedMonth = emiScheduleList[0].tenorMonth;
        selectedEligibleEmiAmount = emiScheduleList[0].emiEligibleAmount;
        log('emiScheduleList : ${emiScheduleList.length}');
        // Go to next Step
        currentStep.value++;
        log("currentStep.value is :: ${currentStep.value}");
      } else {
        log('checkEligibilityFunction Else');
        var resultBody = json.decode(response.body);
        log("checkEligibilityModel.data.message ${checkEligibilityModel.data.message}");
        CommonWidgets().showBorderSnackBar(
          context: Get.context!,
          displayText: checkEligibilityModel.data.errorInfo.extraInfo,
        );
      }
    } catch (e) {
      log('checkEligibilityFunction Error :$e');
      if (isStatusCode == 400) {
        log("BadRequest");
      } else if (isStatusCode == 404) {
        log("NotFound");
      } else if (isStatusCode == 406) {
        log("NotAcceptable");
      } else if (isStatusCode == 417) {
        log("HttpStatusCode.ExpectationFailed");
      }
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
        "RentAgreement_Base64": rentAgreementFile.path == ""
            ? ""
            : base64Encode(rentAgreementFile.readAsBytesSync()),
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
        CustomAlertDialog().showAlertDialog(
          textContent: uploadEmiDocumentModel.message,
          context: Get.context!,
          onYesTap: () {
            Get.offAll(() => IndexScreen());
          },
          onCancelTap: () {
            Get.back();
          },
        );
        // CommonWidgets().showBorderSnackBar(
        //   context: Get.context!,
        //   displayText: uploadEmiDocumentModel.message,
        // );
        // Get.back();
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

class CustomAlertDialog {
  void showAlertDialog({
    required BuildContext context,
    required String textContent,
    required Function() onYesTap,
    required Function() onCancelTap,
  }) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: AppColors.whiteColor,
          title: Text(
            textContent,
            textAlign: TextAlign.center,
          ),
          actionsAlignment: MainAxisAlignment.spaceBetween,
          contentPadding: const EdgeInsets.symmetric(vertical: 40),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                OutlinedButton(
                  onPressed: onYesTap,
                  style: OutlinedButton.styleFrom(
                      backgroundColor: AppColors.accentColor),
                  child: const Text(
                    "yes",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
