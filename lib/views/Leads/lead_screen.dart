// ignore_for_file: must_be_immutable
//flutter
import 'package:credit_app/views/Leads/add_lead_screen.dart';
import 'package:credit_app/views/Leads/lead_detail_screen.dart';
import 'package:credit_app/widget/appBarWidget.dart';
import 'package:credit_app/widget/baseRoute.dart';
import 'package:credit_app/widget/common_padding.dart';
import 'package:credit_app/utils/global.dart' as global;
import 'package:credit_app/widget/elevated_button_widget.dart';
import 'package:flutter/material.dart';
//packages
import 'package:get/get.dart';

class LeadListScreen extends BaseRoute {
  LeadListScreen({a, o}) : super(a: a, o: o, r: 'LeadListScreen');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
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
        title: Text('Leads'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Get.to(() => (AddLeadScreen(
                    a: a,
                    o: o,
                  )));
            },
            icon: Icon(
              Icons.add,
              size: 28,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 10),
        child: CommonPadding(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(child: leadList(context)),
            ],
          ),
        ),
      ),
    );
  }

  Widget leadList(context) {
    return ListView.builder(
        itemCount: 6,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            margin: EdgeInsets.only(top: 0, bottom: 8),
            width: Get.width,
            child: Card(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: 10, left: 10, bottom: 10, top: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                leadcode[index],
                                style: Theme.of(context).textTheme.headlineSmall,
                              ),
                              Text(
                                'SubDSA-DSA001',
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                            ],
                          ),
                        ),
                        Divider(
                          height: 2,
                          color: Colors.grey,
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                titleList[index],
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                              Text(
                                'Home Loan',
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                            ],
                          ),
                        ),
                        Divider(
                          height: 2,
                          color: Colors.grey,
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '9852098520',
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                              Text(
                                '${global.currencySymbol}500000',
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                            ],
                          ),
                        ),
                        Divider(
                          height: 2,
                          color: Colors.grey,
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ElevatedButtonWIdget(
                                child: Text('Call'),
                              ),
                              ElevatedButtonWIdget(
                                voidCallback: () async {
                                  await Get.to(
                                    () => LeadDetailScreen(a: a, o: o),
                                  );
                                },
                                child: Text('View'),
                              ),
                              ElevatedButtonWIdget(
                                voidCallback: () async {
                                  await Get.to(
                                    () => AddLeadScreen(a: a, o: o),
                                  );
                                },
                                child: Text('Edit'),
                              ),
                              ElevatedButtonWIdget(
                                child: Text('Delete'),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  List<String> titleList = ['Rajesh Patel', 'Hari Bhavsar', 'Jenil Shah', 'Denil Prajapati', 'Raju Panchal', 'Samir Shah'];
  List<String> leadcode = ['LEAD-00010501', 'LEAD-00010502', 'LEAD-00010503', 'LEAD-00010504', 'LEAD-00010505', 'LEAD-00010506'];
}
