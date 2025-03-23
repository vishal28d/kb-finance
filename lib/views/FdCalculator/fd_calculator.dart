import 'package:credit_app/views/FdCalculator/fd_calculator_card.dart';
import 'package:credit_app/widget/appBarWidget.dart';
import 'package:credit_app/widget/custom_textformfield.dart';
import 'package:credit_app/widget/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:credit_app/controllers/fd_calculator_controller.dart';
import 'package:intl/intl.dart'; // For date formatting

class FixedDepositCalculator extends StatefulWidget {
  @override
  State<FixedDepositCalculator> createState() => _FixedDepositCalculatorState();
}

class _FixedDepositCalculatorState extends State<FixedDepositCalculator> {
  final FixedDepositController controller = Get.put(FixedDepositController());

  var update = 0.obs;

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
        title: Text('Fixed Deposit Calculator'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // FD Amount Input
              _buildInputSection(
                context,
                'FD Amount',
                'Enter FD amount',
                TextInputType.numberWithOptions(signed: true, decimal: true),
                controller.fdAmountController,
              ),
              // Interest Rate Input
              _buildInputSection(
                context,
                'Interest Rate (%)',
                'Enter interest rate',
                TextInputType.numberWithOptions(signed: true, decimal: true),
                controller.rateOfInterestController,
              ),
              // FD Start Date Input
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Text(
                  'FD Start Date',
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge
                      ?.copyWith(color: Colors.black),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Obx(() => InkWell(
                      onTap: () async {
                        DateTime? pickedDate = await showDatePicker(
                          context: context,
                          initialDate: controller.fdStartDate.value,
                          firstDate: DateTime(2000),
                          lastDate: DateTime(2101),
                        );
                        controller.fdStartDate.value = pickedDate!;
                                            },
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          DateFormat('dd/MM/yyyy')
                              .format(controller.fdStartDate.value),
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    )),
              ),
              // Tenure Input
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Text(
                  'Tenure (Years, Months, Days)',
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge
                      ?.copyWith(color: Colors.black),
                ),
              ),
              Row(
                children: [
                  _buildTextFormField('Years', controller.yearsController),
                  SizedBox(width: 8),
                  _buildTextFormField('Months', controller.monthsController),
                  SizedBox(width: 8),
                  _buildTextFormField('Days', controller.daysController),
                ],
              ),
              // Calculate Button
              Padding(
                padding: const EdgeInsets.only(top: 15, bottom: 15),
                child: PrimaryTextButton(
                  text: "Calculate",
                  voidCallback: () {
                    setState(() {
                    controller.calculateMaturityAmount();
                    });
                  
                  },
                ),
              ),
              Divider(),
              // Display FD Calculator Card only if isCalculated is true
              Obx(() {
                if (controller.isCalculated.value) {
                  return Padding(
                    padding: EdgeInsets.all(10),
                    child: FDcalculatorCard(),
                  );
                }
                return SizedBox.shrink(); // Don't show anything if not calculated
              }),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInputSection(BuildContext context, String label, String hint, TextInputType inputType, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: Theme.of(context)
                .textTheme
                .bodyLarge
                ?.copyWith(color: Colors.black),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: CustomTextFormField(
              hintText: hint,
              obscureText: false,
              textEditingController: controller,
              textInputType: inputType,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextFormField(String hint, TextEditingController controller) {
    return Expanded(
      child: CustomTextFormField(
        hintText: hint,
        obscureText: false,
        textEditingController: controller,
        textInputType: TextInputType.numberWithOptions(signed: true, decimal: true),
      ),
    );
  }
}
