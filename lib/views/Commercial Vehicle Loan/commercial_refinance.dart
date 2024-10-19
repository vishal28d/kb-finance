import 'package:credit_app/views/Commercial%20Vehicle%20Loan/com_vehicle_loan_controller.dart';
import 'package:credit_app/widget/custom_dropdown.dart';
import 'package:credit_app/widget/custom_textformfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart'; // For Obx

class CommercialRefinanceFormPage extends StatelessWidget {

  final ComVehicleLoanController loanController = Get.put(ComVehicleLoanController());

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Is Vehicle Financed?
          Text('Is Vehicle Financed?', style: Theme.of(context).textTheme.bodyLarge),
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

          // Conditional fields if vehicle is financed
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

          // Owner Serial
          Text('Owner Serial', style: Theme.of(context).textTheme.bodyLarge),
          CustomTextFormField(
            hintText: "Enter owner serial",
            textEditingController: loanController.ownerSerialController,
          ),
          SizedBox(height: 10),

          // Do You Have Any Other Commercial Vehicles?
          Text('Do You Have Any Other Commercial Vehicles?', style: Theme.of(context).textTheme.bodyLarge),
          CustomDropDown(
            hint: Text("Select"),
            list: ["Yes", "No"],
            val: loanController.hasOtherCommercialVehicles.value.isNotEmpty
                ? loanController.hasOtherCommercialVehicles.value
                : null,
            onChanged: (value) {
              loanController.hasOtherCommercialVehicles.value = value.toString();
            },
          ),
          SizedBox(height: 10),

          // Conditional fields if the user has other commercial vehicles
          Obx(() {
            if (loanController.hasOtherCommercialVehicles.value == "Yes") {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Maker Company
                  Text('Maker Company', style: Theme.of(context).textTheme.bodyLarge),
                  CustomTextFormField(
                    hintText: "Enter maker company",
                    textEditingController: loanController.otherVehicleMakerController,
                  ),
                  SizedBox(height: 10),

                  // Model Name
                  Text('Model Name', style: Theme.of(context).textTheme.bodyLarge),
                  CustomTextFormField(
                    hintText: "Enter model name",
                    textEditingController: loanController.otherVehicleModelController,
                  ),
                  SizedBox(height: 10),

                  // Owner Serial
                  Text('Owner Serial', style: Theme.of(context).textTheme.bodyLarge),
                  CustomTextFormField(
                    hintText: "Enter owner serial",
                    textEditingController: loanController.otherVehicleOwnerSerialController,
                  ),
                ],
              );
            } else {
              return SizedBox.shrink();
            }
          }),
        ],
      ),
    );
  }
}


