import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class CommonLoanController extends GetxController {
  // Form field controllers
  TextEditingController loanAmountController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController motherNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController alternateMobileController = TextEditingController();
  TextEditingController wifeNameController = TextEditingController();
  TextEditingController wifeMobileController = TextEditingController();
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



  // Clear form fields after submission
  void clearForm() {
    loanAmountController.clear();
    nameController.clear();
    motherNameController.clear();
    emailController.clear();
    mobileController.clear();
    alternateMobileController.clear();
    wifeNameController.clear();
    wifeMobileController.clear();
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
  }

  @override
  void onClose() {
    loanAmountController.dispose();
    nameController.dispose();
    motherNameController.dispose();
    emailController.dispose();
    mobileController.dispose();
    alternateMobileController.dispose();
    wifeNameController.dispose();
    wifeMobileController.dispose();
    nomineeNameController.dispose();
    nomineeRelationController.dispose();
    currentAddressController.dispose();
    currentPinController.dispose();
    currentLandmarkController.dispose();
    squareFeetController.dispose();
    yearsAtCityController.dispose();
    permanentAddressController.dispose();
    permanentPinController.dispose();
    permanentLandmarkController.dispose();
    permanentSquareFeetController.dispose();
    permanentYearsAtCityController.dispose();
    super.onClose();
  }


  final FirebaseFirestore _firestore = FirebaseFirestore.instance;  
  
  // Validate form  
  bool validateForm() {  
   if (loanAmountController.text.isEmpty ||  
      nameController.text.isEmpty ||  
      emailController.text.isEmpty ||  
      mobileController.text.isEmpty) {  
    Get.snackbar("Error", "Please fill all required fields",  
       snackPosition: SnackPosition.TOP,
       backgroundColor: Colors.red[400] ,
       );  
    return false;  
   }  
   return true;  
  }  


    // Submit form  
  void submitForm() {  
   if (validateForm()) {  
    _firestore.collection('LoanFormDetails').add({  
      'loanAmount': loanAmountController.text,  
      'name': nameController.text,  
      'motherName': motherNameController.text,  
      'email': emailController.text,  
      'mobile': mobileController.text,  
      'alternateMobile': alternateMobileController.text,  
      'wifeName': wifeNameController.text,  
      'wifeMobile': wifeMobileController.text,  
      'nomineeName': nomineeNameController.text,  
      'nomineeRelation': nomineeRelationController.text,  
      'currentAddress': currentAddressController.text,  
      'currentPin': currentPinController.text,  
      'currentLandmark': currentLandmarkController.text,  
      'squareFeet': squareFeetController.text,  
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
      'nomineeDob': nomineeDob.value?.toIso8601String(),  
    }).then((value) {  
      Get.snackbar("Success", "Form submitted successfully!",  
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.green[400] ,
        );  
     
    }).catchError((error) {  
      Get.snackbar("Error", "Error submitting form: $error",  
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.red[400] ,
        );  
    });  
   }  
  }








}
