import 'package:get/get.dart';

import 'package:olocker/constants/api_url.dart';

class SchemePaymentFailureScreenController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;

  ApiHeader apiHeader = ApiHeader();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }
}
