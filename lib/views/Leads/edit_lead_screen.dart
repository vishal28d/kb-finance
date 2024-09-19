
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:credit_app/controllers/edit_lead_controller.dart';
import 'package:credit_app/controllers/lead_controller.dart';
import 'package:credit_app/services/fetchDbData.dart';
import 'package:credit_app/widget/appBarWidget.dart';
import 'package:credit_app/widget/baseRoute.dart';
import 'package:credit_app/widget/common_padding.dart';
import 'package:credit_app/widget/custom_dropdown.dart';
import 'package:credit_app/widget/custom_textformfield.dart';
import 'package:credit_app/widget/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';


// ignore: must_be_immutable
class EditLeadScreen extends BaseRoute {
  //a - analytics
  //o - observer
  EditLeadScreen({a, o , required this.documentId}) : super(a: a, o: o, r: 'EditLeadScreen');

   final EditLeadController leadsController = Get.find<EditLeadController>();
  // Firebase Instance 
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    
      var documentId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyCustomAppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            Icons.arrow_back_ios,
            size: 20,
          ),
        ),
        height: 80,
        appbarPadding: 0,
        title: Text('Edit Lead'),
        centerTitle: true,
      ),
      body: GetBuilder<EditLeadController>(
          builder: (_) => (CommonPadding(
                  child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(bottom: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: 15),
                            child: Text(
                              'Name',
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 8),
                            child: CustomTextFormField(
                              hintText: "Enter your full name",
                              textEditingController: leadsController.fullname,
                              obscureText: false,
                              key: key,
                              textInputType: TextInputType.text,
                              onEditingComplete: () {
                                FocusScope.of(context).requestFocus(
                                  leadsController.mobileno as FocusNode?,
                                );
                              },
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 15),
                            child: Text(
                              'Phone No',
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 8),
                            child: CustomTextFormField(
                              hintText: "Change mobile no",
                              textEditingController: leadsController.mobileno,
                              focusnode: leadsController.fmobileno,
                              obscureText: false,
                              key: key,
                              textInputType: TextInputType.numberWithOptions(signed: true, decimal: true),
                              onEditingComplete: () {
                                FocusScope.of(context).requestFocus(
                                  leadsController.femail,
                                );
                              },
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 15),
                            child: Text(
                              'Email Id',
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 8),
                            child: CustomTextFormField(
                              hintText: "Change email address",
                              textEditingController: leadsController.email,
                              focusnode: leadsController.femail,
                              obscureText: false,
                              key: key,
                              textInputType: TextInputType.text,
                              onEditingComplete: () {
                                FocusScope.of(context).requestFocus(
                                  leadsController.floanamount,
                                );
                              },
                            ),
                          ),


                           Padding(
                            padding: EdgeInsets.only(top: 15),
                            child: Text(
                              'Follow Up',
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                          ),
                          Padding(
                              padding: const EdgeInsets.only(top: 8),
                                child: Obx(() => InkWell(
                                  onTap: () async {
                                    DateTime? pickedDate = await showDatePicker(
                                        context: context,
                                        initialDate: leadsController.pickedDate.value ,
                                        firstDate: DateTime(2000),
                                        lastDate: DateTime(2101),
                                      );
                                      if (pickedDate != null) {
                                        leadsController.pickedDate.value= pickedDate; 
                                      }
                                    },
                                    child: Container(
                                      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                                      decoration: BoxDecoration(
                                        border: Border.all(color: Colors.grey),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Text(
                                        DateFormat('dd/MM/yyyy').format(leadsController.pickedDate.value),
                                        style: TextStyle(color: Colors.black),
                                      ),
                                    ),
                                  )),
                                ),


                          Padding(
                            padding: EdgeInsets.only(top: 15),
                            child: Text(
                              'Employment Type',
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                          ),
                          Padding(
                              padding: EdgeInsets.only(top: 8),
                              child: CustomDropDown(
                                hint: Text(
                                  "Select employment",
                                  style: Theme.of(context).inputDecorationTheme.hintStyle,
                                ),
                                list: leadsController.employmenttypelist,
                                val: leadsController.employmenttypeVal,
                                onChanged: (selectedValue) {
                                  leadsController.employmenttypeVal = selectedValue.toString();
                                },
                              )),
                          Padding(
                            padding: EdgeInsets.only(top: 15),
                            child: Text(
                              'Loan Type',
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                          ),
                          Padding(
                              padding: EdgeInsets.only(top: 8),
                              child: CustomDropDown(
                                hint: Text(
                                  "Select loan type",
                                  style: Theme.of(context).inputDecorationTheme.hintStyle,
                                ),
                                list: leadsController.loantypelist,
                                val: leadsController.loantypelistVal,
                                onChanged: (selectedValue) {
                                  leadsController.loantypelistVal = selectedValue.toString();
                                },
                              )),
                          Padding(
                            padding: EdgeInsets.only(top: 15),
                            child: Text(
                              'Loan Amount',
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 8),
                            child: CustomTextFormField(
                              prefixIcon: Icon(
                                FontAwesomeIcons.rupeeSign,
                                size: 15,
                                color: Theme.of(context).primaryColor,
                              ),
                              hintText: "Enter loan amount",
                              textEditingController: leadsController.loanamount,
                              focusnode: leadsController.floanamount,
                              obscureText: false,
                              key: key,
                              textInputType: TextInputType.numberWithOptions(signed: true, decimal: true),
                              onEditingComplete: () {
                                FocusScope.of(context).requestFocus(
                                  leadsController.faadharno,
                                );
                              },
                            ),
                          ),

                          // Padding(
                          //   padding: EdgeInsets.only(top: 15),
                          //   child: Text(
                          //     'Aadhar Card No',
                          //     style: Theme.of(context).textTheme.bodyLarge,
                          //   ),
                          // ),
                          // Padding(
                          //   padding: EdgeInsets.only(top: 8),
                          //   child: CustomTextFormField(
                          //     hintText: "Enter your aadhar no",
                          //     textEditingController: leadsController.aadharno,
                          //     focusnode: leadsController.faadharno,
                          //     obscureText: false,
                          //     key: key,
                          //     textInputType: TextInputType.numberWithOptions(signed: true, decimal: true),
                          //     onEditingComplete: () {
                          //       FocusScope.of(context).requestFocus(
                          //         leadsController.fpanno,
                          //       );
                          //     },
                          //   ),
                          // ),

                          // Padding(
                          //   padding: EdgeInsets.only(top: 15),
                          //   child: Text(
                          //     'PAN Card No',
                          //     style: Theme.of(context).textTheme.bodyLarge,
                          //   ),
                          // ),
                          // Padding(
                          //   padding: EdgeInsets.only(top: 8),
                          //   child: CustomTextFormField(
                          //     hintText: "Enter your PAN No",
                          //     textEditingController: leadsController.panno,
                          //     focusnode: leadsController.fpanno,
                          //     obscureText: false,
                          //     key: key,
                          //     textInputType: TextInputType.text,
                          //     onEditingComplete: () {
                          //       FocusScope.of(context).requestFocus(
                          //         leadsController.flocation,
                          //       );
                          //     },
                          //   ),
                          // ),

                          Padding(
                            padding: EdgeInsets.only(top: 15),
                            child: Text(
                              'Address',
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 8),
                            child: CustomTextFormField(
                              hintText: "Enter your address",
                              textEditingController: leadsController.location,
                              focusnode: leadsController.flocation,
                              obscureText: false,
                              key: key,
                              textInputType: TextInputType.text,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )))),


 bottomNavigationBar: CommonPadding(
  child: PrimaryTextButton(
    text: "Submit",
    voidCallback: () async {
      if (leadsController.validateForm()) {
        // Show the confirmation dialog
        Get.defaultDialog(
          title: "Confirmation",
          middleText: "Do you really want to update the data? This will override the previous data.",
          textCancel: "Cancel",
          textConfirm: "Confirm",
          confirmTextColor: Colors.white,
          buttonColor: Colors.red[400],
          onConfirm: () async {
            var leadDetails = leadsController.getLeadDetails();

            try {
              await firestore.collection('leadDetails').doc(documentId).update({
                'details': leadDetails,
                'createdAt': FieldValue.serverTimestamp(),
              });

              // Dismiss the dialog and show success message
              Get.back();
              Get.snackbar(
                "Success",
                "Lead updated successfully",
                snackPosition: SnackPosition.TOP,
                backgroundColor: Colors.green[400],
                duration: Duration(seconds: 2),
              );
            } catch (e) {
              // Dismiss the dialog and show error message
              Get.back();
              Get.snackbar(
                "Error",
                "Failed to update lead: $e",
                snackPosition: SnackPosition.TOP,
                backgroundColor: Colors.red[400],
                duration: Duration(seconds: 2),
              );
            }
          },
          onCancel: () {
            Get.back();
          },
        );
      }
    },
  ),
),


    );
  }
}
