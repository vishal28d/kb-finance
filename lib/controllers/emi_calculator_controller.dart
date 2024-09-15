import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:math'; // For interest calculations
import 'package:intl/intl.dart'; // For formatting dates

class EmiCalculatorController extends GetxController {
  // TextEditingControllers
  var loanamount1 = TextEditingController();
  var interestrate1 = TextEditingController();
  var duration1 = TextEditingController();
  var floanamount1 = FocusNode();
  var finterestrate1 = FocusNode();
  var fduration1 = FocusNode();

  // Observables
  var loanAmount = 0.0.obs;
  var annualInterestRate = 0.0.obs;
  var loanTermMonths = 0.obs;
  var repaymentSchedule = <Map<String, dynamic>>[].obs;

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
    loanAmount.value = 0.0;
    annualInterestRate.value = 0.0;
    loanTermMonths.value = 0;
    repaymentSchedule.clear();
  }

  void calculateEmi() {
    double loanAmountValue = double.tryParse(loanamount1.text) ?? 0.0;
    double annualInterestRateValue = double.tryParse(interestrate1.text) ?? 0.0;
    int loanTermMonthsValue = int.tryParse(duration1.text) ?? 0;

    // Update observables
    loanAmount.value = loanAmountValue;
    annualInterestRate.value = annualInterestRateValue;
    loanTermMonths.value = loanTermMonthsValue;

    generateRepaymentSchedule();
  }

  void generateRepaymentSchedule() {
    double loanAmountValue = loanAmount.value;
    double annualInterestRateValue = annualInterestRate.value;
    int loanTermMonthsValue = loanTermMonths.value;

    double monthlyInterestRate = annualInterestRateValue / 12 / 100;
    double monthlyPayment = (loanAmountValue * monthlyInterestRate) /
        (1 - pow(1 + monthlyInterestRate, -loanTermMonthsValue));

    double remainingBalance = loanAmountValue;
    List<Map<String, dynamic>> schedule = [];

    for (int i = 0; i < loanTermMonthsValue; i++) {
      double interestPayment = remainingBalance * monthlyInterestRate;
      double principalPayment = monthlyPayment - interestPayment;
      remainingBalance -= principalPayment;

      DateTime paymentDate = DateTime.now().add(Duration(days: i * 30)); // Approximate date
      String monthName = DateFormat('MMMM yyyy').format(paymentDate);

      schedule.add({
        'paymentNo': i + 1,
        'paymentDate': monthName,
        'beginningBalance': i == 0 ? loanAmountValue : schedule[i - 1]['endingBalance'],
        'payment': monthlyPayment,
        'principal': principalPayment,
        'interest': interestPayment,
        'endingBalance': max(remainingBalance, 0),
      });
    }

    repaymentSchedule.value = schedule;
  }
}
