//flutter
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//packages
import 'package:get/get.dart';

class LoanApplicationController extends GetxController {
  //objects
  ScrollController scrollController = ScrollController();

  //TextEditing
  var fullname = TextEditingController();
  var cfromdate = TextEditingController();
  var ctodate = TextEditingController();

  var ftodate = FocusNode();
  var ffromdate = FocusNode();

  List<String> loantypelist = ['Home', 'Personal', 'Business', 'Property Against'];
  dynamic loantypelistVal;

  List<String> loanstatus = [
    'pending',
    'sanction',
  ];
  dynamic loanstatusVal;

  @override
  void onInit() async {
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void resetForm() {
    fullname.text = '';
  }
}
