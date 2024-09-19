import 'dart:async';

import 'package:credit_app/controllers/emi_calculator_controller.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'dart:math'; // For interest calculations
import 'package:intl/intl.dart'; // For formatting dates
import 'package:pdf/pdf.dart'; // For PDF generation
import 'package:pdf/widgets.dart' as pw; // For PDF widgets
import 'package:printing/printing.dart'; // For PDF printing and sharing
import 'dart:io'; // For file operations
import 'package:path_provider/path_provider.dart'; // For accessing device directories

// ignore: must_be_immutable
class RepaymentScheduleTable extends StatefulWidget {
   double loanAmount;
   double annualInterestRate;
   double loanTermMonths;

  RepaymentScheduleTable({
    required this.loanAmount,
    required this.annualInterestRate,
    required this.loanTermMonths,
  });

  @override
  _RepaymentScheduleTableState createState() => _RepaymentScheduleTableState();
}

class _RepaymentScheduleTableState extends State<RepaymentScheduleTable> {
  
   List<Map<String, dynamic>> repaymentSchedule = [];
   late DateTime startDate;
  
  @override
  void initState() {
    super.initState();
    startDate = DateTime.now();
    initializeRepaymentSchedule();
  }


  Future<void> initializeRepaymentSchedule() async {
    List<Map<String, dynamic>> schedule = await generateRepaymentSchedule(

      widget.loanAmount,
      widget.annualInterestRate,
      widget.loanTermMonths.toInt(),
    );

    if (mounted) {
      setState(() {
        repaymentSchedule = schedule;
      });
    }
  }


  Future<List<Map<String, dynamic>>> generateRepaymentSchedule(
      double loanAmount, double annualInterestRate, int loanTermMonths) async {
    double monthlyInterestRate = annualInterestRate / 12 / 100;
    double monthlyPayment = (loanAmount * monthlyInterestRate) /
        (1 - pow(1 + monthlyInterestRate, -loanTermMonths));

    double remainingBalance = loanAmount;
    List<Map<String, dynamic>> schedule = [];

    setState(() {});

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

Future<void> generateAndDownloadPDF() async {
  try {
    final pdf = pw.Document();
    final data = repaymentSchedule;

    // Load the logo image
    final logoImage = pw.MemoryImage(
      (await rootBundle.load('assets/logo4by1.png')).buffer.asUint8List(),
    );

    final font = pw.Font.ttf(await rootBundle.load('assets/fonts/Roboto-Black.ttf'));

    pdf.addPage(
      pw.Page(
        build: (pw.Context context) {
          return pw.Column(
            children: [
              // Add the logo at the top in the center
              pw.Center(
                child: pw.Image(logoImage, width: 200, height: 50),
              ),
              pw.SizedBox(height: 00),
              pw.Table(
                border: pw.TableBorder.all(),
                children: [
                  pw.TableRow(
                    children: [
                      pw.Padding(
                        padding: const pw.EdgeInsets.all(8.0),
                        child: pw.Text('S.No.', style: pw.TextStyle(font: font)),
                      ),
                      pw.Padding(
                        padding: const pw.EdgeInsets.all(8.0),
                        child: pw.Text('Principal', style: pw.TextStyle(font: font)),
                      ),
                      pw.Padding(
                        padding: const pw.EdgeInsets.all(8.0),
                        child: pw.Text('Interest', style: pw.TextStyle(font: font)),
                      ),
                      pw.Padding(
                        padding: const pw.EdgeInsets.all(8.0),
                        child: pw.Text('Ending Balance', style: pw.TextStyle(font: font)),
                      ),
                    ],
                  ),
                  ...data.map(
                    (row) => pw.TableRow(
                      children: [
                        pw.Padding(
                          padding: const pw.EdgeInsets.all(8.0),
                          child: pw.Text(row['paymentNo'].toString(), style: pw.TextStyle(font: font)),
                        ),
                        pw.Padding(
                          padding: const pw.EdgeInsets.all(8.0),
                          child: pw.Text(row['principal'].toStringAsFixed(2), style: pw.TextStyle(font: font)),
                        ),
                        pw.Padding(
                          padding: const pw.EdgeInsets.all(8.0),
                          child: pw.Text(row['interest'].toStringAsFixed(2), style: pw.TextStyle(font: font)),
                        ),
                        pw.Padding(
                          padding: const pw.EdgeInsets.all(8.0),
                          child: pw.Text(row['endingBalance'].toStringAsFixed(2), style: pw.TextStyle(font: font)),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );

    await _savePDFLocally(pdf);

  } catch (e) {
    print('Error generating PDF: $e');
    Get.snackbar('Error', 'Error generating PDF: $e');
  }
}

    // share pdf fucntion 
 Future<void> _sharePDF() async {
  try {
    final pdf = pw.Document();
    final data = repaymentSchedule;

    // Load the font and logo
    final font = pw.Font.ttf(await rootBundle.load('assets/fonts/Roboto-Black.ttf'));
    final logoImage = pw.MemoryImage(
      (await rootBundle.load('assets/kb_finance_logo.png')).buffer.asUint8List(),
    );

    const rowsPerPage = 18 ; // Adjust this number based on the page size and row height
    int totalPages = (data.length / rowsPerPage).ceil();

    for (int page = 0; page < totalPages; page++) {
      final start = page * rowsPerPage;
      final end = start + rowsPerPage > data.length ? data.length : start + rowsPerPage;

      pdf.addPage(
        pw.Page(
          build: (pw.Context context) {
            return pw.Column(
              children: [
                // Add logo at the top center
                pw.Center(
                  child: pw.Image(logoImage, width: 150, height: 100),
                ),
                pw.SizedBox(height: 2), 

                // Add the table
                pw.Table(
                  border: pw.TableBorder.all(),
                  children: [
                    pw.TableRow(
                      children: [
                        pw.Padding(
                          padding: const pw.EdgeInsets.all(8.0),
                          child: pw.Text('S.No.', style: pw.TextStyle(font: font)),
                        ),
                        pw.Padding(
                          padding: const pw.EdgeInsets.all(8.0),
                          child: pw.Text('Principal', style: pw.TextStyle(font: font)),
                        ),
                        pw.Padding(
                          padding: const pw.EdgeInsets.all(8.0),
                          child: pw.Text('Interest', style: pw.TextStyle(font: font)),
                        ),
                        pw.Padding(
                          padding: const pw.EdgeInsets.all(8.0),
                          child: pw.Text('Ending Balance', style: pw.TextStyle(font: font)),
                        ),
                      ],
                    ),
                    ...data.sublist(start, end).map(
                      (row) => pw.TableRow(
                        children: [
                          pw.Padding(
                            padding: const pw.EdgeInsets.all(8.0),
                            child: pw.Text(row['paymentNo'].toString(), style: pw.TextStyle(font: font)),
                          ),
                          pw.Padding(
                            padding: const pw.EdgeInsets.all(8.0),
                            child: pw.Text(row['principal'].toStringAsFixed(2), style: pw.TextStyle(font: font)),
                          ),
                          pw.Padding(
                            padding: const pw.EdgeInsets.all(8.0),
                            child: pw.Text(row['interest'].toStringAsFixed(2), style: pw.TextStyle(font: font)),
                          ),
                          pw.Padding(
                            padding: const pw.EdgeInsets.all(8.0),
                            child: pw.Text(row['endingBalance'].toStringAsFixed(2), style: pw.TextStyle(font: font)),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            );
          },
        ),
      );
    }

    // Share the generated PDF
    await Printing.sharePdf(bytes: await pdf.save(), filename: 'repayment_schedule.pdf');
  } catch (e) {
    print('Error sharing PDF: $e');
    if (mounted) {
      Get.snackbar('Error', 'Error sharing PDF: $e');
    }
  }
}


Future<void> _savePDFLocally(pw.Document pdf) async {
  try {
    // Get the path to the "Download" folder
    final directory = await getExternalStorageDirectory();
    String downloadsfolerPath = '/storage/emulated/0/Download';
    final downloadPath = '${downloadsfolerPath}/repayment_schedule.pdf';
    
    // Create the "Download" directory if it doesn't exist
    final downloadDir = Directory('${directory?.path}/Download');
    if (!await downloadDir.exists()) {
      await downloadDir.create(recursive: true);
    }
    
    // Save the PDF file to the "Download" folder
    final file = File(downloadPath);
    await file.writeAsBytes(await pdf.save());

    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('PDF saved to ${file.path}')),
      );
    }
  } catch (e) {
    print('Error saving PDF: $e');
    if (mounted) {
      Get.snackbar('Error', 'Error saving PDF: $e');
    }
  }
}


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
      
        SizedBox(height: 20),
        Row(
          children: [
            ElevatedButton(
              onPressed: _sharePDF,
              child: Text('Share PDF'),
            ),
            SizedBox(width: 10),
            ElevatedButton(
              onPressed: generateAndDownloadPDF, 
              child: Text('Download PDF'),
            ),
          ],
        ),
        SizedBox(height: 20),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: DataTable(
            dataTextStyle: TextStyle(color: Colors.black),
            columnSpacing: 16.0,
            headingRowHeight: 40.0,
            columns: [
              DataColumn(label: Text('S.No.', style: TextStyle(color: Colors.black.withOpacity(0.5)))),
              DataColumn(label: Text('Principal', style: TextStyle(color: Colors.black.withOpacity(0.5)))),
              DataColumn(label: Text('Interest', style: TextStyle(color: Colors.black.withOpacity(0.5)))),
              DataColumn(label: Text('Balance', style: TextStyle(color: Colors.black.withOpacity(0.5)))),
            ],
            rows: repaymentSchedule
                .map(
                  (repayment) => DataRow(
                    cells: [
                      DataCell(Text(repayment['paymentNo'].toString(), style: TextStyle(color: Colors.black.withOpacity(0.5)))),
                      DataCell(Text(repayment['principal'].toStringAsFixed(2), style: TextStyle(color: Colors.black.withOpacity(0.5)))),
                      DataCell(Text(repayment['interest'].toStringAsFixed(2), style: TextStyle(color: Colors.black.withOpacity(0.5)))),
                      DataCell(Text(repayment['endingBalance'].toStringAsFixed(2), style: TextStyle(color: Colors.black.withOpacity(0.5)))),
                    ],
                  ),
                )
                .toList(),
          ),
        ),
        SizedBox(height: 20),
       
      ],
    );
  }
}
