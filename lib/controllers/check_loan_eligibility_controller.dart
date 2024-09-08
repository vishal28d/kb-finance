//flutter
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//packages
import 'package:get/get.dart';
//contoller

class LoanEligibilityController extends GetxController {
  ScrollController scrollController = ScrollController();

  //TextEditing
  var tenure = TextEditingController();
  var loanamount = TextEditingController();
  var annualintesrstrate = TextEditingController();
  var monthlyemiamount = TextEditingController();
  var floanamount = FocusNode();
  var fannualintesrstrate = FocusNode();
  var fmonthlyemiamount = FocusNode();

  @override
  void onInit() async {
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void resetForm() {
    tenure.text = '';
  }
}
