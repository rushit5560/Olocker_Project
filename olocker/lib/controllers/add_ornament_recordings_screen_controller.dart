import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import '../constants/api_url.dart';
import '../constants/user_details.dart';
import '../models/ornament_recording_models/get_ornament_recording_model.dart';

class AddOrnamentRecordingsScreenController extends GetxController {
  final size = Get.size;

  RxBool isLoading = false.obs;

  ApiHeader apiHeader = ApiHeader();

  final ornamentRecordingFormKey = GlobalKey<FormState>();

  List<OrnamentHistoryDetail> ornamentHistoryDetailList = [];
  TrackingDetail? trackingDetail;

  TextEditingController activityDateController = TextEditingController();
  TextEditingController otherLocationOfJewelleryController =
      TextEditingController();
  TextEditingController exchangedAtShopNameController = TextEditingController();
  TextEditingController giftedToPersonController = TextEditingController();
  TextEditingController reasonForController = TextEditingController();
  TextEditingController relevantDocumentkeptController =
      TextEditingController();
  TextEditingController amountController = TextEditingController();
  // TextEditingController notesController = TextEditingController();
  TextEditingController notesController = TextEditingController();

  List<FormDDValue> selectActivityTypeList = [
    FormDDValue(
      id: 1,
      textValue: "Ornament Exchanged",
    ),
    FormDDValue(
      id: 2,
      textValue: "Ornament Gifted",
    ),
    FormDDValue(
      id: 3,
      textValue: "Ornament Given to Friend Or Relative",
    ),
    FormDDValue(
      id: 4,
      textValue: "Ornament Issued to Pawnbroker",
    ),
    FormDDValue(
      id: 5,
      textValue: "Ornament Melted Destroyed",
    ),
    FormDDValue(
      id: 6,
      textValue: "Ornament Received back",
    ),
    FormDDValue(
      id: 7,
      textValue: "Ornament Ornament Sent for Repair",
    ),
    FormDDValue(
      id: 8,
      textValue: "Others",
    ),
  ];

  FormDDValue? selectedActivityTypeName;

  List<FormDDValue> locationOfJewelleryTypeList = [
    FormDDValue(
      id: 1,
      textValue: "At Home",
    ),
    FormDDValue(
      id: 2,
      textValue: "At Locker",
    ),
    FormDDValue(
      id: 3,
      textValue: "At Other Place",
    ),
  ];

  FormDDValue? selectedlocationOfJewellery;

  void showDatePicker(ctx) {
    showCupertinoModalPopup(
      context: ctx,
      builder: (_) => Container(
        height: size.height * 0.4,
        // padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        color: const Color.fromARGB(255, 255, 255, 255),
        child: Column(
          children: [
            SizedBox(
              height: size.height * 0.32,
              child: CupertinoDatePicker(
                  mode: CupertinoDatePickerMode.date,
                  initialDateTime: DateTime.now(),
                  minimumYear: 1950,
                  maximumYear: DateTime.now().year,
                  onDateTimeChanged: (val) {
                    // 03/11/2019 date format
                    var dateFormat = DateFormat('yyyy/MM/dd');

                    var formattedDate = dateFormat.format(val);
                    log("selected op date is : : ${formattedDate}");

                    activityDateController.text = formattedDate;
                  }),
            ),
            // Close the modal
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Get.back();
              },
            )
          ],
        ),
      ),
    );
  }

  // Future<void> addOrnamentRecordingsFunction() async {
  //   try {
  //     isLoading(true);
  //     http.Response response = await http.get(
  //       Uri.parse(""),
  //       headers: apiHeader.headers,
  //     );
  //     log(" getOrnamentRecordingsListFunction url: ${response.request}");

  //     log("getOrnamentRecordingsListFunction st code is : ${response.statusCode}");
  //     log("getOrnamentRecordingsListFunction res body : ${response.body}");

  //     var resBody = jsonDecode(response.body);

  //     GetOrnamentRecordingsModel getOrnamentRecordingsModel =
  //         GetOrnamentRecordingsModel.fromJson(resBody);

  //     if (response.statusCode == 200) {
  //       log("getOrnamentRecordingsListFunction get success");

  //       ornamentHistoryDetailList =
  //           getOrnamentRecordingsModel.ornamentHistoryDetails;
  //       trackingDetail = getOrnamentRecordingsModel.trackingDetails[0];
  //     } else {
  //       log("getOrnamentRecordingsListFunction not success");
  //       //do nothing
  //     }
  //   } catch (e) {
  //     log("getOrnamentRecordingsListFunction Error ::: $e");
  //     rethrow;
  //   } finally {
  //     isLoading(false);
  //   }
  // }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }
}

class FormDDValue {
  FormDDValue({
    required this.id,
    required this.textValue,
  });

  int id;
  String textValue;
}
