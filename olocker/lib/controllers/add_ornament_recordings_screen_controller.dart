import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:olocker/controllers/ornament_recordings_list_screen_controller.dart';
import 'package:olocker/widgets/common_widgets.dart';
import '../constants/api_url.dart';
import '../constants/user_details.dart';
import '../models/ornament_recording_models/get_ornament_recording_model.dart';

class AddOrnamentRecordingsScreenController extends GetxController {
  final size = Get.size;
  final custOraSrNo = Get.arguments[0];

  RxBool isLoading = false.obs;

  ApiHeader apiHeader = ApiHeader();

  final ornamentRecordingFormKey = GlobalKey<FormState>();

  List<OrnamentHistoryDetail> ornamentHistoryDetailList = [];
  TrackingDetail? trackingDetail;

  TextEditingController activityDateController = TextEditingController();
  TextEditingController otherLocationOfJewelleryController =
      TextEditingController();
  TextEditingController changeAtNameController = TextEditingController();
  TextEditingController ornamentWeightController = TextEditingController();
  TextEditingController reasonForController = TextEditingController();
  TextEditingController relevantDocumentkeptController =
      TextEditingController();
  TextEditingController amountController = TextEditingController();
  TextEditingController rateOfInterestController = TextEditingController();
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
                    log("selected op date is : : $formattedDate");

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

  Future<void> addOrnamentRecordingsFunction() async {
    if (ornamentRecordingFormKey.currentState!.validate()) {
      var url = ApiUrl.addTrackingDataApi;
      try {
        isLoading(true);
        Map<String, dynamic> requestMap = {
          "CustOraSrNo": custOraSrNo,
          "CustSrNo": UserDetails.customerId,
          "ActivityType": "${selectedActivityTypeName!.id}",
          "ActivityDate": activityDateController.text,
          "Giventoname": selectedActivityTypeName!.id == 8
              ? ""
              : changeAtNameController.text,
          "Reasonforexchange":
              selectedActivityTypeName!.id == 8 ? "" : reasonForController.text,
          "Weight": selectedActivityTypeName!.id == 5
              ? ornamentWeightController.text
              : selectedActivityTypeName!.id == 6
                  ? ornamentWeightController.text
                  : selectedActivityTypeName!.id == 7
                      ? ornamentWeightController.text
                      : null,
          "ReleventDocuments": selectedActivityTypeName!.id == 3
              ? ""
              : selectedActivityTypeName!.id == 8
                  ? ""
                  : relevantDocumentkeptController.text,
          "Notes": notesController.text,
          "RateOfInterest": selectedActivityTypeName!.id == 1
              ? 0
              : selectedActivityTypeName!.id == 2
                  ? 0
                  : selectedActivityTypeName!.id == 3
                      ? 0
                      : selectedActivityTypeName!.id == 5
                          ? 0
                          : selectedActivityTypeName!.id == 6
                              ? 0
                              : selectedActivityTypeName!.id == 7
                                  ? 0
                                  : selectedActivityTypeName!.id == 8
                                      ? 0
                                      : int.parse(
                                          rateOfInterestController.text),
          "Amountexchange": selectedActivityTypeName!.id == 3
              ? 0
              : selectedActivityTypeName!.id == 6
                  ? 0
                  : selectedActivityTypeName!.id == 7
                      ? 0
                      : selectedActivityTypeName!.id == 8
                          ? 0
                          : int.parse(amountController.text),
          "CurrentJewelleryLocation": selectedlocationOfJewellery!.id,
          "OtherLocation": selectedlocationOfJewellery!.id == 3
              ? otherLocationOfJewelleryController.text
              : ""
        };

        http.Response response = await http.post(
          Uri.parse(url),
          headers: apiHeader.headers,
          body: jsonEncode(requestMap),
        );

        log("addOrnamentRecordingsFunction st code is : ${response.statusCode}");
        log("addOrnamentRecordingsFunction res body : ${response.body}");

        final recordingsListController =
            Get.find<OrnamentRecordingsListScreenController>();
        // var resBody = jsonDecode(response.body);

        // AddRecordingResponseModel addRecordingResponseModel =
        //     AddRecordingResponseModel.fromJson(resBody);

        if (response.statusCode == 200) {
          log("addOrnamentRecordingsFunction get success");

          Get.back();
          recordingsListController.getOrnamentRecordingsListFunction();

          CommonWidgets().showBorderSnackBar(
            context: Get.context!,
            displayText: "Ornament Recording Added Successfully.",
          );
        } else {
          CommonWidgets().showBorderSnackBar(
            context: Get.context!,
            displayText: "Ornament Recording Failed to add.",
          );
          log("addOrnamentRecordingsFunction not success");
          //do nothing
        }
      } catch (e) {
        log("addOrnamentRecordingsFunction Error ::: $e");
        rethrow;
      } finally {
        isLoading(false);
      }
    }
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
