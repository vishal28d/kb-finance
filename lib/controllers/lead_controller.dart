import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddLeadController extends GetxController {
  // TextEditingControllers for form fields
  var fullname = TextEditingController();
  var mobileno = TextEditingController();
  var aadharno = TextEditingController();
  var panno = TextEditingController();
  var location = TextEditingController();
  var email = TextEditingController();
  var loanamount = TextEditingController();

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
  List<String> loantypelist = ['Home', 'Personal', 'Business', 'Property Against'];
  dynamic loantypelistVal;

  // Date picker field
  var pickedDate = DateTime.now().obs; // Observable date

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
  List<String> getLeadDetails() {
    String leadID = 'Lead-${mobileno.text}';
  
    return [
      'Full Name: ${fullname.text}',
      'Mobile No: ${mobileno.text}',
      'Email: ${email.text}',
      'Loan Amount: ${loanamount.text}',
      'Employment Type: $employmenttypeVal',
      'Loan Type: $loantypelistVal',
      'Aadhar No: ${aadharno.text}',
      'PAN No: ${panno.text}',
      'Location: ${location.text}',
      'LeadID: $leadID',
      'Start Date: ${pickedDate.toString().toString()}',
      'CreatedBy: $createdby' ,
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
    loantypelistVal = null;
    pickedDate.value = DateTime.now(); 
    update();
  }

  // Validate form fields
  bool validateForm() {
    if (fullname.text.isEmpty ||
        mobileno.text.isEmpty ||
        location.text.isEmpty ||
        email.text.isEmpty ||
        loanamount.text.isEmpty ||
        employmenttypeVal == null ||
        loantypelistVal == null) {
      Get.snackbar(
        'Error',
        'Please fill all the values',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return false;
    }
    return true;
  }
}
