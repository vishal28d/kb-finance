// ignore_for_file: camel_case_types
//flutter
import 'package:credit_app/controllers/business_loan_controller.dart';
import 'package:credit_app/controllers/loan_against_property_controller.dart';
import 'package:credit_app/views/LoanAgainstProperty/basic_detail_entry_lapscreen6.dart';
import 'package:credit_app/widget/appBarWidget.dart';
import 'package:credit_app/widget/common_padding.dart';
import 'package:credit_app/widget/primary_button.dart';
import 'package:flutter/material.dart';
//models
import 'package:credit_app/widget/baseRoute.dart';
//packages
import 'package:get/get.dart';

class chooseScreenLAPScreen extends BaseRoute {
  chooseScreenLAPScreen({a, o}) : super(a: a, o: o, r: 'chooseScreenLAPScreen');

  final BusinessLoanController businessLoanController = Get.find<BusinessLoanController>();
  final LoanAgainstPropertyController loanAgainstProperty = Get.find<LoanAgainstPropertyController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: MyCustomAppBar(
          leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Icon(Icons.arrow_back_ios)),
          height: 80,
          appbarPadding: 0,
        ),
        bottomNavigationBar: Padding(
          padding: EdgeInsets.only(bottom: 0),
          child: CommonPadding(
            child: PrimaryTextButton(
              text: 'Next',
              voidCallback: () {
                Get.to(() => BasicDetailEntryLAPScreen(
                      a: a,
                      o: o,
                    ));
              },
            ),
          ),
        ),
        body: GetBuilder<LoanAgainstPropertyController>(builder: (controller) {
          return Padding(
            padding: const EdgeInsets.only(top: 30),
            child: CommonPadding(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'What are you interested in?',
                  style: Theme.of(context).primaryTextTheme.displayLarge,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Text(
                    'Loan Against Property Loan',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 50),
                  child: Text('Select type of loan', style: Theme.of(context).primaryTextTheme.displayLarge),
                ),
                RadioListTile(
                  dense: true,
                  value: 1,
                  groupValue: loanAgainstProperty.loanType,
                  onChanged: (value) {
                    loanAgainstProperty.setLoanType(value!);
                  },
                  title: Text("New Loan", style: Theme.of(context).textTheme.bodyLarge),
                ),
                RadioListTile(
                  dense: true,
                  value: 2,
                  groupValue: loanAgainstProperty.loanType,
                  onChanged: (value) {
                    loanAgainstProperty.setLoanType(value!);
                  },
                  title: Text("Transfer Existing Loan", style: Theme.of(context).textTheme.bodyLarge),
                )
              ],
            )),
          );
        }));
  }
}
