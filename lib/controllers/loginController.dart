//flutter
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//packages
import 'package:get/get.dart';

class LoginController extends GetxController {
  ScrollController scrollController = ScrollController();

  //TextEditing
  var mobileNumber = TextEditingController();
  var refferalcode = TextEditingController();
  var dsacode = TextEditingController();
  bool agree = false.obs();

  void setAgree() {
    agree = !agree;
    update();
  }

  @override
  void onInit() async {
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void resetForm() {
    mobileNumber.text = '';
  }
}
