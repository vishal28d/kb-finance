import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class FixedDepositController extends GetxController {
  // These controllers will be used for user inputs
  TextEditingController fdAmountController = TextEditingController();
  TextEditingController rateOfInterestController = TextEditingController();
  TextEditingController yearsController = TextEditingController();
  TextEditingController monthsController = TextEditingController();
  TextEditingController daysController = TextEditingController();

  // These values will be used after clicking "Calculate"
  var fdAmount = 0.0.obs;
  var rateOfInterest = 0.0.obs;
  var tenureYears = 0.obs;
  var tenureMonths = 0.obs;
  var tenureDays = 0.obs;
  var fdStartDate = DateTime.now().obs;

  var isCalculated = false.obs;

  // Method to calculate the maturity amount and tenure
  void calculateMaturityAmount() {
    final fdAmountInput = double.tryParse(fdAmountController.text) ?? 0.0;
    final rateOfInterestInput = double.tryParse(rateOfInterestController.text) ?? 0.0;
    final yearsInput = int.tryParse(yearsController.text) ?? 0;
    final monthsInput = int.tryParse(monthsController.text) ?? 0;
    final daysInput = int.tryParse(daysController.text) ?? 0;

    // Perform validation checks on the values here
    if (fdAmountInput <= 0 || rateOfInterestInput <= 0) {
      Get.snackbar("Error", "FD Amount or Interest Rate must be greater than 0", backgroundColor: Colors.red[400]);
      return;
    }
    if (fdAmountInput >= 1e15 || rateOfInterestInput >= 1e10) {
      Get.snackbar("Error", "FD Amount or Interest Rate is too large", backgroundColor: Colors.red[400]);
      return;
    }

    // Copy temporary values to actual ones
    fdAmount.value = fdAmountInput;
    rateOfInterest.value = rateOfInterestInput;
    tenureYears.value = yearsInput;
    tenureMonths.value = monthsInput;
    tenureDays.value = daysInput;

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

  @override
  void onClose() {
    // Dispose of text editing controllers

    // fdAmountController.dispose();
    // rateOfInterestController.dispose();
    // yearsController.dispose();
    // monthsController.dispose();
    // daysController.dispose();

    // Reset all observable values
    fdAmount.value = 0.0;
    rateOfInterest.value = 0.0;
    tenureYears.value = 0;
    tenureMonths.value = 0;
    tenureDays.value = 0;
    fdStartDate.value = DateTime.now();
    isCalculated.value = false;

    super.onClose();
  }
}
