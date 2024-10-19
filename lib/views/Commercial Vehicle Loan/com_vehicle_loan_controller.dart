import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:credit_app/views/Commercial%20Vehicle%20Loan/commercial_vehicle_document.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ComVehicleLoanController extends GetxController {
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

  var hasCurrentLoan = ''.obs ;
  var isCurrentAddressSame = ''.obs ;

  // for dropdown use var,  textediting controller for text input, 

  // vehicle loan details
  var purchaseAmountController = TextEditingController();
  var downPaymentController = TextEditingController();
  var landSizeController = TextEditingController();
  var makerController = TextEditingController();
  var modelYearController = TextEditingController();
  var registrationNumberController = TextEditingController();
  var purposeOfUse = ''.obs;
  var ownerSerialController = TextEditingController();
  var isFinanced = ''.obs;
  var financerNameController = TextEditingController();
  var loanAmountDisbursedController = TextEditingController();
  var disbursedMonthYearController = TextEditingController();
  var loanEndingMonthYearController = TextEditingController();
  var loanAmountPendingController = TextEditingController();
  var vehicle_emiType = ''.obs;
  var vehicle_emiAmountController = TextEditingController();
 //
 var hasOtherCommercialVehicles = ''.obs ;
 var otherVehicleMakerController = TextEditingController() ;
 var otherVehicleModelController = TextEditingController() ;
 var otherVehicleOwnerSerialController = TextEditingController() ;



  // Add any additional methods needed for validation or submission
  void onClose(){
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


 void compileData() {
  Map<String, dynamic> loanFormDetails = {
    // General Information
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
    'Created By': email, // Shared prefs email
    'Current Address': currentAddressController.text,
    'Current Pin': currentPinController.text,
    'Current Landmark': currentLandmarkController.text,
    'Permanent Address': permanentAddressController.text,
    'Permanent Pin': permanentPinController.text,
    'Permanent Landmark': permanentLandmarkController.text,
    'Current Address same as Permanent Address': isCurrentAddressSame.value  ,

    // Work Details
    'Workplace Address': workplaceAddressController.text,
    'Graduation Year': graduationYearController.text,
    'Experience': experienceController.text,
    'Professional Degree': professionalDegreeController.text,
    'Turnover': turnoverController.text,
    'Years In Business': yearsInBusinessController.text,
    'Workplace Name': workplaceNameController.text,
    'Workplace Pin Code': workplacePinCodeController.text,
    'Company Name': companyNameController.text,
    'Salary': salaryController.text,
    'Years In Job': yearsInJobController.text,
    'Business Registration Date': businessRegistrationDate.text,
    'Business Name': businessName.text,
    'Business Address': businessAdress.text,

    // Reference Details
    'Reference 1 Name': reference1NameController.text,
    'Reference 1 Mobile': reference1MobileController.text,
    'Reference 1 Address': reference1AddressController.text,
    'Reference 2 Name': reference2NameController.text,
    'Reference 2 Mobile': reference2MobileController.text,
    'Reference 2 Address': reference2AddressController.text,

    // Loan Details
    'Current Loan Bank': currentLoanBank.text,
    'EMI Amount': emiAmount.text,
    'Disbursed Date': disbursedDate.text,
    'Current Loan Amount': loanAmount.text,
    'Credit Bank Name': creditBankName.text,

    // Dropdown and Selection Values
    'Selected Loan Type': selectedLoanType.value,
    'Selected Religion': selectedReligion.value,
    'Selected Caste': selectedCaste.value  ,
    'Marital Status': maritalStatus.value   ,
    'Spouse DOB': spouseDob.value.toString() ,
    'Nominee DOB': nomineeDob.value.toString() ,
    'Ownership Status': ownershipStatus.value,
    'Permanent Ownership Status': permanentOwnershipStatus.value,
    'Permanent House Type': permanentHouseType.value,
    'Permanent Square Feet': permanentSquareFeetController.text,
    'Years At City': yearsAtCityController.text,

    // Job Type & Business Details
    'Selected Job Type': selectedJobType.value,
    'Business Type': businessType.value,
    'Business Proof Type': businessProofType.value,

    // Additional Information
    'Official Email': officialEmailController.text,
    'Senior Name': seniorNameController.text,
    'Senior Number': seniorNumberController.text,
    'Total Work Experience': totalWorkExperienceController.text,

    // Vehicle Details
    'Maker (Company)': makerController.text,
    'Model (Year)': modelYearController.text,
    'Registration Number': registrationNumberController.text,
    'Purpose of Use': purposeOfUse.value, // Assuming purposeOfUse is a dropdown
    'Owner Serial': ownerSerialController.text,
    'Financed Tractors': isFinanced.value, // Assuming it's a Yes/No dropdown
    'Financer Name': financerNameController.text,
    'Loan Amount Disbursed': loanAmountDisbursedController.text,
    'Disbursed Month & Year': disbursedMonthYearController.text,
    'Loan Ending Month & Year': loanEndingMonthYearController.text,
    'Loan Amount Pending': loanAmountPendingController.text,
    'Vehicle EMI Type': vehicle_emiType.value , // If you have specific EMI fields
    'Vehicle EMI Amount': vehicle_emiAmountController.text , // If you have specific EMI fields


    // Loan Form Status
    'Loan Status': 'Pending',
    
  };

  // Add document links to the loanFormDetails map (Assumed PropertyDocController provides this)
  ComVehicleDocController docController = Get.find<ComVehicleDocController>();
  docController.downloadLinks.forEach((docType, link) {
    loanFormDetails[docType] = link; // e.g., 'aadhar': 'download_url'
  });

  // Upload to Firestore
  uploadToFirestore(loanFormDetails);
}


  void uploadToFirestore(Map<String, dynamic> data) async {
  try {
    await FirebaseFirestore.instance.collection('LoanFormDetails').add(data);
    Get.snackbar('Success', 'Form Submitted Successfully.' , backgroundColor: Colors.green[400], duration: Duration(seconds: 5))  ;
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
