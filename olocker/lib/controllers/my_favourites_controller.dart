import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:olocker/models/favourites_model/favourites_model.dart';
import '../constants/api_url.dart';
import '../constants/user_details.dart';

class MyFavouritesScreenController extends GetxController {
  final size = Get.size;

  final String partnerSRno = Get.arguments[0];

  RxBool isLoading = false.obs;

  List<FavProduct> favouriteProductsList = [];

  ApiHeader apiHeader = ApiHeader();

  Future<void> getFavouriteProductsFunction() async {
    String url =
        "${ApiUrl.getFavProductApi}?customerId=${UserDetails.customerId}&PartnerSRno=$partnerSRno";
    log("getFavouriteProducts Api Url : $url");

    try {
      isLoading(true);
      http.Response response = await http.get(
        Uri.parse(url),
        headers: apiHeader.headers,
      );

      FavouritesModel favouritesModel =
          FavouritesModel.fromJson(json.decode(response.body));

      log('getFavouriteProducts response.body is  : ${response.body}');
      var isSuccessStatus = favouritesModel.success.obs;

      if (isSuccessStatus.value) {
        favouriteProductsList.clear();
        favouriteProductsList = favouritesModel.favProduct;
        log('getFavouriteProducts list count is  : ${favouriteProductsList.length}');
      } else {
        log('get FavouriteProductsFunction Else');
      }
    } catch (e) {
      log("get FavouriteProductsFunction Error :$e");
      rethrow;
    } finally {
      isLoading(false);
    }
  }

  Future<void> deleteFavouriteProductFunction({required int id}) async {
    String url = "${ApiUrl.deleteFavProductApi}?Id=$id";
    log("deleteFavouriteProductFunction Api Url : $url");

    try {
      isLoading(true);
      http.Response response = await http.get(
        Uri.parse(url),
        headers: apiHeader.headers,
      );

      var resBody = jsonDecode(response.body);

      log('deleteFavouriteProductFunction response.body is  : ${response.body}');
      var isSuccessStatus = resBody["success"];

      if (isSuccessStatus) {
        log('deleteFavouriteProductFunction  if success');
      } else {
        log('get deleteFavouriteProductFunction Else');
      }
    } catch (e) {
      log("get deleteFavouriteProductFunction Error :$e");
      rethrow;
    } finally {
      getFavouriteProductsFunction();
      // isLoading(false);
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    getFavouriteProductsFunction();
    super.onInit();
  }
}
