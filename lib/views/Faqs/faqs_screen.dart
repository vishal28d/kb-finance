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

class FaqsScreen extends BaseRoute {
  FaqsScreen({a, o}) : super(a: a, o: o, r: 'FaqsScreen');
  final SplashController customerController = Get.put(SplashController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: MyCustomAppBar(
          height: 80,
          appbarPadding: 0,
          leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Icon(Icons.arrow_back_ios)),
          title: Text('FAQs'),
          centerTitle: true,
        ),
        body: CommonPadding(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 15),
                  child: Text(
                    'FAQs:',
                    style: Theme.of(context).primaryTextTheme.displayLarge,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10),
                  child: ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: 5,
                      itemBuilder: (BuildContext contex, int index) {
                        return Theme(
                          data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
                          child: ExpansionTile(
                            tilePadding: EdgeInsets.all(0),
                            title: Text(
                              'What are the benifits of this app?',
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                            children: [Text('In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content', style: Theme.of(context).primaryTextTheme.displaySmall)],
                          ),
                        );
                      }),
                )
              ],
            ),
          ),
        ));
  }
}
