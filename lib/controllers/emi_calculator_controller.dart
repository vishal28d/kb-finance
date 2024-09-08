
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EmiCalculatorController extends GetxController {
  // TextEditingControllers
  var loanamount1 = TextEditingController();
  var interestrate1 = TextEditingController();
  var duration1 = TextEditingController();
  var floanamount1 = FocusNode();
  var finterestrate1 = FocusNode();
  var fduration1 = FocusNode();


  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {
    // Dispose controllers and focus nodes
    loanamount1.dispose();
    interestrate1.dispose();
    duration1.dispose();
    floanamount1.dispose();
    finterestrate1.dispose();
    fduration1.dispose();
    super.onClose();
  }

  void resetForm() {
    loanamount1.text = '';
    interestrate1.text = '';
    duration1.text = '';

  }

 
}
