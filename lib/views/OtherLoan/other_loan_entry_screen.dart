// ignore_for_file: must_be_immutable
//flutter
import 'package:credit_app/controllers/other_loan_controller.dart';
import 'package:credit_app/views/bottom_navigation_screen.dart';
import 'package:credit_app/widget/appBarWidget.dart';
import 'package:credit_app/widget/common_padding.dart';
import 'package:credit_app/widget/custom_dropdown.dart';
import 'package:credit_app/widget/custom_textformfield.dart';
import 'package:credit_app/widget/primary_button.dart';
import 'package:date_format/date_format.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
//models
import 'package:credit_app/widget/baseRoute.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class OtherLoanEntryScreen extends BaseRoute {
  OtherLoanEntryScreen({a, o}) : super(a: a, o: o, r: 'OtherLoanEntryScreen');
  DateTime? selectedBirthDate;
  TextEditingController cBirthDate = new TextEditingController();
  final OtherLoanController otherLoanController = Get.find<OtherLoanController>();

  Future _selectBirthdate(context) async {
    try {
      final DateTime? picked = await showDatePicker(
        lastDate: DateTime(2050),
        context: context,
        initialDate: selectedBirthDate != null ? selectedBirthDate! : DateTime.now(),
        firstDate: DateTime(1940),
      );
      if (picked != null && picked != DateTime(2000)) {
        selectedBirthDate = picked;
        cBirthDate.text = formatDate(selectedBirthDate!, [dd, '-', mm, '-', yyyy]);
      }
    } catch (e) {
      print('Exception - addCoupon - _selectBirthdate(): ' + e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: MyCustomAppBar(
          height: 80,
          appbarPadding: 0,
          leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Icon(Icons.arrow_back_ios)),
          title: Text('Other Loan'),
          centerTitle: true,
        ),
        bottomNavigationBar: CommonPadding(
          child: PrimaryTextButton(
            text: 'Submit',
            voidCallback: () {
              Get.to(() => BottomNavigationScreen(
                    a: a,
                    o: o,
                  ));
            },
          ),
        ),
        body: CommonPadding(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  width: Get.width,
                  child: Padding(
                    padding: EdgeInsets.only(top: 15),
                    child: Text(
                      'Full Name',
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
                      'Birth Date',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 8),
                  child: CustomTextFormField(
                    hintText: "Choose here",
                    textEditingController: cBirthDate,
                    obscureText: false,
                    readOnly: true,
                    onTap: () {
                      _selectBirthdate(context);
                    },
                  ),
                ),
                Container(
                  width: Get.width,
                  child: Padding(
                    padding: EdgeInsets.only(top: 15),
                    child: Text(
                      'PAN Card',
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
                      'Phone Number',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 8),
                  child: CustomTextFormField(
                    hintText: "Type here",
                    obscureText: false,
                    textInputType: TextInputType.numberWithOptions(decimal: true, signed: true),
                  ),
                ),
                Container(
                  width: Get.width,
                  child: Padding(
                    padding: EdgeInsets.only(top: 15),
                    child: Text(
                      'Email Id',
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
                      'Communication Address',
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
                      'Work Detail',
                      style: Theme.of(context).primaryTextTheme.displayLarge,
                    ),
                  ),
                ),
                Container(
                  width: Get.width,
                  child: Padding(
                    padding: EdgeInsets.only(top: 30),
                    child: Text(
                      'Employement Type',
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
                      list: otherLoanController.employementTypeList,
                      val: otherLoanController.employemenTypeVal,
                      onChanged: (selectedValue) {
                        otherLoanController.setEmployementType(selectedValue.toString());
                      },
                    )),
                Container(
                  width: Get.width,
                  child: Padding(
                    padding: EdgeInsets.only(top: 15),
                    child: Text(
                      'Your Monthly Income',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
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
                    hintText: "Type here",
                    obscureText: false,
                  ),
                ),
                GetBuilder<OtherLoanController>(builder: (controler) {
                  return otherLoanController.employemenTypeVal == 'Salaried'
                      ? Column(
                          children: [
                            Container(
                              width: Get.width,
                              child: Padding(
                                padding: EdgeInsets.only(top: 15),
                                child: Text(
                                  'Service Type',
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
                                  list: otherLoanController.serviceList,
                                  val: otherLoanController.serviceTypeVal,
                                  onChanged: (selectedValue) {
                                    otherLoanController.setServiceType(selectedValue.toString());
                                  },
                                )),
                            Container(
                              width: Get.width,
                              child: Padding(
                                padding: EdgeInsets.only(top: 15),
                                child: Text(
                                  'Nature of Employement',
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
                                  list: otherLoanController.employeNatureList,
                                  val: otherLoanController.employeNatureVal,
                                  onChanged: (selectedValue) {
                                    otherLoanController.setEmployeNature(selectedValue.toString());
                                  },
                                )),
                          ],
                        )
                      : SizedBox();
                }),
                GetBuilder<OtherLoanController>(builder: (controller) {
                  return otherLoanController.employemenTypeVal == 'Self-employed'
                      ? Column(
                          children: [
                            Container(
                              width: Get.width,
                              child: Padding(
                                padding: EdgeInsets.only(top: 15),
                                child: Text(
                                  'Industry',
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
                          ],
                        )
                      : SizedBox();
                }),
                GetBuilder<OtherLoanController>(builder: (controller) {
                  return Padding(
                    padding: EdgeInsets.only(top: 15),
                    child: otherLoanController.employemenTypeVal == 'Self-employed' || otherLoanController.employemenTypeVal == 'Salaried'
                        ? DottedBorder(
                            strokeWidth: 1,
                            color: Colors.black,
                            child: Padding(
                              padding: EdgeInsets.all(08),
                              child: Column(
                                children: [
                                  Container(
                                    width: Get.width,
                                    child: Text('Work Address', style: Theme.of(context).primaryTextTheme.displayLarge),
                                  ),
                                  Container(
                                    width: Get.width,
                                    child: Padding(
                                      padding: EdgeInsets.only(top: 15),
                                      child: Text(
                                        'Address Line 1',
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
                                        'Address Line 2',
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
                                        'Area',
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
                                        'Pin Code',
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
                                        'City',
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
                                        'State',
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
                                ],
                              ),
                            ))
                        : SizedBox(),
                  );
                })
              ],
            ),
          ),
        ));
  }
}
