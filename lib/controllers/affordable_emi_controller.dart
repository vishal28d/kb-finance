import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AffordableEmiCalculatorController extends GetxController {
  var emiAmount = 0.0.obs;
  var annualInterestRate = 0.0.obs;
  var tenureMonths = 0.0.obs;
  var affordableAmount = 0.0.obs;
  var totalInterestPayable = 0.0.obs;
  var isCalculated = false.obs;

  TextEditingController emiAmountController = TextEditingController();
  TextEditingController annualInterestRateController = TextEditingController();
  TextEditingController yearsController = TextEditingController();
  TextEditingController monthsController = TextEditingController();
  TextEditingController daysController = TextEditingController();

  FocusNode emiAmountFocusNode = FocusNode();
  FocusNode annualInterestRateFocusNode = FocusNode();
  FocusNode yearsFocusNode = FocusNode();
  FocusNode monthsFocusNode = FocusNode();
  FocusNode daysFocusNode = FocusNode();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {
  
    // emiAmountController.dispose();
    // annualInterestRateController.dispose();
    // yearsController.dispose();
    // monthsController.dispose();
    // daysController.dispose();

    // emiAmountFocusNode.dispose();
    // annualInterestRateFocusNode.dispose();
    // yearsFocusNode.dispose();
    // monthsFocusNode.dispose();
    // daysFocusNode.dispose();

    super.onClose();
  }

  void calculateAffordableAmount() {
    // Reset the tenureMonths
    tenureMonths.value = 0;

    // Update the values from the controllers
    emiAmount.value = double.tryParse(emiAmountController.text) ?? 0.0;
    annualInterestRate.value = double.tryParse(annualInterestRateController.text) ?? 0.0;

    // Calculate tenure in months
    double years = double.tryParse(yearsController.text) ?? 0.0;
    double months = double.tryParse(monthsController.text) ?? 0.0;
    double days = double.tryParse(daysController.text) ?? 0.0;
    tenureMonths.value = (years * 12) + months + (days / 30);

    if (!validateValues()) {
      affordableAmount.value = 0.0;
      totalInterestPayable.value = 0.0;
      return;
    }

    double monthlyInterestRate = annualInterestRate.value / 12 / 100;
    double tenure = tenureMonths.value;

    // Calculate total payment (P)
    double totalPayment = emiAmount.value * tenure;

    // Calculate loan amount (L) using the formula
    double loanAmount = (emiAmount.value * (1 - pow(1 + monthlyInterestRate, -tenure))) / monthlyInterestRate;

    affordableAmount.value = loanAmount;

    // Calculate total interest payable
    totalInterestPayable.value = (emiAmount.value * tenure) - affordableAmount.value;

    isCalculated.value = true;
  }

  bool validateValues() {
    if (emiAmount.value <= 0 || annualInterestRate.value <= 0 || tenureMonths.value <= 0) {
      Get.snackbar(
        'Invalid Input',
        'All input values must be greater than zero.',
        backgroundColor: Colors.red,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
      );
      return false;
    }

    if (emiAmount.value > 1e12 || annualInterestRate.value > 10000 || tenureMonths.value > 36000) {
      Get.snackbar(
        'Invalid Input',
        'Values entered are too large. Please enter smaller values.',
        backgroundColor: Colors.red,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
      );
      return false;
    }

    return true;
  }
}
