import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:intl/intl.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:credit_app/controllers/fd_calculator_controller.dart';

class FDcalculatorCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Fetch the controller instance
    final FixedDepositController controller = Get.find();

    // Calculate tenure in years
    double tenureInYears = controller.calculateTenureInYears();
    
    // Calculate maturity amount and total interest payable
    double maturityAmount = _calculateMaturityAmount(
      controller.fdAmount.value,
      controller.rateOfInterest.value,
      tenureInYears,
      4 
    );
    double totalInterestPayable = maturityAmount - controller.fdAmount.value;

    // Calculate maturity date
    String maturityDate = controller.calculateMaturityDate();

    // Pie chart data
    Map<String, double> dataMap = {
      "Principal Amount": controller.fdAmount.value,
      "Interest Earned": totalInterestPayable,
    };

    // Text color
    Color customTextColor = Color(0xFF16423C);

    return Card(
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Maturity Amount',
              style: TextStyle(fontSize: 15, color: customTextColor),
            ),
            Text(
              '₹ ${maturityAmount.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: customTextColor),
            ),
            Text(
              'Interest Earned',
              style: TextStyle(fontSize: 15, color: customTextColor),
            ),
            Text(
              '₹ ${totalInterestPayable.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: customTextColor),
            ),
            SizedBox(height: 10),
            Text(
              'Maturity Date',
              style: TextStyle(fontSize: 15, color: customTextColor),
            ),
            Text(
              maturityDate,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: customTextColor),
            ),
            SizedBox(height: 10),
            Text(
              'Break-up of Total Payment',
              style: TextStyle(fontSize: 15, color: customTextColor),
            ),
            SizedBox(height: 10),
            PieChart(
              dataMap: dataMap,
              chartRadius: MediaQuery.of(context).size.width / 2,
              colorList: [Colors.green, Colors.orange],
              chartValuesOptions: ChartValuesOptions(
                showChartValuesInPercentage: true,
                chartValueStyle: TextStyle(color: customTextColor),
              ),
              legendOptions: LegendOptions(
                legendPosition: LegendPosition.bottom,
                legendTextStyle: TextStyle(color: customTextColor),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Function to calculate FD maturity amount using compound interest formula
  double _calculateMaturityAmount(  
  double principal, double annualInterestRate, double tenureInYears, int compoundingFrequency) {  
  double ratePerPeriod = annualInterestRate / 100 / compoundingFrequency; // Convert percentage to decimal and divide by compounding frequency  
  double maturityAmount = principal * pow((1 + ratePerPeriod), compoundingFrequency * tenureInYears); // Compound interest formula  
  return maturityAmount;  
}


}
