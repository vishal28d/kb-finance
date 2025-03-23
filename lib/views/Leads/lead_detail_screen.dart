import 'package:credit_app/widget/appBarWidget.dart';
import 'package:credit_app/widget/baseRoute.dart';
import 'package:credit_app/widget/common_padding.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';


class LeadDetailScreen extends BaseRoute {
  final Map<String, dynamic> lead;

  LeadDetailScreen({a, o, required this.lead}) : super(a: a, o: o, r: 'LeadDetailScreen');

  String _formatDate(String dateStr) {
    try {
      final date = DateTime.parse(dateStr);
      return DateFormat('dd/MM/yyyy').format(date);
    } catch (e) {
      return 'Invalid date';
    }
  }

  @override
  Widget build(BuildContext context) {
    Map<String, String> fieldMap = {
 
  'LeadID': 'LeadID',
  // Personal Details
  'Full Name': 'Full Name',
  'Email': 'Email',
  'Mobile No': 'Mobile No',
  'Alternate Mobile': 'Alternate Mobile',
  // 'Aadhar No': 'Aadhar No',
  // 'PAN No': 'PAN No',
  'Employment Type': 'Employment Type',
  'Created By': 'Created By',
  
  // Address Details
  'City Residence': 'City Residence Address ',
  'State Residence': 'State Residence Address',
  'Pincode Residence': 'Pincode Residence Address ',
  'City Office': 'City Office Address',
  'State Office': 'State Office Address',
  'Pincode Office': 'Pincode Office Address',
  'City Permanent': 'City Permanent Address',
  'State Permanent': 'State Permanent Address',
  'Pincode Permanent': 'Pincode Permanent Address',
  'Landmark': 'Landmark',

  // Follow-up Details
  'Next Follow Up Date': 'Next Follow Up Date',
  'Next Follow Up Time': 'Next Follow Up Time',
  'Follow Up Comments': 'Follow Up Comments',
  'Start Date': 'Follow Up Date',
  'Picked Time': 'Follow Up Time',

  // Loan Details
  'Loan Amount': 'Loan Amount',
  'Loan Type': 'Loan Type',
  'Interest Rate': 'Interest Rate',
  'Tenure': 'Tenure',
  'Tenure Left': 'Tenure Left',
  'Bank': 'Bank',

  //required
    'EMI Type':  'EMI Type' ,
    'Required Loan Amount':  'Required Loan Amount' ,
    'Required Loan Type': 'Required Loan Type'  ,
    'Required Bank Name': 'Required Bank Name' ,
    'Required Loan Tenure': 'Required Loan Tenure' ,
    'Required Loan Interest':   'Required Loan Interest' ,
    'Required Loan EMI Type' :  'Required Loan EMI Type' ,

  // Miscellaneous
};


    return Scaffold(
      backgroundColor: Color(0xffffffff),
      appBar: MyCustomAppBar(
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(Icons.arrow_back_ios, size: 20),
        ),
        height: 80,
        appbarPadding: 0,
        title: Text('Lead Detail'),
        centerTitle: true,
      ),
      body: CommonPadding(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: fieldMap.entries.map((entry) {
              String label = entry.value;
              String key = entry.value;
              String value = lead[entry.key]?.toString() ?? 'N/A';

              // Format dates for specific fields
              if ((label == 'Follow Up Date' || label == 'Next Follow Up Date') && value != 'N/A') {
                value = _formatDate(value);
              }

              return DetailTile(title: label, value: value);

            }).toList(),
          ),
        ),
      ),
    );
  }
}


class DetailTile extends StatelessWidget {
  final String title;
  final String value;

  DetailTile({required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Text(
            title,
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          subtitle: Padding(
            padding: const EdgeInsets.only(left: 0, top: 5),
            child: Text(
              value,
              style: Theme.of(context).primaryTextTheme.titleLarge,
            ),
          ),
        ),
        Divider(height: 1, thickness: 1),
      ],
    );
  }
}
