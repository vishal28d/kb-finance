//flutter
// ignore_for_file: unused_local_variable

import 'dart:io';

import 'package:credit_app/controllers/business_loan_controller.dart';
import 'package:credit_app/controllers/imageController.dart';
import 'package:credit_app/controllers/personal_loan_controller.dart';
import 'package:credit_app/views/BusinessLoan/upload_partner_director_documenst.dart';
import 'package:credit_app/views/SanctionedDisbursal/sanctioned_disbursal_sreen.dart';
import 'package:credit_app/views/businessLoan/loan_detail_entry_for_transfer_blscreen.dart';
import 'package:credit_app/widget/appBarWidget.dart';
import 'package:credit_app/widget/common_padding.dart';
import 'package:credit_app/widget/custom_dropdown.dart';
import 'package:credit_app/widget/custom_textformfield.dart';
import 'package:credit_app/widget/imageWidget.dart';
import 'package:credit_app/widget/primary_button.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
//models
import 'package:credit_app/widget/baseRoute.dart';
//packages
import 'package:get/get.dart';

// ignore: must_be_immutable
class UploadDocumentBLScreen extends BaseRoute {
  //a - analyticsSplashScreen
  //o - observer
  UploadDocumentBLScreen({a, o}) : super(a: a, o: o, r: 'UploadDocumentBLScreen');
  ImageControlller imageController = Get.find<ImageControlller>();

  final PersonalLoanController personalLoanController = Get.put(PersonalLoanController());
  final BusinessLoanController businessLoanController = Get.find<BusinessLoanController>();
  List<Widget> partnerPanCardList(context) {
    List<Widget> list = [];

    for (var i = 0; i < businessLoanController.partnerNameList.length; i++) {
      list.add(Column(
        children: [
          Container(
            width: Get.width,
            child: Padding(
              padding: EdgeInsets.only(top: 15),
              child: Text(
                'PAN Card of ${businessLoanController.partnerNameList[i]}',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
          ),
          Padding(
              padding: EdgeInsets.only(top: 8),
              child: DottedBorder(
                strokeWidth: 1,
                color: Theme.of(context).primaryColor,
                child: GestureDetector(
                  onTap: () {
                    imagePickerSheet('Partner PAN Card', context, i);
                  },
                  child: Container(
                    width: Get.width,
                    height: 250,
                    child: ImageWidget(
                      file: businessLoanController.partnerPanCards[i],
                      name: 'Partner PAN Card',
                    ),
                  ),
                ),
              )),
        ],
      ));
    }
    return list;
  }

  List<Widget> partnerAadharCardList(context) {
    List<Widget> list1 = [];

    for (var i = 0; i < businessLoanController.partnerNameList.length; i++) {
      list1.add(Column(
        children: [
          Container(
            width: Get.width,
            child: Padding(
              padding: EdgeInsets.only(top: 15),
              child: Text(
                'Aadhar Card of ${businessLoanController.partnerNameList[i]}',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
          ),
          Padding(
              padding: EdgeInsets.only(top: 8),
              child: DottedBorder(
                strokeWidth: 1,
                color: Theme.of(context).primaryColor,
                child: GestureDetector(
                  onTap: () {
                    imagePickerSheet('Partner Aadhar Card', context, i);
                  },
                  child: Container(
                    width: Get.width,
                    height: 250,
                    child: ImageWidget(
                      file: businessLoanController.partnerAadharCards[i],
                      name: 'Partner Aadhar Card',
                    ),
                  ),
                ),
              )),
        ],
      ));
    }
    return list1;
  }

  List<Widget> partnerPhotoList(context) {
    List<Widget> list1 = [];

    for (var i = 0; i < businessLoanController.partnerNameList.length; i++) {
      list1.add(Column(
        children: [
          Container(
            width: Get.width,
            child: Padding(
              padding: EdgeInsets.only(top: 15),
              child: Text(
                'Photo of ${businessLoanController.partnerNameList[i]}',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
          ),
          Padding(
              padding: EdgeInsets.only(top: 8),
              child: DottedBorder(
                strokeWidth: 1,
                color: Theme.of(context).primaryColor,
                child: GestureDetector(
                  onTap: () {
                    imagePickerSheet('Photo of partner', context, i);
                  },
                  child: Container(
                    width: Get.width,
                    height: 250,
                    child: ImageWidget(
                      file: businessLoanController.photoOfPartners[i],
                      name: 'Photo of Partner',
                    ),
                  ),
                ),
              )),
        ],
      ));
    }
    return list1;
  }

  List<Widget> directorPanCardList(context) {
    List<Widget> list = [];

    for (var i = 0; i < businessLoanController.directorNameList.length; i++) {
      list.add(Column(
        children: [
          Container(
            width: Get.width,
            child: Padding(
              padding: EdgeInsets.only(top: 15),
              child: Text(
                'PAN Card of ${businessLoanController.directorNameList[i]}',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
          ),
          Padding(
              padding: EdgeInsets.only(top: 8),
              child: DottedBorder(
                strokeWidth: 1,
                color: Theme.of(context).primaryColor,
                child: GestureDetector(
                  onTap: () {
                    imagePickerSheet('Director PAN Card', context, i);
                  },
                  child: Container(
                    width: Get.width,
                    height: 250,
                    child: ImageWidget(
                      file: businessLoanController.directorPanCards[i],
                      name: 'Director PAN Card',
                    ),
                  ),
                ),
              )),
        ],
      ));
    }
    return list;
  }

  List<Widget> directorAadharCardList(context) {
    List<Widget> list = [];

    for (var i = 0; i < businessLoanController.directorNameList.length; i++) {
      list.add(Column(
        children: [
          Container(
            width: Get.width,
            child: Padding(
              padding: EdgeInsets.only(top: 15),
              child: Text(
                'Aadhar Card of ${businessLoanController.directorNameList[i]}',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
          ),
          Padding(
              padding: EdgeInsets.only(top: 8),
              child: DottedBorder(
                strokeWidth: 1,
                color: Theme.of(context).primaryColor,
                child: GestureDetector(
                  onTap: () {
                    imagePickerSheet('Director Aadhar Card', context, i);
                  },
                  child: Container(
                    width: Get.width,
                    height: 250,
                    child: ImageWidget(
                      file: businessLoanController.directorAadharCards[i],
                      name: 'Director Aadhar Card',
                    ),
                  ),
                ),
              )),
        ],
      ));
    }
    return list;
  }

  List<Widget> directorPhotoList(context) {
    List<Widget> list = [];

    for (var i = 0; i < businessLoanController.directorNameList.length; i++) {
      list.add(Column(
        children: [
          Container(
            width: Get.width,
            child: Padding(
              padding: EdgeInsets.only(top: 15),
              child: Text(
                'Photo of ${businessLoanController.directorNameList[i]}',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
          ),
          Padding(
              padding: EdgeInsets.only(top: 8),
              child: DottedBorder(
                strokeWidth: 1,
                color: Theme.of(context).primaryColor,
                child: GestureDetector(
                  onTap: () {
                    imagePickerSheet('Photo of Director', context, i);
                  },
                  child: Container(
                    width: Get.width,
                    height: 250,
                    child: ImageWidget(
                      file: businessLoanController.photoOfDirectors[i],
                      name: 'Photo of Director',
                    ),
                  ),
                ),
              )),
        ],
      ));
    }
    return list;
  }

  imagePickerSheet(String imageName, context, int? index) {
    File imageFile;
    return Get.bottomSheet(
        Container(
            decoration: BoxDecoration(color: Theme.of(context).primaryColor, borderRadius: BorderRadius.only(topLeft: Radius.circular(25), topRight: Radius.circular(25))),
            height: 180,
            width: Get.width,
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.only(top: 5),
                  // color:Colors.red,
                  child: Text(
                    'Select Image',
                    style: Theme.of(context).primaryTextTheme.headlineSmall,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10, left: 15, right: 15),
                  child: Card(
                    child: ListTile(
                      leading: Icon(
                        Icons.image,
                        size: 25,
                      ),
                      title: Text('Gallery'),
                      onTap: () async {
                        Get.back();
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10, left: 15, right: 15),
                  child: Card(
                    child: ListTile(
                      leading: Icon(Icons.camera, size: 25),
                      title: Text('Camera'),
                      onTap: () async {
                        Get.back();
                      },
                    ),
                  ),
                ),
              ],
            )),
        backgroundColor: Colors.transparent);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CommonPadding(child: GetBuilder<BusinessLoanController>(builder: (controller) {
        return PrimaryTextButton(
          text: 'Next',
          voidCallback: () {
            if (businessLoanController.companyTypeVal == 'Partnership' || businessLoanController.companyTypeVal == 'LLP' || businessLoanController.companyTypeVal == 'Pvt.Ltd') {
              Get.to(() => UploadPartnerDirectorDocumentsBLScreen(
                    a: a,
                    o: o,
                  ));
            } else {
              if (businessLoanController.loanType == 1) {
                Get.to(() => SanctionedDisbursalScreen(
                      a: a,
                      o: o,
                    ));
              } else {
                Get.to(() => LoanDetailEntryForTransferBLScreen(
                      a: a,
                      o: o,
                    ));
              }
            }
          },
        );
      })),
      appBar: MyCustomAppBar(
        height: 80,
        appbarPadding: 0,
        title: Text('Upload Documents'),
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(Icons.arrow_back_ios)),
      ),
      body: CommonPadding(
        child: SingleChildScrollView(child: GetBuilder<BusinessLoanController>(builder: (controller) {
          return Column(
            children: [
              businessLoanController.companyTypeVal == 'Proprietor'
                  ? Column(
                      children: [
                        Container(
                          width: Get.width,
                          child: Padding(
                            padding: EdgeInsets.only(top: 15),
                            child: Text(
                              'PAN card',
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                          ),
                        ),
                        Padding(
                            padding: EdgeInsets.only(top: 8),
                            child: DottedBorder(
                              strokeWidth: 1,
                              color: Theme.of(context).primaryColor,
                              child: GestureDetector(
                                onTap: () {
                                  imagePickerSheet('PAN card', context, null);
                                },
                                child: Container(
                                  width: Get.width,
                                  height: 250,
                                  child: ImageWidget(
                                    file: businessLoanController.panCard,
                                    name: 'PAN card',
                                  ),
                                ),
                              ),
                            )),
                        Container(
                          width: Get.width,
                          child: Padding(
                            padding: EdgeInsets.only(top: 15),
                            child: Text(
                              'Aadhar Card',
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                          ),
                        ),
                        Padding(
                            padding: EdgeInsets.only(top: 8),
                            child: DottedBorder(
                              strokeWidth: 1,
                              color: Theme.of(context).primaryColor,
                              child: GestureDetector(
                                onTap: () {
                                  imagePickerSheet('Aadhar Card', context, null);
                                },
                                child: Container(
                                  width: Get.width,
                                  height: 250,
                                  child: ImageWidget(
                                    file: businessLoanController.aadharCard,
                                    name: 'Aadhar Card',
                                  ),
                                ),
                              ),
                            )),
                        Container(
                          width: Get.width,
                          child: Padding(
                            padding: EdgeInsets.only(top: 15),
                            child: Text(
                              'Photo of Prop/Indi',
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                          ),
                        ),
                        Padding(
                            padding: EdgeInsets.only(top: 8),
                            child: DottedBorder(
                              strokeWidth: 1,
                              color: Theme.of(context).primaryColor,
                              child: GestureDetector(
                                onTap: () {
                                  imagePickerSheet('Photo of Prop/Indi', context, null);
                                },
                                child: Container(
                                  width: Get.width,
                                  height: 250,
                                  child: ImageWidget(
                                    file: businessLoanController.photoOfPropIndi,
                                    name: 'Photo of Prop/Indi',
                                  ),
                                ),
                              ),
                            )),
                        Container(
                          width: Get.width,
                          child: Padding(
                            padding: EdgeInsets.only(top: 15),
                            child: Text(
                              'All Bank Account Statement/s 12 months',
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                          ),
                        ),
                        Padding(
                            padding: EdgeInsets.only(top: 8),
                            child: DottedBorder(
                              strokeWidth: 1,
                              color: Theme.of(context).primaryColor,
                              child: GestureDetector(
                                onTap: () {},
                                child: Container(
                                  width: Get.width,
                                  height: 250,
                                  child: ImageWidget(
                                    file: null,
                                    name: 'Bank Account Statements',
                                  ),
                                ),
                              ),
                            )),
                        Container(
                          width: Get.width,
                          child: Padding(
                            padding: EdgeInsets.only(top: 15),
                            child: Text(
                              'Electricity Bill',
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                          ),
                        ),
                        Padding(
                            padding: EdgeInsets.only(top: 8),
                            child: DottedBorder(
                              strokeWidth: 1,
                              color: Theme.of(context).primaryColor,
                              child: GestureDetector(
                                onTap: () {
                                  imagePickerSheet('Electricity Bill', context, null);
                                },
                                child: Container(
                                  width: Get.width,
                                  height: 250,
                                  child: ImageWidget(
                                    file: businessLoanController.electricityBill,
                                    name: 'Electricity Bill',
                                  ),
                                ),
                              ),
                            )),
                        Container(
                          width: Get.width,
                          child: Padding(
                            padding: EdgeInsets.only(top: 15),
                            child: Text(
                              'GST Registration',
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                          ),
                        ),
                        Padding(
                            padding: EdgeInsets.only(top: 8),
                            child: DottedBorder(
                              strokeWidth: 1,
                              color: Theme.of(context).primaryColor,
                              child: GestureDetector(
                                onTap: () {
                                  imagePickerSheet('GST registration', context, null);
                                },
                                child: Container(
                                  width: Get.width,
                                  height: 250,
                                  child: ImageWidget(
                                    file: businessLoanController.gstRegistration,
                                    name: 'GST Registration',
                                  ),
                                ),
                              ),
                            )),
                      ],
                    )
                  : businessLoanController.companyTypeVal == 'Partnership' || businessLoanController.companyTypeVal == 'LLP'
                      ? Column(
                          children: [
                            Container(
                              width: Get.width,
                              child: Padding(
                                padding: EdgeInsets.only(top: 15),
                                child: Text(
                                  'PAN card partnership firm',
                                  style: Theme.of(context).textTheme.bodyLarge,
                                ),
                              ),
                            ),
                            Padding(
                                padding: EdgeInsets.only(top: 8),
                                child: DottedBorder(
                                  strokeWidth: 1,
                                  color: Theme.of(context).primaryColor,
                                  child: GestureDetector(
                                    onTap: () {
                                      imagePickerSheet('PAN card partnership firm', context, null);
                                    },
                                    child: Container(
                                      width: Get.width,
                                      height: 250,
                                      child: ImageWidget(
                                        file: businessLoanController.panCardPartnershipFirm,
                                        name: 'PAN card partnership firm',
                                      ),
                                    ),
                                  ),
                                )),
                            Container(
                              width: Get.width,
                              child: Padding(
                                padding: EdgeInsets.only(top: 15),
                                child: Text(
                                  'All Bank Account Statement/s 12 months',
                                  style: Theme.of(context).textTheme.bodyLarge,
                                ),
                              ),
                            ),
                            Padding(
                                padding: EdgeInsets.only(top: 8),
                                child: DottedBorder(
                                  strokeWidth: 1,
                                  color: Theme.of(context).primaryColor,
                                  child: GestureDetector(
                                    onTap: () {},
                                    child: Container(
                                      width: Get.width,
                                      height: 250,
                                      child: ImageWidget(
                                        file: null,
                                        name: 'Bank Account Statements',
                                      ),
                                    ),
                                  ),
                                )),
                            Padding(
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
                                        padding: EdgeInsets.only(top: 3),
                                        child: Text(
                                          'Business Address Proof',
                                          style: Theme.of(context).primaryTextTheme.displayLarge,
                                        ),
                                      ),
                                      Container(
                                        width: Get.width,
                                        child: Padding(
                                          padding: EdgeInsets.only(top: 15),
                                          child: Text(
                                            'Electricity Bill',
                                            style: Theme.of(context).textTheme.bodyLarge,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                          padding: EdgeInsets.only(top: 8),
                                          child: DottedBorder(
                                            strokeWidth: 1,
                                            color: Theme.of(context).primaryColor,
                                            child: GestureDetector(
                                              onTap: () {
                                                imagePickerSheet('Electricity Bill', context, null);
                                              },
                                              child: Container(
                                                width: Get.width,
                                                height: 250,
                                                child: ImageWidget(
                                                  file: businessLoanController.electricityBill,
                                                  name: 'Electricity Bill',
                                                ),
                                              ),
                                            ),
                                          )),
                                      Container(
                                        width: Get.width,
                                        child: Padding(
                                          padding: EdgeInsets.only(top: 15),
                                          child: Text(
                                            'Partnership Deed',
                                            style: Theme.of(context).textTheme.bodyLarge,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                          padding: EdgeInsets.only(top: 8),
                                          child: DottedBorder(
                                            strokeWidth: 1,
                                            color: Theme.of(context).primaryColor,
                                            child: GestureDetector(
                                              onTap: () {
                                                imagePickerSheet('Partnership Deed', context, null);
                                              },
                                              child: Container(
                                                width: Get.width,
                                                height: 250,
                                                child: ImageWidget(
                                                  file: businessLoanController.partnershipDeed,
                                                  name: 'Partnership Deed',
                                                ),
                                              ),
                                            ),
                                          )),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Padding(
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
                                        padding: EdgeInsets.only(top: 3),
                                        child: Text(
                                          'Business Proof',
                                          style: Theme.of(context).primaryTextTheme.displayLarge,
                                        ),
                                      ),
                                      Container(
                                        width: Get.width,
                                        child: Padding(
                                          padding: EdgeInsets.only(top: 15),
                                          child: Text(
                                            'Registration',
                                            style: Theme.of(context).textTheme.bodyLarge,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                          padding: EdgeInsets.only(top: 8),
                                          child: DottedBorder(
                                            strokeWidth: 1,
                                            color: Theme.of(context).primaryColor,
                                            child: GestureDetector(
                                              onTap: () {
                                                imagePickerSheet('Registration', context, null);
                                              },
                                              child: Container(
                                                width: Get.width,
                                                height: 250,
                                                child: ImageWidget(
                                                  file: businessLoanController.registration,
                                                  name: 'Registration',
                                                ),
                                              ),
                                            ),
                                          )),
                                      Container(
                                        width: Get.width,
                                        child: Padding(
                                          padding: EdgeInsets.only(top: 15),
                                          child: Text(
                                            'GST Registration',
                                            style: Theme.of(context).textTheme.bodyLarge,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                          padding: EdgeInsets.only(top: 8),
                                          child: DottedBorder(
                                            strokeWidth: 1,
                                            color: Theme.of(context).primaryColor,
                                            child: GestureDetector(
                                              onTap: () {
                                                imagePickerSheet('GST registration', context, null);
                                              },
                                              child: Container(
                                                width: Get.width,
                                                height: 250,
                                                child: ImageWidget(
                                                  file: businessLoanController.gstRegistration,
                                                  name: 'GST Registration',
                                                ),
                                              ),
                                            ),
                                          )),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              width: Get.width,
                              child: Padding(
                                padding: EdgeInsets.only(top: 15),
                                child: Text(
                                  'Email id/s',
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
                            Padding(
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
                                        padding: EdgeInsets.only(top: 3),
                                        child: Text(
                                          '2 Year IT return with computation',
                                          style: Theme.of(context).primaryTextTheme.displayLarge,
                                        ),
                                      ),
                                      Container(
                                        width: Get.width,
                                        child: Padding(
                                          padding: EdgeInsets.only(top: 15),
                                          child: Text(
                                            'Select Year',
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
                                            list: businessLoanController.yearList,
                                            onChanged: (selectedValue) {
                                              businessLoanController.firstYearOfITReturnVal = selectedValue.toString();
                                            },
                                            val: businessLoanController.firstYearOfITReturnVal,
                                          )),
                                      Container(
                                        width: Get.width,
                                        child: Padding(
                                          padding: EdgeInsets.only(top: 15),
                                          child: Text(
                                            'IT Return',
                                            style: Theme.of(context).textTheme.bodyLarge,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                          padding: EdgeInsets.only(top: 8),
                                          child: DottedBorder(
                                            strokeWidth: 1,
                                            color: Theme.of(context).primaryColor,
                                            child: GestureDetector(
                                              onTap: () {},
                                              child: Container(
                                                width: Get.width,
                                                height: 250,
                                                child: ImageWidget(
                                                  file: null,
                                                  name: 'IT Return',
                                                ),
                                              ),
                                            ),
                                          )),
                                      Container(
                                        width: Get.width,
                                        child: Padding(
                                          padding: EdgeInsets.only(top: 15),
                                          child: Text(
                                            'Select Year',
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
                                            list: businessLoanController.yearList,
                                            onChanged: (selectedValue) {
                                              businessLoanController.secondYearOfITReturnVal = selectedValue.toString();
                                            },
                                            val: businessLoanController.secondYearOfITReturnVal,
                                          )),
                                      Container(
                                        width: Get.width,
                                        child: Padding(
                                          padding: EdgeInsets.only(top: 15),
                                          child: Text(
                                            'IT Return',
                                            style: Theme.of(context).textTheme.bodyLarge,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                          padding: EdgeInsets.only(top: 8),
                                          child: DottedBorder(
                                            strokeWidth: 1,
                                            color: Theme.of(context).primaryColor,
                                            child: GestureDetector(
                                              onTap: () {},
                                              child: Container(
                                                width: Get.width,
                                                height: 250,
                                                child: ImageWidget(
                                                  file: null,
                                                  name: 'IT Return',
                                                ),
                                              ),
                                            ),
                                          )),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Padding(
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
                                        padding: EdgeInsets.only(top: 3),
                                        child: Text(
                                          '2 Year Audit report with all Annexure',
                                          style: Theme.of(context).primaryTextTheme.displayLarge,
                                        ),
                                      ),
                                      Container(
                                        width: Get.width,
                                        child: Padding(
                                          padding: EdgeInsets.only(top: 15),
                                          child: Text(
                                            'Select Year',
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
                                            list: businessLoanController.yearList,
                                            val: businessLoanController.firstYearOfAuditReportVal,
                                            onChanged: (selectedValue) {
                                              businessLoanController.firstYearOfAuditReportVal = selectedValue.toString();
                                            },
                                          )),
                                      Container(
                                        width: Get.width,
                                        child: Padding(
                                          padding: EdgeInsets.only(top: 15),
                                          child: Text(
                                            'Audit Report',
                                            style: Theme.of(context).textTheme.bodyLarge,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                          padding: EdgeInsets.only(top: 8),
                                          child: DottedBorder(
                                            strokeWidth: 1,
                                            color: Theme.of(context).primaryColor,
                                            child: GestureDetector(
                                              onTap: () {},
                                              child: Container(
                                                width: Get.width,
                                                height: 250,
                                                child: ImageWidget(
                                                  file: null,
                                                  name: 'Audit Report',
                                                ),
                                              ),
                                            ),
                                          )),
                                      Container(
                                        width: Get.width,
                                        child: Padding(
                                          padding: EdgeInsets.only(top: 15),
                                          child: Text(
                                            'Select Year',
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
                                            val: businessLoanController.secondYearOfAuditReportVal,
                                            list: businessLoanController.yearList,
                                            onChanged: (selectedValue) {
                                              businessLoanController.secondYearOfAuditReportVal = selectedValue.toString();
                                            },
                                          )),
                                      Container(
                                        width: Get.width,
                                        child: Padding(
                                          padding: EdgeInsets.only(top: 15),
                                          child: Text(
                                            'Audit Report',
                                            style: Theme.of(context).textTheme.bodyLarge,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                          padding: EdgeInsets.only(top: 8),
                                          child: DottedBorder(
                                            strokeWidth: 1,
                                            color: Theme.of(context).primaryColor,
                                            child: GestureDetector(
                                              onTap: () {},
                                              child: Container(
                                                width: Get.width,
                                                height: 250,
                                                child: ImageWidget(
                                                  file: null,
                                                  name: 'Audit Report',
                                                ),
                                              ),
                                            ),
                                          )),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              width: Get.width,
                              child: Padding(
                                padding: EdgeInsets.only(top: 15),
                                child: Text(
                                  'P&L and Balance sheet',
                                  style: Theme.of(context).textTheme.bodyLarge,
                                ),
                              ),
                            ),
                            Padding(
                                padding: EdgeInsets.only(top: 8),
                                child: DottedBorder(
                                  strokeWidth: 1,
                                  color: Theme.of(context).primaryColor,
                                  child: GestureDetector(
                                    onTap: () {},
                                    child: Container(
                                      width: Get.width,
                                      height: 250,
                                      child: ImageWidget(
                                        file: null,
                                        name: 'P&L and Balance sheet',
                                      ),
                                    ),
                                  ),
                                )),
                            Padding(
                              padding: const EdgeInsets.only(top: 15),
                              child: DottedBorder(
                                  color: Colors.black,
                                  strokeWidth: 1,
                                  child: Container(
                                    padding: EdgeInsets.all(08),
                                    child: Column(
                                      children: [
                                        Container(
                                          width: Get.width,
                                          child: Padding(
                                            padding: EdgeInsets.only(top: 0),
                                            child: Text(
                                              '2 References',
                                              style: Theme.of(context).primaryTextTheme.displayLarge,
                                            ),
                                          ),
                                        ),
                                        Container(
                                          width: Get.width,
                                          child: Padding(
                                            padding: EdgeInsets.only(top: 15),
                                            child: Text(
                                              'Buyer Name',
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
                                              'Buyer Phone Number',
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
                                              'Seller Name',
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
                                              'Seller Phone Number',
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
                                  )),
                            ),
                          ],
                        )
                      : businessLoanController.companyTypeVal == 'Pvt.Ltd'
                          ? Column(
                              children: [
                                Container(
                                  width: Get.width,
                                  child: Padding(
                                    padding: EdgeInsets.only(top: 15),
                                    child: Text(
                                      'PAN card limited company',
                                      style: Theme.of(context).textTheme.bodyLarge,
                                    ),
                                  ),
                                ),
                                Padding(
                                    padding: EdgeInsets.only(top: 8),
                                    child: DottedBorder(
                                      strokeWidth: 1,
                                      color: Theme.of(context).primaryColor,
                                      child: GestureDetector(
                                        onTap: () {
                                          imagePickerSheet('PAN card limited company', context, null);
                                        },
                                        child: Container(
                                          width: Get.width,
                                          height: 250,
                                          child: ImageWidget(
                                            file: businessLoanController.panCardLimitedCompany,
                                            name: 'PAN card limited company',
                                          ),
                                        ),
                                      ),
                                    )),
                                Container(
                                  width: Get.width,
                                  child: Padding(
                                    padding: EdgeInsets.only(top: 15),
                                    child: Text(
                                      'All Bank Account Statement/s 12 months',
                                      style: Theme.of(context).textTheme.bodyLarge,
                                    ),
                                  ),
                                ),
                                Padding(
                                    padding: EdgeInsets.only(top: 8),
                                    child: DottedBorder(
                                      strokeWidth: 1,
                                      color: Theme.of(context).primaryColor,
                                      child: GestureDetector(
                                        onTap: () {},
                                        child: Container(
                                          width: Get.width,
                                          height: 250,
                                          child: ImageWidget(
                                            file: null,
                                            name: 'Bank Account Statements',
                                          ),
                                        ),
                                      ),
                                    )),
                                Padding(
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
                                            padding: EdgeInsets.only(top: 3),
                                            child: Text(
                                              'Business Address Proof',
                                              style: Theme.of(context).primaryTextTheme.displayLarge,
                                            ),
                                          ),
                                          Container(
                                            width: Get.width,
                                            child: Padding(
                                              padding: EdgeInsets.only(top: 15),
                                              child: Text(
                                                'Electricity Bill',
                                                style: Theme.of(context).textTheme.bodyLarge,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                              padding: EdgeInsets.only(top: 8),
                                              child: DottedBorder(
                                                strokeWidth: 1,
                                                color: Theme.of(context).primaryColor,
                                                child: GestureDetector(
                                                  onTap: () {
                                                    imagePickerSheet('Electricity Bill', context, null);
                                                  },
                                                  child: Container(
                                                    width: Get.width,
                                                    height: 250,
                                                    child: ImageWidget(
                                                      file: businessLoanController.electricityBill,
                                                      name: 'Electricity Bill',
                                                    ),
                                                  ),
                                                ),
                                              )),
                                          Container(
                                            width: Get.width,
                                            child: Padding(
                                              padding: EdgeInsets.only(top: 15),
                                              child: Text(
                                                'MOA & AOA',
                                                style: Theme.of(context).textTheme.bodyLarge,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                              padding: EdgeInsets.only(top: 8),
                                              child: DottedBorder(
                                                strokeWidth: 1,
                                                color: Theme.of(context).primaryColor,
                                                child: GestureDetector(
                                                  onTap: () {},
                                                  child: Container(
                                                    width: Get.width,
                                                    height: 250,
                                                    child: ImageWidget(
                                                      file: null,
                                                      name: 'MOA & AOA',
                                                    ),
                                                  ),
                                                ),
                                              )),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
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
                                            padding: EdgeInsets.only(top: 3),
                                            child: Text(
                                              'Business Proof',
                                              style: Theme.of(context).primaryTextTheme.displayLarge,
                                            ),
                                          ),
                                          Container(
                                            width: Get.width,
                                            child: Padding(
                                              padding: EdgeInsets.only(top: 15),
                                              child: Text(
                                                'Registration',
                                                style: Theme.of(context).textTheme.bodyLarge,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                              padding: EdgeInsets.only(top: 8),
                                              child: DottedBorder(
                                                strokeWidth: 1,
                                                color: Theme.of(context).primaryColor,
                                                child: GestureDetector(
                                                  onTap: () {
                                                    imagePickerSheet('Registration', context, null);
                                                  },
                                                  child: Container(
                                                    width: Get.width,
                                                    height: 250,
                                                    child: ImageWidget(
                                                      file: businessLoanController.registration,
                                                      name: 'Registration',
                                                    ),
                                                  ),
                                                ),
                                              )),
                                          Container(
                                            width: Get.width,
                                            child: Padding(
                                              padding: EdgeInsets.only(top: 15),
                                              child: Text(
                                                'GST Registration',
                                                style: Theme.of(context).textTheme.bodyLarge,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                              padding: EdgeInsets.only(top: 8),
                                              child: DottedBorder(
                                                strokeWidth: 1,
                                                color: Theme.of(context).primaryColor,
                                                child: GestureDetector(
                                                  onTap: () {
                                                    imagePickerSheet('GST registration', context, null);
                                                  },
                                                  child: Container(
                                                    width: Get.width,
                                                    height: 250,
                                                    child: ImageWidget(
                                                      file: businessLoanController.gstRegistration,
                                                      name: 'GST Registration',
                                                    ),
                                                  ),
                                                ),
                                              )),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  width: Get.width,
                                  child: Padding(
                                    padding: EdgeInsets.only(top: 15),
                                    child: Text(
                                      'Email id/s of Director',
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
                                Padding(
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
                                            padding: EdgeInsets.only(top: 3),
                                            child: Text(
                                              '2 Year IT return with computation',
                                              style: Theme.of(context).primaryTextTheme.displayLarge,
                                            ),
                                          ),
                                          Container(
                                            width: Get.width,
                                            child: Padding(
                                              padding: EdgeInsets.only(top: 15),
                                              child: Text(
                                                'Select Year',
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
                                                list: businessLoanController.yearList,
                                                val: businessLoanController.firstYearOfITReturnVal,
                                                onChanged: (selectedValue) {
                                                  businessLoanController.firstYearOfITReturnVal = selectedValue.toString();
                                                },
                                              )),
                                          Container(
                                            width: Get.width,
                                            child: Padding(
                                              padding: EdgeInsets.only(top: 15),
                                              child: Text(
                                                'IT Return',
                                                style: Theme.of(context).textTheme.bodyLarge,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                              padding: EdgeInsets.only(top: 8),
                                              child: DottedBorder(
                                                strokeWidth: 1,
                                                color: Theme.of(context).primaryColor,
                                                child: GestureDetector(
                                                  onTap: () {},
                                                  child: Container(
                                                    width: Get.width,
                                                    height: 250,
                                                    child: ImageWidget(
                                                      file: null,
                                                      name: 'IT Return',
                                                    ),
                                                  ),
                                                ),
                                              )),
                                          Container(
                                            width: Get.width,
                                            child: Padding(
                                              padding: EdgeInsets.only(top: 15),
                                              child: Text(
                                                'Select Year',
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
                                                list: businessLoanController.yearList,
                                                val: businessLoanController.secondYearOfITReturnVal,
                                                onChanged: (selectedValue) {
                                                  businessLoanController.secondYearOfITReturnVal = selectedValue.toString();
                                                },
                                              )),
                                          Container(
                                            width: Get.width,
                                            child: Padding(
                                              padding: EdgeInsets.only(top: 15),
                                              child: Text(
                                                'IT Return',
                                                style: Theme.of(context).textTheme.bodyLarge,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                              padding: EdgeInsets.only(top: 8),
                                              child: DottedBorder(
                                                strokeWidth: 1,
                                                color: Theme.of(context).primaryColor,
                                                child: GestureDetector(
                                                  onTap: () {},
                                                  child: Container(
                                                    width: Get.width,
                                                    height: 250,
                                                    child: ImageWidget(
                                                      file: null,
                                                      name: 'IT Return',
                                                    ),
                                                  ),
                                                ),
                                              )),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
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
                                            padding: EdgeInsets.only(top: 3),
                                            child: Text(
                                              '2 Year Audit report with all Annexure',
                                              style: Theme.of(context).primaryTextTheme.displayLarge,
                                            ),
                                          ),
                                          Container(
                                            width: Get.width,
                                            child: Padding(
                                              padding: EdgeInsets.only(top: 15),
                                              child: Text(
                                                'Select Year',
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
                                                val: businessLoanController.firstYearOfAuditReportVal,
                                                list: businessLoanController.yearList,
                                                onChanged: (selectedValue) {
                                                  businessLoanController.firstYearOfAuditReportVal = selectedValue.toString();
                                                },
                                              )),
                                          Container(
                                            width: Get.width,
                                            child: Padding(
                                              padding: EdgeInsets.only(top: 15),
                                              child: Text(
                                                'Audit Report',
                                                style: Theme.of(context).textTheme.bodyLarge,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                              padding: EdgeInsets.only(top: 8),
                                              child: DottedBorder(
                                                strokeWidth: 1,
                                                color: Theme.of(context).primaryColor,
                                                child: GestureDetector(
                                                  onTap: () {},
                                                  child: Container(
                                                    width: Get.width,
                                                    height: 250,
                                                    child: ImageWidget(
                                                      file: null,
                                                      name: 'Audit Report',
                                                    ),
                                                  ),
                                                ),
                                              )),
                                          Container(
                                            width: Get.width,
                                            child: Padding(
                                              padding: EdgeInsets.only(top: 15),
                                              child: Text(
                                                'Select Year',
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
                                                list: businessLoanController.yearList,
                                                val: businessLoanController.secondYearOfAuditReportVal,
                                                onChanged: (selectedValue) {
                                                  businessLoanController.secondYearOfAuditReportVal = selectedValue.toString();
                                                },
                                              )),
                                          Container(
                                            width: Get.width,
                                            child: Padding(
                                              padding: EdgeInsets.only(top: 15),
                                              child: Text(
                                                'Audit Report',
                                                style: Theme.of(context).textTheme.bodyLarge,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                              padding: EdgeInsets.only(top: 8),
                                              child: DottedBorder(
                                                strokeWidth: 1,
                                                color: Theme.of(context).primaryColor,
                                                child: GestureDetector(
                                                  onTap: () {},
                                                  child: Container(
                                                    width: Get.width,
                                                    height: 250,
                                                    child: ImageWidget(
                                                      file: null,
                                                      name: 'Audit Report',
                                                    ),
                                                  ),
                                                ),
                                              )),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  width: Get.width,
                                  child: Padding(
                                    padding: EdgeInsets.only(top: 15),
                                    child: Text(
                                      'P&L and Balance sheet',
                                      style: Theme.of(context).textTheme.bodyLarge,
                                    ),
                                  ),
                                ),
                                Padding(
                                    padding: EdgeInsets.only(top: 8),
                                    child: DottedBorder(
                                      strokeWidth: 1,
                                      color: Theme.of(context).primaryColor,
                                      child: GestureDetector(
                                        onTap: () {},
                                        child: Container(
                                          width: Get.width,
                                          height: 250,
                                          child: ImageWidget(
                                            file: null,
                                            name: 'P&L and Balance sheet',
                                          ),
                                        ),
                                      ),
                                    )),
                                Padding(
                                  padding: const EdgeInsets.only(top: 15),
                                  child: DottedBorder(
                                      color: Colors.black,
                                      strokeWidth: 1,
                                      child: Container(
                                        padding: EdgeInsets.all(08),
                                        child: Column(
                                          children: [
                                            Container(
                                              width: Get.width,
                                              child: Padding(
                                                padding: EdgeInsets.only(top: 0),
                                                child: Text(
                                                  '2 References',
                                                  style: Theme.of(context).primaryTextTheme.displayLarge,
                                                ),
                                              ),
                                            ),
                                            Container(
                                              width: Get.width,
                                              child: Padding(
                                                padding: EdgeInsets.only(top: 15),
                                                child: Text(
                                                  'Buyer Name',
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
                                                  'Buyer Phone Number',
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
                                                  'Seller Name',
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
                                                  'Seller Phone Number',
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
                                      )),
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
                                      'PAN card',
                                      style: Theme.of(context).textTheme.bodyLarge,
                                    ),
                                  ),
                                ),
                                Padding(
                                    padding: EdgeInsets.only(top: 8),
                                    child: DottedBorder(
                                      strokeWidth: 1,
                                      color: Theme.of(context).primaryColor,
                                      child: GestureDetector(
                                        onTap: () {
                                          imagePickerSheet('PAN card', context, null);
                                        },
                                        child: Container(
                                          width: Get.width,
                                          height: 250,
                                          child: ImageWidget(
                                            file: businessLoanController.panCard,
                                            name: 'PAN card',
                                          ),
                                        ),
                                      ),
                                    )),
                                Container(
                                  width: Get.width,
                                  child: Padding(
                                    padding: EdgeInsets.only(top: 15),
                                    child: Text(
                                      'Aadhar Card',
                                      style: Theme.of(context).textTheme.bodyLarge,
                                    ),
                                  ),
                                ),
                                Padding(
                                    padding: EdgeInsets.only(top: 8),
                                    child: DottedBorder(
                                      strokeWidth: 1,
                                      color: Theme.of(context).primaryColor,
                                      child: GestureDetector(
                                        onTap: () {
                                          imagePickerSheet('Aadhar Card', context, null);
                                        },
                                        child: Container(
                                          width: Get.width,
                                          height: 250,
                                          child: ImageWidget(
                                            file: businessLoanController.aadharCard,
                                            name: 'Aadhar Card',
                                          ),
                                        ),
                                      ),
                                    )),
                              ],
                            )
            ],
          );
        })),
      ),
    );
  }
}
