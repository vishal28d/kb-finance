import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:credit_app/views/ProfessionalLoan/professionalDocument.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfessionalLoanController extends GetxController {
  // Text Editing Controllers
  var loanAmountController = TextEditingController();
  var nameController = TextEditingController();
  var motherNameController = TextEditingController();
  var emailController = TextEditingController();
  var mobileController = TextEditingController();
  var alternateMobileController = TextEditingController();
  var spouseNameController = TextEditingController();
  var spouseMobileController = TextEditingController();
  var nomineeNameController = TextEditingController();
  var nomineeRelationController = TextEditingController();
  var currentAddressController = TextEditingController();
  var currentPinController = TextEditingController();
  var currentLandmarkController = TextEditingController();
  var permanentAddressController = TextEditingController();
  var permanentPinController = TextEditingController();
  var permanentLandmarkController = TextEditingController();
  
  // Work Details Controllers
  var clinicAddressController = TextEditingController();
  var graduationYearController = TextEditingController();
  var experienceController = TextEditingController();
  var professionalDegreeController = TextEditingController();
  var turnoverController = TextEditingController();
  var yearsInBusinessController = TextEditingController();

  var reference1NameController = TextEditingController();
  var reference1MobileController = TextEditingController();
  var reference1AddressController = TextEditingController();
  var reference2NameController = TextEditingController();
  var reference2MobileController = TextEditingController();
  var reference2AddressController = TextEditingController();
  
  var currentLoanBank = TextEditingController();
  var emiAmount = TextEditingController();
  var disbursedDate = TextEditingController();
  var loanAmount = TextEditingController();
  
  var carDetails = TextEditingController();
  var carRegistrationDate = TextEditingController();
  var creditBankName = TextEditingController();
  
  // Reactive Variables
  var selectedLoanType = ''.obs;
  var selectedReligion = ''.obs;
  var selectedCaste = ''.obs;
  var maritalStatus = ''.obs;
  var spouseDob = DateTime.now().obs;
  var nomineeDob = DateTime.now().obs;
  var ownershipStatus = ''.obs;
  var permanentOwnershipStatus = ''.obs;
  var permanentHouseType = ''.obs;
  var permanentSquareFeetController = TextEditingController();
  var yearsAtCityController = TextEditingController();
  var selectedJobType = ''.obs;
  var businessType = ''.obs;
  var businessProofType = ''.obs;
  var isAudited = ''.obs; // Reactive variable for audited status
  var loanType = ''.obs ;

  // Add any additional methods needed for validation or submission
  void clearControllers() {
    loanAmountController.clear();
    nameController.clear();
    motherNameController.clear();
    emailController.clear();
    mobileController.clear();
    alternateMobileController.clear();
    spouseNameController.clear();
    spouseMobileController.clear();
    nomineeNameController.clear();
    nomineeRelationController.clear();
    currentAddressController.clear();
    currentPinController.clear();
    currentLandmarkController.clear();
    permanentAddressController.clear();
    permanentPinController.clear();
    permanentLandmarkController.clear();
    
    // Clear work details controllers
    clinicAddressController.clear();
    graduationYearController.clear();
    experienceController.clear();
    professionalDegreeController.clear();
    turnoverController.clear();
    yearsInBusinessController.clear();
    
    reference1NameController.clear();
    reference1MobileController.clear();
    reference1AddressController.clear();
    reference2NameController.clear();
    reference2MobileController.clear();
    reference2AddressController.clear();
    
    currentLoanBank.clear();
    emiAmount.clear();
    disbursedDate.clear();
    loanAmount.clear();
    
    carDetails.clear();
    carRegistrationDate.clear();
    creditBankName.clear();
  }


  var email = 'No email' ;
  void getEmail() async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      email = prefs.getString('email') ?? 'No email found';
  }


  void compileData() {
  Map<String, dynamic> loanFormDetails = {
    'loanAmount': loanAmountController.text,
    'name': nameController.text,
    'motherName': motherNameController.text,
    'mobile': mobileController.text,
    'alternateMobile': alternateMobileController.text,
    'spouseName': spouseNameController.text,
    'spouseMobile': spouseMobileController.text,
    'nomineeName': nomineeNameController.text,
    'nomineeRelation': nomineeRelationController.text,
    'createdby' : email ,   // shared prefs for email
    'currentAddress': currentAddressController.text,
    'currentPin': currentPinController.text,
    'currentLandmark': currentLandmarkController.text,
    'permanentAddress': permanentAddressController.text,
    'permanentPin': permanentPinController.text,
    'permanentLandmark': permanentLandmarkController.text,
    'clinicAddress': clinicAddressController.text,
    'graduationYear': graduationYearController.text,
    'experience': experienceController.text,
    'professionalDegree': professionalDegreeController.text,
    'turnover': turnoverController.text,
    'yearsInBusiness': yearsInBusinessController.text,
    'reference1Name': reference1NameController.text,
    'reference1Mobile': reference1MobileController.text,
    'reference1Address': reference1AddressController.text,
    'reference2Name': reference2NameController.text,
    'reference2Mobile': reference2MobileController.text,
    'reference2Address': reference2AddressController.text,
    'currentLoanBank': currentLoanBank.text,
    'emiAmount': emiAmount.text,
    'disbursedDate': disbursedDate.text,
    'carDetails': carDetails.text,
    'carRegistrationDate': carRegistrationDate.text,
    'creditBankName': creditBankName.text,
    'selectedLoanType': selectedLoanType.value,
    'selectedReligion': selectedReligion.value,
    'selectedCaste': selectedCaste.value,
    'maritalStatus': maritalStatus.value,
    'spouseDob': spouseDob.value.toIso8601String(),
    'nomineeDob': nomineeDob.value.toIso8601String(),
    'ownershipStatus': ownershipStatus.value,
    'permanentOwnershipStatus': permanentOwnershipStatus.value,
    'permanentHouseType': permanentHouseType.value,
    'permanentSquareFeet': permanentSquareFeetController.text,
    'yearsAtCity': yearsAtCityController.text,
    'selectedJobType': selectedJobType.value,
    'businessType': businessType.value,
    'businessProofType': businessProofType.value,
    'isAudited': isAudited.value,
    'loanType': loanType.value,
    // loan doc links


  };

  ProfessionalDocController docController = Get.find<ProfessionalDocController>();

  // Add document links to the loanFormDetails map
  docController.downloadLinks.forEach((docType, link) {
    loanFormDetails[docType] = link; // e.g., 'aadhar': 'download_url'
  });


  uploadToFirestore(loanFormDetails);
}



  void uploadToFirestore(Map<String, dynamic> data) async {
  try {
    await FirebaseFirestore.instance.collection('LoanFormDetails').add(data);
    Get.snackbar('Success', 'Form Submitted Successfully.' , backgroundColor: Colors.green[400], duration: Duration(seconds: 5))  ;
    print('Data uploaded successfully');
  } catch (e) {
    print('Error uploading data: $e');
  }
}




  void submitForm() {
    compileData(); // compile and upload both handle in this
}



}
