//Application Id
import 'package:credit_app/controllers/imageController.dart';
import 'package:credit_app/controllers/personal_loan_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

ImageControlller imageController = Get.find<ImageControlller>();
PersonalLoanController personalLoanController = Get.find<PersonalLoanController>();
String appId = "credit_app";
String? languageCode;
List<String> rtlLanguageCodeLList = ['ar', 'arc', 'ckb', 'dv', 'fa', 'ha', 'he', 'khw', 'ks', 'ps', 'ur', 'uz_AF', 'yi'];

bool isRTL = false;
bool smaDone = false;
bool contactDone = false;
bool storageDone = false;
bool locationDone = false;
bool cameraDone = false;
String currencySymbol = '₹';

String baseUrl = "http://192.168.29.220:9090/customers/";

Future<Map<String, String>> getApiHeaders(bool authorizationRequired) async {
  Map<String, String> apiHeader = new Map<String, String>();

  if (authorizationRequired) {
    apiHeader.addAll({"Authorization": appId});
  } else {
    apiHeader.addAll({"Authorization": appId});
  }

  apiHeader.addAll({"Content-Type": "application/json"});
  apiHeader.addAll({"Accept": "application/json"});
  print(apiHeader);
  return apiHeader;
}

showSnackBar(String title, String text) {
  return Get.snackbar(title, text, dismissDirection: DismissDirection.horizontal, showProgressIndicator: true, isDismissible: true, duration: Duration(seconds: 2), snackPosition: SnackPosition.BOTTOM);
}
