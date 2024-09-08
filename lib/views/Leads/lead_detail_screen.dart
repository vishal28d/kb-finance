//flutter
import 'package:credit_app/widget/appBarWidget.dart';
import 'package:credit_app/widget/common_padding.dart';
import 'package:flutter/material.dart';
//controllers
import 'package:credit_app/utils/global.dart' as global;
//models
import 'package:credit_app/widget/baseRoute.dart';
//packages
import 'package:get/get.dart';

class LeadDetailScreen extends BaseRoute {
  LeadDetailScreen({a, o}) : super(a: a, o: o, r: 'LeadDetailScreen');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffffffff),
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
        title: Text('Lead Detail'),
        centerTitle: true,
      ),
      body: CommonPadding(
          child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 0),
                  child: ListTile(
                    title: Text("Lead Id", style: Theme.of(context).textTheme.headlineSmall),
                    subtitle: Padding(
                      padding: const EdgeInsets.only(left: 0, top: 5),
                      child: Text("LEAD-00010501", style: Theme.of(context).primaryTextTheme.titleLarge),
                    ),
                  ),
                ),
                Divider(
                  height: 1,
                  thickness: 1,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 0),
                  child: ListTile(
                    title: Text("Name", style: Theme.of(context).textTheme.headlineSmall),
                    subtitle: Padding(
                      padding: const EdgeInsets.only(left: 0, top: 5),
                      child: Text("Rajesh Ramanbhai Patel", style: Theme.of(context).primaryTextTheme.titleLarge),
                    ),
                  ),
                ),
                Divider(
                  height: 1,
                  thickness: 1,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 0),
                  child: ListTile(
                    title: Text("Lead Source", style: Theme.of(context).textTheme.headlineSmall),
                    subtitle: Padding(
                      padding: const EdgeInsets.only(left: 0, top: 5),
                      child: Text("SubDSA-DSA001", style: Theme.of(context).primaryTextTheme.titleLarge),
                    ),
                  ),
                ),
                Divider(
                  height: 1,
                  thickness: 1,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 0),
                  child: ListTile(
                    title: Text("Email", style: Theme.of(context).textTheme.headlineSmall),
                    subtitle: Padding(
                      padding: const EdgeInsets.only(left: 0, top: 5),
                      child: Text("abc@gmail.com", style: Theme.of(context).primaryTextTheme.titleLarge),
                    ),
                  ),
                ),
                Divider(
                  height: 1,
                  thickness: 1,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 0),
                  child: ListTile(
                    title: Text("Aadhar Number", style: Theme.of(context).textTheme.headlineSmall),
                    subtitle: Padding(
                      padding: const EdgeInsets.only(left: 0, top: 5),
                      child: Text("1200210014001584", style: Theme.of(context).primaryTextTheme.titleLarge),
                    ),
                  ),
                ),
                Divider(
                  height: 1,
                  thickness: 1,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 0),
                  child: ListTile(
                    title: Text("PAN Number", style: Theme.of(context).textTheme.headlineSmall),
                    subtitle: Padding(
                      padding: const EdgeInsets.only(left: 0, top: 5),
                      child: Text("BARAA62", style: Theme.of(context).primaryTextTheme.titleLarge),
                    ),
                  ),
                ),
                Divider(
                  height: 1,
                  thickness: 1,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 0),
                  child: ListTile(
                    title: Text("Loan Type", style: Theme.of(context).textTheme.headlineSmall),
                    subtitle: Padding(
                      padding: const EdgeInsets.only(left: 0, top: 5),
                      child: Text("Business Loan", style: Theme.of(context).primaryTextTheme.titleLarge),
                    ),
                  ),
                ),
                Divider(
                  height: 1,
                  thickness: 1,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 0),
                  child: ListTile(
                    title: Text("Loan Amount", style: Theme.of(context).textTheme.headlineSmall),
                    subtitle: Padding(
                      padding: const EdgeInsets.only(left: 0, top: 5),
                      child: Text("${global.currencySymbol}500000", style: Theme.of(context).primaryTextTheme.titleLarge),
                    ),
                  ),
                ),
                Divider(
                  height: 1,
                  thickness: 1,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 0),
                  child: ListTile(
                    title: Text("Employment Type", style: Theme.of(context).textTheme.headlineSmall),
                    subtitle: Padding(
                      padding: const EdgeInsets.only(left: 0, top: 5),
                      child: Text("Self Employee", style: Theme.of(context).primaryTextTheme.titleLarge),
                    ),
                  ),
                ),
                Divider(
                  height: 1,
                  thickness: 1,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 0),
                  child: ListTile(
                    title: Text("Address", style: Theme.of(context).textTheme.headlineSmall),
                    subtitle: Padding(
                      padding: const EdgeInsets.only(left: 0, top: 5),
                      child: Text("Surat,Gujarat,India", style: Theme.of(context).primaryTextTheme.titleLarge),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      )),
    );
  }
}
