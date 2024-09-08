//flutter
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//packages
import 'package:get/get.dart';

class LeadsController extends GetxController {
  //objects

  ScrollController scrollController = ScrollController();
  //TextEditing
  var fullname = TextEditingController();
  var mobileno = TextEditingController();
  var aadharno = TextEditingController();
  var panno = TextEditingController();
  var location = TextEditingController();
  var email = TextEditingController();
  var loanamount = TextEditingController();
  //focusnode
  var fmobileno = FocusNode();
  var faadharno = FocusNode();
  var fpanno = FocusNode();
  var flocation = FocusNode();
  var femail = FocusNode();
  var floanamount = FocusNode();

  List<String> employmenttypelist = ['Self employee', 'saleried'];
  dynamic employmenttypeVal;
  List<String> loantypelist = ['Home', 'Personal', 'Business', 'Property Against'];
  dynamic loantypelistVal;

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
