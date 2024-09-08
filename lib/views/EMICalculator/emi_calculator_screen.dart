// ignore_for_file: must_be_immutable

import 'dart:math';
import 'package:credit_app/controllers/emi_calculator_controller.dart';
import 'package:credit_app/widget/appBarWidget.dart';
import 'package:credit_app/widget/baseRoute.dart';
import 'package:credit_app/widget/common_padding.dart';
import 'package:credit_app/widget/custom_textformfield.dart';
import 'package:credit_app/widget/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class EmiCalculatorScreen extends BaseRoute {
  EmiCalculatorScreen({a, o}) : super(a: a, o: o, r: 'EmiCalculatorScreen');
  final EmiCalculatorController emiCalculatorController = Get.find<EmiCalculatorController>();

  var emiResult = 0.0;

  // Single function to calculate EMI and update the result
  void calculateAndSetEMI() {
    double principal = double.parse(emiCalculatorController.loanamount1.text);
    double annualInterestRate = double.parse(emiCalculatorController.interestrate1.text);
    int tenureMonths = int.parse(emiCalculatorController.duration1.text);

    // EMI calculation logic
    double monthlyInterestRate = annualInterestRate / 12 / 100;
    double emi = (principal * monthlyInterestRate * pow(1 + monthlyInterestRate, tenureMonths)) /
        (pow(1 + monthlyInterestRate, tenureMonths) - 1);

    emiResult = emi;
    print(emiResult) ;
    // Update the UI using GetX
    emiCalculatorController.update(); 
  }

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
        title: Text('EMI Calculator'),
        centerTitle: true,
      ),
      body: GetBuilder<EmiCalculatorController>(
        builder: (_) => CommonPadding(
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
                          'Loan Amount',
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ),

                      Padding(
                        padding: EdgeInsets.only(top: 8),
                        child: CustomTextFormField(
                          hintText: "Enter loan amount",
                          textEditingController: emiCalculatorController.loanamount1,
                          obscureText: false,
                          key: key,
                          textInputType: TextInputType.numberWithOptions(signed: true, decimal: true),
                          onEditingComplete: () {
                            FocusScope.of(context).requestFocus(
                              emiCalculatorController.finterestrate1,
                            );
                          },
                        ),
                      ),

                      Padding(
                        padding: EdgeInsets.only(top: 15),
                        child: Text(
                          'Interest Rate (%)',
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 8),
                        child: CustomTextFormField(
                          hintText: "Enter interest rate",
                          textEditingController: emiCalculatorController.interestrate1,
                          focusnode: emiCalculatorController.finterestrate1,
                          obscureText: false,
                          key: key,
                          textInputType: TextInputType.numberWithOptions(signed: true, decimal: true),
                          onEditingComplete: () {
                            FocusScope.of(context).requestFocus(
                              emiCalculatorController.fduration1,
                            );
                          },
                        ),
                      ),
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
                          hintText: "Enter duration",
                          textEditingController: emiCalculatorController.duration1,
                          focusnode: emiCalculatorController.fduration1,
                          obscureText: false,
                          key: key,
                          textInputType: TextInputType.numberWithOptions(signed: true, decimal: true),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(top: 15, bottom: 15),
                        child: PrimaryTextButton(
                          text: "Calculate",
                          voidCallback: () {
                              calculateAndSetEMI();
                          },
                        ), 
                      ),

                      SizedBox(height: 5,) ,

                        Padding(
                         padding: const EdgeInsets.all(10.0),
                       child: emiResult!=0 ? Text( "Your EMI is: ₹ ${emiResult.toStringAsFixed(2)}" , style: TextStyle(color: Colors.black, fontSize: 20),) : Container() ,
                        
                      ) ,
                
                       
                    ],
                  ),
                ),
     
              ],


            ),
          ),
        ),
      ),
    );
  }
}
