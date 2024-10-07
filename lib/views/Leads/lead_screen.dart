import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:credit_app/services/fetchDbData.dart';
import 'package:credit_app/views/Leads/add_lead_screen.dart';
import 'package:credit_app/views/Leads/edit_lead_screen.dart';
import 'package:credit_app/views/Leads/lead_detail_screen.dart';
import 'package:credit_app/widget/appBarWidget.dart';
import 'package:credit_app/widget/common_padding.dart';
import 'package:credit_app/utils/global.dart' as global;
import 'package:credit_app/widget/dotted_divider.dart';
import 'package:credit_app/widget/elevated_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';


class LeadListScreen extends StatefulWidget {
  LeadListScreen({Key? key, a, o}) : super(key: key);

  @override
  _LeadListScreenState createState() => _LeadListScreenState();
}

class _LeadListScreenState extends State<LeadListScreen> {

  late Future<List<Map<String, dynamic>>> leadData = fetchLeads()  ;
  String? loginEmail ;
  Future<void> getEmail()async{
    SharedPreferences prefs = await SharedPreferences.getInstance() ;
    loginEmail = prefs.getString('email') ;
  }

  @override
  void initState() {
   getEmail() ;
   setState(() {
   leadData = fetchLeads() ;
   });
  super.initState();
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


 Future<void> makePhoneCall(String phoneNumber) async {

  var status = await Permission.phone.status;
  // If permission is not granted, request it
  if (!status.isGranted) {
    status = await Permission.phone.request();
  }

  // Check if permission is granted
  if (status.isGranted) {
    // Construct the phone call URI
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );

    // Check if the phone can handle the call request and then launch it
    if (await canLaunchUrl(launchUri)) {
      await launchUrl(launchUri);
    } else {
      print('Could not launch $launchUri');
    Get.snackbar('Error', 'Phone Call permission not granted' , backgroundColor: Colors.red[400]) ;

    }
  } else {
    print('Phone call permission not granted');
    Get.snackbar('Error', 'Phone Call permission not granted' , backgroundColor: Colors.red[400]) ;
  }
}
 
   refreshLeadScreen(){
    setState(() {
        leadData = fetchLeads();
    });
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
                  onRefresh: refreshLeadScreen ,
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

  String extractDetail(List details, int index, {String defaultValue = 'N/A', bool isDate = false}) {
  if (details.length > index) {
    String value = details[index].toString().split(': ')[1];
    if (isDate) {
      try {
        return DateFormat('dd/MM/yyyy').format(DateTime.parse(value));
      } catch (e) {
        return defaultValue; 
      }
    }
    return value;
  }
  return defaultValue;
}


    String _formatDate(String dateStr) {
    try {
      final date = DateTime.parse(dateStr);
      return DateFormat('dd/MM/yyyy').format(date);
    } catch (e) {
      return 'Invalid date';
    }
  }


Widget leadList(BuildContext context) {
  return FutureBuilder<List<Map<String, dynamic>>>(
    future: leadData,
    builder: (context, snapshot) {
      if (snapshot.connectionState == ConnectionState.waiting) {
        return Center(child: CircularProgressIndicator());
      } else if (snapshot.hasError) {
        return Center(child: Text('Error fetching leads: ${snapshot.error}'));
      } else if (snapshot.hasData) {
        // Filter the list based on 'Created By' == loginEmail
        List<Map<String, dynamic>> leadList = snapshot.data!.where((lead) {
          return lead['Created By'] == loginEmail;
        }).toList();

        if (leadList.isEmpty) {
          return Center(child: Text('No leads found.', style: TextStyle(color: Colors.black)));
        }

        return ListView.builder(
          itemCount: leadList.length,
          itemBuilder: (context, index) {
            Map<String, dynamic> lead = leadList[index];
            
            // Extract details for each lead
            String fullName = lead['Full Name'] ?? 'n/a';
            String mobileNo = lead['Mobile No'] ?? 'n/a';
            String loanAmount = lead['Loan Amount'] ?? 'n/a';
            String loanType = lead['Loan Type'] ?? 'n/a';
            String leadCode = lead['LeadID'] ?? 'n/a';
            String startDate = lead['Start Date'] ?? 'n/a';
            String pickedTime = lead['Picked Time'] ?? 'n/a';
            String pickedDate = lead['Start Date'] ?? 'n/a';
            String documentId = lead['id'] ?? 'n/a';

            pickedDate = _formatDate(pickedDate);

            return Container(
              margin: EdgeInsets.only(top: 0, bottom: 8),
              width: Get.width,
              child: Card(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                leadCode,
                                style: Theme.of(context).textTheme.headlineSmall,
                              ),
                              Text(
                                '${pickedDate} - $pickedTime',
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                            ],
                          ),
                          DottedDivider(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(fullName, style: Theme.of(context).textTheme.bodyLarge),
                              Text(loanType, style: Theme.of(context).textTheme.bodyLarge),
                            ],
                          ),
                          DottedDivider(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(mobileNo, style: Theme.of(context).textTheme.bodyLarge),
                              Text('${global.currencySymbol} $loanAmount', style: Theme.of(context).textTheme.bodyLarge),
                            ],
                          ),
                          DottedDivider(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              LeadScreenElevatedButton(
                                child: Text('Call'),
                                voidCallback: () {
                                  makePhoneCall(mobileNo);
                                },
                              ),
                              LeadScreenElevatedButton(
                                child: Text('View'),
                                voidCallback: () async {
                                  await Get.to(() => LeadDetailScreen(lead: lead));
                                },
                              ),
                              LeadScreenElevatedButton(
                                child: Text('Edit'),
                                voidCallback: () async {
                                  await Get.to(() => EditLeadScreen(documentId: documentId, onRefresh: refreshLeadScreen));
                                },
                              ),
                              LeadScreenElevatedButton(
                                child: Text('Delete'),
                                voidCallback: () async {
                                  bool? confirmDelete = await Get.dialog<bool>(
                                    AlertDialog(
                                      title: Text('Confirm Delete'),
                                      content: Text('Are you sure you want to permanently delete this lead?'),
                                      actions: [
                                        TextButton(
                                          onPressed: () => Get.back(result: false),
                                          child: Text('Cancel'),
                                        ),
                                        TextButton(
                                          style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.red)),
                                          onPressed: () => Get.back(result: true),
                                          child: Text('Delete'),
                                        ),
                                      ],
                                    ),
                                  );

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
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      } else {
        return Center(child: Text('No data found.', style: TextStyle(color: Colors.black)));
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

