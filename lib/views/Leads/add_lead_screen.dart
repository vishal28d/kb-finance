import 'package:credit_app/controllers/lead_controller.dart';
import 'package:credit_app/widget/common_padding.dart';
import 'package:credit_app/widget/custom_dropdown.dart';
import 'package:credit_app/widget/custom_textformfield.dart';
import 'package:credit_app/widget/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class AddLeadScreen extends StatefulWidget {
  final Function onRefresh;

  AddLeadScreen({required this.onRefresh});

  @override
  State<AddLeadScreen> createState() => _AddLeadScreenState();
}

class _AddLeadScreenState extends State<AddLeadScreen> {
  final AddLeadController leadsController = Get.find<AddLeadController>();

  final TextStyle commonTextStyle = TextStyle(fontSize: 16.0, color: Colors.black);

  void _confirmSubmit() {
  Get.defaultDialog(
    title: 'Confirm Submission',
    middleText: 'Are you sure you want to submit the lead details?',
    onConfirm: () {
      // Proceed with the submission
      leadsController.addLeadToFirestore();
      widget.onRefresh();
      Get.back(); // Close the dialog after submission\\\\\\\\\\\\
    },
    onCancel: () {
      // Close the dialog without submitting
      Get.back();
    },
    confirm: TextButton(
      style: ButtonStyle(backgroundColor: WidgetStatePropertyAll(Colors.red)),
      onPressed: () {
      if(!leadsController.validateForm()) return ;
      leadsController.addLeadToFirestore();
      widget.onRefresh();
      Get.back(); 
        
      },
      child: Text('Submit'),
    ),
    cancel: TextButton(
        style: ButtonStyle(backgroundColor: WidgetStatePropertyAll(Colors.red)) ,
      onPressed: () {
        Get.back(); // Close the dialog
      },
      child: Text('Cancel'),
    ),
  );
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Loan Follow-up Form'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Borrower Information
            Text('Borrower Information', style: Theme.of(context).textTheme.titleLarge),
            SizedBox(height: 5),
            Text('Full Name', style: commonTextStyle),
            CustomTextFormField(
              hintText: 'Enter full name',
              textEditingController: leadsController.fullname,
            ),
            SizedBox(height: 5),
            Text('Phone Number', style: commonTextStyle),
            CustomTextFormField(
              hintText: 'Enter phone number',
              textEditingController: leadsController.mobileno,
            ),
            SizedBox(height: 5),
            Text('Alternate Phone Number', style: commonTextStyle),
            CustomTextFormField(
              hintText: 'Enter alternate phone number',
              textEditingController: leadsController.alternateMobile,
            ),

            // Address Information
            SizedBox(height: 20),
            Text('Address Information', style: Theme.of(context).textTheme.titleLarge),
            SizedBox(height: 5),

        Text('Office Address', style: Theme.of(context).textTheme.titleLarge),
        SizedBox(height: 5),
        Text('State', style: commonTextStyle),
        CustomTextFormField(hintText: 'Enter state', textEditingController: leadsController.stateOffice),
        SizedBox(height: 5),
        Text('City', style: commonTextStyle),
        CustomTextFormField(hintText: 'Enter city', textEditingController: leadsController.cityOffice),
        SizedBox(height: 5),
        Text('Pincode', style: commonTextStyle),
        CustomTextFormField(hintText: 'Enter pincode', textEditingController: leadsController.pincodeOffice),

         Text('Residence Address', style: Theme.of(context).textTheme.titleLarge),
        SizedBox(height: 5),
        Text('State', style: commonTextStyle),
        CustomTextFormField(hintText: 'Enter state', textEditingController: leadsController.stateResidence),
        SizedBox(height: 5),
        Text('City', style: commonTextStyle),
        CustomTextFormField(hintText: 'Enter city', textEditingController: leadsController.cityResidence),
        SizedBox(height: 5),
        Text('Pincode', style: commonTextStyle),
        CustomTextFormField(hintText: 'Enter pincode', textEditingController: leadsController.pincodeResidence),

         Text('Permanent Address', style: Theme.of(context).textTheme.titleLarge),
        SizedBox(height: 5),
        Text('State', style: commonTextStyle),
        CustomTextFormField(hintText: 'Enter state', textEditingController: leadsController.statePermanent),
        SizedBox(height: 5),
        Text('City', style: commonTextStyle),
        CustomTextFormField(hintText: 'Enter city', textEditingController: leadsController.cityPermanent),
        SizedBox(height: 5),
        Text('Pincode', style: commonTextStyle),
        CustomTextFormField(hintText: 'Enter pincode', textEditingController: leadsController.pincodePermanent),


            SizedBox(height: 5),
            Text('Landmark', style: commonTextStyle),
            CustomTextFormField(
              hintText: 'Enter landmark',
              textEditingController: leadsController.landmark,
            ),

            // Follow-up Details
            SizedBox(height: 20),
            Text('Follow-up Details', style: Theme.of(context).textTheme.titleLarge),
            SizedBox(height: 5),
            _buildDatePicker('Follow-up Date', leadsController.pickedDate ),
            SizedBox(height: 5),
            _buildTimePicker('Follow-up Time', leadsController.pickedTime ),
            SizedBox(height: 5),
            Text('Follow-up Status', style: commonTextStyle),
            CustomDropDown(
              hint: Text("Select Follow-up Status"),
              list: leadsController.followUpStatusList,
              val: leadsController.followUpStatus, // Use .value if using Rx
              onChanged: (newValue) {
                leadsController.followUpStatus = newValue; // Update value
              },
            ),
            SizedBox(height: 5),
            Text('Follow-up Comments', style: commonTextStyle),
            CustomTextFormField(
              hintText: 'Enter follow-up comments',
              textEditingController: leadsController.followUpComments,
            ),

            // Next Follow-up
            SizedBox(height: 20),
            Text('Next Follow-up', style: Theme.of(context).textTheme.titleLarge),
            SizedBox(height: 5),
            _buildDatePicker('Next Follow-up Date', leadsController.nextFollowUpDate ),
            SizedBox(height: 5),
            _buildTimePicker('Next Follow-up Time', leadsController.nextFollowUpTime ),

          SizedBox(height: 10,) ,

          Text('Required Loan Details', style: Theme.of(context).textTheme.titleLarge),
            SizedBox(height: 5),
            Text('Loan Type', style: commonTextStyle),
            CustomDropDown(
              hint: Text("Select Loan Type"),
              list: leadsController.loanSelectionOptions ,
              val: leadsController.RequiredSelectedLoan.value , 
              onChanged: (newValue) {
                leadsController.RequiredSelectedLoan.value = newValue; 
              },
            ),
            SizedBox(height: 5),
            Text('Loan Amount (Rs)', style: commonTextStyle),
            CustomTextFormField(
              hintText: 'Enter Loan Amount',
              textEditingController: leadsController.RequiredLoanamount ,
            ),
            SizedBox(height: 5),
            Text('Bank Name', style: commonTextStyle),
            CustomTextFormField(
              hintText: 'Enter Bank Name',
              textEditingController: leadsController.RequiredBankName ,
            ),
            SizedBox(height: 5),
            Text('Tenure', style: commonTextStyle),
            CustomTextFormField(
              hintText: 'Enter Tenure for required loan',
              textEditingController: leadsController.RequiredLoanTenure ,
            ),
            SizedBox(height: 10,) ,
            Text('Select EMI Type', style: commonTextStyle),
             CustomDropDown(
              hint: Text("Select EMI Type"),
              list: leadsController.emiTypeList,
              val: leadsController.RequiredEmiType.value, // Use .value if using Rx
              onChanged: (newValue) {
                leadsController.RequiredEmiType.value = newValue; // Update value
              },
            ),

            SizedBox(height: 5),
            Text('Interest Rate(%)', style: commonTextStyle),
            CustomTextFormField(
              hintText: 'Enter interest rate',
              textEditingController: leadsController.RequiredInterest ,
              textInputType: TextInputType.number,
            ),


            //existing Loan Details
            SizedBox(height: 20),
            Text('Existing Loan Details', style: Theme.of(context).textTheme.titleLarge),
            SizedBox(height: 5),
            Text('Loan Type', style: commonTextStyle),
            CustomDropDown(
              hint: Text("Select Loan Type"),
              list: leadsController.loanSelectionOptions ,
              val: leadsController.selectedLoan.value, 
              onChanged: (newValue) {
                leadsController.selectedLoan.value = newValue; 
              },
            ),
            SizedBox(height: 5),
            Text('Bank', style: commonTextStyle),

             CustomTextFormField(
              hintText: 'Enter Bank name',
              textEditingController: leadsController.bank ,
            ),

            SizedBox(height: 5),
            Text('EMI Type', style: commonTextStyle),
            CustomDropDown(
              hint: Text("Select EMI Type"),
              list: leadsController.emiTypeList,
              val: leadsController.emiType.value, // Use .value if using Rx
              onChanged: (newValue) {
                leadsController.emiType.value = newValue; // Update value
              },
            ),
            SizedBox(height: 5),
            Text('Loan Amount (Rs)', style: commonTextStyle),
            CustomTextFormField(
              hintText: 'Enter Loan Amount',
              textEditingController: leadsController.loanamount ,
            ),
            SizedBox(height: 5),
            Text('Tenure', style: commonTextStyle),
            CustomTextFormField(
              hintText: 'Enter tenure',
              textEditingController: leadsController.tenure,
            ),
            SizedBox(height: 5),
            Text('Tenure Left', style: commonTextStyle),
            CustomTextFormField(
              hintText: 'Enter tenure left',
              textEditingController: leadsController.tenureLeft,
            ),
            SizedBox(height: 5),
            Text('Interest Rate', style: commonTextStyle),
            CustomTextFormField(
              hintText: 'Enter interest rate',
              textEditingController: leadsController.interestRate,
            ),

           
          ],
        ),
      ),

    bottomNavigationBar: CommonPadding(
      child: PrimaryTextButton(
        text: 'Submit',
        voidCallback: (){

             _confirmSubmit() ;

        },

      ),
    ),


    );
  }

  // Widget _buildAddressSection(String title , ) {
  //   return Column(
  //     crossAxisAlignment: CrossAxisAlignment.start,
  //     children: [
  //       Text(title, style: Theme.of(context).textTheme.titleLarge),
  //       SizedBox(height: 5),
  //       Text('State', style: commonTextStyle),
  //       CustomTextFormField(hintText: 'Enter state', textEditingController: leadsController.state),
  //       SizedBox(height: 5),
  //       Text('City', style: commonTextStyle),
  //       CustomTextFormField(hintText: 'Enter city', textEditingController: leadsController.city),
  //       SizedBox(height: 5),
  //       Text('Pincode', style: commonTextStyle),
  //       CustomTextFormField(hintText: 'Enter pincode', textEditingController: leadsController.pincode),
  //     ],
  //   );
  // }

  Widget _buildTimePicker(String label, Rx<TimeOfDay> time) {
    return Obx(() => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(label, style: Theme.of(context).textTheme.bodyLarge),
            InkWell(
              onTap: () async {
                TimeOfDay? pickedTime = await showTimePicker(
                  context: context,
                  initialTime: time.value,
                );
                if (pickedTime != null) {
                  time.value = pickedTime;
                }
              },
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Text(
                  time.value.format(context),
                  style: commonTextStyle,
                ),
              ),
            ),
          ],
        ));
  }


  Widget _buildDatePicker(String label, Rx<DateTime> date) {
    return Obx(() => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(label, style: Theme.of(context).textTheme.bodyLarge),
            InkWell(
              onTap: () async {
                DateTime? pickedDate = await showDatePicker(
                  context: context,
                  initialDate: date.value,
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2101),
                );
              if (pickedDate != null) {
                // Format the date into dd:mm:yyyy
                date.value = pickedDate ;
              }
              },
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Text(
                    DateFormat('dd/MM/yyyy').format(date.value),
                  style: commonTextStyle,
                ),
              ),
            ),
          ],
        ));
  }

 
}



