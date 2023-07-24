import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:external_path/external_path.dart';
// import 'package:file_utils/file_utils.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
// import 'package:intl/intl.dart';
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
int isStatusCode=0;
  List<TransactionData>? transactionsDataList;
  
  Dio dio = Dio();
  RxDouble downloadProgress = 0.0.obs;

  Future<void> getMySavingSchemeDetailsFunction() async {
    isLoading(true);

    String url = '${ApiUrl.getSavingSchemeDetailsApi}?SrNo=${schemeData.savingSchemeSrNo}';

    log('getMySavingSchemeDetailsFunction api url  : $url');

    try {
      http.Response response = await http.get(
        Uri.parse(url),
        headers: apiHeader.headers,
      );

      log("getMySavingSchemeDetailsFunction res body :: ${response.body}");

      /*GetSavingSchemesListModel getSavingSchemesListModel =
          GetSavingSchemesListModel.fromJson(json.decode(response.body));

      // isSuccessStatus = getSavingSchemesListModel.success.obs;
      isStatusCode =getSavingSchemesListModel.statusCode;
      if (isStatusCode==200) {
        getSavingSchemeData = getSavingSchemesListModel.data.getSavingSchemeList[0];
        jewellerLogo = ApiUrl.apiImagePath + getSavingSchemesListModel.data.partnerLogo;
        // jewellerLogo = ApiUrl.apiImagePath + getSavingSchemeData!.partnerLogo;

        log('getSavingSchemeData schemeName ::: ${getSavingSchemeData!.schemeName}');
        log('getSavingSchemeData mobile no ::: ${getSavingSchemeData!.mobile}');

        // double totalAmount= 
      } else {
        log('getMySavingSchemeDetailsFunction false');
        if (isStatusCode == 400) {
          log("BadRequest");
        } else if (isStatusCode == 404) {
          log("NotFound");
        } else if (isStatusCode == 406) {
          log("NotAcceptable");
        } else if (isStatusCode == 417) {
          log("HttpStatusCode.ExpectationFailed");
        }
      }*/
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
      // var isSuccessStatus = getTransactionStatusDetailsModel.success.obs;
isStatusCode=getTransactionStatusDetailsModel.statusCode;
      if (isStatusCode==200) {
        transactionsDataList = getTransactionStatusDetailsModel.data.transactions;
        log('transactionsDataList : ${transactionsDataList!.length}');
        // log('transactionData.invoiceNo : ${transactionData.invoiceNo}');
      } else {
        log('getTransactionsListFunction Else');
        if (isStatusCode == 400) {
          log("BadRequest");
        } else if (isStatusCode == 404) {
          log("NotFound");
        } else if (isStatusCode == 406) {
          log("NotAcceptable");
        } else if (isStatusCode == 417) {
          log("HttpStatusCode.ExpectationFailed");
        }
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


  /// Download Pdf from Server function

  var progress = "";
  bool downloading = false;
  var path = "No Data";


  Future<void> downloadFile(String url) async {

    List<String> nameList = url.split("/");
    String fileName = "";
    for(int i=0; i < nameList.length; i++) {
      log('nameList : ${nameList[i]}');
      fileName = nameList[i];
    }

    Dio dio = Dio();

    final status = await Permission.storage.request();

    if (status.isGranted) {
      String dirLocation = "";

      if (Platform.isAndroid) {
        dirLocation = "${ExternalPath.getExternalStoragePublicDirectory(ExternalPath.DIRECTORY_DOWNLOADS)}";
      } else {
        dirLocation = (await getApplicationDocumentsDirectory()).path;
      }

      try {
        CommonWidgets().showBorderSnackBar(context: Get.context!, displayText: "Downloading");
        // FileUtils.mkdir([dirLocation]);
        await dio.download(
          "https://www.w3.org/WAI/ER/tests/xhtml/testfiles/resources/pdf/dummy.pdf",
          "$dirLocation$fileName",
          onReceiveProgress: (receivedBytes, totalBytes) {
            log('here 1');
            downloading = true;
            progress = "${((receivedBytes / totalBytes) * 100).toStringAsFixed(0)}%";
            log(progress);
          },
        );
      } catch(e) {
        log('catch catch catch :$e');
        rethrow;
      }

      downloading = false;
      progress = "Download Completed.";
      path = "$dirLocation$fileName";
      ScaffoldMessenger.of(Get.context!).hideCurrentSnackBar();
      CommonWidgets().showBorderSnackBar(context: Get.context!, displayText: "Download Complete");
      log(path);
      log('here give alert-->completed');

    }
    else {
        progress = "Permission Denied!";
    }
  }

  @override
  void onInit() {
    getMySavingSchemeDetailsFunction();
    super.onInit();
  }


  /*downloadPdfFileFunction({required String url, required String fileName}) async {
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
  }*/

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
