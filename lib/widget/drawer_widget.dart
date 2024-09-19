// ignore_for_file: must_be_immutable
import 'package:credit_app/controllers/bottom_nav_controller.dart';
import 'package:credit_app/controllers/loan_compare_controller.dart';
import 'package:credit_app/views/CibilScore/cibili_score_check_screen.dart';
import 'package:credit_app/views/CustomerService/customer_service.dart';
import 'package:credit_app/views/EMICalculator/emi_calculator_screen.dart';
import 'package:credit_app/views/LoanCompare/loan_compare_screen.dart';
import 'package:credit_app/views/LoanEligibility/check_loan_eligibility_screen.dart';
import 'package:credit_app/views/Login/login_screen.dart';
import 'package:credit_app/views/Refer&Earn/refer_and_earn_screen.dart';
import 'package:credit_app/views/Rewards/reward_screen.dart';
import 'package:credit_app/views/Setting/setting_screen.dart';
import 'package:credit_app/views/Wallet/wallet_screen.dart';
import 'package:credit_app/widget/baseRoute.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class DrawerWidget extends BaseRoute {
  DrawerWidget({a, o}) : super(a: a, o: o, r: 'DrawerWidget');

  final LoanCompareController loanCompareController = Get.find<LoanCompareController>();
  BottomNavController bottomNavController = Get.find<BottomNavController>();
  double titleGap = -5;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: Container(
          color: Colors.white,
          child: ListView(
            children: [
              Container(
                height: 120,
                color: Theme.of(context).primaryColor,
                child: Center(
                  child: ListTile(
                    horizontalTitleGap: -10,
                    contentPadding: EdgeInsets.all(0),
                    leading: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 50,
                      child: Icon(
                        Icons.person,
                        size: 45,
                      ),
                    ),
                    title: Text(
                      'Alex Smith',
                      style: Theme.of(context).primaryTextTheme.headlineSmall,
                    ),
                    subtitle: Text(
                      '9525098250',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 0),
                child: ListTile(
                  horizontalTitleGap: titleGap,
                  leading: Icon(
                    FontAwesomeIcons.house,
                    color: Colors.black,
                    size: 20,
                  ),
                  title: Text(
                    'Home 1',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  onTap: () {
                    bottomNavController.setHome2();
                    Get.back();
                  },
                  trailing: Icon(Icons.arrow_forward_ios),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 0),
                child: ListTile(
                  horizontalTitleGap: titleGap,
                  leading: Icon(
                    FontAwesomeIcons.house,
                    color: Colors.black,
                    size: 20,
                  ),
                  title: Text(
                    'Home 2',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  onTap: () {
                    bottomNavController.setHome();
                    Get.back();
                  },
                  trailing: Icon(Icons.arrow_forward_ios),
                ),
              ),
              Divider(),
              Padding(
                padding: const EdgeInsets.only(top: 0),
                child: ListTile(
                  horizontalTitleGap: titleGap,
                  leading: const Icon(
                    FontAwesomeIcons.calculator,
                    color: Colors.black,
                    size: 20,
                  ),
                  title: Text(
                    'EMI Calculator',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  onTap: () {
                    Get.to(() => (EmiCalculatorScreen(
                        
                        )));
                  },
                  trailing: Icon(Icons.arrow_forward_ios),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 0),
                child: ListTile(
                  horizontalTitleGap: titleGap,
                  leading: const Icon(
                    FontAwesomeIcons.handPointUp,
                    color: Colors.black,
                    size: 20,
                  ),
                  title: Text(
                    'Check CIBIL Score',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  onTap: () {
                    Get.to(() => (CheckCIBILScoreScreen(
                          a: a,
                          o: o,
                        )));
                  },
                  trailing: Icon(Icons.arrow_forward_ios),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 0),
                child: ListTile(
                  horizontalTitleGap: titleGap,
                  leading: const Icon(
                    FontAwesomeIcons.solidCreditCard,
                    color: Colors.black,
                    size: 20,
                  ),
                  title: Text(
                    'Loan Eligibility',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  onTap: () {
                    Get.to(() => (CheckLoanEligibilityScreen(
                          a: a,
                          o: o,
                        )));
                  },
                  trailing: Icon(Icons.arrow_forward_ios),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 0),
                child: ListTile(
                  horizontalTitleGap: titleGap,
                  leading: const Icon(
                    Icons.compare_sharp,
                    color: Colors.black,
                    size: 20,
                  ),
                  title: Text(
                    'Compare Loan',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  onTap: () {
                    loanCompareController.loanamount.text = "100000";
                    loanCompareController.tenure.text = "12";
                    Get.to(() => (LoanCompareScreen(
                          a: a,
                          o: o,
                        )));
                  },
                  trailing: Icon(Icons.arrow_forward_ios),
                ),
              ),
              Divider(),
              Padding(
                padding: const EdgeInsets.only(top: 0),
                child: ListTile(
                  horizontalTitleGap: titleGap,
                  leading: Icon(
                    FontAwesomeIcons.wallet,
                    color: Colors.black,
                    size: 20,
                  ),
                  title: Text(
                    'Wallet',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  onTap: () {
                    Get.to(() => (MyWalletScreen(
                          a: a,
                          o: o,
                        )));
                  },
                  trailing: Icon(Icons.arrow_forward_ios),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 0),
                child: ListTile(
                  horizontalTitleGap: titleGap,
                  leading: const Icon(
                    FontAwesomeIcons.trophy,
                    color: Colors.black,
                    size: 20,
                  ),
                  title: Text(
                    'Rewards',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  onTap: () {
                    Get.to(() => (RewardScreen(
                          a: a,
                          o: o,
                        )));
                  },
                  trailing: Icon(Icons.arrow_forward_ios),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 0),
                child: ListTile(
                  horizontalTitleGap: titleGap,
                  leading: const Icon(
                    FontAwesomeIcons.share,
                    color: Colors.black,
                    size: 20,
                  ),
                  title: Text(
                    'Refer & Earn',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  onTap: () {
                    Get.to(() => (ReferralAndEarnScreen(
                          a: a,
                          o: o,
                        )));
                  },
                  trailing: Icon(Icons.arrow_forward_ios),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 0),
                child: ListTile(
                  horizontalTitleGap: titleGap,
                  leading: Icon(
                    MdiIcons.faceAgent,
                    color: Colors.black,
                    size: 20,
                  ),
                  title: Text(
                    'Customer Service',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  onTap: () {
                    Get.to(() => CustomerServiceScreen(
                          a: a,
                          o: o,
                        ));
                  },
                  trailing: Icon(Icons.arrow_forward_ios),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 0),
                child: ListTile(
                  horizontalTitleGap: titleGap,
                  leading: const Icon(
                    Icons.settings,
                    color: Colors.black,
                    size: 20,
                  ),
                  title: Text(
                    'Settings',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  onTap: () {
                    Get.to(() => SettingScreen(
                          a: a,
                          o: o,
                        ));
                  },
                  trailing: Icon(Icons.arrow_forward_ios),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 0),
                child: ListTile(
                  horizontalTitleGap: titleGap,
                  leading: const Icon(FontAwesomeIcons.rightFromBracket, color: Colors.black, size: 20),
                  title: Text(
                    'Sign Out',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  onTap: () {
                    Get.defaultDialog(
                      title: "Sign Out",
                      middleText: 'Are you sure you want to signout',
                      backgroundColor: Colors.white,
                      titleStyle: TextStyle(color: Colors.black),
                      middleTextStyle: TextStyle(color: Colors.black),
                      textConfirm: "Yes",
                      onConfirm: () {
                        Get.to(() => (LoginScreen(
                              a: a,
                              o: o,
                            )));
                      },
                      textCancel: "No",
                      onCancel: () {},
                      cancelTextColor: Colors.white,
                      confirmTextColor: Colors.white,
                      buttonColor: Theme.of(context).primaryColor,
                      barrierDismissible: true,
                      radius: 10,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
