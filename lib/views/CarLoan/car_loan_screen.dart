

import 'package:credit_app/views/CarLoan/car_document.dart';
import 'package:credit_app/views/CarLoan/car_loan_controller.dart';

// import 'package:credit_app/views/ProfessionalLoan/professionalDocument.dart';
import 'package:credit_app/widget/custom_dropdown.dart';
import 'package:credit_app/widget/custom_textformfield.dart';
import 'package:credit_app/widget/datePickerField.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class CarLoanForm extends StatefulWidget {
  @override
  _CarLoanFormState createState() => _CarLoanFormState();
}

class _CarLoanFormState extends State<CarLoanForm> {

  final CarLoanController loanController = Get.put(CarLoanController());

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
        title: Text('Car Loan Form'),
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
                  "New Car Purchase",
                  "Used Car Purchase",
                  "Car Refinance",     
                  "Car Loan Transfer" ,
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

                  Obx(() {
                    DateTime? selectedDate;
                    if (loanController.spouseDob.value.isNotEmpty) {
                      selectedDate = DateFormat('dd-MM-yyyy').parse(loanController.spouseDob.value);
                    }
                    return DatePickerField(
                      date: selectedDate,  // Pass the parsed DateTime or null
                      labelText: "Spouse's Date of Birth",
                      onChanged: (DateTime? date) {
                        if (date != null) {
                          // Format and assign the selected date as a string to the spouseDob RxString
                          loanController.spouseDob.value = DateFormat('dd-MM-yyyy').format(date);
                        }
                      },
                    );
                  }),
                  
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

                  Obx(() {
                      // Check if nomineeDob has a value, otherwise display null
                      DateTime? selectedDate;
                      if (loanController.nomineeDob.value.isNotEmpty) {
                        selectedDate = DateFormat('dd-MM-yyyy').parse(loanController.nomineeDob.value);
                      }
                      return DatePickerField(
                        date: selectedDate,  // Pass the parsed DateTime or null
                        labelText: "Nominee Date of Birth",
                        onChanged: (DateTime? date) {
                          if (date != null) {
                            // Format and assign the selected date as a string to the nomineeDob RxString
                            loanController.nomineeDob.value = DateFormat('dd-MM-yyyy').format(date);
                          }
                        },
                      );
                    }),

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
        Text('Current Address Details',
            style: TextStyle(
                fontFamily: 'montserrat',
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black45)),
        SizedBox(height: 10),
        Text('Current Residence Address',
            style: Theme.of(context).textTheme.bodyLarge),
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
        Text('Ownership (Rented/Own House)',
            style: Theme.of(context).textTheme.bodyLarge),
        CustomDropDown(
          hint: Text("Select Ownership"),
          list: ['Rented', 'Own', 'Company Provided'],
          val: loanController.ownershipStatus.value.isNotEmpty
              ? loanController.ownershipStatus.value
              : null,
          onChanged: (value) =>
              loanController.ownershipStatus.value = value.toString(),
        ),
        SizedBox(height: 10),

        // Divider between current and permanent address
        Divider(height: 20, color: Colors.grey),

        // Dropdown for checking if current address is same as permanent address
        Text('Is Current Address Same as Permanent Address?',
            style: Theme.of(context).textTheme.bodyLarge),
        Obx(() => CustomDropDown(
              hint: Text("Select Option"),
              list: ['Yes', 'No'],
              val: loanController.isCurrentAddressSame.value.isNotEmpty
                  ? loanController.isCurrentAddressSame.value
                  : null,
              onChanged: (value) =>
                  loanController.isCurrentAddressSame.value = value.toString(),
            )),
        Divider(),
        SizedBox(height: 10),

        // Show permanent address details only if selected 'No'
        Obx(() {
          if (loanController.isCurrentAddressSame.value == 'No') {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Permanent Address Details',
                    style: TextStyle(
                        fontFamily: 'montserrat',
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black45)),
                SizedBox(height: 10),
                Text('Enter address',
                    style: Theme.of(context).textTheme.bodyLarge),
                CustomTextFormField(
                  hintText: "Enter permanent address",
                  textEditingController: loanController.permanentAddressController,
                ),
                SizedBox(height: 10),
                Text('Permanent Pin Code',
                    style: Theme.of(context).textTheme.bodyLarge),
                CustomTextFormField(
                  hintText: "Enter permanent pin code",
                  textEditingController: loanController.permanentPinController,
                  textInputType: TextInputType.number,
                ),
                SizedBox(height: 10),
                Text('Permanent Landmark',
                    style: Theme.of(context).textTheme.bodyLarge),
                CustomTextFormField(
                  hintText: "Enter permanent landmark",
                  textEditingController: loanController.permanentLandmarkController,
                ),
                SizedBox(height: 10),
                Text('Permanent Ownership (Rented/Own House)',
                    style: Theme.of(context).textTheme.bodyLarge),
                Obx(() => CustomDropDown(
                      hint: Text("Select Permanent Ownership"),
                      list: ['Rented', 'Own', 'Company Provided'],
                      val: loanController.permanentOwnershipStatus.value.isNotEmpty
                          ? loanController.permanentOwnershipStatus.value
                          : null,
                      onChanged: (value) => loanController
                          .permanentOwnershipStatus.value = value.toString(),
                    )),
                SizedBox(height: 10),

                Text('Permanent House Type',
                    style: Theme.of(context).textTheme.bodyLarge),
                Obx(() => CustomDropDown(
                      hint: Text("Select Permanent House Type"),
                      list: ['Kaccha', 'Pakka'],
                      val: loanController.permanentHouseType.value.isNotEmpty
                          ? loanController.permanentHouseType.value
                          : null,
                      onChanged: (value) =>
                          loanController.permanentHouseType.value = value.toString(),
                    )),
                SizedBox(height: 10),

                // Additional Permanent Address Details
                Text('House Area', style: Theme.of(context).textTheme.bodyLarge),
                CustomTextFormField(
                  hintText: "Enter House square feet",
                  textEditingController: loanController.permanentSquareFeetController,
                  textInputType: TextInputType.number,
                ),
                SizedBox(height: 10),
                Text('Years at Current City',
                    style: Theme.of(context).textTheme.bodyLarge),
                CustomTextFormField(
                  hintText: "Enter number of years at current city",
                  textEditingController: loanController.yearsAtCityController,
                  textInputType: TextInputType.number,
                ),
                SizedBox(height: 10),
              ],
            );
          } else {
            return SizedBox(height: 5); // Shrinked SizedBox if 'Yes' is selected
          }
        }),
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
        // Common fields
          Text('Select Occupation Type', style: Theme.of(context).textTheme.bodyLarge),
          CustomDropDown(
          hint: Text("Select Occupation Type "),
          list: ["Professional", "Business", "Job" ],
          val: loanController.selectedJobType.value.isNotEmpty
              ? loanController.selectedJobType.value
              : null,
          onChanged: (value) => loanController.selectedJobType.value = value.toString(),
        ),

        SizedBox(height: 6),

        Obx(() {
      
          if (loanController.selectedJobType.value == 'Professional') {
            return _buildProfessionalDetails();
          } else if (loanController.selectedJobType.value == 'Business') {
            return _buildBusinessDetails();
          } else if (loanController.selectedJobType.value == 'Job') {
            return _buildJobDetails();
          } else {
            return Container();
          }
        }),
        Divider(),
        
        SizedBox(height: 6),

        Text('Do you want to Balance Transfer?', style: Theme.of(context).textTheme.bodyLarge),
          CustomDropDown(
          hint: Text("Transfer Balance?"),
          list: ["Yes" , "No" ],
          val: loanController.isBalanceTransfer.value.isNotEmpty
              ? loanController.isBalanceTransfer.value
              : null,
          onChanged: (value) => loanController.isBalanceTransfer.value = value.toString(),
        ),

        // current loan details

        Text('Do you have any current loan?', style: Theme.of(context).textTheme.bodyLarge),
        CustomDropDown(
          hint: Text("Select"),
          list: ["Yes", "No"],
          val: loanController.hasCurrentLoan.value.isNotEmpty
              ? loanController.hasCurrentLoan.value
              : null,
          onChanged: (value) {
            loanController.hasCurrentLoan.value = value.toString();
          },
        ),
        SizedBox(height: 10),
        Obx(() {
          // Check the value of hasCurrentLoan
          if (loanController.hasCurrentLoan.value == 'Yes') {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Current Loan Details', style: Theme.of(context).textTheme.titleLarge),
                SizedBox(height: 10),
                Text('Do you want to Balance Transfer?', style: Theme.of(context).textTheme.bodyLarge),
                CustomDropDown(
                  hint: Text("Transfer Balance?"),
                  list: ["Yes", "No"],
                  val: loanController.isBalanceTransfer.value.isNotEmpty
                      ? loanController.isBalanceTransfer.value
                      : null,
                  onChanged: (value) => loanController.isBalanceTransfer.value = value.toString(),
                ),
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
                  textInputType: TextInputType.number,
                ),
                SizedBox(height: 10),
                Text('Enter Loan Amount', style: Theme.of(context).textTheme.bodyLarge),
                CustomTextFormField(
                  hintText: "Enter Loan Amount",
                  textEditingController: loanController.currentLoanAmount,
                  textInputType: TextInputType.number,
                ),
                SizedBox(height: 10),
                Text('Disbursed Date', style: Theme.of(context).textTheme.bodyLarge),
                CustomTextFormField(
                  hintText: "Enter current loan disbursed date",
                  textEditingController: loanController.currentDisbursedDate,
                  textInputType: TextInputType.datetime,
                ),
                SizedBox(height: 10),
                Text('Select Loan Type', style: Theme.of(context).textTheme.bodyLarge),
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
                  val: loanController.loanType.value.isNotEmpty
                      ? loanController.loanType.value
                      : null,
                  onChanged: (value) => loanController.loanType.value = value.toString(),
                ),
              ],
            );
          } else {
            // Show a shrinked SizedBox when the answer is "No"
            return SizedBox(height: 10);
          }
        }),
        Divider() ,

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
        SizedBox(height: 10,) ,
        Divider() ,


      // vehicle details car losn details
        Text('${loanController.selectedLoanType} Details', style: Theme.of(context).textTheme.titleLarge),
        SizedBox(height: 10),
  
        Text('Which company car you want to buy?', style: Theme.of(context).textTheme.bodyLarge),
     
         CustomDropDown(
          hint: Text("select company"),
          list: [ 
                "Tata Motors",
                "Mahindra & Mahindra",
                "Ashok Leyland",
                "Force Motors",
                "Hindustan Motors",
                "Eicher Motors",
                "Maruti Suzuki",
                "Hyundai Motors",
                "Honda Cars India",
                "Toyota Kirloskar Motor",
                "Renault India",
                "Kia Motors",
                "Volkswagen India",
                "Skoda Auto India",
                "MG Motors India",
                "Nissan Motor India",
                "Ford India",
                "Fiat Chrysler",
          ],
          val: loanController.carBuyCompany.value.isNotEmpty
              ? loanController.carBuyCompany.value
              : null,
          onChanged: (value) => loanController.carBuyCompany.value = value.toString(),
        ),

        SizedBox(height: 10,) ,
        Text('Enter Car Model Name', style: Theme.of(context).textTheme.bodyLarge),
        CustomTextFormField(
          hintText: "Enter Car Model Name",
          textEditingController: loanController.carModelName ,
          textInputType: TextInputType.text,
        ),

        SizedBox(height: 10,),

        DatePickerField(
          date: DateTime.now(),
          labelText: "Car Buy Date", 
          onChanged: (newDate) {
            if (newDate != null) {
              setState(() {
              loanController.carBuyDate.value = newDate.toString();  
             
              });
            }
           
          }
        ),

        SizedBox(height: 10,) ,
        Text('Enter Car Price', style: Theme.of(context).textTheme.bodyLarge),
        CustomTextFormField(
          hintText: "Enter Car Price",
          textEditingController: loanController.carPrice ,
          textInputType: TextInputType.text ,
        ),

        SizedBox(height: 10,) ,
        Text('Down Payment Amount', style: Theme.of(context).textTheme.bodyLarge),
        CustomTextFormField(
          hintText: "Enter down payment amount",
          textEditingController: loanController.carDownPayment ,
          textInputType: TextInputType.text ,
        ),

        SizedBox(height: 10,) ,
        Text('Enter Manufacturing  Year', style: Theme.of(context).textTheme.bodyLarge),
        CustomTextFormField(
          hintText: "manufacturing year",
          textEditingController: loanController.carManufacturingYear ,
          textInputType: TextInputType.text ,
        ),

        SizedBox(height: 10,) ,
        Text('Enter Owner Serial', style: Theme.of(context).textTheme.bodyLarge),
        CustomTextFormField(
          hintText: "owner serial",
          textEditingController: loanController.ownerSerial ,
          textInputType: TextInputType.text ,
        ),

        SizedBox(height: 10,) ,

        Text('Your Car is Free or Finance?', style: Theme.of(context).textTheme.bodyLarge),
          CustomDropDown(
            hint: Text("select"),
            list: ['Free', 'Finance'],
            val: loanController.freeOrFinance.value.isNotEmpty
                ? loanController.freeOrFinance.value
                : null,
            onChanged: (value) => loanController.freeOrFinance.value = value.toString(),
          ),

        
        // Show additional fields if "Finance" is selected
       Obx(() {
  if (loanController.freeOrFinance.value == 'Finance') {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 10),
        Text('Bank or Company Name', style: Theme.of(context).textTheme.bodyLarge),
        CustomTextFormField(
          hintText: "Enter Bank or Company Name",
          textEditingController: loanController.bankOrCompanyName,
          textInputType: TextInputType.text,
        ),

        SizedBox(height: 10),
        Text('Finance Amount', style: Theme.of(context).textTheme.bodyLarge),
        CustomTextFormField(
          hintText: "Enter Finance Amount",
          textEditingController: loanController.financeAmount,
          textInputType: TextInputType.number,
        ),

        SizedBox(height: 10),
        Text('Loan Disbursed Month', style: Theme.of(context).textTheme.bodyLarge),
        CustomTextFormField(
          hintText: "Enter Loan Disbursed Month",
          textEditingController: loanController.loanDisbursedMonth,
          textInputType: TextInputType.text,
        ),

        SizedBox(height: 10),
        Text('Interest Rate', style: Theme.of(context).textTheme.bodyLarge),
        CustomTextFormField(
          hintText: "Enter Interest Rate(%)",
          textEditingController: loanController.interestRate,
          textInputType: TextInputType.number,
        ),

        SizedBox(height: 10),
        Text('Number of EMI Paid in Months', style: Theme.of(context).textTheme.bodyLarge),
        CustomTextFormField(
          hintText: "Enter Number of EMI Paid",
          textEditingController: loanController.emiPaidMonths,
          textInputType: TextInputType.text,
        ),

        SizedBox(height: 10),
        Text('Number of EMI Left', style: Theme.of(context).textTheme.bodyLarge),
        CustomTextFormField(
          hintText: "Enter Number of EMI Left",
          textEditingController: loanController.emiLeftMonths,
          textInputType: TextInputType.text,
        ),

        SizedBox(height: 10),
        Text('Any Bounces in Last 12 Months?', style: Theme.of(context).textTheme.bodyLarge),
        CustomDropDown(
          hint: Text("Select"),
          list: ['Yes', 'No'],
          val: loanController.bouncesLast12Months.value.isNotEmpty
              ? loanController.bouncesLast12Months.value
              : null,
          onChanged: (value) {
            loanController.bouncesLast12Months.value = value.toString();
          },
        ),

        // If "Yes" is selected for bounces, show the additional field
        Obx(() {
          if (loanController.bouncesLast12Months.value == 'Yes') {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10),
                Text('How Many Bounces', style: Theme.of(context).textTheme.bodyLarge),
                CustomTextFormField(
                  hintText: "Enter number of bounces",
                  textEditingController: loanController.numberOfBounces,
                  textInputType: TextInputType.number,
                ),
              ],
            );
          }
          return SizedBox.shrink(); // Empty space if "No" is selected
        }),
      ],
    );
  }
  return SizedBox.shrink(); // Empty space if "Finance" is not selected
}),


    Divider() ,

        SizedBox(height: 10,) ,
        Text('Are you using Credit Card (if yes)', style: Theme.of(context).textTheme.bodyLarge),
        CustomTextFormField(
          hintText: "Enter Bank Name with expiry date",
          textEditingController: loanController.creditBankName ,
          textInputType: TextInputType .text ,
        ),

        SizedBox(height: 10,) ,

    Obx(() {
  if (loanController.selectedJobType.value == 'Business' || loanController.selectedJobType.value == 'Professional') {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Your Firm is Audited?',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        CustomDropDown(
          hint: Text("Your Firm is Audited?"),
          list: ["Yes", "No"],
          val: loanController.isAudited.value.isNotEmpty
              ? loanController.isAudited.value
              : null,
          onChanged: (value) => loanController.isAudited.value = value.toString(),
        ),
      ],
    );
  } else {
    return Container(); 
  }
}),


        SizedBox(height: 10,) , 
      ],
    ),
  );
}


Widget _buildProfessionalDetails() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text('Workplace Address', style: Theme.of(context).textTheme.bodyLarge),
      CustomTextFormField(
        hintText: "Workplace address",
        textEditingController: loanController.workplaceAddressController,
      ),
      SizedBox(height: 10),
      Text('Graduation Year', style: Theme.of(context).textTheme.bodyLarge),
      CustomTextFormField(
        hintText: "Enter graduation year",
        textEditingController: loanController.graduationYearController,
        textInputType: TextInputType.number,
      ),
      SizedBox(height: 10),
      Text('Workplace Name(e.g. hospital/clinic/firm)', style: Theme.of(context).textTheme.bodyLarge),
      CustomTextFormField(
        hintText: "Enter Workplace name",
        textEditingController: loanController.workplaceNameController,
      ),
      SizedBox(height: 10),
      Text('Pin Code', style: Theme.of(context).textTheme.bodyLarge),
      CustomTextFormField(
        hintText: "Enter pin code",
        textEditingController: loanController.workplacePinCodeController,
        textInputType: TextInputType.number,
      ),
      SizedBox(height: 10),
      Text('Total Work Experience', style: Theme.of(context).textTheme.bodyLarge),
      CustomTextFormField(
        hintText: "work experience in years",
        textEditingController: loanController.experienceController ,
        textInputType: TextInputType.number,
      ),

    ],
  );
}


Widget _buildBusinessDetails() {
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
      Text('Business Proof', style: Theme.of(context).textTheme.bodyLarge),
      CustomDropDown(
        hint: Text("Select Business Proof"),
        list: ["GST", "Gumasta", "Drug License", "FSSAI", "Udyam Aadhar", "Other", "Panchayat Gumasta" , "Don't have Business proof"],
        val: loanController.businessProofType.value.isNotEmpty
            ? loanController.businessProofType.value
            : null,
        onChanged: (value) => loanController.businessProofType.value = value.toString(),
      ),
      SizedBox(height: 10),
      Text('Annual Turnover (₹)', style: Theme.of(context).textTheme.bodyLarge),
      CustomTextFormField(
        hintText: "Enter annual turnover",
        textEditingController: loanController.turnoverController,
        textInputType: TextInputType.number,
      ),
      SizedBox(height: 10),
      Text('Business Registration Date', style: Theme.of(context).textTheme.bodyLarge),
      CustomTextFormField(
        hintText: "Enter registration date",
        textEditingController: loanController.businessRegistrationDate,
        textInputType: TextInputType.datetime ,
      ),
      SizedBox(height: 10),
      Text('Business Name', style: Theme.of(context).textTheme.bodyLarge),
      CustomTextFormField(
        hintText: "Enter Business Name",
        textEditingController: loanController.businessName ,
        textInputType: TextInputType.text ,
      ),
      SizedBox(height: 10),
      Text('Business Address', style: Theme.of(context).textTheme.bodyLarge),
      CustomTextFormField(
        hintText: "Enter Business Address",
        textEditingController: loanController.businessAdress ,
        textInputType: TextInputType.text ,
      ),
      SizedBox(height: 10),
      Text('Number of Years in this business', style: Theme.of(context).textTheme.bodyLarge),
      CustomTextFormField(
        hintText: "Enter Years in business",
        textEditingController: loanController.yearsInBusinessController ,
        textInputType: TextInputType.text ,
      ),

    ],
  );
}

Widget _buildJobDetails() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      // Job Type Selection
      Text('You Are Working In:', style: Theme.of(context).textTheme.bodyLarge),
      CustomDropDown(
        hint: Text("Select Job Type"),
        list: [
          "Proprietorship Firm", 
          "Partnership Firm", 
          "Contractual Basis", 
          "Government Employee", 
          "Private limited", 
          "LLP", 
          "LIMITED"
        ],
        val: loanController.jobType.value.isNotEmpty
            ? loanController.jobType.value
            : null,
        onChanged: (value) {
          loanController.jobType.value = value.toString();
        },
      ),
      SizedBox(height: 10),
  
        
    Text('Company Name', style: Theme.of(context).textTheme.bodyLarge),
    CustomTextFormField(
      hintText: "Enter company name",
      textEditingController: loanController.companyNameController,
    ),
      
      // Office Address
      Text('Office Address', style: Theme.of(context).textTheme.bodyLarge),
      CustomTextFormField(
        hintText: "Enter office address",
        textEditingController: loanController.officeAddress,
      ),
      SizedBox(height: 10),
      Text('Pin Code', style: Theme.of(context).textTheme.bodyLarge),
      CustomTextFormField(
        hintText: "Enter office pin code",
        textEditingController: loanController.officePinCode,
        textInputType: TextInputType.number,
      ),
      SizedBox(height: 10),
      Text('Office Landmark', style: Theme.of(context).textTheme.bodyLarge),
      CustomTextFormField(
        hintText: "Enter office landmark",
        textEditingController: loanController.officeLandmark,
      ),
      SizedBox(height: 10),

      // Salary and Designation
      Text('Net Salary', style: Theme.of(context).textTheme.bodyLarge),
      CustomTextFormField(
        hintText: "Enter net salary",
        textEditingController: loanController.salaryController,
        textInputType: TextInputType.number,
      ),
      SizedBox(height: 10),
      Text('Your Designation', style: Theme.of(context).textTheme.bodyLarge),
      CustomTextFormField(
        hintText: "Enter designation",
        textEditingController: loanController.designationController,
      ),
      SizedBox(height: 10),

      // Official Email ID
      Text('Official Mail I\'d', style: Theme.of(context).textTheme.bodyLarge),
      CustomTextFormField(
        hintText: "Enter official email",
        textEditingController: loanController.officialEmailController,
        textInputType: TextInputType.emailAddress,
      ),
      SizedBox(height: 10),

      // Office Senior Details
      Text('Office Senior Name', style: Theme.of(context).textTheme.bodyLarge),
      CustomTextFormField(
        hintText: "Enter senior\'s name",
        textEditingController: loanController.seniorNameController,
      ),
      SizedBox(height: 10),
      Text('Office Senior Number', style: Theme.of(context).textTheme.bodyLarge),
      CustomTextFormField(
        hintText: "Enter senior\'s phone number",
        textEditingController: loanController.seniorNumberController,
        textInputType: TextInputType.phone,
      ),
      SizedBox(height: 10),

      // Job Experience
      Text('Years in Current Job', style: Theme.of(context).textTheme.bodyLarge),
      CustomTextFormField(
        hintText: "Enter years in current job",
        textEditingController: loanController.yearsInJobController,
        textInputType: TextInputType.text,
      ),
      SizedBox(height: 10),
      Text('Total Work Experience', style: Theme.of(context).textTheme.bodyLarge),
      CustomTextFormField(
        hintText: "Enter total work experience",
        textEditingController: loanController.totalWorkExperienceController,
        textInputType: TextInputType.text,
      ),
    ],
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
              CarDocController carDocController = CarDocController() ;
              carDocController.update() ;
              setState(() {
              carDocController.clearSelectedDocuments() ;
              });
              
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
          
          Future.delayed(Duration(seconds: 2), () {
            Navigator.pop(context);
          });

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
