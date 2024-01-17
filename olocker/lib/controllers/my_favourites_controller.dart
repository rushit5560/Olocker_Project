import 'dart:convert';
import 'dart:developer';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:olocker/models/favourites_model/favourites_model.dart';
import 'package:olocker/widgets/common_widgets.dart';
import '../constants/api_url.dart';
import '../constants/user_details.dart';
import '../models/favourites_model/categorize_fav_products_model.dart';

class MyFavouritesScreenController extends GetxController {
  final size = Get.size;

  // final String partnerSRno = Get.arguments[0];
  var jewellerId = Get.arguments[0]; // Coming From Home Screen Jeweller List
  int isStatusCode = 0;
  RxBool isLoading = false.obs;

  List<FavProduct> favouriteProductsList = [];

  List<String> jewelCatStringslist = [];
  List<CategorizedProduct> categorizedProductsList = [];

  ApiHeader apiHeader = ApiHeader();

  Future<void> getFavouriteProductsFunction() async {
    // String url = "${ApiUrl.getFavProductApi}?customerId=${UserDetails.customerId}&PartnerSRno=$partnerSRno";
    String url =
        "${ApiUrl.getFavProductApi}?CustomerId=${UserDetails.customerId}";
    log("getFavouriteProducts Api Url : $url");

    try {
      isLoading(true);
      http.Response response = await http.get(
        Uri.parse(url),
        headers: apiHeader.headers,
      );
      log('getFavouriteProducts response.body is  : ${response.body}');


      FavouritesModel favouritesModel =
          FavouritesModel.fromJson(json.decode(response.body));

      // var isSuccessStatus = favouritesModel.success.obs;
      isStatusCode = favouritesModel.statusCode;
      if (isStatusCode == 200) {
        favouriteProductsList.clear();
        categorizedProductsList.clear();
        favouriteProductsList = favouritesModel.data.favProduct;
        log('getFavouriteProducts list count is  : ${favouriteProductsList.length}');

        List<FavProduct> demoFavProdList = [];
        for (var item in favouriteProductsList) {
          if (jewelCatStringslist.contains(item.productDetails.itemTypeName)) {
            demoFavProdList.add(item);
          } else {
            jewelCatStringslist.add(item.productDetails.itemTypeName);
            demoFavProdList.add(item);
          }
        }
        for (var element in jewelCatStringslist) {
          String typeName = "";

          List<FavProduct> typeProductsList = [];
          // log("jewelCatString is :: $element");
          for (var single in demoFavProdList) {
            if (element == single.productDetails.itemTypeName) {
              log("if the $element is same");
              typeName = element;
              if (single != null) {
                typeProductsList.add(single);
              }
            } else {
              // log("if the $element is not same");
              // typeName = "";
              // typeProductsList.clear();
              // typeName = "";
              // typeProductsList.clear();
            }
          }
          if (typeProductsList.isNotEmpty) {
            categorizedProductsList.add(
              CategorizedProduct(
                itemTypeName: typeName,
                favProductsList: typeProductsList,
              ),
            );
          }
        }
        log("categorizedProductsList length is :: ${categorizedProductsList.length}");
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
    String url = "${ApiUrl.removeFavProductApi}?Id=$id";
    log("deleteFavouriteProductFunction Api Url : $url");

    try {
      isLoading(true);
      http.Response response = await http.get(
        Uri.parse(url),
        headers: apiHeader.headers,
      );

      var resBody = jsonDecode(response.body);

      log('deleteFavouriteProductFunction response.body is  : ${response.body}');
      // var isSuccessStatus = resBody["success"];

      if (response.statusCode == 200) {
        log('deleteFavouriteProductFunction  if success');
        CommonWidgets().showBorderSnackBar(
          context: Get.context!,
          displayText: "Item deleted from favourites.",
        );
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
