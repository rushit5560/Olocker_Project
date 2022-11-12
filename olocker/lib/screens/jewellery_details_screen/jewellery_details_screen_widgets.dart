import 'dart:developer';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:olocker/constants/api_url.dart';
import 'package:olocker/constants/app_colors.dart';
import 'package:olocker/constants/app_images.dart';
import 'package:olocker/controllers/jeweller_details_screen_controller.dart';
import 'package:olocker/models/jeweller_details_screen_model/best_seller_model.dart';
import 'package:olocker/models/jeweller_details_screen_model/client_testimonials_model.dart';
import 'package:olocker/models/jeweller_details_screen_model/jewellery_type_model.dart';
import 'package:olocker/screens/jeweller_feedback_screen/jeweller_feedback_screen.dart';
import 'package:olocker/screens/jeweller_loyalty_point_screen/jeweller_loyalty_point_screen.dart';
import 'package:olocker/utils/extensions.dart';
import 'package:sizer/sizer.dart';

import '../../controllers/jewellery_details_screen_controller.dart';
import '../my_favourites_screen/my_favourites_screen.dart';

class JewelleryApproxPriceModule extends StatelessWidget {
  JewelleryApproxPriceModule({Key? key}) : super(key: key);
  final screenController = Get.find<JewelleryDetailsScreenController>();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text("87249.00"),
      ],
    ).commonAllSidePadding(10);
  }
}
