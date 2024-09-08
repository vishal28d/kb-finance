// ignore_for_file: must_be_immutable
//flutter
import 'package:credit_app/widget/appBarWidget.dart';
import 'package:credit_app/widget/common_padding.dart';
import 'package:flutter/material.dart';
//controllers
import 'package:credit_app/controllers/splashController.dart';
//models
import 'package:credit_app/widget/baseRoute.dart';
//packages
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class NotApprovedScreen extends BaseRoute {
  //a - analytics
  //o - observer
  NotApprovedScreen({a, o}) : super(a: a, o: o, r: 'NotApprovedScreen');

  final SplashController customerController = Get.put(SplashController());
  List<String> reasonTitles = ['Profile not eligible', 'Missed EMI payments'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: MyCustomAppBar(
            height: 80,
            centerTitle: true,
            title: Text('Not Approved'),
            appbarPadding: 0,
            leading: IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: Icon(Icons.arrow_back_ios))),
        body: CommonPadding(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    top: 10,
                  ),
                  child: Icon(
                    MdiIcons.accountAlertOutline,
                    size: 60,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 15),
                  child: Text(
                    'Application not approved',
                    style: Theme.of(context).primaryTextTheme.headlineMedium,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: 10,
                  ),
                  child: Text(
                    'Sorry, we are not able to approve your loan application currently',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: 10,
                  ),
                  child: Text(
                    'You can re-apply after 90 days',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: 25,
                  ),
                  child: Text(
                    'Reasons:',
                    style: Theme.of(context).primaryTextTheme.displayLarge,
                  ),
                ),
                ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: 2,
                    itemBuilder: (BuildContext context, int index) {
                      return Theme(
                        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
                        child: ExpansionTile(
                          title: Text(
                            '${reasonTitles[index]}',
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 15, right: 15),
                              child: Text(
                                'In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content',
                                style: Theme.of(context).primaryTextTheme.displaySmall,
                              ),
                            )
                          ],
                        ),
                      );
                    })
              ],
            ),
          ),
        ));
  }
}
