// ignore_for_file: must_be_immutable
//flutter
import 'package:credit_app/views/BusinessLoan/choose_screen_blscreen.dart';
import 'package:credit_app/views/HomeLoan/choose_screen_hlscreen.dart';
import 'package:credit_app/views/LoanAgainstProperty/choose_screen_lapscreen.dart';
import 'package:credit_app/views/OtherLoan/other_loan_screen.dart';
import 'package:credit_app/views/OtherServices/other_service.dart';
import 'package:credit_app/views/PersonalLoan/personal_loan_basic_detail_entry_plscreen3.dart';
import 'package:credit_app/widget/appBarWidget.dart';
import 'package:credit_app/widget/drawer_widget.dart';
import 'package:credit_app/widget/elevated_button_widget.dart';
import 'package:credit_app/utils/global.dart' as global;
import 'package:flutter/material.dart';
//controllers
import 'package:credit_app/controllers/splashController.dart';
//models
import 'package:credit_app/widget/baseRoute.dart';
//packages
import 'package:get/get.dart';

class HomeScreen extends BaseRoute {
  HomeScreen({a, o}) : super(a: a, o: o, r: 'HomeScreen');

  final SplashController customerController = Get.put(SplashController());
  List<String> titleList = ['Personal Loan', 'Business Loan', 'Home Loan', 'Loan against property', 'Other Loan', 'Other Services'];
  List<String> subTitle = ['Get up to ${global.currencySymbol}20 lac for 72 months EMI', 'Get up to ${global.currencySymbol}20 lac for 72 months EMI', 'Get up to ${global.currencySymbol}20 lac for 72 months EMI', 'Get up to ${global.currencySymbol}20 lac for 72 months EMI', 'Get up to ${global.currencySymbol}20 lac for 72 months EMI', 'Get up to ${global.currencySymbol}20 lac for 72 months EMI'];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return Future.value(true);
      },
      child: Scaffold(
          drawer: DrawerWidget(
            a: a,
            o: o,
          ),
          backgroundColor: Colors.grey[100],
          appBar: MyCustomAppBar(
            height: 80,
            appbarPadding: 0,
            title: Text('Home'),
            centerTitle: true,
          ),
          body: Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Padding(
              padding: EdgeInsets.only(left: 15, right: 15, bottom: 5),
              child: ListView.builder(
                  itemCount: 6,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      margin: EdgeInsets.only(top: 10, bottom: 10),
                      width: Get.width,
                      height: 150,
                      child: Card(
                        child: Stack(
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: 20, top: 20),
                              width: Get.width,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '${titleList[index]}',
                                        style: Theme.of(context).textTheme.headlineSmall,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 5),
                                        child: Container(
                                            width: Get.width - 80,
                                            child: Text(
                                              '${subTitle[index]}',
                                              style: Theme.of(context).primaryTextTheme.displayMedium,
                                            )),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 20),
                                    child: ElevatedButtonWIdget(
                                      voidCallback: () {
                                        if (index == 0) {
                                          Get.to(() => BasicDetailEntryPLScreen(
                                                a: a,
                                                o: o,
                                              ));
                                        } else if (index == 1) {
                                          Get.to(() => ChooseScreenBLScreen(
                                                a: a,
                                                o: o,
                                              ));
                                        } else if (index == 2) {
                                          Get.to(() => chooseScreenHLScreen(
                                                a: a,
                                                o: o,
                                              ));
                                        } else if (index == 3) {
                                          Get.to(() => chooseScreenLAPScreen(
                                                a: a,
                                                o: o,
                                              ));
                                        } else if (index == 4) {
                                          Get.to(() => OtherLoanScreen(
                                                a: a,
                                                o: o,
                                              ));
                                        } else if (index == 5) {
                                          Get.to(() => OtherServicesScreen(
                                                a: a,
                                                o: o,
                                              ));
                                        }
                                      },
                                      child: Text('Apply'),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Positioned(
                                bottom: 0,
                                right: 0,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.only(bottomRight: Radius.circular(16)),
                                  child: Container(
                                    decoration: BoxDecoration(image: DecorationImage(image: AssetImage('assets/homescreen.jpg'), fit: BoxFit.cover)),
                                    width: 110,
                                    height: 80,
                                  ),
                                ))
                          ],
                        ),
                      ),
                    );
                  }),
            ),
          )),
    );
  }
}
