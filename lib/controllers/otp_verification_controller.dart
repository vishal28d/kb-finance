//flutter
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//packages
import 'package:get/get.dart';

class OtpVerificationController extends GetxController {
  ScrollController scrollController = ScrollController();

  //TextEditing
  var pinPutController = TextEditingController().obs();

  @override
  void onInit() async {
    super.onInit();
  }

  bool checkcontroller() {
    if (pinPutController.text == '') {
      return false;
    } else {
      return true;
    }
  }

  @override
  void onClose() {
    super.onClose();
  }

//reset controller filed
  void resetForm() {
    pinPutController.text = '';
  }
}
