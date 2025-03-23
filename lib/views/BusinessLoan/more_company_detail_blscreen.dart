// ignore_for_file: must_be_immutable
//flutter
import 'package:credit_app/controllers/business_loan_controller.dart';
import 'package:credit_app/views/BusinessLoan/director_entry_screen.dart';
import 'package:credit_app/views/BusinessLoan/partner_entry_screen.dart';
import 'package:credit_app/views/businessLoan/upload_document_blscreen.dart';
import 'package:credit_app/widget/appBarWidget.dart';
import 'package:credit_app/widget/common_padding.dart';
import 'package:credit_app/widget/custom_textformfield.dart';
import 'package:credit_app/widget/primary_button.dart';
import 'package:flutter/material.dart';
//controllers
import 'package:credit_app/controllers/splashController.dart';
//models
import 'package:credit_app/widget/baseRoute.dart';
//packages
import 'package:get/get.dart';

class MoreCompanyDetailEntryBLScreen extends BaseRoute {
  MoreCompanyDetailEntryBLScreen({a, o}) : super(a: a, o: o, r: 'MoreCompanyDetailEntryBLScreen');

  final SplashController customerController = Get.put(SplashController());
  BusinessLoanController businessLoanController = Get.find<BusinessLoanController>();
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
                businessLoanController.companyTypeVal == 'Partnership' || businessLoanController.companyTypeVal == 'LLP'
                    ? Get.to(() => PartnerListEntryBLScreen(
                          a: a,
                          o: o,
                        ))
                    : businessLoanController.companyTypeVal == 'Pvt.Ltd'
                        ? Get.to(() => DirectorListEntryBLScreen(
                              a: a,
                              o: o,
                            ))
                        : Get.to(() => UploadDocumentBLScreen(
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
            title: Text('More Company Detail'),
            centerTitle: true,
            leading: IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: Icon(Icons.arrow_back_ios))),
        body: CommonPadding(
          child: SingleChildScrollView(child: GetBuilder<BusinessLoanController>(builder: (controller) {
            return Column(children: [
              Column(
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
                    ),
                  ),
                ],
              )
            ]);
          })),
        ));
  }
}
