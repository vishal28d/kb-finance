import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddLeadController extends GetxController {
  // TextEditingControllers for form fields
  var fullname = TextEditingController();
  var mobileno = TextEditingController();
  var alternateMobile = TextEditingController();
  var landmark = TextEditingController();
  var aadharno = TextEditingController();
  var panno = TextEditingController();
  var location = TextEditingController();
  var email = TextEditingController();
  var loanamount = TextEditingController();
  var followUpComments = TextEditingController();
  var tenure = TextEditingController();
  var tenureLeft = TextEditingController();
  var interestRate = TextEditingController();

  var stateOffice = TextEditingController();
  var cityOffice = TextEditingController();
  var pincodeOffice= TextEditingController();

  var stateResidence = TextEditingController();
  var cityResidence = TextEditingController();
  var pincodeResidence= TextEditingController();

  var statePermanent= TextEditingController();
  var cityPermanent= TextEditingController();
  var pincodePermanent= TextEditingController();


  var bank = TextEditingController();

  // FocusNodes
  var fmobileno = FocusNode();
  var faadharno = FocusNode();
  var fpanno = FocusNode();
  var flocation = FocusNode();
  var femail = FocusNode();
  var floanamount = FocusNode();

  // Dropdown lists
  List<String> employmenttypelist = ['Self employee', 'Salaried'];
  dynamic employmenttypeVal;
  List<String> loantypelist = [
  "Loan Takeover / BT",
  "Personal Loan",
  "Business Loan",
  "Professional Loan",
  "Home Loan",
  "Mortgage Loan",
  "New Car Loan",
  "Used Car Loan",
  "Used Tractor Loan",
  "New Tractor Loan",
  "Used Commercial Vehicles",
  "New Commercial Vehicles",
  "Two Wheeler Loan",
  "Used Two Wheeler Loan",
  "New Three Vehicles Loan",
  "Credit Card",
  "KCC Loan",
  "Working Capital / CC / OD",
  "Account Opening",
  "Insurance",
  "Investment"
];


  // Date picker field
  Rx<DateTime> pickedDate = DateTime.now().obs ; // Observable date
  Rx<DateTime> nextFollowUpDate =  DateTime.now().obs ; // Observable date

  var pickedTime = Rx<TimeOfDay>(TimeOfDay.now());
  var nextFollowUpTime = Rx<TimeOfDay>(TimeOfDay.now());
 

  List<dynamic>? followUpStatusList = [
  'Pending',
  'Approved',
  'Rejected',
  'On Hold'
  ] ;


  List<dynamic>? emiTypeList = [
  'Monthly',
  'Quarterly',
  'Half-Yearly',
  'Annually' ,
  'None' ,
  ] ;

  List<dynamic>? loanSelectionOptions = [
  'None' ,
  'Loan Takeover / BT',
  'Personal Loan',
  'Business Loan',
  'Professional Loan',
  'Home Loan',
  'Mortgage Loan',
  'New Car Loan',
  'Used Car Loan',
  'Used Tractor Loan',
  'New Tractor Loan',
  'Used Commercial Vehicles Loan',
  'New Commercial Vehicles Loan',
  'Two Wheeler Loan',
  'Used Two Wheeler Loan',
  'New Three Wheelers Loan',
  'Credit Card',
  'KCC Loan',
  'Working Capital / CC / OD',
  'Account Opening',
  'Insurance',
  'Investment'
  ] ;


  var loanType = 'None'.obs ;
  var followUpStatus = 'Pending' ;
  var emiType = 'Monthly'.obs ;
  var selectedLoan = 'None'.obs ;
  var RequiredEmiType = 'None'.obs ;

  var RequiredSelectedLoan = 'None'.obs ;
  var RequiredLoanamount = TextEditingController() ;
  var RequiredBankName = TextEditingController() ;
  var RequiredLoanTenure = TextEditingController() ;
  var RequiredInterest = TextEditingController() ;

  

  @override
  void onInit() async {
    createdbyFunction() ;
    super.onInit();
  }

  @override
  void onClose() {
    // Dispose of controllers and focus nodes when no longer needed
    // fullname.dispose();
    // mobileno.dispose();
    // aadharno.dispose();
    // panno.dispose();
    // location.dispose();
    // email.dispose();
    // loanamount.dispose();
    // fmobileno.dispose();
    // faadharno.dispose();
    // fpanno.dispose();
    // flocation.dispose();
    // femail.dispose();
    // floanamount.dispose();

    super.onClose();
  }

  String? createdby ;

   Future<void> createdbyFunction() async{
      SharedPreferences prefs = await SharedPreferences.getInstance() ;
       createdby = prefs.getString('email') ?? "email not found" ;
     
  }
  
  
  // Method to extract form data and return as a list
 // Method to extract form data and return as a list
List<String> getLeadDetails() {
  String leadID = 'Lead-${mobileno.text}';
  String timePicked = '${pickedTime.value.hour.toString().padLeft(2, '0')}:${pickedTime.value.minute.toString().padLeft(2, '0')}';
  pickedDate = DateFormat('dd:MM:yyyy').format(pickedDate as DateTime) as Rx<DateTime>;
  nextFollowUpDate = DateFormat('dd:MM:yyyy').format(nextFollowUpDate as DateTime) as Rx<DateTime> ;

  return [
    'Full Name: ${fullname.text}',
    'Mobile No: ${mobileno.text}',
    'Alternate Mobile: ${alternateMobile.text}', // Added alternate mobile field
    'Email: ${email.text}',
    'Existing Loan Amount: ${loanamount.text}',
    'Employment Type: $employmenttypeVal',
    'Existing Loan Type: ${selectedLoan.toString()}',
    'Aadhar No: ${aadharno.text}',
    'PAN No: ${panno.text}',
    'Location: ${location.text}',
    'LeadID: $leadID',
    'Start Date: ${pickedDate}', // Use .value for observable
    'Created By: $createdby',
    'Picked Time: $timePicked',
    'Landmark: ${landmark.text}',                  // Added landmark field
    'Tenure: ${tenure.text}',                      // Added tenure field
    'Tenure Left: ${tenureLeft.text}',            // Added tenure left field
    'Interest Rate: ${interestRate.text}',         // Added interest rate field
    'State Office: ${stateOffice.text}',           // Added state office field
    'City Office: ${cityOffice.text}',             // Added city office field
    'Pincode Office: ${pincodeOffice.text}',       // Added pincode office field
    'State Residence: ${stateResidence.text}',     // Added state residence field
    'City Residence: ${cityResidence.text}',       // Added city residence field
    'Pincode Residence: ${pincodeResidence.text}', // Added pincode residence field
    'State Permanent: ${statePermanent.text}',     // Added state permanent field
    'City Permanent: ${cityPermanent.text}',       // Added city permanent field
    'Pincode Permanent: ${pincodePermanent.text}', // Added pincode permanent field
    'Bank: ${bank.text}',                          // Added bank field
    'Follow Up Comments: ${followUpComments.text}', // Added follow-up comments field
    'Next Follow Up Date: ${nextFollowUpDate.value.toString()}', // Added next follow-up date field
    'Next Follow Up Time: ${nextFollowUpTime.value.hour}:${nextFollowUpTime.value.minute}', // Added next follow-up time field
    'Required Loan Amount: ${RequiredLoanamount.text}' ,
    'Required Loan Type: ${RequiredSelectedLoan}' ,
    'Required Bank Name: ${RequiredBankName.text}' ,
    'Required Loan Tenure: ${RequiredLoanTenure.text}' ,
    'Required Loan Interest: ${RequiredInterest.text}' ,
    'Required Loan EMI Type: ${RequiredEmiType}' ,


  ];
}



  // Reset the form fields
  void resetForm() {
    fullname.clear();
    mobileno.clear();
    aadharno.clear();
    panno.clear();
    location.clear();
    email.clear();
    loanamount.clear();
    employmenttypeVal = null;
  
    pickedDate.value = DateTime.now(); 
    update();
  }

  // Validate form fields
  bool validateForm() {
    if (fullname.text.isEmpty ||
        mobileno.text.isEmpty ||
        landmark.text.isEmpty  
        ) {
      Get.snackbar(
        'Error',
        'Please fill all the values',
        snackPosition: SnackPosition.TOP ,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return false;
    }
    return true;
  }

 final FirebaseFirestore _firestore = FirebaseFirestore.instance;


  Future<void> addLeadToFirestore() async {

      if(!validateForm()) return ;
      
  try {
    // Extract form data and prepare it as a map
    Map<String, dynamic> leadData = {
      'Full Name': fullname.text,
      'Mobile No': mobileno.text,
      'Alternate Mobile': alternateMobile.text,
      'Email': email.text,
      'Loan Amount': loanamount.text,
      'Employment Type': employmenttypeVal,
      'Loan Type': selectedLoan.toString() ,
      'Aadhar No': aadharno.text,
      'PAN No': panno.text,
      'Location': location.text,
      'LeadID': 'Lead-${mobileno.text}',
      'Start Date': pickedDate.value.toString(),
      'Created By': createdby,
      'Picked Time': '${pickedTime.value.hour.toString().padLeft(2, '0')}:${pickedTime.value.minute.toString().padLeft(2, '0')}',
      'Landmark': landmark.text,
      'Tenure': tenure.text,
      'Tenure Left': tenureLeft.text,
      'Interest Rate': interestRate.text,
      'State Office': stateOffice.text,
      'City Office': cityOffice.text,
      'Pincode Office': pincodeOffice.text,
      'State Residence': stateResidence.text,
      'City Residence': cityResidence.text,
      'Pincode Residence': pincodeResidence.text,
      'State Permanent': statePermanent.text,
      'City Permanent': cityPermanent.text,
      'Pincode Permanent': pincodePermanent.text,
      'Bank': bank.text,
      'Follow Up Comments': followUpComments.text,
      'Next Follow Up Date': nextFollowUpDate.value.toString(),
      'Next Follow Up Time': '${nextFollowUpTime.value.hour}:${nextFollowUpTime.value.minute}',
      'EMI Type':  emiType.toString() ,
    'Required Loan Amount': RequiredLoanamount.text ,
    'Required Loan Type':   RequiredSelectedLoan.value,
    'Required Bank Name':   RequiredBankName.text ,
    'Required Loan Tenure': RequiredLoanTenure.text ,
    'Required Loan Interest': RequiredInterest.text,
    'Required Loan EMI Type' : RequiredEmiType.value ,

    };

    // Add to Firestore
    await _firestore.collection('leadDetails').add(leadData);

    // Optional: Show success message
    Get.snackbar(
      'Success',
      'Lead details added successfully!',
      snackPosition: SnackPosition.TOP,
      backgroundColor: Colors.green,
      colorText: Colors.white,
    );

    // Optionally reset the form after adding
    resetForm();
    
  } catch (e) {
    // Handle errors
    Get.snackbar(
      'Error',
      'Failed to add lead: $e',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.red,
      colorText: Colors.white,
    );
  }

  }
}
