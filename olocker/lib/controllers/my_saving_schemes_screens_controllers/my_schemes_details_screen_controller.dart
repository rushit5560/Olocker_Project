import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:external_path/external_path.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:olocker/constants/api_url.dart';
import 'package:olocker/widgets/common_widgets.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import '../../models/my_saving_schemes_models/get_saving_schemes_list_model/get_saving_scheme_list_model.dart';
import '../../models/saving_scheme_screens_models/get_saving_scheme_list_models/get_saving_schemes_list_model.dart';
import '../../models/saving_scheme_screens_models/saving_schemes_success_failure_models/get_transaction_status_details_model.dart';

class MySchemesDetailsScreenController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;
  int savingSchemeSrNo = Get.arguments[0];
  GetCustomerPurchaseSavingSchemeData schemeData = Get.arguments[1];

  ApiHeader apiHeader = ApiHeader();
  GetSavingSchemeData? getSavingSchemeData;
  String jewellerLogo = '';

  List<TransactionData>? transactionsDataList;
  
  Dio dio = Dio();
  RxDouble downloadProgress = 0.0.obs;

  Future<void> getMySavingSchemeDetailsFunction() async {
    isLoading(true);

    String url = '${ApiUrl.getSavingSchemeDetailsApi}?SrNo=$savingSchemeSrNo';

    log('getMySavingSchemeDetailsFunction api url  : $url');

    try {
      http.Response response = await http.get(
        Uri.parse(url),
        headers: apiHeader.headers,
      );

      log("getMySavingSchemeDetailsFunction res body :: ${response.body}");

      GetSavingSchemesListModel getSavingSchemesListModel =
          GetSavingSchemesListModel.fromJson(json.decode(response.body));

      isSuccessStatus = getSavingSchemesListModel.success.obs;

      if (isSuccessStatus.value) {
        getSavingSchemeData = getSavingSchemesListModel.getSavingSchemeList[0];
        jewellerLogo = ApiUrl.apiImagePath + getSavingSchemeData!.partnerLogo;

        log('getSavingSchemeData schemeName ::: ${getSavingSchemeData!.schemeName}');
        log('getSavingSchemeData mobile no ::: ${getSavingSchemeData!.mobile}');

        // double totalAmount= 
      } else {
        log('getMySavingSchemeDetailsFunction false');
      }
    } catch (e) {
      log('getMySavingSchemeDetailsFunction error:$e');
      rethrow;
    } finally {
      // isLoading(false);
      getTransactionsListFunction();
    }
  }

  Future<void> getTransactionsListFunction() async {
    isLoading(true);
    String url =
        "${ApiUrl.getCustomerSavingTransactions}?SavingSchemeSrNo=${schemeData.savingSchemeSrNo}";

    // 10047";
    log('getTransactionsListFunction Api url : $url');

    try {
      http.Response response = await http.get(
        Uri.parse(url),
        headers: apiHeader.headers,
      );

      log("getTransactionsListFunction res body :: ${response.body}");

      GetTransactionStatusDetailsModel getTransactionStatusDetailsModel =
          GetTransactionStatusDetailsModel.fromJson(json.decode(response.body));
      var isSuccessStatus = getTransactionStatusDetailsModel.success.obs;

      if (isSuccessStatus.value) {
        transactionsDataList = getTransactionStatusDetailsModel.transactions;
        log('transactionsDataList : ${transactionsDataList!.length}');
        // log('transactionData.invoiceNo : ${transactionData.invoiceNo}');
      } else {
        log('getTransactionsListFunction Else');
      }

      // log("response : ${response.body}");

    } catch (e) {
      log('getTransactionsListFunction Error :$e');
      rethrow;
    } finally {
      isLoading(false);
    }
  }

  Future<bool> saveFile(String url, String fileName) async {
    log('url : $url');
    try {
      // if (await _requestPermission(Permission.storage)) {
        Directory? directory;
        directory = await getExternalStorageDirectory();
        String newPath = "";
        List<String> paths = directory!.path.split("/");
        for (int x = 1; x < paths.length; x++) {
          String folder = paths[x];
          if (folder != "Android") {
            newPath += "/$folder";
          } else {
            break;
          }
        }
        newPath = "$newPath/PDF_Download";
        directory = Directory(newPath);

        File saveFile = File("${directory.path}/$fileName");
        if (kDebugMode) {
          print(saveFile.path);
        }
        if (!await directory.exists()) {
          await directory.create(recursive: true);
        }
        if (await directory.exists()) {
          await Dio().download(
            url,
            saveFile.path,
          );
        }
      // }
      return true;
    } catch (e) {
      return false;
    }
  }

  @override
  void onInit() {
    getMySavingSchemeDetailsFunction();
    super.onInit();
  }


  downloadPdfFileFunction({required String url, required String fileName}) async {
    final appStorage = await ExternalPath.getExternalStoragePublicDirectory(ExternalPath.DIRECTORY_DOWNLOADS);
    final file = File("$appStorage/$fileName");
    var response = await dio.download(url, file);
    log('response : ${response.data}');
    // await dio.download(
    //     url,
    //     file,
    //   onReceiveProgress: (receivedBytes, totalBytes) {
    //     downloadProgress.value = receivedBytes / totalBytes;
    //     log('downloadProgress.value :${downloadProgress.value}');
    //   },
    //   deleteOnError: true,
    // ).then((value) {
    //   CommonWidgets().showBorderSnackBar(
    //     context: Get.context!,
    //     displayText: "File downloaded",
    //   );
    // });
  }

  /*downloadPdfFileFunction({required String url, required String fileName}) async {
    // CommonWidgets().showBorderSnackBar(
    //   context: Get.context!,
    //   displayText: "Please wait...",
    // );
      final file = await downloadFile(url, fileName);


      if(file != null) {
        log('File Path : ${file.path}');

        CommonWidgets().showBorderSnackBar(
          context: Get.context!,
          displayText: "File downloaded",
        );
      } else {
        CommonWidgets().showBorderSnackBar(
          context: Get.context!,
          displayText: "File not download",
        );
      }
  }*/

  /*Future<File?> downloadFile(String url, String fileName) async {
    try {
      final appStorage = await getApplicationDocumentsDirectory();
      final file = File("${appStorage.path}/$fileName");
      log('file1 :$url');
      log('file2 :$file');

      final response1 = await Dio().get(url);

      log('response1 : ${response1.statusMessage}');

      final raf = file.openSync(mode: FileMode.write);
      raf.writeByteSync(response1.data);
      await raf.close();

      return file;
    } catch(e) {
      log('downloadFile Error : $e');
      return null;
    }

  }*/

}
