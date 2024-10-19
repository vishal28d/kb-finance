// ignore_for_file: must_be_immutable
//flutter
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:credit_app/controllers/loan_application_controller.dart';
import 'package:credit_app/services/CommonLoanDetailFetchData.dart';

import 'package:credit_app/widget/appBarWidget.dart';
import 'package:credit_app/widget/common_padding.dart';
import 'package:credit_app/widget/custom_dropdown.dart';
import 'package:credit_app/widget/custom_textformfield.dart';
// import 'package:credit_app/widget/drawer_widget.dart';
import 'package:credit_app/utils/global.dart' as global;
import 'package:credit_app/widget/not_available_page.dart';
import 'package:credit_app/widget/primary_button.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
//packages
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'loan_detail_screen.dart';


class LoanApplicationScreen extends StatefulWidget {

   final int initialTabIndex;  // Add a parameter for the initial tab index
  LoanApplicationScreen({this.initialTabIndex = 0});


  @override
  State<LoanApplicationScreen> createState() => _LoanApplicationScreenState();
}

class _LoanApplicationScreenState extends State<LoanApplicationScreen> with SingleTickerProviderStateMixin  {
  DateTime? _fromDate;

  DateTime? _toDate;

  TabController? _tabController;

  final LoanApplicationController loanController = Get.find<LoanApplicationController>();

  List<String> titleList1 = [
    'Home Loan',
    "Business Loan",
    "Personal Loan",
  ];

  List<Map<String,dynamic>> loanDetails = [];

  String? email = '' ;

  void _saveEmail() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  email = prefs.getString('email')!;
}

  @override
  void initState() {
    fetchLoanData() ;
    _saveEmail() ;
    super.initState();
     _tabController = TabController(length: 8, vsync: this );
 
    // Set the initial tab using the passed parameter
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_tabController != null) {
        _tabController!.animateTo(widget.initialTabIndex);
      }
    });

  }

   @override
  void dispose() {
    _tabController?.dispose();
    super.dispose();
  }

  // Function to fetch loan data using CommonLoanDataFetcher
  CommonLoanDataFetcher loanDataFetcher = CommonLoanDataFetcher();

  Future<void> fetchLoanData() async {
    loanDetails = await loanDataFetcher.fetchAllLoanDetails();
    setState(() {}); 
    
  }

  FirebaseFirestore _firestore = FirebaseFirestore.instance ;

  Future<void> deleteLoanForm(String documentId) async {
  try {
    await _firestore.collection('LoanFormDetails').doc(documentId).delete();
    Get.snackbar(
      'Success',
      'Loan form details deleted successfully!',
      snackPosition: SnackPosition.TOP,
      backgroundColor: Colors.green,
      colorText: Colors.white,
    );
  } catch (e) {
    Get.snackbar(
      'Error',
      'Failed to delete loan form: $e',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.red,
      colorText: Colors.white,
    );
  }
}


void _showDeleteConfirmationDialog(BuildContext context, String documentId) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(
          'Confirm Deletion',
          style: TextStyle(color: Colors.black54), // Red color for title
        ),
        content: Text(
          'Are you sure you want to delete this loan form details?',
          style: TextStyle(color: Colors.black), // Optional: you can keep this as is or change it
        ),
        actions: <Widget>[
          TextButton(
            style: ButtonStyle(backgroundColor: WidgetStatePropertyAll(Colors.red)),
            onPressed: () {
              Get.back(); // Close the dialog
            },
            child: Text(
              'Cancel',
              style: TextStyle(color: Colors.white), // Optional: you can set this color as desired
            ),
          ),
          TextButton(
            style: ButtonStyle(backgroundColor: WidgetStatePropertyAll(Colors.red)),
            onPressed: () async {
              Get.back(); // Close the dialog
             await deleteLoanForm(documentId); // Delete the loan form
             setState(() {
               fetchLoanData() ;
             });
            },
            child: Text(
              'Delete',
              style: TextStyle(color: Colors.white), // Red color for delete button
            ),
          ),
        ],
      );
    },
  );
}



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // removed Drawer
        // drawer: DrawerWidget(
        //   a: a,
        //   o: o,
        // ),
        backgroundColor: Colors.grey[100],
        appBar: MyCustomAppBar(
          height: 80,
          appbarPadding: 0,
          title: Text('Loan Applications'),
          centerTitle: true,
        ),
        body: DefaultTabController(
          length: 8,
          child: Column(
            children: [
              TabBar(
                onTap: (int index) async {},
                controller: _tabController,
                isScrollable: true,
                indicatorColor: Theme.of(context).primaryColor,
                unselectedLabelColor: Theme.of(context).primaryTextTheme.displaySmall!.color,
                indicatorSize: TabBarIndicatorSize.tab,
                labelColor: Theme.of(context).primaryColor,
                labelStyle: Theme.of(context).textTheme.headlineSmall,
                tabs: [
                  Tab(
                    child: Text(
                      'Pending',
                    ),
                  ),
                  Tab(
                    child: Text(
                      'RM Assigned',
                    ),
                  ),
                  Tab(
                    child: Text(
                      'For Verification',
                    ),
                  ),
                  Tab(
                    child: Text(
                      'To Credit Team',
                    ),
                  ),
                  Tab(
                    child: Text(
                      'Approved',
                    ),
                  ),
                  Tab(
                    child: Text(
                      'Decline',
                    ),
                  ),
                  Tab(
                    child: Text(
                      'Sanctioned',
                    ),
                  ),
                  Tab(
                    child: Text(
                      'Disbursed',
                    ),
                  ),
                ],
              ),

              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    CommonPadding(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(child: loanApplicationList(context , loanDataFetcher.pendingLoans)),
                        ],
                      ),
                    ),
                    CommonPadding(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(child: loanApplicationList(context, loanDataFetcher.rmAssignedLoans)),
                        ],
                      ),
                    ),
                    CommonPadding(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(child: loanApplicationList(context , loanDataFetcher.forVerificationLoans)),
                        ],
                      ),
                    ),
                    CommonPadding(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(child: loanApplicationList(context, loanDataFetcher.toCreditTeamLoans)),
                        ],
                      ),
                    ),
                    CommonPadding(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(child: loanApplicationList(context , loanDataFetcher.approvedLoans )),
                        ],
                      ),
                    ),
                    CommonPadding(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(child: loanApplicationList(context , loanDataFetcher.declinedLoans )),
                        ],
                      ),
                    ),
                    CommonPadding(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(child: loanApplicationList(context , loanDataFetcher.sanctionedLoans )),
                        ],
                      ),
                    ),
                    CommonPadding(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(child: loanApplicationList(context, loanDataFetcher.disbursedLoans )),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }


 Widget loanApplicationList(BuildContext context , List<Map<String,dynamic>> loanDetails ) {

   var filteredLoanDetails = loanDetails.where((loanDetail) {

    // print( "Created by ${loanDetail['Created By']}") ;
    return loanDetail['Created By'] == email; // match both emails loggedin and createdby
  }).toList();


  // Check if the filtered list is empty and display a message
  if (filteredLoanDetails.isEmpty) {
    return Center(
      child: Text(
        'No loan applications found for this email.',
        style: Theme.of(context).textTheme.bodyLarge,
      ),
    );
  }
  
  return ListView.builder(
    itemCount: filteredLoanDetails.length, // Use the length of the loanDetails list
    itemBuilder: (BuildContext context, int index) {
      final loanDetail = filteredLoanDetails[index]; // Get the current loan detail
      
      return Container(
        margin: EdgeInsets.only(top: 8, bottom: 8),
        width: Get.width,
        height: 85,
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                Container(
                  
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        loanDetail['Selected Loan Type'] ?? 'N/A', // Use the loan type from the current detail
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 2, bottom: 2),
                        child: Text(
                         "Name : ${loanDetail['Name']}" ?? 'Date Not Available', // Placeholder for date
                          style: Theme.of(context).primaryTextTheme.displayMedium,
                        ),
                      ),
                      Text(
                        'Loan Amount : ${global.currencySymbol}${loanDetail['Loan Amount']}', // Use the loan amount from the current detail
                        style: Theme.of(context).primaryTextTheme.displayMedium,
                      )
                    ],
                  ),
                ),

                
                Expanded(
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        PopupMenuButton(
                          icon: Icon(Icons.more_vert, color: Colors.black),
                          itemBuilder: (context) => [
                            PopupMenuItem(
                              child: ListTile(
                                contentPadding: EdgeInsets.zero,
                                title: Row(
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.only(right: 10),
                                      child: Icon(
                                        Icons.edit,
                                        color: Theme.of(context).primaryColor,
                                      ),
                                    ),
                                    Text(
                                      'Edit',
                                      style: Theme.of(context).primaryTextTheme.displayMedium,
                                    ),
                                  ],
                                ),
                                onTap: () {
                                  Get.to(()=> NotAvailablePage()) ;
                                },
                              ),
                            ),

                            PopupMenuItem(
                              child: ListTile(
                                contentPadding: EdgeInsets.zero,
                                title: Row(
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.only(right: 10),
                                      child: Icon(
                                        Icons.delete,
                                        color: Theme.of(context).primaryColor,
                                      ),
                                    ),
                                    Text(
                                      'Delete',
                                      style: Theme.of(context).primaryTextTheme.displayMedium,
                                    ),
                                  ],
                                ),
                                onTap: () {
                                  
                                  Navigator.pop(context) ;
                                _showDeleteConfirmationDialog(context, loanDetail["Document Id"]); 
                               
                                  
                                },
                              ),
                            ),

  PopupMenuItem(
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        title: Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Icon(Icons.edit, color: Theme.of(context).primaryColor),
            ),
            Text(
              'Edit Status',
              style: Theme.of(context).primaryTextTheme.displayMedium,
            ),
          ],
        ),
        onTap: () {
          Navigator.pop(context); // Close popup menu

          List<Map<String, String>> statuses = [
            {"title": "Pending", "status": "Pending"},
            {"title": "RM Assigned", "status": "RM Assigned"},
            {"title": "For Verification", "status": "For Verification"},
            {"title": "To Credit Team", "status": "To Credit Team"},
            {"title": "Approved", "status": "Approved"},
            {"title": "Decline", "status": "Decline"},
            {"title": "Sanctioned", "status": "Sanctioned"},
            {"title": "Disbursed", "status": "Disbursed"},
          ];

          // Show status selection dialog
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text("Change Loan Status"),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: statuses.map((status) {
                    return ListTile(
                      title: Text(status['title']!),
                      onTap: () {
                        Navigator.pop(context); // Close status dialog
                        // Show confirmation dialog
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text("Confirm Status Change"),
                              content: Text(
                                "Are you sure you want to change the loan status to ${status['title']}?",
                              ),
                              actions: <Widget>[

                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.black54 , 
                                  ),
                                  child: Text("Cancel" , style: TextStyle(color: Colors.white),),
                                  onPressed: () => Navigator.of(context).pop(),
                                ),

                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.red[800] , 
                                  ),
                                  child: Text("Change",  style: TextStyle(color: Colors.white),),
                                  onPressed: () {
                                    Navigator.of(context).pop(); // Close confirmation dialog
                                    // Update Firestore with new status
                                    FirebaseFirestore.instance
                                        .collection('LoanFormDetails')
                                        .doc(loanDetail["Document Id"]) // Replace with actual docId
                                        .update({'Loan Status': status['status']})
                                        .then((_) => print("Loan status updated to ${status['status']}"))
                                        .catchError((e) => print("Error: $e"));

                                  setState(() {
                                    fetchLoanData() ;
                                  });

                                  },
                                ),
                              ],
                            );
                          },
                        );
                      },
                    );
                  }).toList(),
                ),
              );
            },
          );
        },
      ),
    ),


                            PopupMenuItem(
                              child: ListTile(
                                contentPadding: EdgeInsets.zero,
                                title: Row(
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.only(right: 10),
                                      child: Icon(
                                        Icons.visibility,
                                        color: Theme.of(context).primaryColor,
                                      ),
                                    ),
                                    Text(
                                      'View',
                                      style: Theme.of(context).primaryTextTheme.displayMedium,
                                    ),
                                  ],
                                ),
                                onTap: () {
                                  Get.back();
                                  Get.to(() => LoanDetailScreen(
                                    loanDetails: loanDetail,
                                  ));
                                print(loanDetail) ;

                                },
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      );
    },
  );
}


  Future loanFilter(context) {
    return Get.bottomSheet(
      SingleChildScrollView(
        child: Container(
            height: MediaQuery.of(context).size.height / 2 ,
            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30))),
            child: Padding(
              padding: EdgeInsets.only(left: 15, right: 15),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          'Filter',
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(3),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Status',
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                          Container(
                              width: MediaQuery.of(context).size.width / 2,
                              child: CustomDropDown(
                                hint: Text(
                                  "loan status",
                                  style: Theme.of(context).inputDecorationTheme.hintStyle,
                                ),
                                list: loanController.loanstatus,
                                val: loanController.loanstatusVal,
                                onChanged: (selectedValue) {
                                  loanController.loanstatusVal = selectedValue.toString();
                                },
                              )),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(3),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Type',
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                          Container(
                              width: MediaQuery.of(context).size.width / 2,
                              child: CustomDropDown(
                                hint: Text(
                                  "loan type",
                                  style: Theme.of(context).inputDecorationTheme.hintStyle,
                                ),
                                list: loanController.loantypelist,
                                val: loanController.loantypelistVal,
                                onChanged: (selectedValue) {
                                  loanController.loantypelistVal = selectedValue.toString();
                                },
                              )),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(3),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'From Date',
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width / 2,
                            child: CustomTextFormField(
                              hintText: "from date",
                              textEditingController: loanController.cfromdate,
                              focusnode: loanController.ffromdate,
                              onTap: () async {
                                _selectFromDate(context);
                              },
                              obscureText: false,
                              
                              readOnly: true,
                            ),
                          ),
                        ],
                      ),
                    ),

                    Padding(
                      padding: EdgeInsets.all(3),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'ToDate',
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width / 2,
                            child: CustomTextFormField(
                              hintText: "to date",
                              textEditingController: loanController.ctodate,
                              focusnode: loanController.ftodate,
                              onTap: () async {
                                _seletToDate(context);
                              },
                              obscureText: false,
                             
                              readOnly: true,
                            ),
                          ),
                        ],
                      ),
                    ),

                    Padding(
                      padding: EdgeInsets.only(top: 15),
                      child: Container(
                        child: PrimaryTextButton(
                          text: "Apply",
                          voidCallback: () {
                            Get.back();
                          },
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )),
      ),
    );
  }


  Future _selectFromDate(context) async {
    try {
      final DateTime? picked = await showDatePicker(
        lastDate: DateTime(2050),
        context: context,
        initialDate: _fromDate != null ? _fromDate! : DateTime.now(),
        firstDate: DateTime(1940),
      );
      if (picked != null && picked != DateTime(2000)) {
        _fromDate = picked;
        loanController.cfromdate.text = formatDate(_fromDate!, [dd, '-', mm, '-', yyyy]);
      }
    } catch (e) {
      print('Exception - loan_list_screen - _selectFromDate(): ' + e.toString());
    }
  }


  Future _seletToDate(context) async {
    try {
      final DateTime? picked = await showDatePicker(
        lastDate: DateTime(2050),
        context: context,
        initialDate: _fromDate != null ? _fromDate! : DateTime.now(),
        firstDate: _fromDate!,
      );
      if (picked != null && picked != DateTime(2000)) {
        _toDate = picked;
        loanController.ctodate.text = formatDate(_toDate!, [dd, '-', mm, '-', yyyy]);
      }
    } catch (e) {
      print('Exception - loan_list_screen - _seletToDate(): ' + e.toString());
    }
  }

  List<String> titleList = [];

  List<String> subTitle = [];

  List<String> loantype = [];
}
