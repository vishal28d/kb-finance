
import 'package:credit_app/controllers/professional_loan_controller.dart';
import 'package:credit_app/views/ProfessionalLoan/professionalDocument.dart';
import 'package:credit_app/widget/custom_dropdown.dart';
import 'package:credit_app/widget/custom_textformfield.dart';
import 'package:credit_app/widget/datePickerField.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfessionalLoanForm extends StatefulWidget {
  @override
  _ProfessionalLoanFormState createState() => _ProfessionalLoanFormState();
}

class _ProfessionalLoanFormState extends State<ProfessionalLoanForm> {

  final ProfessionalLoanController loanController = Get.put(ProfessionalLoanController());

  final PageController _pageController = PageController();
  int _currentPage = 0; // Track the current page

  @override
  void initState() {

    super.initState();
    // Listen to page changes
     loanController.getEmail() ;
    _pageController.addListener(() {
      setState(() {
        _currentPage = _pageController.page!.toInt();
      });
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Professional Loan Form'),
        centerTitle: true,
      ),
      body: PageView(
        controller: _pageController,
        physics: NeverScrollableScrollPhysics(), // Disable swipe navigation
        children: [
          // Combined Step: Loan Amount and Personal Details
          _buildLoanAndPersonalDetailsStep(context),
          // Step 2: Address Details
          _buildAddressDetailsStep(context),
          // step 3 : work details
          _buildWorkDetailsStep(context) ,
          // documents
          _buildUploadDocuments(context) ,
          
        ],
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget _buildLoanAndPersonalDetailsStep(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Required Loan Amount', style: Theme.of(context).textTheme.bodyLarge),
          CustomTextFormField(
            hintText: "Enter loan amount",
            textEditingController: loanController.loanAmountController,
            textInputType: TextInputType.number,
          ),
          SizedBox(height: 10),
          // Type of loan
          CustomDropDown(
            hint: Text("Select Loan Type"),
            list: [
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
            ],
            val: loanController.selectedLoanType.value.isNotEmpty
                ? loanController.selectedLoanType.value
                : null,
            onChanged: (value) {
              loanController.selectedLoanType.value = value.toString();
            },
          ),
          SizedBox(height: 10),
          // Personal Details Section
          Text('Personal Details', style: TextStyle(fontFamily: 'montserrat', fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black45)),
          SizedBox(height: 10),
          Text('Your Name', style: Theme.of(context).textTheme.bodyLarge),
          CustomTextFormField(
            hintText: "Enter your name",
            textEditingController: loanController.nameController,
          ),
          SizedBox(height: 10),
          Text('Mother\'s Name', style: Theme.of(context).textTheme.bodyLarge),
          CustomTextFormField(
            hintText: "Enter your mother's name",
            textEditingController: loanController.motherNameController,
          ),
          SizedBox(height: 10),
          Text('Religion', style: Theme.of(context).textTheme.bodyLarge),
          CustomDropDown(
            hint: Text("Select Religion"),
            list: ['Hindu', 'Muslim', 'Christian', 'Jain', 'Others'],
            val: loanController.selectedReligion.value.isNotEmpty
                ? loanController.selectedReligion.value
                : null,
            onChanged: (value) => loanController.selectedReligion.value = value.toString(),
          ),
          SizedBox(height: 10),
          Text('Caste', style: Theme.of(context).textTheme.bodyLarge),
          CustomDropDown(
            hint: Text("Select Caste"),
            list: ['ST', 'SC', 'OBC', 'GEN', 'EWS'],
            val: loanController.selectedCaste.value.isNotEmpty ? loanController.selectedCaste.value : null,
            onChanged: (value) => loanController.selectedCaste.value = value.toString(),
          ),
          SizedBox(height: 10),
          Text('Email ID', style: Theme.of(context).textTheme.bodyLarge),
          CustomTextFormField(
            hintText: "Enter email ID",
            textEditingController: loanController.emailController,
            textInputType: TextInputType.emailAddress,
          ),
          SizedBox(height: 10),
          Text('Mobile Number', style: Theme.of(context).textTheme.bodyLarge),
          CustomTextFormField(
            hintText: "Enter mobile number",
            textEditingController: loanController.mobileController,
            textInputType: TextInputType.phone,
          ),
          SizedBox(height: 10),
          Text('Alternate Mobile Number', style: Theme.of(context).textTheme.bodyLarge),
          CustomTextFormField(
            hintText: "Enter alternate mobile number",
            textEditingController: loanController.alternateMobileController,
            textInputType: TextInputType.phone,
          ),
          SizedBox(height: 10),
          Text('Marital Status', style: Theme.of(context).textTheme.bodyLarge),
          CustomDropDown(
            hint: Text("Single / Married"),
            list: ['Single', 'Married'],
            val: loanController.maritalStatus.value.isNotEmpty ? loanController.maritalStatus.value : null,
            onChanged: (value) => loanController.maritalStatus.value = value.toString(),
          ),
          SizedBox(height: 10),
          Obx(() {
            if (loanController.maritalStatus.value == 'Married') {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Spouse\'s Name', style: Theme.of(context).textTheme.bodyLarge),
                  CustomTextFormField(
                    hintText: "Enter Spouse's name",
                    textEditingController: loanController.spouseNameController,
                  ),
                  SizedBox(height: 10),
                  Text('Spouse\'s Mobile Number', style: Theme.of(context).textTheme.bodyLarge),
                  CustomTextFormField(
                    hintText: "Enter Spouse's mobile number",
                    textEditingController: loanController.spouseMobileController,
                    textInputType: TextInputType.phone,
                  ),
                  SizedBox(height: 10),

                  DatePickerField(
                        date: loanController.spouseDob.value,
                        labelText: "Spouse's Date of Birth",
                        onChanged: (date) => loanController.spouseDob.value = date!,
                   ),
                  
                  SizedBox(height: 10,) ,

                ],
              );
            } else {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Nominee\'s Name', style: Theme.of(context).textTheme.bodyLarge),
                  CustomTextFormField(
                    hintText: "Enter nominee's name",
                    textEditingController: loanController.nomineeNameController,
                  ),
                  SizedBox(height: 10),
                  Obx(() => DatePickerField(
                        date: loanController.nomineeDob.value,
                        labelText: "Nominee Date of Birth",
                        onChanged: (date) => loanController.nomineeDob.value = date!,
                      )),
                  SizedBox(height: 10),
                  Text('Nominee\'s Relation', style: Theme.of(context).textTheme.bodyLarge),
                  CustomTextFormField(
                    hintText: "Enter nominee's relation",
                    textEditingController: loanController.nomineeRelationController,
                  ),
                  SizedBox(height: 10),
                ],
              );
            }
          }),
        ],
      ),
    );
  }

  Widget _buildAddressDetailsStep(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Address Details', style: TextStyle(fontFamily: 'montserrat', fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black45)),
          SizedBox(height: 10),
          Text('Current Residence Address', style: Theme.of(context).textTheme.bodyLarge),
          CustomTextFormField(
            hintText: "Enter current residence address",
            textEditingController: loanController.currentAddressController,
          ),
          SizedBox(height: 10),
          Text('Pin Code', style: Theme.of(context).textTheme.bodyLarge),
          CustomTextFormField(
            hintText: "Enter pin code",
            textEditingController: loanController.currentPinController,
            textInputType: TextInputType.number,
          ),
          SizedBox(height: 10),
          Text('Landmark', style: Theme.of(context).textTheme.bodyLarge),
          CustomTextFormField(
            hintText: "Enter landmark",
            textEditingController: loanController.currentLandmarkController,
          ),
          SizedBox(height: 10),
          Text('Ownership (Rented/Own House)', style: Theme.of(context).textTheme.bodyLarge),
          CustomDropDown(
            hint: Text("Select Ownership"),
            list: ['Rented', 'Own' , 'Company Provided' ],
            val: loanController.ownershipStatus.value.isNotEmpty
                ? loanController.ownershipStatus.value
                : null,
            onChanged: (value) => loanController.ownershipStatus.value = value.toString(),
          ),
          SizedBox(height: 10),


          Text('Permanent Address Details', style: TextStyle(fontFamily: 'montserrat', fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black45)),
          SizedBox(height: 10,) ,
          CustomTextFormField(
            hintText: "Enter permanent address",
            textEditingController: loanController.permanentAddressController,
          ),
          SizedBox(height: 10),
          Text('Permanent Pin Code', style: Theme.of(context).textTheme.bodyLarge),
          CustomTextFormField(
            hintText: "Enter permanent pin code",
            textEditingController: loanController.permanentPinController,
            textInputType: TextInputType.number,
          ),
          SizedBox(height: 10),
          Text('Permanent Landmark', style: Theme.of(context).textTheme.bodyLarge),
          CustomTextFormField(
            hintText: "Enter permanent landmark",
            textEditingController: loanController.permanentLandmarkController,
          ),
          SizedBox(height: 10),
          Text('Permanent Ownership (Rented/Own House)', style: Theme.of(context).textTheme.bodyLarge),
          CustomDropDown(
            hint: Text("Select Permanent Ownership"),
            list: ['Rented', 'Own' , 'Company Provided' ],
            val: loanController.permanentOwnershipStatus.value.isNotEmpty
                ? loanController.permanentOwnershipStatus.value
                : null,
            onChanged: (value) => loanController.permanentOwnershipStatus.value = value.toString(),
          ),
          SizedBox(height: 10),


          Text('Permanent House Type', style: Theme.of(context).textTheme.bodyLarge),
          CustomDropDown(
            hint: Text("Select Permanent House Type"),
            list: ['Kaccha', 'Pakka'],
            val: loanController.permanentHouseType.value.isNotEmpty
                ? loanController.permanentHouseType.value
                : null,
            onChanged: (value) => loanController.permanentHouseType.value = value.toString(),
          ),
          SizedBox(height: 10,) ,


          // Additional Address Details
          Text('Square Feet', style: Theme.of(context).textTheme.bodyLarge),
          CustomTextFormField(
            hintText: "Enter House square feet",
            textEditingController: loanController.permanentSquareFeetController ,
            textInputType: TextInputType.number,
          ),
          SizedBox(height: 10),
          Text('Years at Current City', style: Theme.of(context).textTheme.bodyLarge),
          CustomTextFormField(
            hintText: "Enter number of years at current city",
            textEditingController: loanController.yearsAtCityController,
            textInputType: TextInputType.number,
          ),
          SizedBox(height: 10),
        ],
      ),
    );
  }



Widget _buildWorkDetailsStep(BuildContext context) {
  return SingleChildScrollView(
    padding: const EdgeInsets.all(16.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Work Details', style: Theme.of(context).textTheme.titleLarge),
        SizedBox(height: 10),
        
        // Professional or Business Selection
        Text('Job', style: Theme.of(context).textTheme.bodyLarge),
        CustomDropDown(
          hint: Text("Select"),
          list: ["Professional", "Business"],
          val: loanController.selectedJobType.value.isNotEmpty
              ? loanController.selectedJobType.value
              : null,
          onChanged: (value) => loanController.selectedJobType.value = value.toString(),
        ),
        SizedBox(height: 10),

        // Conditional Fields: Professional or Business
        Obx(() {
          if (loanController.selectedJobType.value == 'Professional') {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Clinic or Hospital Address', style: Theme.of(context).textTheme.bodyLarge),
                CustomTextFormField(
                  hintText: "Enter clinic or hospital address",
                  textEditingController: loanController.clinicAddressController,
                ),
                SizedBox(height: 10),
                Text('Graduation Year', style: Theme.of(context).textTheme.bodyLarge),
                CustomTextFormField(
                  hintText: "Enter graduation year",
                  textEditingController: loanController.graduationYearController,
                  textInputType: TextInputType.number,
                ),
                SizedBox(height: 10),
                Text('Experience (in years)', style: Theme.of(context).textTheme.bodyLarge),
                CustomTextFormField(
                  hintText: "Enter experience",
                  textEditingController: loanController.experienceController,
                  textInputType: TextInputType.number,
                ),
                SizedBox(height: 10),
                Text('Professional Degree', style: Theme.of(context).textTheme.bodyLarge),
                CustomTextFormField(
                  hintText: "Enter degree",
                  textEditingController: loanController.professionalDegreeController,
                ),
              ],
            );
          } else if (loanController.selectedJobType.value == 'Business') {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Business Type', style: Theme.of(context).textTheme.bodyLarge),
                CustomDropDown(
                  hint: Text("Select Business Type"),
                  list: ["Proprietor", "Partnership", "Private Limited", "LLP"],
                  val: loanController.businessType.value.isNotEmpty
                      ? loanController.businessType.value
                      : null,
                  onChanged: (value) => loanController.businessType.value = value.toString(),
                ),
                SizedBox(height: 10),
                Text('Do You Have Business Proof?', style: Theme.of(context).textTheme.bodyLarge),
                CustomDropDown(
                  hint: Text("Select Proof"),
                  list: ["GST", "Gumasta", "Drug License", "FSSAI", "Udyam Aadhar", "Other", "None"],
                  val: loanController.businessProofType.value.isNotEmpty
                      ? loanController.businessProofType.value
                      : null,
                  onChanged: (value) => loanController.businessProofType.value = value.toString(),
                ),
                SizedBox(height: 10),
                Text('Annual Turnover (in ₹)', style: Theme.of(context).textTheme.bodyLarge),
                CustomTextFormField(
                  hintText: "Enter turnover",
                  textEditingController: loanController.turnoverController,
                  textInputType: TextInputType.number,
                ),
                SizedBox(height: 10),
                Text('Years in Business', style: Theme.of(context).textTheme.bodyLarge),
                CustomTextFormField(
                  hintText: "Enter years in business",
                  textEditingController: loanController.yearsInBusinessController,
                  textInputType: TextInputType.number,
                ),
              ],
            );
          } else {
            return Container();
          }
        }),

        SizedBox(height: 20),
        // Reference Details
        Text('Reference Details', style: Theme.of(context).textTheme.titleLarge),
        SizedBox(height: 10),
        Text('1) Relative/Friend Name', style: Theme.of(context).textTheme.bodyLarge),
        CustomTextFormField(
          hintText: "Enter name",
          textEditingController: loanController.reference1NameController,
        ),
        SizedBox(height: 10),
        Text('Mobile Number', style: Theme.of(context).textTheme.bodyLarge),
        CustomTextFormField(
          hintText: "Enter mobile number",
          textEditingController: loanController.reference1MobileController,
          textInputType: TextInputType.phone,
        ),
        SizedBox(height: 10),
        Text('Address', style: Theme.of(context).textTheme.bodyLarge),
        CustomTextFormField(
          hintText: "Enter Address details",
          textEditingController: loanController.reference1AddressController,
          textInputType: TextInputType.text,
        ),
        SizedBox(height: 10),
        Text('2) Relative/Friend Name', style: Theme.of(context).textTheme.bodyLarge),
        CustomTextFormField(
          hintText: "Enter name",
          textEditingController: loanController.reference2NameController,
        ),
        SizedBox(height: 10),
        Text('Mobile Number', style: Theme.of(context).textTheme.bodyLarge),
        CustomTextFormField(
          hintText: "Enter mobile number",
          textEditingController: loanController.reference2MobileController,
          textInputType: TextInputType.phone,
        ),
        SizedBox(height: 10),

        Text('Address', style: Theme.of(context).textTheme.bodyLarge),
        CustomTextFormField(
          hintText: "Enter Address details",
          textEditingController: loanController.reference2AddressController,
          textInputType: TextInputType.text,
        ),

        Text('Current Loan Details', style: Theme.of(context).textTheme.titleLarge),
        SizedBox(height: 10),
        Text('Enter Current Bank', style: Theme.of(context).textTheme.bodyLarge),
        CustomTextFormField(
          hintText: "Enter Current Bank",
          textEditingController: loanController.currentLoanBank,
          textInputType: TextInputType.text,
        ),

        SizedBox(height: 10),
        Text('Enter EMI Amount', style: Theme.of(context).textTheme.bodyLarge),
        CustomTextFormField(
          hintText: "Enter EMI Amount",
          textEditingController: loanController.emiAmount,
          textInputType: TextInputType.text,
        ),

        SizedBox(height: 10),
        Text('Select Loan Type', style: Theme.of(context).textTheme.bodyLarge),
        CustomDropDown(
                  hint: Text("Select Loan Type"),
                  list:  [
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
            ],
                  val: loanController.loanType.value.isNotEmpty
                      ? loanController.loanType.value
                      : null,
                  onChanged: (value) => loanController.loanType.value = value.toString(),
        ),

        SizedBox(height: 10),
        Text('Select Disbursed Date', style: Theme.of(context).textTheme.bodyLarge),
        CustomTextFormField(
          hintText: "Select Disbursed Date",
          textEditingController: loanController.disbursedDate ,
          textInputType: TextInputType.datetime,
        ),

        SizedBox(height: 10),
        Text('Enter Loan Amount', style: Theme.of(context).textTheme.bodyLarge),
        CustomTextFormField(
          hintText: "Enter Loan Amount",
          textEditingController: loanController.loanAmount ,
          textInputType: TextInputType.number,
        ),
        SizedBox(height: 10,) ,

      // vehicle details car
        Text('Additional Details', style: Theme.of(context).textTheme.titleLarge),
        SizedBox(height: 10),
        Text('Do You Have Car Or Commercial Vehicle ? If You Have', style: Theme.of(context).textTheme.bodyLarge),
        Text('Enter Car Name With Company Name', style: Theme.of(context).textTheme.bodyLarge),
        CustomTextFormField(
          hintText: "Enter details",
          textEditingController: loanController.carDetails ,
          textInputType: TextInputType.text,
        ),
        SizedBox(height: 10,) ,
        Text('Registration Details', style: Theme.of(context).textTheme.bodyLarge),
        CustomTextFormField(
          hintText: "Enter Registration Date",
          textEditingController: loanController.carRegistrationDate ,
          textInputType: TextInputType.datetime,
        ),

        SizedBox(height: 10,) ,
        Text('Are you using Credit Card (if yes)', style: Theme.of(context).textTheme.bodyLarge),
        CustomTextFormField(
          hintText: "Enter Bank Name",
          textEditingController: loanController.creditBankName ,
          textInputType: TextInputType.datetime,
        ),

        SizedBox(height: 10,) ,

        Text('Your Firm is Audited?', style: Theme.of(context).textTheme.bodyLarge),
        CustomDropDown(
                  hint: Text("Your Firm is Audited?"),
                  list: ["Yes", "No"],
                  val: loanController.isAudited.value.isNotEmpty
                      ? loanController.isAudited.value
                      : null,
                  onChanged: (value) => loanController.isAudited.value = value.toString(),
            ),

        SizedBox(height: 10,) , 

      

      ],
    ),
  );
}


  Widget _buildUploadDocuments(BuildContext context) {
    return 
        UploadDocumentsScreen() ;
  }



  Widget _buildBottomNavigationBar() {
    return BottomAppBar(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ElevatedButton(
            style: ButtonStyle(backgroundColor: WidgetStateProperty.all( Color.fromARGB(255, 167, 12, 12) )) ,

            onPressed: () {
              // Handle previous step navigation
              if (_currentPage > 0) {
                _pageController.previousPage(duration: Duration(milliseconds: 300), curve: Curves.ease);
              }
            },
            child: Text('Previous'),
          ),
          ElevatedButton(
            style: ButtonStyle(backgroundColor: WidgetStateProperty.all(Color.fromARGB(255, 167, 12, 12))) ,
            onPressed: () {
      if (_currentPage == 3) {
        // Show confirmation dialog
        showConfirmationDialog(context, () {
          // Handle form submission

          loanController.getEmail() ;

          loanController.compileData(); 
          Navigator.pop(context) ;
          
          print("Form Submitted");
        });
      } else {
        // Handle next step navigation
        _pageController.nextPage(duration: Duration(milliseconds: 300), curve: Curves.ease);
      }
    },
            child: Text(_currentPage == 3 ? 'Submit' : 'Next'),
          ),
        ],
      ),
    );
  }
}



void showConfirmationDialog(BuildContext context, Function onConfirm) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Confirm Submission'),
        content: Text('Are you sure you want to submit the form and go back?'),
        actions: <Widget>[
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black54 , // Dark red color
            ),
            onPressed: () {
              Navigator.of(context).pop(); // Close the dialog
            },
            child: Text(
              'Cancel',
              style: TextStyle(color: Colors.white),
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red[800], // Dark red color
            ),
            onPressed: () {
              onConfirm(); // Call the submission function
              Navigator.of(context).pop(); // Close the dialog
            },
            child: Text('Confirm'),
          ),
        ],
      );
    },
  );
}
