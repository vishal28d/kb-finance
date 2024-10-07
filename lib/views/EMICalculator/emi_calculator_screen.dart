import 'dart:async';
import 'dart:math';
import 'package:credit_app/controllers/emi_calculator_controller.dart';
import 'package:credit_app/views/EMICalculator/RepaymentScheduleTable.dart';
import 'package:credit_app/views/EMICalculator/LoanBreakDown.dart';
import 'package:credit_app/widget/appBarWidget.dart';
import 'package:credit_app/widget/common_padding.dart';
import 'package:credit_app/widget/custom_textformfield.dart';
import 'package:credit_app/widget/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EmiCalculatorScreen extends StatefulWidget {

  @override
  State<EmiCalculatorScreen> createState() => _EmiCalculatorScreenState();
}

class _EmiCalculatorScreenState extends State<EmiCalculatorScreen> {
  final EmiCalculatorController emiCalculatorController = Get.find<EmiCalculatorController>();
 
  double emiResult = 0.0;
  double loanAmount = 0.0;
  double annualInterestRate = 0.0;
  double tenureMonths = 0.0;
  final double maxLoanAmount = 1e9;
  final double maxInterestRate = 1000.0;

  void _extractValues() {
    loanAmount = double.tryParse(emiCalculatorController.loanAmountController.text) ?? 0.0;
    annualInterestRate = double.tryParse(emiCalculatorController.interestRateController.text) ?? 0.0;
    tenureMonths = (double.tryParse(emiCalculatorController.yearsController.text) ?? 0) * 12 +
                    (double.tryParse(emiCalculatorController.monthsController.text) ?? 0);

    emiCalculatorController.initializeRepaymentSchedule(
      loanAmount,
    annualInterestRate,
    tenureMonths,
   );

    emiCalculatorController.update();

  }


  bool _validateValues() {
    if (loanAmount > maxLoanAmount || annualInterestRate > maxInterestRate) {
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


  void _calculateAndSetEMI() {
    double monthlyInterestRate = annualInterestRate / 12 / 100;
    double emi = (loanAmount * monthlyInterestRate * pow(1 + monthlyInterestRate, tenureMonths)) /
                 (pow(1 + monthlyInterestRate, tenureMonths) - 1);

    setState(() {
      emiResult = emi;
      
    });

    emiCalculatorController.update();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyCustomAppBar(
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(Icons.arrow_back_ios, size: 20),
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
                  child: _buildInputSection(context, 'Loan Amount', 'Enter loan amount', TextInputType.numberWithOptions(signed: true, decimal: true), emiCalculatorController.loanAmountController, null),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 15),
                  child: _buildInputSection(context, 'Interest Rate (%)', 'Enter interest rate', TextInputType.numberWithOptions(signed: true, decimal: true), emiCalculatorController.interestRateController, null),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 15),
                  child: Text('Tenure (Years, Months, Days)', style: Theme.of(context).textTheme.bodyLarge),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 8),
                  child: Row(
                    children: [
                      Expanded(child: _buildTextFormField('Years', emiCalculatorController.yearsController, null)),
                      SizedBox(width: 8),
                      Expanded(child: _buildTextFormField('Months', emiCalculatorController.monthsController, null)),
                      SizedBox(width: 8),
                      Expanded(child: _buildTextFormField('Days', emiCalculatorController.daysController, null)),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15, bottom: 15),
                  child: PrimaryTextButton(
                    text: "Calculate",
                    voidCallback: () {
                      
                      _extractValues();
                      if (_validateValues()) {
                        _calculateAndSetEMI();
                      }
                    
              
                      
                    },
                  ),
                ),

                SizedBox(height: 5),
                if (emiResult != 0.0)
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text("Your EMI is: ₹ ${emiResult.toStringAsFixed(2)}", style: TextStyle(color: Colors.black, fontSize: 20)),
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

                SizedBox(height: 5),
                Divider(),

                if (emiResult != 0.0 )
                  Center(
                    child: Padding(
                      padding: EdgeInsets.all(5),
                      child: Text("Repayment Schedule Chart", textAlign: TextAlign.center, style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
                    ),
                  ),

                if (emiResult != 0.0)
                Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: RepaymentScheduleTable(
                      loanAmount: loanAmount,
                      annualInterestRate: annualInterestRate,
                      loanTermMonths: tenureMonths,
                      emiResult: emiResult.toPrecision(2),
                    ),
                  ),
              
                  
              ],
            ),
          ),
        ),
      ),
    );
  }


  Widget _buildInputSection(BuildContext context, String label, String hint, TextInputType inputType, TextEditingController controller, Function(String)? onChanged) {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.black)),
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: CustomTextFormField(
              textEditingController: controller,
              hintText: hint,
              obscureText: false,
              textInputType: inputType,
              onChanged: onChanged,
            ),
          ),
        ],
      ),
    );
  }


  Widget _buildTextFormField(String hint, TextEditingController controller, Function(String)? onChanged) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: CustomTextFormField(
        textEditingController: controller,
        hintText: hint,
        obscureText: false,
        textInputType: TextInputType.numberWithOptions(signed: true, decimal: true),
        onChanged: onChanged,
      ),
    );
  }


}
