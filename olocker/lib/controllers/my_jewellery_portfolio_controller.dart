import 'dart:convert';
import 'dart:developer';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../constants/api_url.dart';
import '../constants/user_details.dart';
import '../models/jewellery_models/jewellery_portfolio_get_model.dart';

class MyJewelleryPortFolioScreenController extends GetxController {
  final size = Get.size;

  RxBool isLoading = false.obs;
  RxBool isSuccessResult = false.obs;
  int isStatusCode = 0;
  List<InsuredOrnament> insuredOrnamentsList = [];
  List<UnInsuredOrnament> unInsuredOrnamentsList = [];
  List<TotalJewelleryPortfolio> totalJewelleryPortfolioList = [];

  ApiHeader apiHeader = ApiHeader();

  Future<void> getJewelleryPortFolioDetailsFunction() async {
    // if (formKey.currentState!.validate()) {
    String url =
        "${ApiUrl.getJewelleryPortfolioApi}?customerId=${UserDetails.customerId}";
    log(" getJewelleryPortFolioDetailsFunction url: $url");

    try {
      isLoading(true);
      http.Response response = await http.get(
        Uri.parse(url),
        headers: apiHeader.headers,
      );

      log("getJewelleryPortFolioDetailsFunction st code is : ${response.statusCode}");
      log("getJewelleryPortFolioDetailsFunction res body : ${response.body}");

      // var resBody = jsonDecode(response.body);

      JewelleryPortFolioGetModel jewelleryPortFolioGetModel = JewelleryPortFolioGetModel.fromJson(json.decode(response.body));

      // isSuccessResult.value = jewelleryPortFolioGetModel.success;
      isStatusCode = jewelleryPortFolioGetModel.statusCode;
      if (isStatusCode == 200) {
        log("getJewelleryPortFolioDetailsFunction get success");
        totalJewelleryPortfolioList = jewelleryPortFolioGetModel.data.totalJewelleryPortfolio;
        insuredOrnamentsList = jewelleryPortFolioGetModel.data.insuredOrnaments;
        unInsuredOrnamentsList = jewelleryPortFolioGetModel.data.unInsuredOrnaments;

        log('totalJewelleryPortfolioList Length Inner : ${totalJewelleryPortfolioList.length}');
        log('insuredOrnamentsList Length Inner : ${insuredOrnamentsList.length}');
        log('unInsuredOrnamentsList Length Inner : ${unInsuredOrnamentsList.length}');
      } else {
        log("getJewelleryPortFolioDetailsFunction get not success");
        //do nothing
      }
    } catch (e) {
      log("getJewelleryPortFolioDetailsFunction Error ::: $e");
      rethrow;
    } finally {
      isLoading(false);
    }
    // }
  }

  @override
  void onInit() {
    getJewelleryPortFolioDetailsFunction();
    super.onInit();
  }
}
