import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:credit_app/widget/appBarWidget.dart';
import 'package:credit_app/widget/baseRoute.dart';
import 'package:credit_app/widget/common_padding.dart';
import 'package:flutter/material.dart';
import 'package:credit_app/utils/global.dart' as global;
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class LeadDetailScreen extends BaseRoute {
  final Map<String, dynamic> lead;

  LeadDetailScreen({a, o, required this.lead}) : super(a: a, o: o, r: 'LeadDetailScreen');

  @override
  Widget build(BuildContext context) {
    // Extract data from lead map
    List<dynamic> details = lead['details'] ?? [];
    Timestamp createdAt = lead['createdAt'];
    DateTime createdAtDate = createdAt.toDate();
    String fullName = details.isNotEmpty ? details[0].toString().split(': ')[1] : 'N/A';
    String loanType = details.length > 5 ? details[5].toString().split(': ')[1] : 'N/A';
    String mobileNo = details.length > 1 ? details[1].toString().split(': ')[1] : 'N/A';
    String loanAmount = details.length > 3 ? details[3].toString().split(': ')[1] : 'N/A';
    String employmentType = details.length > 4 ? details[4].toString().split(': ')[1] : 'N/A';
    String leadCode = details.length > 9 ? details[9].toString().split(': ')[1] : 'N/A';
    String email = details.length > 2    ? details[2].toString().split(': ')[1] : 'N/A';
    String aadharNo = details.length > 6 ? details[6].toString().split(': ')[1] : 'N/A';
    String panNo = details.length > 7    ? details[7].toString().split(': ')[1] : 'N/A';
    String address = details.length > 8  ? details[8].toString().split(': ')[1] : 'N/A';
    String startDate = details.length > 10 ? DateFormat('dd/MM/yyyy').format(DateTime.parse(details[10].toString().split(': ')[1]))  : 'N/A';


    return Scaffold(
      backgroundColor: Color(0xffffffff),
      appBar: MyCustomAppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            Icons.arrow_back_ios,
            size: 20,
          ),
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
            children: [
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 0),
                    child: ListTile(
                      title: Text("Lead Id", style: Theme.of(context).textTheme.headlineSmall),
                      subtitle: Padding(
                        padding: const EdgeInsets.only(left: 0, top: 5),
                        child: Text(leadCode, style: Theme.of(context).primaryTextTheme.titleLarge),
                      ),
                    ),
                  ),
                  Divider(height: 1, thickness: 1),
                  Padding(
                    padding: EdgeInsets.only(top: 0),
                    child: ListTile(
                      title: Text("Name", style: Theme.of(context).textTheme.headlineSmall),
                      subtitle: Padding(
                        padding: const EdgeInsets.only(left: 0, top: 5),
                        child: Text(fullName, style: Theme.of(context).primaryTextTheme.titleLarge),
                      ),
                    ),
                  ),
                  Divider(height: 1, thickness: 1),
                  Padding(
                    padding: EdgeInsets.only(top: 0),
                    child: ListTile(
                      title: Text("Date", style: Theme.of(context).textTheme.headlineSmall),
                      subtitle: Padding(
                        padding: const EdgeInsets.only(left: 0, top: 5),
                        child: Text(startDate , style: Theme.of(context).primaryTextTheme.titleLarge),
                      ),
                    ),
                  ),
                  Divider(height: 1, thickness: 1),
                  Padding(
                    padding: EdgeInsets.only(top: 0),
                    child: ListTile(
                      title: Text("Email", style: Theme.of(context).textTheme.headlineSmall),
                      subtitle: Padding(
                        padding: const EdgeInsets.only(left: 0, top: 5),
                        child: Text(email, style: Theme.of(context).primaryTextTheme.titleLarge),
                      ),
                    ),
                  ),
                  Divider(height: 1, thickness: 1),
                  Padding(
                    padding: EdgeInsets.only(top: 0),
                    child: ListTile(
                      title: Text("Aadhar Number", style: Theme.of(context).textTheme.headlineSmall),
                      subtitle: Padding(
                        padding: const EdgeInsets.only(left: 0, top: 5),
                        child: Text(aadharNo, style: Theme.of(context).primaryTextTheme.titleLarge),
                      ),
                    ),
                  ),
                  Divider(height: 1, thickness: 1),
                  Padding(
                    padding: EdgeInsets.only(top: 0),
                    child: ListTile(
                      title: Text("PAN Number", style: Theme.of(context).textTheme.headlineSmall),
                      subtitle: Padding(
                        padding: const EdgeInsets.only(left: 0, top: 5),
                        child: Text(panNo, style: Theme.of(context).primaryTextTheme.titleLarge),
                      ),
                    ),
                  ),
                  Divider(height: 1, thickness: 1),
                  Padding(
                    padding: EdgeInsets.only(top: 0),
                    child: ListTile(
                      title: Text("Loan Type", style: Theme.of(context).textTheme.headlineSmall),
                      subtitle: Padding(
                        padding: const EdgeInsets.only(left: 0, top: 5),
                        child: Text(loanType, style: Theme.of(context).primaryTextTheme.titleLarge),
                      ),
                    ),
                  ),
                  Divider(height: 1, thickness: 1),
                  Padding(
                    padding: EdgeInsets.only(top: 0),
                    child: ListTile(
                      title: Text("Loan Amount", style: Theme.of(context).textTheme.headlineSmall),
                      subtitle: Padding(
                        padding: const EdgeInsets.only(left: 0, top: 5),
                        child: Text("${global.currencySymbol}$loanAmount", style: Theme.of(context).primaryTextTheme.titleLarge),
                      ),
                    ),
                  ),
                  Divider(height: 1, thickness: 1),
                  Padding(
                    padding: EdgeInsets.only(top: 0),
                    child: ListTile(
                      title: Text("Employment Type", style: Theme.of(context).textTheme.headlineSmall),
                      subtitle: Padding(
                        padding: const EdgeInsets.only(left: 0, top: 5),
                        child: Text(employmentType , style: Theme.of(context).primaryTextTheme.titleLarge),
                      ),
                    ),
                  ),
                  Divider(height: 1, thickness: 1),
                  Padding(
                    padding: EdgeInsets.only(top: 0),
                    child: ListTile(
                      title: Text("Address", style: Theme.of(context).textTheme.headlineSmall),
                      subtitle: Padding(
                        padding: const EdgeInsets.only(left: 0, top: 5),
                        child: Text(address, style: Theme.of(context).primaryTextTheme.titleLarge),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
