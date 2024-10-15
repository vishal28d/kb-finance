import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:credit_app/views/UnsecuredLoans/professionalDocument.dart';
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
  
  var carDetails = TextEditingController();
  var carRegistrationDate = TextEditingController();
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
    
    carDetails.clear();
    carRegistrationDate.clear();
    creditBankName.clear();
  }


  var email = 'No email' ;

  void getEmail() async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      email = prefs.getString('email') ?? 'No email found';
  }

bool validateForm() {
  String loanAmount = loanAmountController.text.trim();
  String name = nameController.text.trim();
  String mobile = mobileController.text.trim();
  String loanType = selectedLoanType.value;

  // Collect missing fields
  List<String> missingFields = [];

  if (loanAmount.isEmpty) {
    missingFields.add('Loan Amount');
  }
  if (name.isEmpty) {
    missingFields.add('Name');
  }
  if (mobile.isEmpty) {
    missingFields.add('Mobile Number');
  }
  if (loanType.isEmpty || loanType == 'Select Loan Type') {
    missingFields.add('Loan Type');
  }

  // Show dialog if there are missing fields
  if (missingFields.isNotEmpty) {
    Get.dialog(
      AlertDialog(
        title: Text("Missing Fields"),
        content: Text(
            "Please fill the following fields: ${missingFields.join(', ')}"),
        actions: <Widget>[
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red, 
            ),
            child: Text("OK"),
            onPressed: () {
              Get.back(); // Close the dialog
            },
          ),
        ],
      ),
    );
    return false; // Form validation failed
  } else {
    print('Form submitted successfully!');
    return true; // Form validation succeeded
  }
}


 void compileData() {
  Map<String, dynamic> loanFormDetails = {
    'Loan Amount': loanAmountController.text,
    'Name': nameController.text,
    'Mother\'s Name': motherNameController.text,
    'Email': emailController.text,
    'Mobile': mobileController.text,
    'Alternate Mobile': alternateMobileController.text,
    'Spouse Name': spouseNameController.text,
    'Spouse Mobile': spouseMobileController.text,
    'Nominee Name': nomineeNameController.text,
    'Nominee Relation': nomineeRelationController.text,
    'Created By': email, // shared prefs for email
    'Current Address': currentAddressController.text,
    'Current Pin Code': currentPinController.text,
    'Current Landmark': currentLandmarkController.text,
    'Permanent Address': permanentAddressController.text,
    'Permanent Pin Code': permanentPinController.text,
    'Permanent Landmark': permanentLandmarkController.text,
    'Reference 1 Name': reference1NameController.text,
    'Reference 1 Mobile': reference1MobileController.text,
    'Reference 1 Address': reference1AddressController.text,
    'Reference 2 Name': reference2NameController.text,
    'Reference 2 Mobile': reference2MobileController.text,
    'Reference 2 Address': reference2AddressController.text,
    'Current Loan Bank': currentLoanBank.text,
    'Current Loan Amount': currentLoanAmount.text, // Added
    'Current Disbursed Date': currentDisbursedDate.text, // Added
    'EMI Amount': emiAmount.text,
    'Disbursed Date': disbursedDate.text,
    'Car Details': carDetails.text, // Added
    'Car Registration Date': carRegistrationDate.text, // Added
    'Credit Bank Name': creditBankName.text,
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
    'Years At City': yearsAtCityController.text,
    'Selected Job Type': selectedJobType.value,
    'Is Audited': isAudited.value, // Added
    'Loan Type': loanType.value,
    'Job Type': jobType.value, // Added
    'Is Balance Transfer': isBalanceTransfer.value, 
    'Loan Status': 'Pending', // status
    'Business Proof Type': businessProofType.value,
    'Business Type': businessType.value,
    'Clinic Address': workplaceAddressController.text,
    'Graduation Year': graduationYearController.text,
    'Experience': experienceController.text,
    'Professional Degree': professionalDegreeController.text,
    'Turnover': turnoverController.text,
    'Years In Business': yearsInBusinessController.text,
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
  };

  ProfessionalDocController docController = Get.find<ProfessionalDocController>();

  // Add document links to the loanFormDetails map
  docController.downloadLinks.forEach((docType, link) {
    loanFormDetails[docType] = link; // e.g., 'Aadhar': 'download_url'
  });

 
  uploadToFirestore(loanFormDetails);
}

  void uploadToFirestore(Map<String, dynamic> data) async {
  try {
    await FirebaseFirestore.instance.collection('LoanFormDetails').add(data);
    Get.snackbar('Success', 'Form Submitted Successfully.' , backgroundColor: Colors.green[400], duration: Duration(seconds: 4))  ;
    print('Data uploaded successfully');
  } catch (e) {
    Get.snackbar('Failed', 'Form Failed to submit.($e)' , backgroundColor: Colors.red[400], duration: Duration(seconds: 4))  ;
    print('Error uploading data: $e');
  }
}


        void submitForm() {
        if(validateForm()){
                compileData(); // compile and upload both handle in this
        }
       

      }


}
