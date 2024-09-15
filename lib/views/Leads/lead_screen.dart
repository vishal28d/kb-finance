import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:credit_app/services/fetchDbData.dart';
import 'package:credit_app/views/Leads/add_lead_screen.dart';
import 'package:credit_app/views/Leads/edit_lead_screen.dart';
import 'package:credit_app/views/Leads/lead_detail_screen.dart';
import 'package:credit_app/widget/appBarWidget.dart';
import 'package:credit_app/widget/baseRoute.dart';
import 'package:credit_app/widget/common_padding.dart';
import 'package:credit_app/utils/global.dart' as global;
import 'package:credit_app/widget/dotted_divider.dart';
import 'package:credit_app/widget/elevated_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class LeadListScreen extends StatefulWidget {
  LeadListScreen({Key? key, a, o}) : super(key: key);

  @override
  _LeadListScreenState createState() => _LeadListScreenState();
}

class _LeadListScreenState extends State<LeadListScreen> {

  late Future<List<Map<String, dynamic>>> leadData = fetchLeads()  ;

  @override
  void initState() {
    super.initState();
   leadData = fetchLeads() ;

  }


  Future<void> deleteLead(String documentId) async {
    try {
      // Perform the deletion
      await FirebaseFirestore.instance
          .collection('leadDetails')
          .doc(documentId)
          .delete();
      print('Lead deleted successfully');
      // Refresh the data after deletion
      setState(() {
        leadData = fetchLeads();
      });
    } catch (e) {
      print('Error deleting lead: $e');
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
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
        title: Text('Leads'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Get.to(() => (AddLeadScreen(
                   
                  )));
            },
            icon: Icon(
              Icons.add,
              size: 28,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 10),
        child: CommonPadding(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(child: leadList(context)),
            ],
          ),
        ),
      ),
    );
  }

  Widget leadList(BuildContext context) {
    return FutureBuilder<List<Map<String, dynamic>>>(
      future: leadData,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<Map<String, dynamic>> leadList = snapshot.data!;

          return ListView.builder(
            itemCount: leadList.length,
            itemBuilder: (context, index) {
              Map<String, dynamic> lead = leadList[index];

              List<dynamic> details = lead['details'] ?? [];
              Timestamp createdAt = lead['createdAt'];
              DateTime createdAtDate = createdAt.toDate();
              String fullName = details.isNotEmpty ? details[0].toString().split(': ')[1] : 'N/A';
              String loanType = details.length > 5 ? details[5].toString().split(': ')[1] : 'N/A';
              String mobileNo = details.length > 1 ? details[1].toString().split(': ')[1] : 'N/A';
              String loanAmount = details.length > 3 ? details[3].toString().split(': ')[1] : 'N/A';
              String leadCode = details.length > 9 ? details[9].toString().split(': ')[1] : 'N/A';
              String documentId = lead['id'] ?? 'N/A';
              String startDate = details.length > 10 ? DateFormat('dd/MM/yyyy').format(DateTime.parse(details[10].toString().split(': ')[1]))  : 'N/A';

              return Container(
                margin: EdgeInsets.only(top: 0, bottom: 8),
                width: Get.width,
                child: Card(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(right: 10, left: 10, bottom: 10, top: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: 10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    leadCode,
                                    style: Theme.of(context).textTheme.headlineSmall,
                                  ),
                                  Text(
                                    startDate ,
                                    style: Theme.of(context).textTheme.bodyLarge,
                                  ),
                                ],
                              ),
                            ),

                            DottedDivider() , // divider

                            Padding(
                              padding: EdgeInsets.only(top: 5),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    fullName,
                                    style: Theme.of(context).textTheme.bodyLarge,
                                  ),
                                  Text(
                                    loanType,
                                    style: Theme.of(context).textTheme.bodyLarge,
                                  ),
                                ],
                              ),
                            ),

                           DottedDivider() , // divider
                            Padding(
                              padding: EdgeInsets.only(top: 5),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    mobileNo,
                                    style: Theme.of(context).textTheme.bodyLarge,
                                  ),
                                  Text(
                                    '${global.currencySymbol} $loanAmount',
                                    style: Theme.of(context).textTheme.bodyLarge,
                                  ),
                                ],
                              ),
                            ),
                          
                            DottedDivider() , // divider

                            Padding(
                              padding: EdgeInsets.only(top: 5),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  LeadScreenElevatedButton(
                                    child: Text('Call'),
                                    voidCallback: () {
                                      // Call functionality goes here
                                    },
                                  ),
                                  LeadScreenElevatedButton(
                                    voidCallback: () async {
                                      await Get.to(() => LeadDetailScreen( lead: lead));
                                    },
                                    child: Text('View'),
                                  ),
                                  LeadScreenElevatedButton(
                                    voidCallback: () async {
                                      await Get.to(() => EditLeadScreen());
                                    },
                                    child: Text('Edit'),
                                  ),
                                  LeadScreenElevatedButton(
                                    child: Text('Delete'),
                                    voidCallback: () async {
                                      bool? confirmDelete = await Get.dialog<bool>(
                                        AlertDialog(
                                          title: Text('Confirm Delete'),
                                          content: Text('Are you sure you want to delete this lead?'),
                                          actions: [
                                            TextButton(
                                              style: ButtonStyle(
                                                backgroundColor: WidgetStateProperty.all<Color>(Colors.red),
                                                  
                                                ),
                                              onPressed: () {
                                                Get.back(result: false); 
                                              },
                                              child: Text('Cancel'),
                                            ),
                                            TextButton(
                                              style: ButtonStyle(
                                                backgroundColor: WidgetStateProperty.all<Color>(Colors.red),
                                              ),
                                              onPressed: () {
                                                Get.back(result: true); 
                                              },
                                              child: Text('Delete'),
                                            ),
                                          ],
                                        ),
                                      );

                                      // If the user confirmed deletion, proceed to delete the lead
                                      if (confirmDelete == true) {
                                        await deleteLead(documentId);

                                        Get.snackbar(
                                          'Success',
                                          'Lead deleted successfully',
                                          snackPosition: SnackPosition.BOTTOM,
                                          backgroundColor: Colors.green,
                                          colorText: Colors.white,
                                          duration: Duration(seconds: 2),
                                        );
                                      }
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        } else if (snapshot.hasError) {
          return Center(child: Text('Error fetching leads: ${snapshot.error}'));
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}

class LeadScreenElevatedButton extends ElevatedButtonWIdget {
  const LeadScreenElevatedButton({
    Key? key,
    Widget? child,
    VoidCallback? voidCallback,
  }) : super(key: key, child: child, voidCallback: voidCallback);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: voidCallback,
      child: child,
      style: ElevatedButton.styleFrom(
        backgroundColor: Color(0xFFC63437),
      ),
    );
  }
}

