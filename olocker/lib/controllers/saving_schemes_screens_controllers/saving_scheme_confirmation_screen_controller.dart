import 'package:get/get.dart';

import 'package:olocker/constants/api_url.dart';

class SavingSchemeConfirmationScreenController extends GetxController {

  final 
  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;

  ApiHeader apiHeader = ApiHeader();

  final size = Get.size;

  @override
  void onInit() {
    // TODO: implement onInit

    super.onInit();
  }
}
