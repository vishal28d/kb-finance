
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:credit_app/controllers/affordable_emi_controller.dart';

class AffordableEMICard extends StatelessWidget {
  AffordableEMICard({super.key});

  @override
  Widget build(BuildContext context) {
    final AffordableEmiCalculatorController controller = Get.find();

    // Retrieve affordable amount and total interest payable
    var affordableAmount = controller.affordableAmount.value;
    var totalInterestPayable = controller.totalInterestPayable.value;

    // Define the custom color
    Color customTextColor = Color(0xFF16423C);

    return Card(
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Affordable Loan Amount',
              style: TextStyle(fontSize: 15, color: customTextColor),
            ),
            Text(
              '₹ ${affordableAmount.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: customTextColor),
            ),
            SizedBox(height: 10),
            Text(
              'Total Interest Payable',
              style: TextStyle(fontSize: 15, color: customTextColor),
            ),
            Text(
              '₹ ${totalInterestPayable.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: customTextColor),
            ),
            SizedBox(height: 10),
            Text(
              'Total Payment (Principal + Interest)',
              style: TextStyle(fontSize: 15, color: customTextColor),
            ),
            Text(
              '₹ ${(totalInterestPayable + affordableAmount).toStringAsFixed(2)}',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: customTextColor),
            ),


          ],
        ),
      ),
    );
  }
}
