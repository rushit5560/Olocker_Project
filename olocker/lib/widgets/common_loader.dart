import 'package:flutter/material.dart';

class CommonLoader {
  showCircularLoader() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
