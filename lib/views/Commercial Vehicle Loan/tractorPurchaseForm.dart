import 'package:credit_app/views/Commercial%20Vehicle%20Loan/com_vehicle_loan_controller.dart';
import 'package:credit_app/widget/custom_dropdown.dart';
import 'package:credit_app/widget/custom_textformfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart'; // For Obx

class TractorPurchaseFormPage extends StatelessWidget {
  final ComVehicleLoanController loanController = Get.put(ComVehicleLoanController());

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
       child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Purchase Amount
              Text('Purchase Amount', style: Theme.of(context).textTheme.bodyLarge),
              CustomTextFormField(
                hintText: "Enter purchase amount",
                textEditingController: loanController.purchaseAmountController,
                textInputType: TextInputType.number,
              ),
              SizedBox(height: 10),

              // Down Payment
              Text('Down Payment', style: Theme.of(context).textTheme.bodyLarge),
              CustomTextFormField(
                hintText: "Enter down payment",
                textEditingController: loanController.downPaymentController,
                textInputType: TextInputType.number,
              ),
              SizedBox(height: 10),

              // Land Size (In Akar)
              Text('Land Size (In Akar)', style: Theme.of(context).textTheme.bodyLarge),
              CustomTextFormField(
                hintText: "Enter land size in Akar",
                textEditingController: loanController.landSizeController,
                textInputType: TextInputType.text,
              ),
              SizedBox(height: 10),

              // Maker (Company)
              Text('Maker (Company)', style: Theme.of(context).textTheme.bodyLarge),
              CustomTextFormField(
                hintText: "Enter maker (company)",
                textEditingController: loanController.makerController,
              ),
              SizedBox(height: 10),

              // Model (Year)
              Text('Model (Year)', style: Theme.of(context).textTheme.bodyLarge),
              CustomTextFormField(
                hintText: "Enter model year",
                textEditingController: loanController.modelYearController,
                textInputType: TextInputType.number,
              ),
              SizedBox(height: 10),

              // Registration Number
              Text('Registration Number', style: Theme.of(context).textTheme.bodyLarge),
              CustomTextFormField(
                hintText: "Enter registration number",
                textEditingController: loanController.registrationNumberController,
              ),
              SizedBox(height: 10),

              // Purpose Of Use (Commercial Or Agri)
              Text('Purpose Of Use (Commercial Or Agri)', style: Theme.of(context).textTheme.bodyLarge),
              CustomDropDown(
                hint: Text("Select purpose of use"),
                list: ["Commercial", "Agri"],
                val: loanController.purposeOfUse.value.isNotEmpty
                    ? loanController.purposeOfUse.value
                    : null,
                onChanged: (value) {
                  loanController.purposeOfUse.value = value.toString();
                },
              ),
              SizedBox(height: 10),

              // Owner Serial
              Text('Owner Serial', style: Theme.of(context).textTheme.bodyLarge),
              CustomTextFormField(
                hintText: "Enter owner serial",
                textEditingController: loanController.ownerSerialController,
              ),
              SizedBox(height: 10),

              // Is Tractor Financed?
              Text('Is Your Tractor Financed?', style: Theme.of(context).textTheme.bodyLarge),
              CustomDropDown(
                hint: Text("Select"),
                list: ["Yes", "No"],
                val: loanController.isFinanced.value.isNotEmpty
                    ? loanController.isFinanced.value
                    : null,
                onChanged: (value) {
                  loanController.isFinanced.value = value.toString();
                },
              ),
              SizedBox(height: 10),

              // Conditional fields if tractor is financed
              Obx(() {
                if (loanController.isFinanced.value == "Yes") {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Financer Name
                      Text('Financer Name', style: Theme.of(context).textTheme.bodyLarge),
                      CustomTextFormField(
                        hintText: "Enter financer name",
                        textEditingController: loanController.financerNameController,
                      ),
                      SizedBox(height: 10),

                      // Loan Amount Disbursed
                      Text('Loan Amount Disbursed', style: Theme.of(context).textTheme.bodyLarge),
                      CustomTextFormField(
                        hintText: "Enter loan amount disbursed",
                        textEditingController: loanController.loanAmountDisbursedController,
                        textInputType: TextInputType.number,
                      ),
                      SizedBox(height: 10),

                      // Disbursed Month & Year
                      Text('Disbursed Month & Year', style: Theme.of(context).textTheme.bodyLarge),
                      CustomTextFormField(
                        hintText: "Enter disbursed month & year",
                        textEditingController: loanController.disbursedMonthYearController,
                      ),
                      SizedBox(height: 10),

                      // Loan Ending Month & Year
                      Text('Loan Ending Month & Year', style: Theme.of(context).textTheme.bodyLarge),
                      CustomTextFormField(
                        hintText: "Enter loan ending month & year",
                        textEditingController: loanController.loanEndingMonthYearController,
                      ),
                      SizedBox(height: 10),

                      // Loan Amount Pending
                      Text('Loan Amount Pending', style: Theme.of(context).textTheme.bodyLarge),
                      CustomTextFormField(
                        hintText: "Enter loan amount pending",
                        textEditingController: loanController.loanAmountPendingController,
                        textInputType: TextInputType.number,
                      ),
                      SizedBox(height: 10),

                      // EMI Year or Half Yearly
                      Text('EMI Is Yearly or Half Yearly', style: Theme.of(context).textTheme.bodyLarge),
                      CustomDropDown(
                        hint: Text("Select EMI type"),
                        list: ["Yearly", "Half Yearly"],
                        val: loanController.vehicle_emiType.value.isNotEmpty
                            ? loanController.vehicle_emiType.value
                            : null,
                        onChanged: (value) {
                          loanController.vehicle_emiType.value = value.toString();
                        },
                      ),
                      SizedBox(height: 10),

                      // EMI Amount
                      Text('EMI Amount', style: Theme.of(context).textTheme.bodyLarge),
                      CustomTextFormField(
                        hintText: "Enter EMI amount",
                        textEditingController: loanController.vehicle_emiAmountController,
                        textInputType: TextInputType.number,
                      ),
                    ],
                  );
                } else {
                  return SizedBox.shrink();
                }
              }),
            ],
          ),
        ),
      ),
    );
  }
}

