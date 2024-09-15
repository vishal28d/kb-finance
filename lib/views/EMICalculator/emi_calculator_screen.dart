import 'dart:math';
import 'package:credit_app/controllers/emi_calculator_controller.dart';
import 'package:credit_app/views/EMICalculator/RepaymentScheduleTable.dart';
import 'package:credit_app/views/EMICalculator/LoanBreakDown.dart';
import 'package:credit_app/widget/appBarWidget.dart';
import 'package:credit_app/widget/baseRoute.dart';
import 'package:credit_app/widget/common_padding.dart';
import 'package:credit_app/widget/custom_textformfield.dart';
import 'package:credit_app/widget/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class EmiCalculatorScreen extends BaseRoute {
  EmiCalculatorScreen({a, o}) : super(a: a, o: o, r: 'EmiCalculatorScreen');
  final EmiCalculatorController emiCalculatorController =
      Get.find<EmiCalculatorController>();

  double emiResult = 0.0;
  double loanAmount = 0.0;
  double annualInterestRate = 0.0;
  double tenureMonths = 0.0;

  // Define a threshold for large values
  final double maxLoanAmount = 1e9; // Example threshold value
  final double maxInterestRate = 1000.0; // Example threshold value
  final double maxTenure = 1000; // Example threshold value (e.g., 30 years)

  // Function to extract values from the controller
  void _extractValues() {
    loanAmount = double.tryParse(emiCalculatorController.loanamount1.text) ?? 0.0;
    annualInterestRate = double.tryParse(emiCalculatorController.interestrate1.text) ?? 0.0;
    tenureMonths = double.tryParse(emiCalculatorController.duration1.text) ?? 0.0;

    emiCalculatorController.update(); // Refresh UI
  }

  // Function to validate the values and show a Snackbar if they are too large
  bool _validateValues() {
    if (loanAmount > maxLoanAmount ||
        annualInterestRate > maxInterestRate ||
        tenureMonths > maxTenure) {
      Get.snackbar(
        'Error',
        'The values entered are too large. Please enter smaller values.',
        backgroundColor: Colors.red,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
      
      );
      return false;
    }
    return true;
  }

  // Function to calculate EMI and update the result
  void _calculateAndSetEMI() {
    double monthlyInterestRate = annualInterestRate / 12 / 100;
    double emi = (loanAmount *
            monthlyInterestRate *
            pow(1 + monthlyInterestRate, tenureMonths)) /
        (pow(1 + monthlyInterestRate, tenureMonths) - 1);

    emiResult = emi;
    emiCalculatorController.update(); // Ensure UI is updated
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyCustomAppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            Icons.arrow_back_ios,
            size: 20,
          ),
        ),
        height: 80,
        appbarPadding: 0,
        title: Text('EMI Calculator'),
        centerTitle: true,
      ),

      body: GetBuilder<EmiCalculatorController>(
        builder: (_) => CommonPadding(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 15),
                        child: Text(
                          'Loan Amount',
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 8),
                        child: CustomTextFormField(
                          hintText: "Enter loan amount",
                          textEditingController:
                              emiCalculatorController.loanamount1,
                          obscureText: false,
                          key: key,
                          textInputType: TextInputType.numberWithOptions(
                              signed: true, decimal: true),
                          onEditingComplete: () {
                            FocusScope.of(context).requestFocus(
                              emiCalculatorController.finterestrate1,
                            );
                          },
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 15),
                        child: Text(
                          'Interest Rate (%)',
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 8),
                        child: CustomTextFormField(
                          hintText: "Enter interest rate",
                          textEditingController:
                              emiCalculatorController.interestrate1,
                          focusnode: emiCalculatorController.finterestrate1,
                          obscureText: false,
                          key: key,
                          textInputType: TextInputType.numberWithOptions(
                              signed: true, decimal: true),
                          onEditingComplete: () {
                            FocusScope.of(context).requestFocus(
                              emiCalculatorController.fduration1,
                            );
                          },
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 15),
                        child: Text(
                          'Tenure (Months)',
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 8),
                        child: CustomTextFormField(
                          hintText: "Enter duration",
                          textEditingController:
                              emiCalculatorController.duration1,
                          focusnode: emiCalculatorController.fduration1,
                          obscureText: false,
                          key: key,
                          textInputType: TextInputType.numberWithOptions(
                              signed: true, decimal: true),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 15, bottom: 15),
                        child: PrimaryTextButton(
                          text: "Calculate",
                          voidCallback: () {
                            emiCalculatorController.update(); // Refresh UI
                            _extractValues();
                            if (_validateValues()) {

                              _calculateAndSetEMI();
                              emiCalculatorController.update(); // Refresh 

                            }
                          },
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      if (emiResult != 0.0)
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: emiResult != 0
                              ? Text(
                                  "Your EMI is: ₹ ${emiResult.toStringAsFixed(2)}",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 20),
                                )
                              : Container(),
                        ),
                      Divider(),
                      if (emiResult != 0.0)
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: LoanBreakdownWidget(
                            loanAmount: loanAmount,
                            annualInterestRate: annualInterestRate,
                            tenure: tenureMonths,
                          ),
                        ),
                      SizedBox(height: 5,),
                      Divider(),
                      if (emiResult != 0.0)
                        Center(
                          child: Padding(
                            padding: EdgeInsets.all(5),
                            child: Text(
                              "Repayment Schedule Chart",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.black, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      if (emiResult != 0.0)
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: RepaymentScheduleTable(
                            loanAmount: loanAmount,
                            annualInterestRate: annualInterestRate,
                            loanTermMonths: tenureMonths,
                          ),
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
