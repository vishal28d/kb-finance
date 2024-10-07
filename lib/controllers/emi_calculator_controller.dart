import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:math'; // For interest calculations
import 'package:intl/intl.dart'; // For formatting dates

class EmiCalculatorController extends GetxController with WidgetsBindingObserver {
  // TextEditingControllers for the input fields
  TextEditingController loanAmountController = TextEditingController();
  TextEditingController interestRateController = TextEditingController();
  TextEditingController yearsController = TextEditingController();
  TextEditingController monthsController = TextEditingController();
  TextEditingController daysController = TextEditingController();

  // FocusNodes to manage focus on the input fields
  FocusNode loanAmountFocusNode = FocusNode();
  FocusNode interestRateFocusNode = FocusNode();
  FocusNode yearsFocusNode = FocusNode();
  FocusNode monthsFocusNode = FocusNode();
  FocusNode daysFocusNode = FocusNode();

  // Observables to manage state
  var loanAmount = 0.0.obs;
  var annualInterestRate = 0.0.obs;
  var loanTermMonths = 0.obs;
  // var repaymentSchedule = <Map<String, dynamic>>[].obs;

  @override
  void onInit() {
    super.onInit();
    // Add this controller as an observer for app lifecycle events
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    // No need to dispose controllers and focus nodes here
  }

  @override
  void onClose() {
    // Remove observer on page close
    WidgetsBinding.instance.removeObserver(this); 
    super.onClose();
  }

  // Method to reset the form and clear all fields
  void resetForm() {
    loanAmountController.clear();
    interestRateController.clear();
    yearsController.clear();
    monthsController.clear();
    daysController.clear();
    loanAmount.value = 0.0;
    annualInterestRate.value = 0.0;
    loanTermMonths.value = 0;
    repaymentSchedule.clear();
  }

  // Method to calculate EMI and generate the repayment schedule
  void calculateEmi() {
    // Parse the input values from the text fields
    double loanAmountValue = double.tryParse(loanAmountController.text) ?? 0.0;
    double annualInterestRateValue = double.tryParse(interestRateController.text) ?? 0.0;
    int yearsValue = int.tryParse(yearsController.text) ?? 0;
    int monthsValue = int.tryParse(monthsController.text) ?? 0;
    int daysValue = int.tryParse(daysController.text) ?? 0;

    // Convert the loan term into months, accounting for years, months, and days
    int loanTermMonthsValue = (yearsValue * 12) + monthsValue + (daysValue ~/ 30);

    // Update observables with parsed values
    loanAmount.value = loanAmountValue;
    annualInterestRate.value = annualInterestRateValue;
    loanTermMonths.value = loanTermMonthsValue;

    generateRepaymentSchedule();
  }

  // Method to generate the repayment schedule
  void generateRepaymentSchedule() {
    double loanAmountValue = loanAmount.value;
    double annualInterestRateValue = annualInterestRate.value;
    int loanTermMonthsValue = loanTermMonths.value;

    // Calculate monthly interest rate
    double monthlyInterestRate = annualInterestRateValue / 12 / 100;

    // Formula to calculate EMI
    double emi = (loanAmountValue * monthlyInterestRate) /
        (1 - pow(1 + monthlyInterestRate, -loanTermMonthsValue));

    double remainingBalance = loanAmountValue;
    List<Map<String, dynamic>> schedule = [];

    // Loop through each month to create the repayment schedule
    for (int i = 0; i < loanTermMonthsValue; i++) {
      double interestPayment = remainingBalance * monthlyInterestRate;
      double principalPayment = emi - interestPayment;
      remainingBalance -= principalPayment;

      // Calculate payment date
      DateTime paymentDate = DateTime.now().add(Duration(days: i * 30));
      String monthName = DateFormat('MMMM yyyy').format(paymentDate);

      schedule.add({
        'paymentNo': i + 1,
        'paymentDate': monthName,
        'beginningBalance': i == 0 ? loanAmountValue : schedule[i - 1]['endingBalance'],
        'payment': emi,
        'principal': principalPayment,
        'interest': interestPayment,
        'endingBalance': max(remainingBalance, 0),
      });
    }

    // Update the repayment schedule observable
    repaymentSchedule.value = schedule;     
  }



   
  RxList<Map<String, dynamic>> repaymentSchedule = <Map<String, dynamic>>[].obs;

  void initializeRepaymentSchedule(double loanAmount, double annualInterestRate, double loanTermMonths) {
    repaymentSchedule.clear();

    double monthlyInterestRate = annualInterestRate / 12 / 100;
    double totalMonths = loanTermMonths;
    double emi = (loanAmount * monthlyInterestRate * pow((1 + monthlyInterestRate), totalMonths)) /
        (pow((1 + monthlyInterestRate), totalMonths) - 1);

    double balance = loanAmount;

    for (int i = 1; i <= totalMonths; i++) {
      double interest = balance * monthlyInterestRate;
      double principal = emi - interest;
      balance -= principal;

      repaymentSchedule.add({
        'paymentNo': i,
        'principal': principal,
        'interest': interest,
        'endingBalance': balance > 0 ? balance : 0,
      });
    }
  }
}

 




