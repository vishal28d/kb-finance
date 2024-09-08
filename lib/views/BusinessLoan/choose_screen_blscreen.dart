//flutter
import 'package:credit_app/controllers/business_loan_controller.dart';
import 'package:credit_app/views/businessLoan/basic_detail_entry_blscreen2.dart';
import 'package:credit_app/widget/appBarWidget.dart';
import 'package:credit_app/widget/common_padding.dart';
import 'package:credit_app/widget/primary_button.dart';
import 'package:flutter/material.dart';
//models
import 'package:credit_app/widget/baseRoute.dart';
//packages
import 'package:get/get.dart';

class ChooseScreenBLScreen extends BaseRoute {
  ChooseScreenBLScreen({a, o}) : super(a: a, o: o, r: 'ChooseScreenBLScreen');

  final BusinessLoanController businessLoanController = Get.find<BusinessLoanController>();

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
                Get.to(() => BasicDetailEntryBLScreen(
                      a: a,
                      o: o,
                    ));
              },
            ),
          ),
        ),
        body: GetBuilder<BusinessLoanController>(builder: (controller) {
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
                  child: Text('Select type of loan', style: Theme.of(context).primaryTextTheme.displayLarge),
                ),
                RadioListTile(
                  dense: true,
                  value: 1,
                  groupValue: businessLoanController.loanType,
                  onChanged: (value) {
                    businessLoanController.setLoanType(value!);
                  },
                  title: Text("New Loan", style: Theme.of(context).textTheme.bodyLarge),
                ),
                RadioListTile(
                  dense: true,
                  value: 2,
                  groupValue: businessLoanController.loanType,
                  onChanged: (value) {
                    businessLoanController.setLoanType(value!);
                  },
                  title: Text("Transfer Existing Loan", style: Theme.of(context).textTheme.bodyLarge),
                )
              ],
            )),
          );
        }));
  }
}
