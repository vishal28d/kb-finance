//flutter
import 'package:credit_app/widget/appBarWidget.dart';
import 'package:credit_app/widget/baseRoute.dart';
import 'package:credit_app/widget/common_padding.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AboutUsScreen extends BaseRoute {
  AboutUsScreen({a, o}) : super(a: a, o: o, r: 'AboutUsScreen');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: MyCustomAppBar(
          leading: IconButton(
            onPressed: () {
              Get.back();
              //Get.back();
            },
            icon: Icon(
              Icons.arrow_back_ios,
              size: 20,
            ),
          ),
          height: 80,
          appbarPadding: 0,
          title: Text('About Us'),
          centerTitle: true,
        ),
        body: CommonPadding(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 30),
                        width: MediaQuery.of(context).size.width,
                        child: Padding(
                          padding: EdgeInsets.all(0),
                          child: Text(
                            'In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before final copy is available.In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before final copy is available.',
                            style: Theme.of(context).primaryTextTheme.displayMedium,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
