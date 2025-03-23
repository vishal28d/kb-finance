import 'dart:math'; // Import the math library
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

class LoanBreakdownWidget extends StatelessWidget {
  final double loanAmount;
  final double annualInterestRate; // Annual interest rate in percentage
  final double tenure; // Tenure in months

  LoanBreakdownWidget({
    required this.loanAmount,
    required this.annualInterestRate,
    required this.tenure,
  });

  @override
  Widget build(BuildContext context) {
    // Calculate EMI, total payment, and total interest payable
    double emi = _calculateEMI(loanAmount, annualInterestRate, tenure);
    double totalInterestPayable = emi * tenure - loanAmount;
    double totalPayment = loanAmount + totalInterestPayable;
    double principalLoanAmountPercentage = loanAmount / totalPayment * 100;
    double totalInterestPercentage = totalInterestPayable / totalPayment * 100;

    double effectiveInterestRatePerYear = effectiveRatePerYear(totalInterestPayable);

    // Define the custom color
    Color customTextColor = Color(0xFF16423C);

    // Data for Pie Chart
    Map<String, double> dataMap = {
      "Principal Loan Amount": principalLoanAmountPercentage,
      "Total Interest": totalInterestPercentage,
    };

    return Card(
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Loan EMI',
              style: TextStyle(fontSize: 15, color: customTextColor),
            ),
            Text(
              '₹ ${emi.toStringAsFixed(2)}',
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
              '₹ ${totalPayment.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: customTextColor),
            ),
            SizedBox(height: 10),
            Text(
              'Effective Rate per year',
              style: TextStyle(fontSize: 15, color: customTextColor),
            ),
            Text(
              '${effectiveInterestRatePerYear.toStringAsFixed(2)}%',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: customTextColor),
            ),
            SizedBox(height: 10),
            Text(
              'Effective Rate per month',
              style: TextStyle(fontSize: 15, color: customTextColor),
            ),
            Text(
              '${(effectiveInterestRatePerYear / 12).toStringAsFixed(2)}%',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: customTextColor),
            ),
            SizedBox(height: 20),
            Text(
              'Break-up of Total Payment',
              style: TextStyle(fontSize: 15, color: customTextColor),
            ),
            SizedBox(height: 10),
            Container(
              height: 260,
              child: PieChart(
                dataMap: dataMap,
                chartRadius: MediaQuery.of(context).size.width / 2.5,
                colorList: [Colors.green, Colors.orange],
                chartValuesOptions: ChartValuesOptions(
                  showChartValues: true,
                  showChartValuesInPercentage: true,
                  showChartValuesOutside: true,
                  chartValueStyle: TextStyle(
                    color: customTextColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                legendOptions: LegendOptions(
                  legendPosition: LegendPosition.bottom,
                  legendTextStyle: TextStyle(color: customTextColor),
                  showLegends: true,
                ),
                chartType: ChartType.disc ,  

              ),
            ),
          ],
        ),
      ),
    );
  }

  double _calculateEMI(double loanAmount, double annualInterestRate, double tenure) {
    double monthlyInterestRate = annualInterestRate / 12 / 100;
    double emi = (loanAmount * monthlyInterestRate * pow(1 + monthlyInterestRate, tenure)) /
        (pow(1 + monthlyInterestRate, tenure) - 1);
    return emi;
  }

  double effectiveRatePerYear(double totalInterestPayable) {
    return (totalInterestPayable *100) / (loanAmount * tenure/12) ;

  }


}
