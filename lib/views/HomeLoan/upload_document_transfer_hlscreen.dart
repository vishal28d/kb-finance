//flutter
// ignore_for_file: must_be_immutable

import 'package:credit_app/controllers/home_loan_controller.dart';
import 'package:credit_app/controllers/imageController.dart';
import 'package:credit_app/controllers/personal_loan_controller.dart';
import 'package:credit_app/views/SanctionedDisbursal/sanctioned_disbursal_sreen.dart';
import 'package:credit_app/widget/appBarWidget.dart';
import 'package:credit_app/widget/common_padding.dart';
import 'package:credit_app/widget/custom_textformfield.dart';
import 'package:credit_app/widget/imageWidget.dart';
import 'package:credit_app/widget/primary_button.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
//models
import 'package:credit_app/widget/baseRoute.dart';
//packages
import 'package:get/get.dart';

class UploadDocumentTransferHLScreen extends BaseRoute {
  UploadDocumentTransferHLScreen({a, o}) : super(a: a, o: o, r: 'UploadDocumentTransferHLScreen');
  ImageControlller imageController = Get.find<ImageControlller>();

  final PersonalLoanController personalLoanController = Get.put(PersonalLoanController());
  final HomeLoanController homeLoanController = Get.find<HomeLoanController>();

  imagePickerSheet(String imageName, context) {
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
      bottomNavigationBar: CommonPadding(
        child: PrimaryTextButton(
          text: 'Next',
          voidCallback: () {
            Get.to(() => SanctionedDisbursalScreen(
                  a: a,
                  o: o,
                ));
          },
        ),
      ),
      appBar: MyCustomAppBar(
        height: 80,
        appbarPadding: 0,
        title: Text('Upload Document'),
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(Icons.arrow_back_ios)),
      ),
      body: CommonPadding(
        child: SingleChildScrollView(child: GetBuilder<PersonalLoanController>(builder: (controller) {
          return Column(
            children: [
              Column(
                children: [
                  Container(
                    width: Get.width,
                    child: Padding(
                      padding: EdgeInsets.only(top: 15),
                      child: Text(
                        'Personal Infomation',
                        style: Theme.of(context).primaryTextTheme.displayLarge,
                      ),
                    ),
                  ),
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
                      obscureText: false,
                    ),
                  ),
                  Container(
                    width: Get.width,
                    child: Padding(
                      padding: EdgeInsets.only(top: 15),
                      child: Text(
                        'Mother Name',
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
                  GetBuilder<HomeLoanController>(builder: (controller) {
                    return homeLoanController.employemenTypeVal == 'Salaried'
                        ? Column(
                            children: [
                              Container(
                                width: Get.width,
                                child: Padding(
                                  padding: EdgeInsets.only(top: 15),
                                  child: Text(
                                    'Employer Detail',
                                    style: Theme.of(context).primaryTextTheme.displayLarge,
                                  ),
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
                                ),
                              ),
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
                                    'Company Detail',
                                    style: Theme.of(context).primaryTextTheme.displayLarge,
                                  ),
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
                              )
                            ],
                          )
                        : SizedBox();
                  }),
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
                      child: DottedBorder(
                        strokeWidth: 1,
                        color: Theme.of(context).primaryColor,
                        child: GestureDetector(
                          onTap: () {
                            imagePickerSheet('PAN Card', context);
                          },
                          child: Container(
                            width: Get.width,
                            height: 250,
                            child: ImageWidget(
                              file: homeLoanController.panCard,
                              name: 'PAN Card',
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
                            imagePickerSheet('Aadhar Card', context);
                          },
                          child: Container(
                            width: Get.width,
                            height: 250,
                            child: ImageWidget(
                              file: homeLoanController.aadharCard,
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
                        'Bank Statement',
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
                              name: 'Bank Statement',
                            ),
                          ),
                        ),
                      )),
                  Container(
                    width: Get.width,
                    child: Padding(
                      padding: EdgeInsets.only(top: 15),
                      child: Text(
                        'ITR returns',
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
                              name: 'ITR returns',
                            ),
                          ),
                        ),
                      )),
                  Container(
                    width: Get.width,
                    child: Padding(
                      padding: EdgeInsets.only(top: 15),
                      child: Text(
                        'Property Documents',
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
                              name: 'Property Documents',
                            ),
                          ),
                        ),
                      )),
                  Container(
                    width: Get.width,
                    child: Padding(
                      padding: EdgeInsets.only(top: 15),
                      child: Text(
                        'Lod',
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
                              name: 'Lod',
                            ),
                          ),
                        ),
                      )),
                  Container(
                    width: Get.width,
                    child: Padding(
                      padding: EdgeInsets.only(top: 15),
                      child: Text(
                        'Existing loan documents',
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
                              name: 'Existing loan documents',
                            ),
                          ),
                        ),
                      )),
                ],
              ),
            ],
          );
        })),
      ),
    );
  }
}
