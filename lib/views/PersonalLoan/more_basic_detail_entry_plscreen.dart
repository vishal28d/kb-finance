// ignore_for_file: must_be_immutable
//flutter
import 'package:credit_app/controllers/personal_loan_controller.dart';
import 'package:credit_app/views/PersonalLoan/upload_document_plscreen.dart';
import 'package:credit_app/views/bottom_navigation_screen.dart';
import 'package:credit_app/views/PersonalLoan/more_employement_detail_plscreen.dart';
import 'package:credit_app/widget/appBarWidget.dart';
import 'package:credit_app/widget/common_padding.dart';
import 'package:credit_app/widget/custom_dropdown.dart';
import 'package:credit_app/widget/custom_textformfield.dart';
import 'package:credit_app/widget/primary_button.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
//controllers
import 'package:credit_app/controllers/splashController.dart';
//models
import 'package:credit_app/widget/baseRoute.dart';
//packages
import 'package:get/get.dart';

class MoreBasicDetailEntryPLScreen extends BaseRoute {
  MoreBasicDetailEntryPLScreen({a, o}) : super(a: a, o: o, r: 'MoreBasicDetailEntryPLScreen');

  final SplashController customerController = Get.put(SplashController());
  PersonalLoanController personalLoanController = Get.find<PersonalLoanController>();
  int gender = 1;
  int maritalStatus = 1;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        Get.back();
        return Future.value(true);
      },
      child: Scaffold(
          bottomNavigationBar: Padding(
            padding: EdgeInsets.only(bottom: 0),
            child: CommonPadding(
              child: PrimaryTextButton(
                text: 'Next',
                voidCallback: () {
                  if (personalLoanController.employementVal == 'Salaried' || personalLoanController.employementVal == 'Self Employed') {
                    Get.to(() => MoreEmployementDetailEntryPLScreen(
                          a: a,
                          o: o,
                        ));
                  } else {
                    Get.to(() => UploadDocumentPLScreen(
                          a: a,
                          o: o,
                        ));
                  }
                },
              ),
            ),
          ),
          appBar: MyCustomAppBar(
              height: 80,
              appbarPadding: 0,
              title: Text('More Basic Detail'),
              centerTitle: true,
              leading: IconButton(
                  onPressed: () {
                    Get.to(() => BottomNavigationScreen(
                          a: a,
                          o: o,
                        ));
                  },
                  icon: Icon(
                    Icons.arrow_back_ios,
                  ))),
          body: CommonPadding(
            child: SingleChildScrollView(child: GetBuilder<PersonalLoanController>(builder: (controller) {
              return Column(
                children: [
                  Container(
                    width: Get.width,
                    child: Padding(
                      padding: EdgeInsets.only(top: 15),
                      child: Text(
                        'Alternate Phono Number',
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
                        'Gender',
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 8),
                    child: GetBuilder<PersonalLoanController>(builder: (controler) {
                      return Row(
                        children: [
                          Row(
                            children: [
                              Radio(
                                  value: 1,
                                  groupValue: personalLoanController.gender,
                                  onChanged: (val) {
                                    personalLoanController.setGender(val!);
                                  }),
                              Text(
                                'Male',
                                style: Theme.of(context).primaryTextTheme.displaySmall,
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Radio(
                                  value: 2,
                                  groupValue: personalLoanController.gender,
                                  onChanged: (val) {
                                    personalLoanController.setGender(val!);
                                  }),
                              Text('Female', style: Theme.of(context).primaryTextTheme.displaySmall)
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
                        'Marital Status',
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.only(top: 8),
                      child: GetBuilder<PersonalLoanController>(builder: (controller) {
                        return Row(
                          children: [
                            Row(
                              children: [
                                Radio(
                                    value: 1,
                                    groupValue: personalLoanController.maritalStatus,
                                    onChanged: (val) {
                                      personalLoanController.setMaritalStatus(val!);
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
                                    groupValue: personalLoanController.maritalStatus,
                                    onChanged: (val) {
                                      personalLoanController.setMaritalStatus(val!);
                                    }),
                                Text('Unmarried', style: Theme.of(context).primaryTextTheme.displaySmall)
                              ],
                            ),
                          ],
                        );
                      })),
                  personalLoanController.maritalStatus == 1
                      ? Padding(
                          padding: const EdgeInsets.only(top: 15),
                          child: DottedBorder(
                            color: Colors.black,
                            strokeWidth: 1,
                            child: Container(
                              padding: EdgeInsets.all(08),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(top: 0),
                                    child: Text(
                                      'Spouse Detail',
                                      style: Theme.of(context).primaryTextTheme.displayLarge,
                                    ),
                                  ),
                                  Container(
                                    width: Get.width,
                                    child: Padding(
                                      padding: EdgeInsets.only(top: 15),
                                      child: Text(
                                        'Name',
                                        style: Theme.of(context).textTheme.bodyLarge,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(top: 8),
                                    child: CustomTextFormField(
                                      hintText: "Type here",
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
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                      : SizedBox(),
                  Container(
                    width: Get.width,
                    child: Padding(
                      padding: EdgeInsets.only(top: 15),
                      child: Text(
                        'Father Name',
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 8),
                    child: CustomTextFormField(
                      hintText: "Type here",
                    ),
                  ),
                  Container(
                    width: Get.width,
                    child: Padding(
                      padding: EdgeInsets.only(top: 15),
                      child: Text(
                        'Father Phone Number',
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 8),
                    child: CustomTextFormField(
                      hintText: "Type here",
                      textInputType: TextInputType.numberWithOptions(decimal: true, signed: true),
                    ),
                  ),
                  Container(
                    width: Get.width,
                    child: Padding(
                      padding: EdgeInsets.only(top: 15),
                      child: Text(
                        'Select Nominee',
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
                        list: personalLoanController.nomineesList,
                        val: personalLoanController.nomineeVal,
                        onChanged: (selectedValue) {
                          personalLoanController.nomineeVal = selectedValue.toString();
                        },
                      )),
                ],
              );
            })),
          )),
    );
  }
}
