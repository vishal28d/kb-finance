// ignore_for_file: must_be_immutable
//flutter
import 'package:credit_app/widget/appBarWidget.dart';
import 'package:credit_app/widget/baseRoute.dart';
import 'package:credit_app/widget/common_padding.dart';
import 'package:credit_app/widget/elevated_button_widget.dart';
import 'package:credit_app/utils/global.dart' as global;
import 'package:flutter/material.dart';
//models
import 'package:get/get.dart';

class MyWalletScreen extends BaseRoute {
  MyWalletScreen({a, o}) : super(a: a, o: o, r: 'MyWalletScreen');

  List<String> titleList1 = [
    'Scratch Cards',
    "Refer & Earn",
    "Scratch Cards",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: MyCustomAppBar(
          leading: IconButton(
            onPressed: () {
              Get.back();
              // Get.back();
            },
            icon: Icon(
              Icons.arrow_back_ios,
              size: 20,
            ),
          ),
          height: 80,
          appbarPadding: 0,
          title: Text('My Wallet'),
          centerTitle: true,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 25),
              child: Center(
                child: Column(
                  children: [
                    Text(
                      "Total Points",
                      style: Theme.of(context).textTheme.displaySmall,
                    ),
                    Text(
                      "1000",
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
                child: Container(
              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30))),
              margin: EdgeInsets.only(top: 30),
              width: Get.width,
              child: DefaultTabController(
                length: 2,
                child: Column(
                  children: [
                    TabBar(onTap: (int index) async {}, indicatorColor: Theme.of(context).primaryColor, unselectedLabelColor: Theme.of(context).primaryTextTheme.displaySmall!.color, indicatorSize: TabBarIndicatorSize.tab, labelColor: Theme.of(context).primaryColor, labelStyle: Theme.of(context).textTheme.headlineSmall, tabs: [
                      Tab(
                        child: Text(
                          'Summary',
                        ),
                      ),
                      Tab(
                        child: Text(
                          'Reedem',
                        ),
                      ),
                    ]),
                    Expanded(child: TabBarView(children: [CommonPadding(child: loanApplicationList(context)), CommonPadding(child: reedemCards(context))]))
                  ],
                ),
              ),
            ))
          ],
        ));
  }

  Widget loanApplicationList(context) {
    return ListView.builder(
        itemCount: 3,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            margin: EdgeInsets.only(top: 8, bottom: 8),
            width: Get.width,
            height: 75,
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Cashback Type: ${titleList1[index]}',
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 2, bottom: 2),
                            child: Text(
                              '27-10-2020',
                              style: Theme.of(context).primaryTextTheme.displayMedium,
                            ),
                          ),
                          Text(
                            '${global.currencySymbol}150',
                            style: Theme.of(context).primaryTextTheme.displayMedium,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }

  Widget reedemCards(context) {
    return ListView.builder(
        itemCount: 15,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            margin: EdgeInsets.only(top: 08, bottom: 08),
            width: Get.width,
            height: 70,
            child: Padding(
              padding: const EdgeInsets.only(left: 1, right: 1),
              child: Card(
                child: ListTile(
                  leading: Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(image: DecorationImage(image: AssetImage('assets/productImage.jpg'), fit: BoxFit.cover)),
                  ),
                  title: Text(
                    'New Product',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  subtitle: Text('${global.currencySymbol}300', style: Theme.of(context).primaryTextTheme.displayMedium),
                  trailing: ElevatedButtonWIdget(
                    child: Text('Reedem'),
                  ),
                ),
              ),
            ),
          );
        });
  }

  List<String> titleList = ['Rajesh Patel', 'Hari Bhavsar', 'Jenil Shah', 'Denil Prajapati', 'Raju Panchal', 'Samir Shah'];
  List<String> subTitle = ['EMP01', 'EMP02', 'EMP03', 'EMP04', 'EMP05', 'EMP06'];
}
