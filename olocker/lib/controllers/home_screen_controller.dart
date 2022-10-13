import 'dart:developer';
import 'package:get/get.dart';
import 'package:olocker/constants/api_url.dart';
import 'package:http/http.dart' as http;



class HomeScreenController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;
  final size = Get.size;
  // final scaffoldKey = GlobalKey<ScaffoldState>();

  ApiHeader apiHeader = ApiHeader();

  RxBool smartDealsSwitch = false.obs;


  Future<void> getMyJewellersFunction() async {
    isLoading(true);
    String url = '${ApiUrl.myJewellersApi}?customerId=1';

    try {

      Map<String, dynamic> bodyData = {};

      http.Response response = await http.post(
        Uri.parse(url),
        headers: apiHeader.headers,
        body: bodyData,
      );

      log('response :${response.body}');

    } catch(e) {
     log('getMyJewellersFunction Error :$e');
    }



  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void dispose() {
    super.dispose();
  }
}
