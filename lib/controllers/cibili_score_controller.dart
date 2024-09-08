//flutter
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//packages
import 'package:get/get.dart';
//contoller

class CIBILScoreController extends GetxController {
  ScrollController scrollController = ScrollController();

  //TextEditing
  var mobileno = TextEditingController();
  var panno = TextEditingController();

  var fmobileno = FocusNode();

  @override
  void onInit() async {
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void resetForm() {
    panno.text = '';
  }
}
