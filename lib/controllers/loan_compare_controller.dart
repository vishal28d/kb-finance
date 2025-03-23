//flutter
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//packages
import 'package:get/get.dart';

class LoanCompareController extends GetxController {
  ScrollController scrollController = ScrollController();

  //TextEditing
  var loanamount = TextEditingController();
  var tenure = TextEditingController();

  var ftenure = FocusNode();

  List<String> loanTypes = ["Home Loan", "Personal Loan", "Business Loan", "Loan Against Property"];
  dynamic loanTypeVal;

  @override
  void onInit() async {
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void resetForm() {
    loanamount.text = '';
  }

  void setLoanType(String name) {
    loanTypeVal = name;
    update();
  }
}
