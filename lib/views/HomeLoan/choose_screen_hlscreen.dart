// ignore_for_file: camel_case_types
//flutter
import 'package:credit_app/controllers/business_loan_controller.dart';
import 'package:credit_app/controllers/home_loan_controller.dart';
import 'package:credit_app/views/HomeLoan/basic_detail_entry_hlscreen6.dart';
import 'package:credit_app/widget/appBarWidget.dart';
import 'package:credit_app/widget/common_padding.dart';
import 'package:credit_app/widget/primary_button.dart';
import 'package:flutter/material.dart';
//models
import 'package:credit_app/widget/baseRoute.dart';
//packages
import 'package:get/get.dart';

class chooseScreenHLScreen extends BaseRoute {
  chooseScreenHLScreen({a, o}) : super(a: a, o: o, r: 'chooseScreenHLScreen');

  final BusinessLoanController businessLoanController = Get.find<BusinessLoanController>();
  final HomeLoanController homeLoanController = Get.find<HomeLoanController>();

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
                Get.to(() => BasicDetailEntryHLScreen(
                      a: a,
                      o: o,
                    ));
              },
            ),
          ),
        ),
        body: GetBuilder<HomeLoanController>(builder: (controller) {
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
                    'Home Loan',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 50),
                  child: Text(
                    'Select type of loan',
                    style: Theme.of(context).primaryTextTheme.displayLarge,
                  ),
                ),
                RadioListTile(
                  dense: true,
                  value: 1,
                  groupValue: homeLoanController.loanType,
                  onChanged: (value) {
                    homeLoanController.setLoanType(value!);
                  },
                  title: Text("New Loan", style: Theme.of(context).textTheme.bodyLarge),
                ),
                RadioListTile(
                  dense: true,
                  value: 2,
                  groupValue: homeLoanController.loanType,
                  onChanged: (value) {
                    homeLoanController.setLoanType(value!);
                  },
                  title: Text("Transfer Existing Loan", style: Theme.of(context).textTheme.bodyLarge),
                )
              ],
            )),
          );
        }));
  }
}
