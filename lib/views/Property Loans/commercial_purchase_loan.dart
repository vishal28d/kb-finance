import 'package:credit_app/views/Property%20Loans/property_loan_controller.dart';
import 'package:credit_app/widget/custom_dropdown.dart';
import 'package:flutter/material.dart';

class CommercialPurchaseLoanForm extends StatelessWidget {
  final loanController = PropertyLoanController(); // Controller matching previous forms

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('I Want Loan For', style: Theme.of(context).textTheme.bodyLarge),
          CustomDropDown(
            hint: Text("Select Loan Purpose"),
            list: [
              "Open Land Purchase",
              "Factory",
              "Plat + Construction",
              "Only Construction",
              "Renovation",
              "Home Extension Loan",
              "Top Up Loans",
              "Other",
            ],
            val: loanController.mortgageType.value.isNotEmpty ? loanController.mortgageType.value : null,
            onChanged: (value) => loanController.mortgageType.value = value.toString(),
          ),
          SizedBox(height: 10),

          Text('Select Property Type', style: Theme.of(context).textTheme.bodyLarge),
          CustomDropDown(
            hint: Text("Select Property Type"),
            list: ["Residential", "Agriculture", "Commercial", "Industrial"],
            val: loanController.propertyType.value.isNotEmpty ? loanController.propertyType.value : null,
            onChanged: (value) => loanController.propertyType.value = value.toString(),
          ),
          SizedBox(height: 10),

          Text('Your Property Is', style: Theme.of(context).textTheme.bodyLarge),
          CustomDropDown(
            hint: Text("Select Property Status"),
            list: ["Diverted", "Undiverted", "Industrial Diverson", "Commercial Diverson"],
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
            list: ["Registry Paper", "Nazul Property", "Patta Paper"],
            val: loanController.propertyPaperType.value.isNotEmpty ? loanController.propertyPaperType.value : null,
            onChanged: (value) => loanController.propertyPaperType.value = value.toString(),
          ),
          SizedBox(height: 10),
        ],
      ),
    );
  }
}
