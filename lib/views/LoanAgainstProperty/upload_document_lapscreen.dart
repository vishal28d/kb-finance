// ignore_for_file: must_be_immutable
//flutter
import 'package:credit_app/controllers/imageController.dart';
import 'package:credit_app/controllers/loan_against_property_controller.dart';
import 'package:credit_app/controllers/personal_loan_controller.dart';
import 'package:credit_app/views/SanctionedDisbursal/sanctioned_disbursal_sreen.dart';
import 'package:credit_app/widget/appBarWidget.dart';
import 'package:credit_app/widget/common_padding.dart';
import 'package:credit_app/widget/imageWidget.dart';
import 'package:credit_app/widget/primary_button.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
//models
import 'package:credit_app/widget/baseRoute.dart';
//packages
import 'package:get/get.dart';

class UploadDocumentLAPScreen extends BaseRoute {
  UploadDocumentLAPScreen({a, o}) : super(a: a, o: o, r: 'UploadDocumentLAPScreen');
  ImageControlller imageController = Get.find<ImageControlller>();

  final PersonalLoanController personalLoanController = Get.put(PersonalLoanController());
  final LoanAgainstPropertyController loanAgainstProperty = Get.find<LoanAgainstPropertyController>();

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
        child: SingleChildScrollView(child: GetBuilder<LoanAgainstPropertyController>(builder: (controller) {
          return Column(
            children: [
              Column(
                children: [
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
                              file: loanAgainstProperty.panCard,
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
                              file: loanAgainstProperty.aadharCard,
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
                        'Photographs',
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
                            imagePickerSheet('Photographs', context);
                          },
                          child: Container(
                            width: Get.width,
                            height: 250,
                            child: ImageWidget(
                              file: loanAgainstProperty.photographs,
                              name: 'Photographs',
                            ),
                          ),
                        ),
                      )),
                  GetBuilder<LoanAgainstPropertyController>(builder: (controller) {
                    return loanAgainstProperty.employemenTypeVal == 'Salaried'
                        ? Column(
                            children: [
                              Container(
                                width: Get.width,
                                child: Padding(
                                  padding: EdgeInsets.only(top: 15),
                                  child: Text(
                                    'Employement Documents',
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
                                          name: 'Employement Documents',
                                        ),
                                      ),
                                    ),
                                  )),
                            ],
                          )
                        : SizedBox();
                  }),
                  GetBuilder<LoanAgainstPropertyController>(builder: (controller) {
                    return loanAgainstProperty.employemenTypeVal == 'Self-employed'
                        ? Column(
                            children: [
                              Container(
                                width: Get.width,
                                child: Padding(
                                  padding: EdgeInsets.only(top: 15),
                                  child: Text(
                                    'Company Documents',
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
                                          name: 'Company Documents',
                                        ),
                                      ),
                                    ),
                                  )),
                            ],
                          )
                        : SizedBox();
                  }),
                  Container(
                    width: Get.width,
                    child: Padding(
                      padding: EdgeInsets.only(top: 15),
                      child: Text(
                        'Property Documents',
                        style: Theme.of(context).primaryTextTheme.displayLarge,
                      ),
                    ),
                  ),
                  Container(
                    width: Get.width,
                    child: Padding(
                      padding: EdgeInsets.only(top: 15),
                      child: Text(
                        'Site Plan',
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
                              name: 'Site Plan',
                            ),
                          ),
                        ),
                      )),
                  Container(
                    width: Get.width,
                    child: Padding(
                      padding: EdgeInsets.only(top: 15),
                      child: Text(
                        'Patta',
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
                              name: 'Patta',
                            ),
                          ),
                        ),
                      )),
                  Container(
                    width: Get.width,
                    child: Padding(
                      padding: EdgeInsets.only(top: 15),
                      child: Text(
                        'Buyer Agreement',
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
                              name: 'Buyer Agreement',
                            ),
                          ),
                        ),
                      )),
                  Container(
                    width: Get.width,
                    child: Padding(
                      padding: EdgeInsets.only(top: 15),
                      child: Text(
                        'Chain Documents',
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
                              name: 'Chain Documents',
                            ),
                          ),
                        ),
                      )),
                  Container(
                    width: Get.width,
                    child: Padding(
                      padding: EdgeInsets.only(top: 15),
                      child: Text(
                        'Documents for existing property',
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
                              name: 'Documents for existing property',
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
