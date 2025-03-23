// ignore_for_file: must_be_immutable
//flutter
import 'package:credit_app/controllers/personal_loan_controller.dart';
import 'package:credit_app/views/PersonalLoan/upload_document_plscreen.dart';
import 'package:credit_app/widget/appBarWidget.dart';
import 'package:credit_app/widget/common_padding.dart';
import 'package:credit_app/widget/custom_dropdown.dart';
import 'package:credit_app/widget/custom_textformfield.dart';
import 'package:credit_app/widget/primary_button.dart';
import 'package:flutter/material.dart';
//controllers
import 'package:credit_app/controllers/splashController.dart';
//models
import 'package:credit_app/widget/baseRoute.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
//packages
import 'package:get/get.dart';

class MoreEmployementDetailEntryPLScreen extends BaseRoute {
  MoreEmployementDetailEntryPLScreen({a, o}) : super(a: a, o: o, r: 'MoreEmployementDetailEntryPLScreen');

  final SplashController customerController = Get.put(SplashController());
  PersonalLoanController personalLoanController = Get.find<PersonalLoanController>();
  int gender = 1;
  int maritalStatus = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: Padding(
          padding: EdgeInsets.only(bottom: 0),
          child: CommonPadding(
            child: PrimaryTextButton(
              text: 'Next',
              voidCallback: () {
                Get.to(() => UploadDocumentPLScreen(
                      a: a,
                      o: o,
                    ));
              },
            ),
          ),
        ),
        appBar: MyCustomAppBar(
            height: 80,
            appbarPadding: 0,
            title: Text('More Employement Detail'),
            centerTitle: true,
            leading: IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: Icon(Icons.arrow_back_ios))),
        body: CommonPadding(
          child: SingleChildScrollView(child: GetBuilder<PersonalLoanController>(builder: (controller) {
            return Column(
              children: [
                personalLoanController.employementVal == 'Salaried'
                    ? Column(
                        children: [
                          Container(
                            width: Get.width,
                            child: Padding(
                              padding: EdgeInsets.only(top: 15),
                              child: Text(
                                'Company Name',
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 8),
                            child: CustomTextFormField(
                              hintText: "Type here",
                              obscureText: false,
                            ),
                          ),
                          Container(
                            width: Get.width,
                            child: Padding(
                              padding: EdgeInsets.only(top: 15),
                              child: Text(
                                'Address',
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 8),
                            child: CustomTextFormField(
                              hintText: "Type here",
                              obscureText: false,
                            ),
                          ),
                          Container(
                            width: Get.width,
                            child: Padding(
                              padding: EdgeInsets.only(top: 15),
                              child: Text(
                                'Designation',
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 8),
                            child: CustomTextFormField(
                              hintText: "Type here",
                              obscureText: false,
                            ),
                          ),
                          Container(
                            width: Get.width,
                            child: Padding(
                              padding: EdgeInsets.only(top: 15),
                              child: Text(
                                'Work Type',
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                            ),
                          ),
                          Padding(
                              padding: EdgeInsets.only(top: 8),
                              child: CustomDropDown(
                                list: personalLoanController.workTypeList,
                                hint: Text(
                                  "Choose here",
                                  style: Theme.of(context).inputDecorationTheme.hintStyle,
                                ),
                                val: personalLoanController.workTypeVal,
                                onChanged: (selectedValue) {
                                  personalLoanController.workTypeVal = selectedValue.toString();
                                },
                              )),
                          Container(
                            width: Get.width,
                            child: Padding(
                              padding: EdgeInsets.only(top: 15),
                              child: Text(
                                'Tenure (Months)',
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 8),
                            child: CustomTextFormField(
                              hintText: "Type here",
                              obscureText: false,
                              textInputType: TextInputType.numberWithOptions(signed: true, decimal: true),
                            ),
                          ),
                          Container(
                            width: Get.width,
                            child: Padding(
                              padding: EdgeInsets.only(top: 15),
                              child: Text(
                                'Company Category',
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                            ),
                          ),
                          Padding(
                              padding: EdgeInsets.only(top: 8),
                              child: CustomDropDown(
                                hint: Text(
                                  "Choose here",
                                  style: Theme.of(context).inputDecorationTheme.hintStyle,
                                ),
                                list: personalLoanController.companyCategoryList,
                                val: personalLoanController.companyCategoryVal,
                                onChanged: (selectedValue) {
                                  personalLoanController.companyCategoryVal = selectedValue.toString();
                                },
                              )),
                          Container(
                            width: Get.width,
                            child: Padding(
                              padding: EdgeInsets.only(top: 15),
                              child: Text(
                                'Landline Number',
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 8),
                            child: CustomTextFormField(
                              hintText: "Type here",
                              obscureText: false,
                            ),
                          ),
                          Container(
                            width: Get.width,
                            child: Padding(
                              padding: EdgeInsets.only(top: 15),
                              child: Text(
                                'Experience in profession/Current company experience',
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 8),
                            child: CustomTextFormField(
                              hintText: "Type here",
                              obscureText: false,
                              textInputType: TextInputType.numberWithOptions(signed: true, decimal: true),
                            ),
                          ),
                          Container(
                            width: Get.width,
                            child: Padding(
                              padding: EdgeInsets.only(top: 15),
                              child: Text(
                                'Gross & Annual Income',
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 8),
                            child: CustomTextFormField(
                              prefixIcon: Icon(
                                FontAwesomeIcons.rupeeSign,
                                color: Theme.of(context).primaryColor,
                                size: 15,
                              ),
                              hintText: "Type here",
                              obscureText: false,
                            ),
                          ),
                        ],
                      )
                    : Column(
                        children: [
                          Container(
                            width: Get.width,
                            child: Padding(
                              padding: EdgeInsets.only(top: 15),
                              child: Text(
                                'Profession Business/Professional',
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 8),
                            child: CustomTextFormField(
                              hintText: "Choose here",
                              obscureText: false,
                              readOnly: true,
                            ),
                          ),
                          Container(
                            width: Get.width,
                            child: Padding(
                              padding: EdgeInsets.only(top: 15),
                              child: Text(
                                'Company Name',
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 8),
                            child: CustomTextFormField(
                              hintText: "Type here",
                              obscureText: false,
                            ),
                          ),
                          Container(
                            width: Get.width,
                            child: Padding(
                              padding: EdgeInsets.only(top: 15),
                              child: Text(
                                'Company State',
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 8),
                            child: CustomTextFormField(
                              hintText: "Choose here",
                              obscureText: false,
                              readOnly: true,
                            ),
                          ),
                          Container(
                            width: Get.width,
                            child: Padding(
                              padding: EdgeInsets.only(top: 15),
                              child: Text(
                                'Company Address',
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 8),
                            child: CustomTextFormField(
                              hintText: "Type here",
                              obscureText: false,
                            ),
                          ),
                          Container(
                            width: Get.width,
                            child: Padding(
                              padding: EdgeInsets.only(top: 15),
                              child: Text(
                                'Company City',
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 8),
                            child: CustomTextFormField(
                              hintText: "Type here",
                              obscureText: false,
                            ),
                          ),
                          Container(
                            width: Get.width,
                            child: Padding(
                              padding: EdgeInsets.only(top: 15),
                              child: Text(
                                'Experience in Profession/Current company experience',
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 8),
                            child: CustomTextFormField(
                              hintText: "Type here",
                              obscureText: false,
                              textInputType: TextInputType.numberWithOptions(signed: true, decimal: true),
                            ),
                          ),
                          Container(
                            width: Get.width,
                            child: Padding(
                              padding: EdgeInsets.only(top: 15),
                              child: Text(
                                'Gross & Annual Income',
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 8),
                            child: CustomTextFormField(
                              prefixIcon: Icon(
                                FontAwesomeIcons.rupeeSign,
                                color: Theme.of(context).primaryColor,
                                size: 15,
                              ),
                              hintText: "Type here",
                              obscureText: false,
                            ),
                          ),
                        ],
                      )
              ],
            );
          })),
        ));
  }
}
