import 'package:credit_app/controllers/commonLoanController.dart';
import 'package:credit_app/widget/custom_dropdown.dart';
import 'package:credit_app/widget/custom_textformfield.dart';
import 'package:credit_app/widget/datePickerField.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CommonLoanForm extends StatefulWidget {
  @override
  _CommonLoanFormState createState() => _CommonLoanFormState();
}

class _CommonLoanFormState extends State<CommonLoanForm> {
  final CommonLoanController loanController = Get.put(CommonLoanController());
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
        title: Text('Loan Application Form'),
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
                    textEditingController: loanController.SpouseNameController,
                  ),
                  SizedBox(height: 10),
                  Text('Spouse\'s Mobile Number', style: Theme.of(context).textTheme.bodyLarge),
                  CustomTextFormField(
                    hintText: "Enter Spouse's mobile number",
                    textEditingController: loanController.SpouseMobileController,
                    textInputType: TextInputType.phone,
                  ),
                  SizedBox(height: 10),

                  DatePickerField(
                        date: loanController.SpouseDob.value,
                        labelText: "Spouse's Date of Birth",
                        onChanged: (date) => loanController.SpouseDob.value = date,
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
                        onChanged: (date) => loanController.nomineeDob.value = date,
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
      if (_currentPage == 1) {
        // Show confirmation dialog
        showConfirmationDialog(context, () {
          // Handle form submission

          loanController.getEmail() ;

          loanController.submitForm();
          print("Form Submitted");
        });
      } else {
        // Handle next step navigation
        _pageController.nextPage(duration: Duration(milliseconds: 300), curve: Curves.ease);
      }
    },
            child: Text(_currentPage == 1 ? 'Submit' : 'Next'),
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
        content: Text('Are you sure you want to submit the form?'),
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
