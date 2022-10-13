import 'package:flutter/material.dart';

class CommonLoader {
  showOverlayLoader(bool isLoading) {
    if (isLoading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
    // const Opacity(
    //   opacity: 0.5,
    //   child: ModalBarrier(dismissible: false, color: Colors.black),
    // );
  }
}
