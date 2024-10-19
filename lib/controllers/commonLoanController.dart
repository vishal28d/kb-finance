import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:shared_preferences/shared_preferences.dart';

class CommonLoanController extends GetxController {
  // Current step in the form (used as page index)
  var currentPageIndex = 0.obs;

  // Form field controllers
  TextEditingController loanAmountController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController motherNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController alternateMobileController = TextEditingController();
  TextEditingController SpouseNameController = TextEditingController();
  TextEditingController SpouseMobileController = TextEditingController();
  TextEditingController nomineeNameController = TextEditingController();
  TextEditingController nomineeRelationController = TextEditingController();
  TextEditingController currentAddressController = TextEditingController();
  TextEditingController currentPinController = TextEditingController();
  TextEditingController currentLandmarkController = TextEditingController();
  TextEditingController squareFeetController = TextEditingController();
  TextEditingController yearsAtCityController = TextEditingController();
  TextEditingController permanentAddressController = TextEditingController();
  TextEditingController permanentPinController = TextEditingController();
  TextEditingController permanentLandmarkController = TextEditingController();
  TextEditingController permanentSquareFeetController = TextEditingController();
  TextEditingController permanentYearsAtCityController = TextEditingController();

  // Dropdown values
  var selectedReligion = ''.obs;
  var selectedCaste = ''.obs;
  var maritalStatus = 'Single'.obs;
  var ownershipStatus = ''.obs;
  var houseType = ''.obs;
  var permanentOwnershipStatus = ''.obs;
  var permanentHouseType = ''.obs;
  var selectedLoanType = ''.obs;

  // Date pickers
  Rx<DateTime?> nomineeDob = Rx<DateTime?>(null);
  Rx<DateTime?> SpouseDob = Rx<DateTime?>(null);

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;


  // Clear form fields after submission
  void clearForm() {
    loanAmountController.clear();
    nameController.clear();
    motherNameController.clear();
    emailController.clear();
    mobileController.clear();
    alternateMobileController.clear();
    SpouseNameController.clear();
    SpouseMobileController.clear();
    nomineeNameController.clear();
    nomineeRelationController.clear();
    currentAddressController.clear();
    currentPinController.clear();
    currentLandmarkController.clear();
    squareFeetController.clear();
    yearsAtCityController.clear();
    permanentAddressController.clear();
    permanentPinController.clear();
    permanentLandmarkController.clear();
    permanentSquareFeetController.clear();
    permanentYearsAtCityController.clear();
    selectedReligion.value = '';
    selectedCaste.value = '';
    maritalStatus.value = 'Single';
    ownershipStatus.value = '';
    houseType.value = '';
    permanentOwnershipStatus.value = '';
    permanentHouseType.value = '';
    nomineeDob.value = null;
    SpouseDob.value = null;
  }

  // Validate main fields
  bool validateForm() {

    if (loanAmountController.text.isEmpty) {
      Get.snackbar("Validation Error", "Loan amount is required.",
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.red[400]);
      return false;
    }
    if (nameController.text.isEmpty) {
      Get.snackbar("Validation Error", "Name is required.",
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.red[400]);
      return false;
    }
    if (emailController.text.isEmpty) {
      Get.snackbar("Validation Error", "Email is required.",
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.red[400]);
      return false;
    } else if (!GetUtils.isEmail(emailController.text)) {
      Get.snackbar("Validation Error", "Enter a valid email.",
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.red[400]);
      return false;
    }
    if (mobileController.text.isEmpty) {
      Get.snackbar("Validation Error", "Mobile number is required.",
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.red[400]);
      return false;
    } else if (mobileController.text.length < 10) {
      Get.snackbar("Validation Error", "Enter a valid mobile number.",
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.red[400]);
      return false;
    }
    return true;
  }


  var email = 'No email' ;
  void getEmail() async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      email = prefs.getString('email') ?? 'No email found';
  }



  // Submit form  
  void submitForm() {
    getEmail() ;

    if (!validateForm()) return; 

    Map<String, dynamic> formData = {
  'loanAmount': loanAmountController.text,
  'name': nameController.text,
  'motherName': motherNameController.text,
  'email': emailController.text,
  'mobile': mobileController.text,
  'alternateMobile': alternateMobileController.text,
  'SpouseName': SpouseNameController.text,
  'SpouseMobile': SpouseMobileController.text,
  'nomineeName': nomineeNameController.text,
  'nomineeRelation': nomineeRelationController.text,
  'currentAddress': currentAddressController.text,
  'currentPin': currentPinController.text,
  'currentLandmark': currentLandmarkController.text,
  'yearsAtCity': yearsAtCityController.text,
  'permanentAddress': permanentAddressController.text,
  'permanentPin': permanentPinController.text,
  'permanentLandmark': permanentLandmarkController.text,
  'permanentSquareFeet': permanentSquareFeetController.text,
  'permanentYearsAtCity': permanentYearsAtCityController.text,
  'selectedReligion': selectedReligion.value,
  'selectedCaste': selectedCaste.value,
  'maritalStatus': maritalStatus.value,
  'ownershipStatus': ownershipStatus.value,
  'houseType': houseType.value,
  'permanentOwnershipStatus': permanentOwnershipStatus.value,
  'permanentHouseType': permanentHouseType.value,
  'selectedLoanType': selectedLoanType.value,
  'nomineeDob': nomineeDob.value?.toString(),
  'SpouseDob': SpouseDob.value?.toString(),
  'loanStatus': 'Pending',
  'createdBy': email,
};

_firestore.collection('LoanFormDetails').add(formData).then((value) {
  Get.snackbar("Success", "Form submitted successfully!",
      snackPosition: SnackPosition.TOP,
      backgroundColor: Colors.green[400]);
}).catchError((error) {
  Get.snackbar("Error", "Error submitting form: $error",
      snackPosition: SnackPosition.TOP,
      backgroundColor: Colors.red[400]);
});


  }
}
