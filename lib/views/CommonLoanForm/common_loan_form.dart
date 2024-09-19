import 'package:credit_app/controllers/commonLoanController.dart';
import 'package:credit_app/widget/custom_dropdown.dart';
import 'package:credit_app/widget/custom_textformfield.dart';
import 'package:credit_app/widget/datePickerField.dart';
import 'package:credit_app/widget/elevated_button_widget.dart';
import 'package:credit_app/widget/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CommonLoanForm extends StatelessWidget {
  final CommonLoanController loanController = Get.put(CommonLoanController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Loan Application Form'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Required Loan Field
            Text('Required Loan Amount', style: Theme.of(context).textTheme.bodyLarge),
            CustomTextFormField(
              hintText: "Enter loan amount",
              textEditingController: loanController.loanAmountController,
              textInputType: TextInputType.number,
            ),
            SizedBox(height: 10),
            //type of loan
            CustomDropDown(
          hint: Text("Select Loan Type"),
          list: [
            'Personal Loan',
            'Business Loan',
            'Professional Loan',
            'Car Loan - New Car',
            'Car Loan - Used Car',
            'Home Loan',
            'Mortgage Loan',
            'Commercial Purchase'
          ],
          val: loanController.selectedLoanType.value.isNotEmpty
              ? loanController.selectedLoanType.value
              : null,
          onChanged: (value) {
            loanController.selectedLoanType.value = value.toString();
          },
        ),

          SizedBox(height: 10,) ,

            // Personal Details Section
            Text('Personal Details', style: TextStyle(fontFamily: 'montserrat' , fontSize: 20 , fontWeight: FontWeight.bold , color: Colors.black45)) ,

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
              val: loanController.selectedCaste.value.isNotEmpty
              ? loanController.selectedCaste.value : null    ,
              onChanged: (value) => loanController.selectedCaste = value.toString() as RxString,
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

            // Marital Status Section
            Text('Marital Status', style: Theme.of(context).textTheme.bodyLarge),
           CustomDropDown(
              hint: Text("Single / Married"),
              list: ['Single', 'Married'],
              val: loanController.maritalStatus.value.isNotEmpty ? loanController.maritalStatus.value : null,
              onChanged: (value) => loanController.maritalStatus.value = value.toString(),
            ),

            SizedBox(height: 10),

            Obx(() {
              if (loanController.maritalStatus == 'Married') {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Wife\'s Name', style: Theme.of(context).textTheme.bodyLarge),
                    CustomTextFormField(
                      hintText: "Enter wife's name",
                      textEditingController: loanController.wifeNameController,
                    ),
                    SizedBox(height: 10),

                    Text('Wife\'s Mobile Number', style: Theme.of(context).textTheme.bodyLarge),
                    CustomTextFormField(
                      hintText: "Enter wife's mobile number",
                      textEditingController: loanController.wifeMobileController,
                      textInputType: TextInputType.phone,
                    ),
                    SizedBox(height: 10),
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

            // Address Details Section
            Text('Address Details', style: TextStyle(fontFamily: 'montserrat' , fontSize: 20 , fontWeight: FontWeight.bold , color: Colors.black45)) ,
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
              hint: Text("Select Ownership Status"),
              list: ['Rented', 'Own'],
              val: loanController.ownershipStatus.value.isNotEmpty ? loanController.ownershipStatus.value : null,
              onChanged: (value) => loanController.ownershipStatus.value = value.toString(),
            ),

            SizedBox(height: 10),

            Text('House Type (Kachcha/Pakka)', style: Theme.of(context).textTheme.bodyLarge),
           CustomDropDown(
              hint: Text("Select House Type"),
              list: ['Kachcha', 'Pakka'],
              val: loanController.houseType.value.isNotEmpty ? loanController.houseType.value : null,
              onChanged: (value) => loanController.houseType.value = value.toString(),
            ),

            SizedBox(height: 10),

            Text('Square Feet', style: Theme.of(context).textTheme.bodyLarge),
            CustomTextFormField(
              hintText: "Enter square feet",
              textEditingController: loanController.squareFeetController,
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

            Text('Permanent Address', style: Theme.of(context).textTheme.bodyLarge),
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
            // Permanent Address Section
              SizedBox(height: 10),
              CustomDropDown(
                hint: Text("Select Permanent Ownership"),
                list: ['Rented', 'Own'],
                val: loanController.permanentOwnershipStatus.value.isNotEmpty 
                    ? loanController.permanentOwnershipStatus.value 
                    : null,
                onChanged: (value) => loanController.permanentOwnershipStatus.value = value.toString(),
              ),
              SizedBox(height: 10),


            // Submit Button
             ElevatedButton(
                    child: Text('Submit'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF800000), // Maroon color
                      minimumSize: Size(double.infinity, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: loanController.submitForm  ,
                  ),
          ],
        ),
      ),
    );
  }
}
