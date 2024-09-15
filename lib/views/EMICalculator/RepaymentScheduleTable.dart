import 'package:credit_app/controllers/emi_calculator_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:math'; // For interest calculations
import 'package:intl/intl.dart'; // For formatting dates

class RepaymentScheduleTable extends StatefulWidget {
  final double loanAmount;
  final double annualInterestRate;
  final double loanTermMonths;

  RepaymentScheduleTable({
    required this.loanAmount,
    required this.annualInterestRate,
    required this.loanTermMonths,
  });

  @override
  _RepaymentScheduleTableState createState() => _RepaymentScheduleTableState();
}

class _RepaymentScheduleTableState extends State<RepaymentScheduleTable> {
  

  late List<Map<String, dynamic>> repaymentSchedule;
  late DateTime startDate;

  @override
  void initState() {
    super.initState();
    startDate = DateTime.now(); // Starting from the current month
    repaymentSchedule = _generateRepaymentSchedule(
      widget.loanAmount,
      widget.annualInterestRate,
      widget.loanTermMonths.toInt(),
    );
  }

  // Function to generate the repayment schedule automatically
  List<Map<String, dynamic>> _generateRepaymentSchedule(
      double loanAmount, double annualInterestRate, int loanTermMonths) {
    double monthlyInterestRate = annualInterestRate / 12 / 100;
    double monthlyPayment = (loanAmount * monthlyInterestRate) /
        (1 - pow(1 + monthlyInterestRate, -loanTermMonths));

    double remainingBalance = loanAmount;
    List<Map<String, dynamic>> schedule = [];

    for (int i = 0; i < loanTermMonths; i++) {
      double interestPayment = remainingBalance * monthlyInterestRate;
      double principalPayment = monthlyPayment - interestPayment;
      remainingBalance -= principalPayment;

      DateTime paymentDate = DateTime(
        startDate.year,
        startDate.month + i,
        startDate.day,
      );
      String monthName = DateFormat('MMMM yyyy').format(paymentDate);

      schedule.add({
        'paymentNo': i + 1,
        'paymentDate': monthName,
        'beginningBalance': i == 0 ? loanAmount : schedule[i - 1]['endingBalance'],
        'payment': monthlyPayment,
        'principal': principalPayment,
        'interest': interestPayment,
        'endingBalance': max(remainingBalance, 0), 
      });
    }

    return schedule;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(

      scrollDirection: Axis.horizontal,
      child: DataTable(
        dataTextStyle: TextStyle(color: Colors.black),
        columnSpacing: 16.0, 
        // ignore: deprecated_member_use
        dataRowHeight: 40.0, 
        headingRowHeight: 40.0, 
        columns: [
          DataColumn(label: Text('S.No.', style: TextStyle(color: Colors.black.withOpacity(0.5)))),
          // DataColumn(label: Text('Payment Date', style: TextStyle(color: Colors.black.withOpacity(0.5)))),
          // DataColumn(label: Text('Beginning Balance', style: TextStyle(color: Colors.black.withOpacity(0.5)))),
          // DataColumn(label: Text('Payment', style: TextStyle(color: Colors.black.withOpacity(0.5)))),
          DataColumn(label: Text('Principal', style: TextStyle(color: Colors.black.withOpacity(0.5)))),
          DataColumn(label: Text('Interest', style: TextStyle(color: Colors.black.withOpacity(0.5)))),
          DataColumn(label: Text('Balance', style: TextStyle(color: Colors.black.withOpacity(0.5)))),
        ],
        rows: repaymentSchedule
            .map(
              (repayment) => DataRow(
                cells: [
                  DataCell(Text(repayment['paymentNo'].toString(), style: TextStyle(color: Colors.black.withOpacity(0.5)))),
                  // DataCell(Text(repayment['paymentDate'].toString(), style: TextStyle(color: Colors.black.withOpacity(0.5)))),
                  // DataCell(Text(repayment['beginningBalance'].toStringAsFixed(2), style: TextStyle(color: Colors.black.withOpacity(0.5)))),
                  // DataCell(Text(repayment['payment'].toStringAsFixed(2), style: TextStyle(color: Colors.black.withOpacity(0.5)))),
                  DataCell(Text(repayment['principal'].toStringAsFixed(2), style: TextStyle(color: Colors.black.withOpacity(0.5)))),
                  DataCell(Text(repayment['interest'].toStringAsFixed(2), style: TextStyle(color: Colors.black.withOpacity(0.5)))),
                  DataCell(Text(repayment['endingBalance'].toStringAsFixed(2), style: TextStyle(color: Colors.black.withOpacity(0.5)))),
                ],
              ),
            )
            .toList(),

      ),
    );
  }
}
