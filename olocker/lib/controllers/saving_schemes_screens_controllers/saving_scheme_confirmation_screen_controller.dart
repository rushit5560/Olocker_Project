import 'package:get/get.dart';

import '../../models/saving_scheme_screens_models/saving_scheme_enroll_screen_models/add_enroll_saving_scheme_model.dart';

class SavingSchemeConfirmationScreenController extends GetxController {
  String schemeImagePath = Get.arguments[0];
  String schemeName = Get.arguments[1];
  String schemeTagLine = Get.arguments[2];
  SavingSchemeDetails savingSchemeDetails = Get.arguments[3];
  PartnerSavingSchemeDetails partnerSavingSchemeDetails = Get.arguments[4];
  String jewellerLogo = Get.arguments[5];
  String jewellerName = Get.arguments[6];

  RxBool termConditionCheckValue = false.obs;

  // final RxBool isLoading = false.obs;
  // RxBool isSuccessStatus = false.obs;
  // ApiHeader apiHeader = ApiHeader();

  final size = Get.size;

}
