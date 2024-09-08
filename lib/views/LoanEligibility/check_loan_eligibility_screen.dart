import 'package:credit_app/controllers/check_loan_eligibility_controller.dart';
import 'package:credit_app/widget/appBarWidget.dart';
import 'package:credit_app/widget/baseRoute.dart';
import 'package:credit_app/widget/common_padding.dart';
import 'package:credit_app/widget/custom_textformfield.dart';
import 'package:credit_app/widget/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckLoanEligibilityScreen extends BaseRoute {
  CheckLoanEligibilityScreen({a, o}) : super(a: a, o: o, r: 'CheckLoanEligibilityScreen');

  final LoanEligibilityController loanEligibilityController = Get.find<LoanEligibilityController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyCustomAppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            Icons.arrow_back_ios,
            size: 20,
          ),
        ),
        height: 80,
        appbarPadding: 0,
        title: Text('Loan Eligibility'),
        centerTitle: true,
      ),
      body: GetBuilder<LoanEligibilityController>(
        builder: (_) => (CommonPadding(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 15),
                        child: Text(
                          'Tenure (Months)',
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 8),
                        child: CustomTextFormField(
                          hintText: "enter duration",
                          textEditingController: loanEligibilityController.tenure,
                          obscureText: false,
                          key: key,
                          textInputType: TextInputType.numberWithOptions(signed: true, decimal: true),
                          onEditingComplete: () {
                            FocusScope.of(context).requestFocus(
                              loanEligibilityController.floanamount,
                            );
                          },
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 15),
                        child: Text(
                          'Loan Amount',
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 8),
                        child: CustomTextFormField(
                          hintText: "enter loan amount",
                          textEditingController: loanEligibilityController.loanamount,
                          focusnode: loanEligibilityController.floanamount,
                          obscureText: false,
                          key: key,
                          textInputType: TextInputType.numberWithOptions(signed: true, decimal: true),
                          onEditingComplete: () {
                            FocusScope.of(context).requestFocus(
                              loanEligibilityController.fannualintesrstrate,
                            );
                          },
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 15),
                        child: Text(
                          'Annual Interest Rate(%)',
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 8),
                        child: CustomTextFormField(
                          hintText: "enter annual intesrst rate",
                          textEditingController: loanEligibilityController.annualintesrstrate,
                          focusnode: loanEligibilityController.fannualintesrstrate,
                          obscureText: false,
                          key: key,
                          textInputType: TextInputType.numberWithOptions(signed: true, decimal: true),
                          onEditingComplete: () {
                            FocusScope.of(context).requestFocus(
                              loanEligibilityController.fmonthlyemiamount,
                            );
                          },
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 15),
                        child: Text(
                          'Total Monthly EMI',
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 8),
                        child: CustomTextFormField(
                          hintText: "enter monthly emi amount",
                          textEditingController: loanEligibilityController.monthlyemiamount,
                          focusnode: loanEligibilityController.fmonthlyemiamount,
                          obscureText: false,
                          key: key,
                          textInputType: TextInputType.numberWithOptions(signed: true, decimal: true),
                          onEditingComplete: () {
                            FocusScope.of(context).requestFocus();
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 15, bottom: 15),
                        child: PrimaryTextButton(
                          text: "Check",
                          voidCallback: () {},
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        )),
      ),
    );
  }
}
