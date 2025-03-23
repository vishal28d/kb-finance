import 'dart:async';

import 'package:credit_app/controllers/emi_calculator_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'dart:math'; // For interest calculations
// For formatting dates
// For PDF generation
import 'package:pdf/widgets.dart' as pw; // For PDF widgets
import 'package:permission_handler/permission_handler.dart';
import 'package:printing/printing.dart'; // For PDF printing and sharing
import 'dart:io'; // For file operations
// For accessing device directories

// ignore: must_be_immutable
class RepaymentScheduleTable extends StatefulWidget {
   double loanAmount;
   double annualInterestRate;
   double loanTermMonths;
   double emiResult;

  RepaymentScheduleTable({
    required this.loanAmount,
    required this.annualInterestRate,
    required this.loanTermMonths,
    required this.emiResult,
  });

  @override
  _RepaymentScheduleTableState createState() => _RepaymentScheduleTableState();
}


class _RepaymentScheduleTableState extends State<RepaymentScheduleTable> {

  final EmiCalculatorController emiCalculatorController = Get.put(EmiCalculatorController()) ;
  
  
   late DateTime startDate;
   
  
  @override
  void initState() {
    startDate = DateTime.now();
    emiCalculatorController.initializeRepaymentSchedule(
    widget.loanAmount,
    widget.annualInterestRate,
    widget.loanTermMonths,
    );

    setState(() {
      widget.emiResult ;
    });

    super.initState();

  }



  Future<void> requestStoragePermission() async {
  var status = await Permission.storage.status;
  if (!status.isGranted) {
    await Permission.storage.request();
  }
}



Future<void> generateAndDownloadPDF() async {
  try {
    emiCalculatorController.initializeRepaymentSchedule(
        widget.loanAmount,
    widget.annualInterestRate,
    widget.loanTermMonths,
    );
   
    final pdf = pw.Document();
    final data = emiCalculatorController.repaymentSchedule ;

    // Load the logo image
    final logoImage = pw.MemoryImage(
      (await rootBundle.load('assets/logo4by1.png')).buffer.asUint8List(),
    );

    // Load custom font
    final font = pw.Font.ttf(await rootBundle.load('assets/fonts/Roboto-Black.ttf'));
     
    const rowsPerPage = 18; // Set the number of rows per page
    int totalPages = (data.length / rowsPerPage).ceil(); // Calculate total pages

    for (int page = 0; page < totalPages; page++) {
      final start = page * rowsPerPage;
      final end = start + rowsPerPage > data.length ? data.length : start + rowsPerPage;

      pdf.addPage(
        pw.Page(
          build: (pw.Context context) {
            return pw.Column(
              children: [
                // Add the logo at the top in the center
                pw.Center(
                  child: pw.Image(logoImage, width: 150, height: 60),
                ),
                pw.SizedBox(height: 5),

                if(page==0)
                pw.Text('Loan Amount:Rs ${widget.loanAmount}, \t \t Interest Rate: ${widget.annualInterestRate}% , \nLoan Duration: ${widget.loanTermMonths} months, \t EMI : Rs ${widget.emiResult}' , style: pw.TextStyle(fontSize: 15, font: font) ),

                pw.SizedBox(height: 10) ,
                // Add the table for the current page
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

    // Save the PDF file locally
    await _savePDFLocally(pdf);

  } catch (e) {
    print('Error generating PDF: $e');
    Get.snackbar('Error', 'Error generating PDF: $e');
  }
}


    // share pdf fucntion 
 Future<void> _sharePDF() async {
  try {
   emiCalculatorController.initializeRepaymentSchedule(
      widget.loanAmount,
    widget.annualInterestRate,
    widget.loanTermMonths,
   );
   
    final pdf = pw.Document();
    final data = emiCalculatorController.repaymentSchedule;

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
                  child: pw.Image(logoImage, width: 140, height: 95),
                ),
                pw.SizedBox(height: 2), 

                if(page==0)
                pw.Text('Loan Amount: Rs ${widget.loanAmount}, \t \t Interest Rate: ${widget.annualInterestRate}% , \nLoan Duration: ${widget.loanTermMonths} months, \t EMI :Rs ${widget.emiResult}' , style: pw.TextStyle(fontSize: 15, font: font) ),

                pw.SizedBox(height: 5) ,  

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
    await requestStoragePermission(); // Ensure permission is requested

    // Generate a random 4-digit number
    Random random = Random();
    int randomNumber = 1000 + random.nextInt(9000); // Random number between 1000 and 9999

    String downloadsFolderPath = '/storage/emulated/0/Download';
    final downloadPath = '$downloadsFolderPath/repayment_schedule_$randomNumber.pdf';

    // Create the File object for the PDF to be saved
    final file = File(downloadPath);

    // Save the PDF file
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
          mainAxisAlignment: MainAxisAlignment.center,
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

        Obx(()=>
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
            rows: emiCalculatorController.repaymentSchedule
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
        ) ,
        SizedBox(height: 20),
       
      ],
    );
  }
}
