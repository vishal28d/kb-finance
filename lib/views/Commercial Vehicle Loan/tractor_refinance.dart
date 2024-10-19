import 'package:credit_app/views/Commercial%20Vehicle%20Loan/com_vehicle_loan_controller.dart';
import 'package:credit_app/widget/custom_dropdown.dart';
import 'package:credit_app/widget/custom_textformfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TractorRefinanceForm extends StatelessWidget {
  final loanController = Get.put(ComVehicleLoanController()); // Assuming LoanController is set up

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Land Size (In Akar)', style: Theme.of(context).textTheme.bodyLarge),
          CustomTextFormField(
            hintText: "Enter Land Size",
            textEditingController: loanController.landSizeController,
            textInputType: TextInputType.text,
          ),
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
          
          Text('Purpose Of Use (Commercial Or Agri)', style: Theme.of(context).textTheme.bodyLarge),
          CustomDropDown(
            hint: Text("Select Purpose of Use"),
            list: ["Commercial", "Agricultural"],
            val: loanController.purposeOfUse.value.isNotEmpty
                ? loanController.purposeOfUse.value
                : null,
            onChanged: (value) => loanController.purposeOfUse.value = value.toString(),
          ),
          SizedBox(height: 10),
          
          Text('Owner Serial', style: Theme.of(context).textTheme.bodyLarge),
          CustomTextFormField(
            hintText: "Enter Owner Serial",
            textEditingController: loanController.ownerSerialController,
          ),
          SizedBox(height: 10),

          Text('Is Your Tractor Financed?', style: Theme.of(context).textTheme.bodyLarge),
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
         
                 Text('Financer Name', style: Theme.of(context).textTheme.bodyLarge),
                  CustomTextFormField(
                    hintText: "Financer Name",
                    textEditingController: loanController.financerNameController,
                  ),
                  SizedBox(height: 10),
                  
                 Text('Loan Amount Disbursed', style: Theme.of(context).textTheme.bodyLarge),
                  CustomTextFormField(
                    hintText: "Loan Amount Disbursed (Rs)",
                    textEditingController: loanController.loanAmountDisbursedController,
                    textInputType: TextInputType.number,
                  ),
                  SizedBox(height: 10),
                  
                 Text('Disbursed Month & Year', style: Theme.of(context).textTheme.bodyLarge),
                  CustomTextFormField(
                    hintText: "Disbursed Month & Year",
                    textEditingController: loanController.disbursedMonthYearController,
                  ),
                  SizedBox(height: 10),
                  
                 Text('Loan Ending Month & Year', style: Theme.of(context).textTheme.bodyLarge),
                  CustomTextFormField(
                    hintText: "Loan Ending Month & Year",
                    textEditingController: loanController.loanEndingMonthYearController,
                  ),
                  SizedBox(height: 10),
                  
                 Text('Loan Amount Pending(Rs)', style: Theme.of(context).textTheme.bodyLarge),
                  CustomTextFormField(
                    hintText: "Loan Amount Pending(Rs) ",
                    textEditingController: loanController.loanAmountPendingController,
                    textInputType: TextInputType.number,
                  ),
                  SizedBox(height: 10),
                  
                 Text('EMI duration', style: Theme.of(context).textTheme.bodyLarge),
                  CustomDropDown(
                    hint: Text("EMI Is Year Or Half Yearly"),
                    list: ["Yearly", "Half Yearly" , "Monthly", "Quarterly"],
                    val: loanController.vehicle_emiType.value.isNotEmpty
                        ? loanController.vehicle_emiType.value
                        : null,
                    onChanged: (value) => loanController.vehicle_emiType.value = value.toString(),
                  ),
                  SizedBox(height: 10),
                  
                 Text('EMI Amount (Rs)', style: Theme.of(context).textTheme.bodyLarge),
                  CustomTextFormField(
                    hintText: "EMI Amount (Rs) ",
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
    );
  }
}
