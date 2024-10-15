import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:credit_app/views/Property%20Loans/property_document.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PropertyLoanController extends GetxController {
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
  var workplaceAddressController = TextEditingController();
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
  var currentLoanAmount = TextEditingController();
  var currentDisbursedDate = TextEditingController();
  var emiAmount = TextEditingController();
  var disbursedDate = TextEditingController();
  var loanAmount = TextEditingController();

  var creditBankName = TextEditingController();
  var workplaceNameController = TextEditingController() ;
  var workplacePinCodeController = TextEditingController() ;
  var companyNameController = TextEditingController() ;
  var salaryController = TextEditingController() ;
  var yearsInJobController = TextEditingController() ;

  var businessRegistrationDate = TextEditingController() ;
  var businessName = TextEditingController() ;
  var businessAdress = TextEditingController() ;

  var officeAddress = TextEditingController() ;
  var officePinCode = TextEditingController() ;
  var officeLandmark = TextEditingController() ;
  var designationController = TextEditingController() ;
  var officialEmailController = TextEditingController() ;
  var seniorNameController = TextEditingController() ;
  var seniorNumberController = TextEditingController() ;
  var totalWorkExperienceController = TextEditingController() ;

  // Reactive Variables
  var selectedLoanType = ''.obs;
  var selectedReligion = ''.obs;
  var selectedCaste = ''.obs;
  var maritalStatus = ''.obs;
  var spouseDob = ''.obs;
  var nomineeDob = ''.obs;
  var ownershipStatus = ''.obs;
  var permanentOwnershipStatus = ''.obs;
  var permanentHouseType = ''.obs;
  var permanentSquareFeetController = TextEditingController();
  var yearsAtCityController = TextEditingController();
  var selectedJobType = ''.obs;
  var businessType = ''.obs;
  var businessProofType = ''.obs;

  var loanType = ''.obs ;
  var jobType = ''.obs ;
  

  // for dropdown use var,  textediting controller for text input, 

  // property loan details
  var mortgageType = ''.obs ;
  var propertyType= ''.obs ;
  var propertyStatus= ''.obs ;
  var buildingPermission= ''.obs ;
  var propertyPaperType= ''.obs ;
  var propertySizeController= TextEditingController() ;
  var propertyValueController= TextEditingController() ;


  // Add any additional methods needed for validation or submission
   void onClose(){
    clearControllers() ;
    super.onClose() ;
  }

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
    workplaceAddressController.clear();
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
    
    creditBankName.clear();
  }


  var email = 'No email' ;

  void getEmail() async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      email = prefs.getString('email') ?? 'No email found';
  }

    // 'Loan Status': 'Pending',
    // 'Created By': email, // Shared prefs email

void compileData() {
   Map<String, dynamic> loanFormDetails = {
    'Loan Amount': loanAmountController.text,
    'Name': nameController.text,
    'Mother Name': motherNameController.text,
    'Email': emailController.text,
    'Mobile': mobileController.text,
    'Alternate Mobile': alternateMobileController.text,
    'Spouse Name': spouseNameController.text,
    'Spouse Mobile': spouseMobileController.text,
    'Nominee Name': nomineeNameController.text,
    'Nominee Relation': nomineeRelationController.text,
    'Current Address': currentAddressController.text,
    'Current Pin': currentPinController.text,
    'Current Landmark': currentLandmarkController.text,
    'Permanent Address': permanentAddressController.text,
    'Permanent Pin': permanentPinController.text,
    'Permanent Landmark': permanentLandmarkController.text,

    // Work Details
    'Workplace Address': workplaceAddressController.text,
    'Graduation Year': graduationYearController.text,
    'Experience': experienceController.text,
    'Professional Degree': professionalDegreeController.text,
    'Turnover': turnoverController.text,
    'Years in Business': yearsInBusinessController.text,

    'Reference 1 Name': reference1NameController.text,
    'Reference 1 Mobile': reference1MobileController.text,
    'Reference 1 Address': reference1AddressController.text,
    'Reference 2 Name': reference2NameController.text,
    'Reference 2 Mobile': reference2MobileController.text,
    'Reference 2 Address': reference2AddressController.text,

    'Current Loan Bank': currentLoanBank.text,
    'Current Loan Amount': currentLoanAmount.text,
    'Current Disbursed Date': currentDisbursedDate.text,
    'EMI Amount': emiAmount.text,
    'Disbursed Date': disbursedDate.text,

    'Credit Bank Name': creditBankName.text,
    'Workplace Name': workplaceNameController.text,
    'Workplace Pin Code': workplacePinCodeController.text,
    'Company Name': companyNameController.text,
    'Salary': salaryController.text,
    'Years in Job': yearsInJobController.text,

    'Business Registration Date': businessRegistrationDate.text,
    'Business Name': businessName.text,
    'Business Address': businessAdress.text,

    'Office Address': officeAddress.text,
    'Office Pin Code': officePinCode.text,
    'Office Landmark': officeLandmark.text,
    'Designation': designationController.text,
    'Official Email': officialEmailController.text,
    'Senior Name': seniorNameController.text,
    'Senior Number': seniorNumberController.text,
    'Total Work Experience': totalWorkExperienceController.text,

    // Reactive Variables
    'Selected Loan Type': selectedLoanType.value,
    'Selected Religion': selectedReligion.value,
    'Selected Caste': selectedCaste.value,
    'Marital Status': maritalStatus.value,
    'Spouse DOB': spouseDob.value.toString(),
    'Nominee DOB': nomineeDob.value.toString(),
    'Ownership Status': ownershipStatus.value,
    'Permanent Ownership Status': permanentOwnershipStatus.value,
    'Permanent House Type': permanentHouseType.value,
    'Permanent Square Feet': permanentSquareFeetController.text,
    'Years at City': yearsAtCityController.text,
    'Selected Job Type': selectedJobType.value,
    'Business Type': businessType.value,
    'Business Proof Type': businessProofType.value,
    // Property Loan Details
    'Mortgage Type': mortgageType.value,
    'Property Type': propertyType.value,
    'Property Status': propertyStatus.value,
    'Building Permission': buildingPermission.value,
    'Property Paper Type': propertyPaperType.value,
    'Property Size': propertySizeController.text,
    'Property Value': propertyValueController.text,
    'Loan Status': 'Pending',   // loan status
    'Created By': email, // Shared prefs email



  };

  // Add document links to the loanFormDetails map (Assumed PropertyDocController provides this)
  PropertyDocController docController = Get.find<PropertyDocController>();
  docController.downloadLinks.forEach((docType, link) {
    loanFormDetails[docType] = link; // e.g., 'aadhar': 'download_url'
  });

  // Upload to Firestore
  uploadToFirestore(loanFormDetails);
}



  void uploadToFirestore(Map<String, dynamic> data) async {
  try {
    await FirebaseFirestore.instance.collection('LoanFormDetails').add(data);
    Get.snackbar('Success', 'Form Submitted Successfully.' , backgroundColor: Colors.green[400], duration: Duration(seconds: 4))  ;
    print('Data uploaded successfully');
  } catch (e) {
    print('Error uploading data: $e');
    Get.snackbar('Failed', 'Form Failed to submit.($e)' , backgroundColor: Colors.red[400], duration: Duration(seconds: 4))  ;
  }
}


  void submitForm() {
    compileData(); // compile and upload both handle in this
}


}
