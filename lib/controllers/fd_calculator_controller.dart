import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class FixedDepositController extends GetxController {
  // These values will be used after clicking "Calculate"
  var fdAmount = 0.0.obs;
  var rateOfInterest = 0.0.obs;
  var tenureYears = 0.obs;
  var tenureMonths = 0.obs;
  var tenureDays = 0.obs;
  var fdStartDate = DateTime.now().obs;

  // Temporary values used before clicking "Calculate"
  var tempFdAmount = 0.0.obs;
  var tempRateOfInterest = 0.0.obs;
  var tempYears = 0.obs;
  var tempMonths = 0.obs;
  var tempDays = 0.obs;

  var isCalculated = false.obs;

  // Method to calculate the maturity amount and tenure
  void calculateMaturityAmount() {
    // Perform validation checks on the values here
    if (tempFdAmount.value <= 0 || tempRateOfInterest.value <= 0) {
      Get.snackbar("Error", "FD Amount or Interest Rate must be greater than 0" , backgroundColor: Colors.red[400]);
      return;
    }
    if (tempFdAmount.value >= 1e15 || tempRateOfInterest.value >= 1e10) {
      Get.snackbar("Error", "FD Amount or Interest Rate is too large" , backgroundColor: Colors.red[400]);
      return;
    }

    // Copy temporary values to actual ones
    fdAmount.value = tempFdAmount.value;
    rateOfInterest.value = tempRateOfInterest.value;
    tenureYears.value = tempYears.value;
    tenureMonths.value = tempMonths.value;
    tenureDays.value = tempDays.value;

    // Calculate tenure and maturity logic
    isCalculated.value = true; // Set the flag to true to update the UI
  }

  // Calculate the tenure in years including months and days
  double calculateTenureInYears() {
    return tenureYears.value + (tenureMonths.value / 12) + (tenureDays.value / 365);

  }

  // Calculate maturity date based on tenure
  String calculateMaturityDate() {

    DateTime maturityDate = fdStartDate.value.add(
      Duration(
        days: (tenureYears.value * 365) +
            (tenureMonths.value * 30) +
            tenureDays.value,
      ),
    );
    return DateFormat('dd/MM/yyyy').format(maturityDate);

  }
}
