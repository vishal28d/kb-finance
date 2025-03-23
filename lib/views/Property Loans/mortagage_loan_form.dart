import 'package:credit_app/views/Property%20Loans/property_loan_controller.dart';
import 'package:credit_app/widget/custom_dropdown.dart';
import 'package:credit_app/widget/custom_textformfield.dart';
import 'package:flutter/material.dart';

class MortgageLoanForm extends StatelessWidget {
  final loanController = PropertyLoanController(); // Controller consistent with other forms

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('I Want To Mortgage', style: Theme.of(context).textTheme.bodyLarge),
          CustomDropDown(
            hint: Text("Select Mortgage Type"),
            list: [
              "Open Land",
              "Residential House",
              "Godown",
              "School",
              "Commercial Property",
              "Hospital",
              "Other",
              "Agriculture",
              "Industrial",
            ],
            val: loanController.mortgageType.value.isNotEmpty ? loanController.mortgageType.value : null,
            onChanged: (value) => loanController.mortgageType.value = value.toString(),
          ),
          SizedBox(height: 10),

          Text('Your Property Is', style: Theme.of(context).textTheme.bodyLarge),
          CustomDropDown(
            hint: Text("Select Property Status"),
            list: ["Diverted", "Undiverted", "Industrial Diverson"],
            val: loanController.propertyStatus.value.isNotEmpty ? loanController.propertyStatus.value : null,
            onChanged: (value) => loanController.propertyStatus.value = value.toString(),
          ),
          SizedBox(height: 10),

          Text('Building Permission', style: Theme.of(context).textTheme.bodyLarge),
          CustomDropDown(
            hint: Text("Building Permission"),
            list: ["Yes", "No"],
            val: loanController.buildingPermission.value.isNotEmpty ? loanController.buildingPermission.value : null,
            onChanged: (value) => loanController.buildingPermission.value = value.toString(),
          ),
          SizedBox(height: 10),

          Text('Type Of Property Paper', style: Theme.of(context).textTheme.bodyLarge),
          CustomDropDown(
            hint: Text("Select Property Paper Type"),
            list: ["Registry Paper", "Nazul Property", "Patta Paper", "Other"],
            val: loanController.propertyPaperType.value.isNotEmpty ? loanController.propertyPaperType.value : null,
            onChanged: (value) => loanController.propertyPaperType.value = value.toString(),
          ),
          SizedBox(height: 10),

          Text('Size Of Property (Enter in square feet or dismil)', style: Theme.of(context).textTheme.bodyLarge),
          CustomTextFormField(
            hintText: "Enter property size",
            textEditingController: loanController.propertySizeController,
            textInputType: TextInputType.text,
          ),
          SizedBox(height: 10),

          Text('Estimated Property Value', style: Theme.of(context).textTheme.bodyLarge),
          CustomTextFormField(
            hintText: "Enter estimated property value",
            textEditingController: loanController.propertyValueController,
            textInputType: TextInputType.text,
          ),
        ],
      ),
    );
  }
}
