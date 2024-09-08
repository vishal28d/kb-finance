//flutter
import 'package:credit_app/views/bottom_navigation_screen.dart';
import 'package:credit_app/widget/appBarWidget.dart';
import 'package:credit_app/widget/common_padding.dart';
import 'package:credit_app/widget/primary_button.dart';
import 'package:flutter/material.dart';
//controllers
import 'package:credit_app/controllers/splashController.dart';
//models
import 'package:credit_app/widget/baseRoute.dart';
//packages
import 'package:get/get.dart';

class SanctionedDisbursalScreen extends BaseRoute {
  SanctionedDisbursalScreen({a, o}) : super(a: a, o: o, r: 'SanctionedDisbursalScreen');

  final SplashController customerController = Get.put(SplashController());

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
          title: Text('Sanctioned & Disbursal'),
          centerTitle: true,
        ),
        bottomNavigationBar: Padding(
          padding: EdgeInsets.only(bottom: 0),
          child: CommonPadding(
            child: PrimaryTextButton(
              text: 'Go to Home',
              voidCallback: () {
                Get.to(() => BottomNavigationScreen(
                      a: a,
                      o: o,
                    ));
              },
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 30),
          child: CommonPadding(
              child: Center(
            child: Column(
              children: [
                Text(
                  'Loan Status',
                  style: Theme.of(context).primaryTextTheme.displayLarge,
                ),
                Container(
                  padding: EdgeInsets.only(top: 10, bottom: 10, left: 15, right: 15),
                  child: Text(
                    'Pending',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  margin: EdgeInsets.only(top: 10),
                  decoration: BoxDecoration(
                      color: Color(0xFFF4F5F7),
                      borderRadius: BorderRadius.all(
                        Radius.circular(5),
                      )),
                )
              ],
            ),
          )),
        ));
  }
}
