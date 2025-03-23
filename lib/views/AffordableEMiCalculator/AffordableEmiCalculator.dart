import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:credit_app/controllers/affordable_emi_controller.dart';
import 'package:credit_app/widget/appBarWidget.dart';
import 'package:credit_app/widget/custom_textformfield.dart';
import 'package:credit_app/widget/primary_button.dart';
import 'package:credit_app/views/AffordableEMiCalculator/affordableEmiCard.dart';

class AffordableEmiCalculator extends StatelessWidget {
  final AffordableEmiCalculatorController controller = Get.put(AffordableEmiCalculatorController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyCustomAppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(Icons.arrow_back_ios, size: 20),
        ),
        height: 80,
        appbarPadding: 0,
        title: Text('Affordable EMI Calculator'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Affordable EMI Input
              _buildInputSection(
                context,
                'Affordable EMI',
                'Enter affordable EMI amount',
                TextInputType.numberWithOptions(signed: true, decimal: true),
                controller.emiAmountController,
                (value) {
                  controller.emiAmount.value = double.tryParse(value) ?? 0.0;
                },
              ),
              // Annual Interest Rate Input
              _buildInputSection(
                context,
                'Annual Interest Rate (%)',
                'Enter annual interest rate',
                TextInputType.numberWithOptions(signed: true, decimal: true),
                controller.annualInterestRateController,
                (value) {
                  controller.annualInterestRate.value = double.tryParse(value) ?? 0.0;
                },
              ),
              // Tenure (Years, Months, Days) Input
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Text(
                  'Tenure (Years, Months, Days)',
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.black),
                ),
              ),
              Row(
                children: [
                  _buildTextFormField('Years', controller.yearsController, (value) {
                    double years = double.tryParse(value) ?? 0.0;
                    controller.tenureMonths.value += years * 12;
                  }),
                  SizedBox(width: 8),
                  _buildTextFormField('Months', controller.monthsController, (value) {
                    double months = double.tryParse(value) ?? 0.0;
                    controller.tenureMonths.value += months;
                  }),
                  SizedBox(width: 8),
                  _buildTextFormField('Days', controller.daysController, (value) {
                    double days = double.tryParse(value) ?? 0.0;
                    controller.tenureMonths.value += days / 30;
                  }),
                ],
              ),
              // Calculate Button
              Padding(
                padding: const EdgeInsets.only(top: 15, bottom: 15),
                child: PrimaryTextButton(
                  text: "Calculate",
                  voidCallback: () {
                    controller.calculateAffordableAmount();
                  },
                ),
              ),
              Divider(),
              // Display results
              Obx(() {
                if (controller.isCalculated.value) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: Text(
                          'Your Affordable Loan Amount: \n ₹ ${controller.affordableAmount.value.toStringAsFixed(2)}',
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
                        ),
                      ),
                      SizedBox(height: 10),
                      Padding(
                        padding: EdgeInsets.all(5),
                        child: AffordableEMICard(),
                      ),
                    ],
                  );
                } else {
                  return Center(
                    child: Text('Please enter all details and press Calculate.'),
                  );
                }
              }),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInputSection(BuildContext context, String label, String hint, TextInputType inputType, TextEditingController controller, Function(String) onChanged) {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.black),
          ),
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

  Widget _buildTextFormField(String hint, TextEditingController controller, Function(String) onChanged) {
    return Expanded(
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
