import 'package:flutter/material.dart';
import 'package:flutter_super_html_viewer/flutter_super_html_viewer.dart';
import 'package:get/get.dart';

import '../../constants/app_colors.dart';
import '../../utils/appbar_style.dart';

class TermsAndConditionsScreen extends StatelessWidget {
  const TermsAndConditionsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffdac0),
      appBar: AppBar(
        backgroundColor: const Color(0xffffdac0),
        title: Text(
          'Terms & Conditions',
          style: TextStyleConfig.appbarTextStyle(),
        ),
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(Icons.arrow_back_ios, color: AppColors.blackColor),
        ),
        elevation: 0,
      ),
      body: const HtmlContentViewer(
        htmlContent: 'Terms & Conditions',
      ),
    );
  }
}
