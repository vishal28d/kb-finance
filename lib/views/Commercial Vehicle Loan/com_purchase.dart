import 'package:credit_app/views/Commercial%20Vehicle%20Loan/com_vehicle_loan_controller.dart';
import 'package:credit_app/widget/custom_dropdown.dart';
import 'package:credit_app/widget/custom_textformfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CommercialPurchaseLoanForm extends StatelessWidget {
  final loanController = Get.put(ComVehicleLoanController()); // Assuming LoanController is set up

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Is Vehicle Financed?', style: Theme.of(context).textTheme.bodyLarge),
          Obx(() => CustomDropDown(
                hint: Text("Select Yes or No"),
                list: ["Yes", "No"],
                val: loanController.isFinanced.value.isNotEmpty
                    ? loanController.isFinanced.value
                    : null,
                onChanged: (value) => loanController.isFinanced.value = value.toString(),
              )),
          SizedBox(height: 10),
          Obx(() {
            if (loanController.isFinanced.value == "Yes") {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomTextFormField(
                    hintText: "Financer Name",
                    textEditingController: loanController.financerNameController,
                  ),
                  SizedBox(height: 10),
                  CustomTextFormField(
                    hintText: "Loan Amount Disbursed",
                    textEditingController: loanController.loanAmountDisbursedController,
                    textInputType: TextInputType.number,
                  ),
                  SizedBox(height: 10),
                  CustomTextFormField(
                    hintText: "Disbursed Month & Year",
                    textEditingController: loanController.disbursedMonthYearController,
                  ),
                  SizedBox(height: 10),
                  CustomTextFormField(
                    hintText: "Loan Ending Month & Year",
                    textEditingController: loanController.loanEndingMonthYearController,
                  ),
                  SizedBox(height: 10),
                  CustomTextFormField(
                    hintText: "Loan Amount Pending",
                    textEditingController: loanController.loanAmountPendingController,
                    textInputType: TextInputType.number,
                  ),
                  SizedBox(height: 10),
                  CustomTextFormField(
                    hintText: "EMI Amount",
                    textEditingController: loanController.vehicle_emiAmountController,
                    textInputType: TextInputType.number,
                  ),
                  SizedBox(height: 10),
                  CustomTextFormField(
                    hintText: "Purchase Amount",
                    textEditingController: loanController.purchaseAmountController,
                    textInputType: TextInputType.number,
                  ),
                  SizedBox(height: 10),
                  CustomTextFormField(
                    hintText: "Down Payment",
                    textEditingController: loanController.downPaymentController,
                    textInputType: TextInputType.number,
                  ),
                ],
              );
            } else {
              return SizedBox.shrink();
            }
          }),

          SizedBox(height: 10),
          Text('Maker (Company)', style: Theme.of(context).textTheme.bodyLarge),
          CustomTextFormField(
            hintText: "Enter Maker (Company)",
            textEditingController: loanController.makerController,
          ),
          SizedBox(height: 10),
          Text('Model (Year)', style: Theme.of(context).textTheme.bodyLarge),
          CustomTextFormField(
            hintText: "Enter Model (Year)",
            textEditingController: loanController.modelYearController,
          ),
          SizedBox(height: 10),
          Text('Registration Number', style: Theme.of(context).textTheme.bodyLarge),
          CustomTextFormField(
            hintText: "Enter Registration Number",
            textEditingController: loanController.registrationNumberController,
          ),
          SizedBox(height: 10),
          Text('Owner Serial', style: Theme.of(context).textTheme.bodyLarge),
          CustomTextFormField(
            hintText: "Enter Owner Serial",
            textEditingController: loanController.ownerSerialController,
          ),
          SizedBox(height: 10),
          Text('Do You Have Any Other Commercial Vehicles?', style: Theme.of(context).textTheme.bodyLarge),
          Obx(() => CustomDropDown(
                hint: Text("Select Yes or No"),
                list: ["Yes", "No"],
                val: loanController.hasOtherCommercialVehicles.value.isNotEmpty
                    ? loanController.hasOtherCommercialVehicles.value
                    : null,
                onChanged: (value) => loanController.hasOtherCommercialVehicles.value = value.toString(),
              )),
          SizedBox(height: 10),

          Obx(() {
            if (loanController.hasOtherCommercialVehicles.value == "Yes") {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomTextFormField(
                    hintText: "Maker Company",
                    textEditingController: loanController.otherVehicleMakerController,
                  ),
                  SizedBox(height: 10),
                  CustomTextFormField(
                    hintText: "Model Name",
                    textEditingController: loanController.otherVehicleModelController,
                  ),
                  SizedBox(height: 10),
                  CustomTextFormField(
                    hintText: "Owner Serial",
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
