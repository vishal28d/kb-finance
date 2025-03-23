// ignore_for_file: must_be_immutable
//flutter
import 'package:credit_app/views/OtherServices/other_service_entry_screen.dart';
import 'package:credit_app/views/bottom_navigation_screen.dart';
import 'package:credit_app/widget/appBarWidget.dart';
import 'package:credit_app/widget/common_padding.dart';
import 'package:flutter/material.dart';
//controllers
import 'package:credit_app/controllers/splashController.dart';
//models
import 'package:credit_app/widget/baseRoute.dart';
//packages
import 'package:get/get.dart';

class OtherServicesScreen extends BaseRoute {
  OtherServicesScreen({a, o}) : super(a: a, o: o, r: 'OtherServicesScreen');

  final SplashController customerController = Get.put(SplashController());
  List<String> titleList = [
    'Mutual Fund',
    'Health Insurance',
    'Life Insurance',
    'Credit Card',
  ];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        Get.to(() => BottomNavigationScreen(
              a: a,
              o: o,
            ));
        return Future.value(true);
      },
      child: Scaffold(
          backgroundColor: Colors.grey[100],
          appBar: MyCustomAppBar(
            height: 80,
            leading: IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: Icon(Icons.arrow_back_ios)),
            appbarPadding: 0,
            title: Text('Other Services'),
            centerTitle: true,
          ),
          body: Padding(
            padding: const EdgeInsets.only(top: 10),
            child: CommonPadding(
                child: ListView.builder(
                    itemCount: 4,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        margin: EdgeInsets.only(top: 07, bottom: 07),
                        width: Get.width,
                        child: Card(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                          child: GestureDetector(
                            onTap: () {
                              Get.to(() => OtherServicesEntryScreen(
                                    a: a,
                                    o: o,
                                  ));
                            },
                            child: Container(
                              color: Colors.transparent,
                              margin: const EdgeInsets.all(15.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    '${titleList[index]}',
                                    style: Theme.of(context).primaryTextTheme.displayLarge,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(),
                                    child: Icon(Icons.arrow_forward_ios),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    })),
          )),
    );
  }
}
