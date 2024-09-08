//flutter
// ignore_for_file: unused_field, must_be_immutable

import 'package:credit_app/controllers/home_loan_controller.dart';
import 'package:credit_app/controllers/personal_loan_controller.dart';
import 'package:credit_app/views/HomeLoan/upload_document_hlscreen.dart';
import 'package:credit_app/views/HomeLoan/upload_document_transfer_hlscreen.dart';
import 'package:credit_app/widget/appBarWidget.dart';
import 'package:credit_app/widget/common_padding.dart';
import 'package:credit_app/widget/custom_dropdown.dart';
import 'package:credit_app/widget/custom_textformfield.dart';
import 'package:credit_app/widget/next_and_back_button.dart';
import 'package:date_format/date_format.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
//controllers
import 'package:credit_app/controllers/splashController.dart';
//models
import 'package:credit_app/widget/baseRoute.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
//packages
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:page_view_indicators/linear_progress_page_indicator.dart';

class BasicDetailEntryHLScreen extends BaseRoute {
  BasicDetailEntryHLScreen({a, o}) : super(a: a, o: o, r: 'BasicDetailEntryHLScreen');

  final SplashController customerController = Get.put(SplashController());
  final PersonalLoanController personalLoanController = Get.find<PersonalLoanController>();
  final HomeLoanController homeLoanController = Get.find<HomeLoanController>();

  final _pageController = PageController();
  DateTime? _selectedBirthdate;
  DateTime? _selectedBirthdateOfCoApplicant;
  DateTime? _selectedApproxeDateOfLoan;
  final _currentPageNotifier = ValueNotifier<int>(0);
  TextEditingController cBirthdate = new TextEditingController();
  TextEditingController cBirthdateOfCoApplicant = new TextEditingController();
  TextEditingController cApproxeDateOfLoan = new TextEditingController();

  List<String> titles = ['Property Detail', 'Profile Detail', 'Permanent Address', 'Work Detail', 'Questionarie', 'Pan Detail'];

  @override
  Widget build(BuildContext context) {
    Future _selectBirthdate() async {
      try {
        final DateTime? picked = await showDatePicker(
          lastDate: DateTime(2050),
          context: context,
          initialDate: _selectedBirthdate != null ? _selectedBirthdate! : DateTime.now(),
          firstDate: DateTime(1940),
        );
        if (picked != null && picked != DateTime(2000)) {
          _selectedBirthdate = picked;
          cBirthdate.text = formatDate(_selectedBirthdate!, [dd, '-', mm, '-', yyyy]);
        }
      } catch (e) {
        print('Exception - addCoupon - _selectBirthdate(): ' + e.toString());
      }
    }

    Future _selectApproxeDateOfLoan() async {
      try {
        final DateTime? picked = await showDatePicker(
          lastDate: DateTime(2050),
          context: context,
          initialDate: _selectedApproxeDateOfLoan != null ? _selectedApproxeDateOfLoan! : DateTime.now(),
          firstDate: DateTime(1940),
        );
        if (picked != null && picked != DateTime(2000)) {
          _selectedApproxeDateOfLoan = picked;
          cApproxeDateOfLoan.text = formatDate(_selectedApproxeDateOfLoan!, [dd, '-', mm, '-', yyyy]);
        }
      } catch (e) {
        print('Exception - addCoupon - _selectBirthdate(): ' + e.toString());
      }
    }

    Future _selectBirthdateOfCoApplicant() async {
      try {
        final DateTime? picked = await showDatePicker(
          lastDate: DateTime(2050),
          context: context,
          initialDate: _selectedBirthdate != null ? _selectedBirthdate! : DateTime.now(),
          firstDate: DateTime(1940),
        );
        if (picked != null && picked != DateTime(2000)) {
          _selectedBirthdateOfCoApplicant = picked;
          cBirthdateOfCoApplicant.text = formatDate(_selectedBirthdate!, [dd, '-', mm, '-', yyyy]);
        }
      } catch (e) {
        print('Exception - addCoupon - _selectBirthdate(): ' + e.toString());
      }
    }

    final _items = [
      homeLoanController.loanType == 1
          ? SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    width: Get.width,
                    child: Padding(
                      padding: EdgeInsets.only(top: 15),
                      child: Text(
                        'City of Property',
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
                        'Property Type',
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
                        list: homeLoanController.propetyTypeList,
                        val: homeLoanController.propertyTypeVal,
                        onChanged: (selectedValue) {
                          homeLoanController.setPropertyType(selectedValue.toString());
                        },
                      )),
                  Container(
                    width: Get.width,
                    child: Padding(
                      padding: EdgeInsets.only(top: 15),
                      child: Text(
                        'Property Purchase Value',
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 8),
                    child: CustomTextFormField(
                      hintText: "Type here",
                      prefixIcon: Icon(
                        FontAwesomeIcons.rupeeSign,
                        color: Theme.of(context).primaryColor,
                        size: 15,
                      ),
                      obscureText: false,
                    ),
                  ),
                  Container(
                    width: Get.width,
                    child: Padding(
                      padding: EdgeInsets.only(top: 15),
                      child: Text(
                        'Loan Amount Required',
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 8),
                    child: CustomTextFormField(
                      hintText: "Type here",
                      prefixIcon: Icon(
                        FontAwesomeIcons.rupeeSign,
                        color: Theme.of(context).primaryColor,
                        size: 15,
                      ),
                      obscureText: false,
                    ),
                  ),
                ],
              ),
            )
          : SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    width: Get.width,
                    child: Padding(
                      padding: EdgeInsets.only(top: 15),
                      child: Text(
                        'City of Property',
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
                        'Property Type',
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
                        list: homeLoanController.propetyTypeList,
                        val: homeLoanController.propertyTypeVal,
                        onChanged: (selectedValue) {
                          homeLoanController.setPropertyType(selectedValue.toString());
                        },
                      )),
                  Container(
                    width: Get.width,
                    child: Padding(
                      padding: EdgeInsets.only(top: 15),
                      child: Text(
                        'Loan amount taken in existing loan',
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 8),
                    child: CustomTextFormField(
                      hintText: "Type here",
                      prefixIcon: Icon(
                        FontAwesomeIcons.rupeeSign,
                        color: Theme.of(context).primaryColor,
                        size: 15,
                      ),
                      obscureText: false,
                    ),
                  ),
                  Container(
                    width: Get.width,
                    child: Padding(
                      padding: EdgeInsets.only(top: 15),
                      child: Text(
                        'Approxe date of loan taken',
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 8),
                    child: CustomTextFormField(
                      hintText: "Choose here",
                      textEditingController: cApproxeDateOfLoan,
                      obscureText: false,
                      onTap: () {
                        _selectApproxeDateOfLoan();
                      },
                      readOnly: true,
                    ),
                  ),
                  Container(
                    width: Get.width,
                    child: Padding(
                      padding: EdgeInsets.only(top: 15),
                      child: Text(
                        'Approxe current EMI',
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
                        'Bank Name',
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
                        'Top up loan required?',
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 8),
                    child: GetBuilder<HomeLoanController>(builder: (controler) {
                      return Row(
                        children: [
                          Row(
                            children: [
                              Radio(
                                  value: 1,
                                  groupValue: homeLoanController.isTopUpLoanRequired,
                                  onChanged: (val) {
                                    homeLoanController.setTopUpLoanRequired(val!);
                                  }),
                              Text(
                                'Yes',
                                style: Theme.of(context).primaryTextTheme.displaySmall,
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Radio(
                                  value: 2,
                                  groupValue: homeLoanController.isTopUpLoanRequired,
                                  onChanged: (val) {
                                    homeLoanController.setTopUpLoanRequired(val!);
                                  }),
                              Text('No', style: Theme.of(context).primaryTextTheme.displaySmall)
                            ],
                          ),
                        ],
                      );
                    }),
                  ),
                  GetBuilder<HomeLoanController>(builder: (controller) {
                    return homeLoanController.isTopUpLoanRequired == 1
                        ? Column(
                            children: [
                              Container(
                                width: Get.width,
                                child: Padding(
                                  padding: EdgeInsets.only(top: 15),
                                  child: Text(
                                    'Top up amount required',
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
                                    textInputType: TextInputType.numberWithOptions(decimal: true, signed: true)),
                              ),
                            ],
                          )
                        : SizedBox();
                  })
                ],
              ),
            ),
      SingleChildScrollView(
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
                  'Date of birth',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 8),
              child: CustomTextFormField(
                hintText: "Select birthdate",
                textEditingController: cBirthdate,
                obscureText: false,
                textInputType: TextInputType.number,
                readOnly: true,
                onTap: () {
                  _selectBirthdate();
                },
              ),
            ),
            Container(
              width: Get.width,
              child: Padding(
                padding: EdgeInsets.only(top: 15),
                child: Text(
                  'Marital Status',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 8),
              child: GetBuilder<HomeLoanController>(builder: (controler) {
                return Row(
                  children: [
                    Row(
                      children: [
                        Radio(
                            value: 1,
                            groupValue: homeLoanController.maritalStatus,
                            onChanged: (val) {
                              homeLoanController.setMaritalStatus(val!);
                            }),
                        Text(
                          'Married',
                          style: Theme.of(context).primaryTextTheme.displaySmall,
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Radio(
                            value: 2,
                            groupValue: homeLoanController.maritalStatus,
                            onChanged: (val) {
                              homeLoanController.setMaritalStatus(val!);
                            }),
                        Text('Single', style: Theme.of(context).primaryTextTheme.displaySmall)
                      ],
                    ),
                    Row(
                      children: [
                        Radio(
                            value: 3,
                            groupValue: homeLoanController.maritalStatus,
                            onChanged: (val) {
                              homeLoanController.setMaritalStatus(val!);
                            }),
                        Text(
                          'Other',
                          style: Theme.of(context).primaryTextTheme.displaySmall,
                        )
                      ],
                    ),
                  ],
                );
              }),
            ),
            Container(
              width: Get.width,
              child: Padding(
                padding: EdgeInsets.only(top: 15),
                child: Text(
                  'Is there a Co-applicant?',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 8),
              child: GetBuilder<HomeLoanController>(builder: (controler) {
                return Row(
                  children: [
                    Row(
                      children: [
                        Radio(
                            value: 1,
                            groupValue: homeLoanController.isCoApplicant,
                            onChanged: (val) {
                              homeLoanController.setCoApplicant(val!);
                            }),
                        Text(
                          'Yes',
                          style: Theme.of(context).primaryTextTheme.displaySmall,
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Radio(
                            value: 2,
                            groupValue: homeLoanController.isCoApplicant,
                            onChanged: (val) {
                              homeLoanController.setCoApplicant(val!);
                            }),
                        Text('No', style: Theme.of(context).primaryTextTheme.displaySmall)
                      ],
                    ),
                  ],
                );
              }),
            ),
            GetBuilder<HomeLoanController>(builder: (controller) {
              return homeLoanController.isCoApplicant == 1
                  ? Column(
                      children: [
                        Container(
                          width: Get.width,
                          child: Padding(
                            padding: EdgeInsets.only(top: 15),
                            child: Text(
                              'Co-applicant Name',
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
                              'Co-applicant Date of Birth',
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 8),
                          child: CustomTextFormField(
                            hintText: "Choose here",
                            textEditingController: cBirthdateOfCoApplicant,
                            obscureText: false,
                            readOnly: true,
                            onTap: () {
                              _selectBirthdateOfCoApplicant();
                            },
                          ),
                        ),
                        Container(
                          width: Get.width,
                          child: Padding(
                            padding: EdgeInsets.only(top: 15),
                            child: Text(
                              'Co-applicant Marital Status',
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 8),
                          child: GetBuilder<HomeLoanController>(builder: (controler) {
                            return Row(
                              children: [
                                Row(
                                  children: [
                                    Radio(
                                        value: 1,
                                        groupValue: homeLoanController.coApplicantMaritalStatus,
                                        onChanged: (val) {
                                          homeLoanController.setCoApplicantMaritalStatus(val!);
                                        }),
                                    Text(
                                      'Married',
                                      style: Theme.of(context).primaryTextTheme.displaySmall,
                                    )
                                  ],
                                ),
                                Row(
                                  children: [
                                    Radio(
                                        value: 2,
                                        groupValue: homeLoanController.coApplicantMaritalStatus,
                                        onChanged: (val) {
                                          homeLoanController.setCoApplicantMaritalStatus(val!);
                                        }),
                                    Text('Single', style: Theme.of(context).primaryTextTheme.displaySmall)
                                  ],
                                ),
                                Row(
                                  children: [
                                    Radio(
                                        value: 3,
                                        groupValue: homeLoanController.coApplicantMaritalStatus,
                                        onChanged: (val) {
                                          homeLoanController.setCoApplicantMaritalStatus(val!);
                                        }),
                                    Text(
                                      'Other',
                                      style: Theme.of(context).primaryTextTheme.displaySmall,
                                    )
                                  ],
                                ),
                              ],
                            );
                          }),
                        ),
                        Container(
                          width: Get.width,
                          child: Padding(
                            padding: EdgeInsets.only(top: 15),
                            child: Text(
                              'Relation with Co-applicant',
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
                              list: homeLoanController.relationList,
                              val: homeLoanController.relationVal,
                              onChanged: (selectedValue) {
                                homeLoanController.setRelation(selectedValue.toString());
                              },
                            )),
                      ],
                    )
                  : SizedBox();
            })
          ],
        ),
      ),
      SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: Get.width,
              child: Padding(
                padding: EdgeInsets.only(top: 15),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Icon(
                        MdiIcons.mapMarkerRadius,
                        size: 36,
                      ),
                    ),
                    Text(
                      'Enter your address',
                      style: Theme.of(context).primaryTextTheme.headlineMedium,
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 15),
              child: Container(
                  height: 60,
                  width: Get.width,
                  decoration: BoxDecoration(color: Color(0xFFF4F5F7), borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 15, top: 5, bottom: 5),
                        child: Icon(MdiIcons.information),
                      ),
                      Container(
                        width: Get.width - 60,
                        child: Padding(
                          padding: EdgeInsets.only(left: 15, right: 10, top: 5),
                          child: Text(
                            'Important documents like loan agreements, no dues certificate will be sent to this address',
                            style: Theme.of(context).primaryTextTheme.displaySmall,
                          ),
                        ),
                      )
                    ],
                  )),
            ),
            Container(
              width: Get.width,
              child: Padding(
                padding: EdgeInsets.only(top: 30),
                child: Text(
                  'House',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 8),
              child: CustomTextFormField(
                hintText: "Type here",
                textEditingController: cBirthdate,
                obscureText: false,
              ),
            ),
            Container(
              width: Get.width,
              child: Padding(
                padding: EdgeInsets.only(top: 15),
                child: Text(
                  'Street',
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
                  'Locality',
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
                  'State',
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
                  'Is Correspondence address same as Permanent address?',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 8),
              child: GetBuilder<HomeLoanController>(builder: (controler) {
                return Row(
                  children: [
                    Row(
                      children: [
                        Radio(
                            value: 1,
                            groupValue: homeLoanController.isCorrespondingAddressSame,
                            onChanged: (val) {
                              homeLoanController.setCorrespondingAddress(val!);
                            }),
                        Text(
                          'Yes',
                          style: Theme.of(context).primaryTextTheme.displaySmall,
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Radio(
                            value: 2,
                            groupValue: homeLoanController.isCorrespondingAddressSame,
                            onChanged: (val) {
                              homeLoanController.setCorrespondingAddress(val!);
                            }),
                        Text('No', style: Theme.of(context).primaryTextTheme.displaySmall)
                      ],
                    ),
                  ],
                );
              }),
            ),
            GetBuilder<HomeLoanController>(builder: (controller) {
              return homeLoanController.isCorrespondingAddressSame == 2
                  ? Column(
                      children: [
                        Container(
                          width: Get.width,
                          child: Padding(
                            padding: EdgeInsets.only(top: 30),
                            child: Text(
                              'House',
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 8),
                          child: CustomTextFormField(
                            hintText: "Type here",
                            textEditingController: cBirthdate,
                            obscureText: false,
                          ),
                        ),
                        Container(
                          width: Get.width,
                          child: Padding(
                            padding: EdgeInsets.only(top: 15),
                            child: Text(
                              'Street',
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
                              'Locality',
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
                              'State',
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
            })
          ],
        ),
      ),
      SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 15),
              width: Get.width,
              decoration: BoxDecoration(color: Color(0xFFF4F5F7), borderRadius: BorderRadius.all(Radius.circular(10))),
              padding: EdgeInsets.all(10),
              child: Text('These details are subject to verification', style: Theme.of(context).primaryTextTheme.displaySmall),
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
                  list: homeLoanController.employementTypeList,
                  val: homeLoanController.employemenTypeVal,
                  onChanged: (selectedValue) {
                    homeLoanController.setEmployementType(selectedValue.toString());
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
            GetBuilder<HomeLoanController>(builder: (controler) {
              return homeLoanController.employemenTypeVal == 'Salaried'
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
                              list: homeLoanController.serviceList,
                              val: homeLoanController.serviceTypeVal,
                              onChanged: (selectedValue) {
                                homeLoanController.setServiceType(selectedValue.toString());
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
                              list: homeLoanController.employeNatureList,
                              val: homeLoanController.employeNatureVal,
                              onChanged: (selectedValue) {
                                homeLoanController.setEmployeNature(selectedValue.toString());
                              },
                            )),
                      ],
                    )
                  : SizedBox();
            }),
            GetBuilder<HomeLoanController>(builder: (controller) {
              return homeLoanController.employemenTypeVal == 'Self-employed'
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
            GetBuilder<HomeLoanController>(builder: (controller) {
              return Padding(
                padding: EdgeInsets.only(top: 15),
                child: homeLoanController.employemenTypeVal == 'Self-employed' || homeLoanController.employemenTypeVal == 'Salaried'
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
      SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: Get.width,
              child: Padding(
                padding: EdgeInsets.only(top: 15),
                child: Text(
                  'Tell us more about yourself',
                  style: Theme.of(context).primaryTextTheme.displayLarge,
                ),
              ),
            ),
            Container(
              width: Get.width,
              child: Padding(
                padding: EdgeInsets.only(top: 30),
                child: Text(
                  'Current Residence Type',
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
                  list: homeLoanController.residenceTypeList,
                  val: homeLoanController.residenceTypeVal,
                  onChanged: (selectedValue) {
                    homeLoanController.setResidenceType(selectedValue.toString());
                  },
                )),
            Container(
              width: Get.width,
              child: Padding(
                padding: EdgeInsets.only(top: 15),
                child: Text(
                  'Estimated Monthly Household Expenses',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 8),
              child: CustomTextFormField(
                prefixIcon: Icon(FontAwesomeIcons.rupeeSign, size: 15, color: Theme.of(context).primaryColor),
                hintText: "Type here",
                textEditingController: cBirthdate,
                obscureText: false,
                textInputType: TextInputType.numberWithOptions(decimal: true, signed: true),
              ),
            ),
          ],
        ),
      ),
      SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: Get.width,
              child: Padding(
                padding: EdgeInsets.only(top: 15),
                child: Text(
                  'Enter your PAN',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 8),
              child: CustomTextFormField(
                hintText: "AMIPI2345K",
                obscureText: false,
              ),
            ),
          ],
        ),
      ),
    ];
    _buildPageView() {
      return Container(
        //  color: Colors.red,
        height: Get.height - 220,
        width: Get.width,
        child: PageView.builder(
            physics: NeverScrollableScrollPhysics(),
            itemCount: _items.length,
            controller: _pageController,
            itemBuilder: (BuildContext context, int index) {
              return _items[index];
            },
            onPageChanged: (int index) {
              _currentPageNotifier.value = index;
              homeLoanController.setIndex(_currentPageNotifier.value);
            }),
      );
    }

    _buildLinearProgressIndicator() {
      return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) => LinearProgressPageIndicator(
          itemCount: _items.length,
          currentPageNotifier: _currentPageNotifier,
          progressColor: Theme.of(context).primaryColor,
          width: Get.width - 30,
          height: 5,
        ),
      );
    }

    return Scaffold(
      appBar: MyCustomAppBar(
        height: 80,
        appbarPadding: 0,
        title: Text('Home Loan'),
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(Icons.arrow_back_ios)),
      ),
      body: GetBuilder<HomeLoanController>(builder: (controller) {
        return CommonPadding(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 10),
                  width: Get.width,
                  height: 40,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${titles[homeLoanController.indexValue]}',
                        style: Theme.of(context).primaryTextTheme.displaySmall,
                      ),
                      Container(width: Get.width, margin: EdgeInsets.only(top: 3, right: 10), child: _buildLinearProgressIndicator())
                    ],
                  ),
                ),
                _buildPageView()
              ],
            ),
          ),
        );
      }),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(bottom: 20),
        child: NextBackButton(
          backFunction: () {
            if (_currentPageNotifier.value != 0) {
              _currentPageNotifier.value--;
              _pageController.animateToPage(_currentPageNotifier.value, curve: Curves.ease, duration: Duration(milliseconds: 300));
              homeLoanController.setIndex(_currentPageNotifier.value);
            } else {
              Get.back();
            }
          },
          nextFunction: () {
            if (_currentPageNotifier.value != _items.length - 1) {
              _currentPageNotifier.value++;
              _pageController.animateToPage(_currentPageNotifier.value, curve: Curves.ease, duration: Duration(microseconds: 300));
              homeLoanController.setIndex(_currentPageNotifier.value);
            } else {
              homeLoanController.loanType == 1
                  ? Get.to(() => UploadDocumentHLScreen(
                        a: a,
                        o: o,
                      ))
                  : Get.to(() => UploadDocumentTransferHLScreen(
                        a: a,
                        o: o,
                      ));
            }
          },
        ),
      ),
    );
  }
}
