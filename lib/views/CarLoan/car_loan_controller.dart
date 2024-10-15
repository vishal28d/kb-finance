import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:credit_app/views/CarLoan/car_document.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CarLoanController extends GetxController {
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
  var isAudited = "".obs; // Reactive variable for audited status
  var loanType = ''.obs ;
  var jobType = ''.obs ;
  var isBalanceTransfer = ''.obs ;

  // car details
  var carBuyCompany = ''.obs ;
  RxString carBuyDate = ''.obs ;
  var carModelName = TextEditingController() ;
  var carPrice = TextEditingController() ;
  var carDownPayment = TextEditingController() ;
  var carManufacturingYear = TextEditingController() ;
  var ownerSerial = TextEditingController() ;
  var freeOrFinance = ''.obs ;
  var bankOrCompanyName = TextEditingController() ;
  var financeAmount = TextEditingController() ;
  var loanDisbursedMonth = TextEditingController() ;
  var interestRate = TextEditingController() ;
  var emiPaidMonths = TextEditingController() ;
  var emiLeftMonths = TextEditingController() ;
  var bouncesLast12Months = ''.obs ;
  var numberOfBounces = TextEditingController() ;
  


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
    // Personal Information
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

    // Current Address
    'Current Address': currentAddressController.text,
    'Current Pin': currentPinController.text,
    'Current Landmark': currentLandmarkController.text,

    // Permanent Address
    'Permanent Address': permanentAddressController.text,
    'Permanent Pin': permanentPinController.text,
    'Permanent Landmark': permanentLandmarkController.text,

    // Work Details
    'Workplace Address': workplaceAddressController.text,
    'Graduation Year': graduationYearController.text,
    'Experience': experienceController.text,
    'Professional Degree': professionalDegreeController.text,
    'Turnover': turnoverController.text,
    'Years In Business': yearsInBusinessController.text,

    // References
    'Reference 1 Name': reference1NameController.text,
    'Reference 1 Mobile': reference1MobileController.text,
    'Reference 1 Address': reference1AddressController.text,
    'Reference 2 Name': reference2NameController.text,
    'Reference 2 Mobile': reference2MobileController.text,
    'Reference 2 Address': reference2AddressController.text,

    // Current Loan Details
    'Current Loan Bank': currentLoanBank.text,
    'Current Loan Amount': currentLoanAmount.text,
    'Current Disbursed Date': currentDisbursedDate.text,
    'EMI Amount': emiAmount.text,
    'Disbursed Date': disbursedDate.text,

    // Credit Bank Details
    'Credit Bank Name': creditBankName.text,

    // Reactive Variables
    'Selected Loan Type': selectedLoanType.value,
    'Selected Religion': selectedReligion.value,
    'Selected Caste': selectedCaste.value,
    'Marital Status': maritalStatus.value,
    'Spouse Date of Birth': spouseDob.value.toString(),
    'Nominee Date of Birth': nomineeDob.value.toString(),
    'Ownership Status': ownershipStatus.value,
    'Permanent Ownership Status': permanentOwnershipStatus.value,
    'Permanent House Type': permanentHouseType.value,
    'Permanent Square Feet': permanentSquareFeetController.text,
    'Years At City': yearsAtCityController.text,
    'Selected Job Type': selectedJobType.value,
    'Business Type': businessType.value,
    'Business Proof Type': businessProofType.value,
    'Is Audited': isAudited.value,
    'Loan Type': loanType.value,
    
    'Loan Status': 'Pending',

    // Car Details
    'Car Buy Company': carBuyCompany.value,
    'Car Buy Date': carBuyDate.value,
    'Car Model Name': carModelName.text,
    'Car Price': carPrice.text,
    'Car Down Payment': carDownPayment.text,
    'Car Manufacturing Year': carManufacturingYear.text,
    'Owner Serial': ownerSerial.text,
    'Free or Finance': freeOrFinance.value,
    'Bank or Company Name': bankOrCompanyName.text,
    'Finance Amount': financeAmount.text,
    'Loan Disbursed Month': loanDisbursedMonth.text,
    'Interest Rate': interestRate.text,
    'EMI Paid Months': emiPaidMonths.text,
    'EMI Left Months': emiLeftMonths.text,
    'Bounces Last 12 Months': bouncesLast12Months.value,
    'Number of Bounces': numberOfBounces.text,
  };

  CarDocController docController = Get.find<CarDocController>();

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
    Get.snackbar('Failed', 'Form Failed to submit.($e)' , backgroundColor: Colors.red[400], duration: Duration(seconds: 4))  ;

  }
}

 void onClose(){
    super.onClose() ;
  }


  void submitForm() {
    compileData(); // compile and upload both handle in this
}



}
