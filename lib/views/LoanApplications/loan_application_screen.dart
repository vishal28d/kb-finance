// ignore_for_file: must_be_immutable
//flutter
import 'package:credit_app/controllers/loan_application_controller.dart';
import 'package:credit_app/widget/appBarWidget.dart';
import 'package:credit_app/widget/baseRoute.dart';
import 'package:credit_app/widget/common_padding.dart';
import 'package:credit_app/widget/custom_dropdown.dart';
import 'package:credit_app/widget/custom_textformfield.dart';
import 'package:credit_app/widget/drawer_widget.dart';
import 'package:credit_app/utils/global.dart' as global;
import 'package:credit_app/widget/primary_button.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
//packages
import 'package:get/get.dart';

import 'loan_detail_screen.dart';

class LoanApplicationScreen extends BaseRoute {
  LoanApplicationScreen({a, o}) : super(a: a, o: o, r: 'LoanApplicationScreen');
  DateTime? _fromDate;
  DateTime? _toDate;
  TabController? _tabController;

  final LoanApplicationController loanController = Get.find<LoanApplicationController>();
  List<String> titleList1 = [
    'Home Loan',
    "Business Loan",
    "Personal Loan",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: DrawerWidget(
          a: a,
          o: o,
        ),
        backgroundColor: Colors.grey[100],
        appBar: MyCustomAppBar(
          height: 80,
          appbarPadding: 0,
          title: Text('Loan Applications'),
          centerTitle: true,
        ),
        body: DefaultTabController(
          length: 8,
          child: Column(
            children: [
              TabBar(
                onTap: (int index) async {},
                controller: _tabController,
                isScrollable: true,
                indicatorColor: Theme.of(context).primaryColor,
                unselectedLabelColor: Theme.of(context).primaryTextTheme.displaySmall!.color,
                indicatorSize: TabBarIndicatorSize.tab,
                labelColor: Theme.of(context).primaryColor,
                labelStyle: Theme.of(context).textTheme.headlineSmall,
                tabs: [
                  Tab(
                    child: Text(
                      'Pending',
                    ),
                  ),
                  Tab(
                    child: Text(
                      'RM Assigned',
                    ),
                  ),
                  Tab(
                    child: Text(
                      'For Verification',
                    ),
                  ),
                  Tab(
                    child: Text(
                      'To Credit Team',
                    ),
                  ),
                  Tab(
                    child: Text(
                      'Approved',
                    ),
                  ),
                  Tab(
                    child: Text(
                      'Decline',
                    ),
                  ),
                  Tab(
                    child: Text(
                      'Sanctioned',
                    ),
                  ),
                  Tab(
                    child: Text(
                      'Disbursed',
                    ),
                  ),
                ],
              ),
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    CommonPadding(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(child: loanApplicationList(context)),
                        ],
                      ),
                    ),
                    CommonPadding(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(child: loanApplicationList(context)),
                        ],
                      ),
                    ),
                    CommonPadding(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(child: loanApplicationList(context)),
                        ],
                      ),
                    ),
                    CommonPadding(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(child: loanApplicationList(context)),
                        ],
                      ),
                    ),
                    CommonPadding(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(child: loanApplicationList(context)),
                        ],
                      ),
                    ),
                    CommonPadding(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(child: loanApplicationList(context)),
                        ],
                      ),
                    ),
                    CommonPadding(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(child: loanApplicationList(context)),
                        ],
                      ),
                    ),
                    CommonPadding(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(child: loanApplicationList(context)),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
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
                      width: Get.width / 2 - 60,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${titleList1[index]}',
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
                            '${global.currencySymbol}200000',
                            style: Theme.of(context).primaryTextTheme.displayMedium,
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            PopupMenuButton(
                                icon: Icon(Icons.more_vert, color: Colors.black),
                                itemBuilder: (context) => [
                                      PopupMenuItem(
                                        child: ListTile(
                                          contentPadding: EdgeInsets.zero,
                                          title: Row(
                                            children: <Widget>[
                                              Padding(
                                                padding: const EdgeInsets.only(right: 10),
                                                child: Icon(
                                                  Icons.edit,
                                                  color: Theme.of(context).primaryColor,
                                                ),
                                              ),
                                              Text(
                                                'Edit',
                                                style: Theme.of(context).primaryTextTheme.displayMedium,
                                              ),
                                            ],
                                          ),
                                          onTap: () {
                                            Get.back();
                                          },
                                        ),
                                      ),
                                      PopupMenuItem(
                                        child: ListTile(
                                          contentPadding: EdgeInsets.zero,
                                          title: Row(
                                            children: <Widget>[
                                              Padding(
                                                padding: const EdgeInsets.only(right: 10),
                                                child: Icon(
                                                  Icons.delete,
                                                  color: Theme.of(context).primaryColor,
                                                ),
                                              ),
                                              Text(
                                                'Delete',
                                                style: Theme.of(context).primaryTextTheme.displayMedium,
                                              ),
                                            ],
                                          ),
                                          onTap: () {
                                            Get.back();
                                          },
                                        ),
                                      ),
                                      PopupMenuItem(
                                        child: ListTile(
                                          contentPadding: EdgeInsets.zero,
                                          title: Row(
                                            children: <Widget>[
                                              Padding(
                                                padding: const EdgeInsets.only(right: 10),
                                                child: Icon(
                                                  Icons.visibility,
                                                  color: Theme.of(context).primaryColor,
                                                ),
                                              ),
                                              Text(
                                                'View',
                                                style: Theme.of(context).primaryTextTheme.displayMedium,
                                              ),
                                            ],
                                          ),
                                          onTap: () {
                                            Get.back();
                                            Get.to(() => LoanDetailScreen(
                                                  a: a,
                                                  o: o,
                                                ));
                                          },
                                        ),
                                      ),
                                    ]),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }

  Future loanFilter(context) {
    return Get.bottomSheet(
      SingleChildScrollView(
        child: Container(
            height: MediaQuery.of(context).size.height / 2,
            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30))),
            child: Padding(
              padding: EdgeInsets.only(left: 15, right: 15),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          'Filter',
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(3),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Status',
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                          Container(
                              width: MediaQuery.of(context).size.width / 2,
                              child: CustomDropDown(
                                hint: Text(
                                  "loan status",
                                  style: Theme.of(context).inputDecorationTheme.hintStyle,
                                ),
                                list: loanController.loanstatus,
                                val: loanController.loanstatusVal,
                                onChanged: (selectedValue) {
                                  loanController.loanstatusVal = selectedValue.toString();
                                },
                              )),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(3),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Type',
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                          Container(
                              width: MediaQuery.of(context).size.width / 2,
                              child: CustomDropDown(
                                hint: Text(
                                  "loan type",
                                  style: Theme.of(context).inputDecorationTheme.hintStyle,
                                ),
                                list: loanController.loantypelist,
                                val: loanController.loantypelistVal,
                                onChanged: (selectedValue) {
                                  loanController.loantypelistVal = selectedValue.toString();
                                },
                              )),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(3),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'From Date',
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width / 2,
                            child: CustomTextFormField(
                              hintText: "from date",
                              textEditingController: loanController.cfromdate,
                              focusnode: loanController.ffromdate,
                              onTap: () async {
                                _selectFromDate(context);
                              },
                              obscureText: false,
                              key: key,
                              readOnly: true,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(3),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'ToDate',
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width / 2,
                            child: CustomTextFormField(
                              hintText: "to date",
                              textEditingController: loanController.ctodate,
                              focusnode: loanController.ftodate,
                              onTap: () async {
                                _seletToDate(context);
                              },
                              obscureText: false,
                              key: key,
                              readOnly: true,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 15),
                      child: Container(
                        child: PrimaryTextButton(
                          text: "Apply",
                          voidCallback: () {
                            Get.back();
                          },
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )),
      ),
    );
  }

  Future _selectFromDate(context) async {
    try {
      final DateTime? picked = await showDatePicker(
        lastDate: DateTime(2050),
        context: context,
        initialDate: _fromDate != null ? _fromDate! : DateTime.now(),
        firstDate: DateTime(1940),
      );
      if (picked != null && picked != DateTime(2000)) {
        _fromDate = picked;
        loanController.cfromdate.text = formatDate(_fromDate!, [dd, '-', mm, '-', yyyy]);
      }
    } catch (e) {
      print('Exception - loan_list_screen - _selectFromDate(): ' + e.toString());
    }
  }

  Future _seletToDate(context) async {
    try {
      final DateTime? picked = await showDatePicker(
        lastDate: DateTime(2050),
        context: context,
        initialDate: _fromDate != null ? _fromDate! : DateTime.now(),
        firstDate: _fromDate!,
      );
      if (picked != null && picked != DateTime(2000)) {
        _toDate = picked;
        loanController.ctodate.text = formatDate(_toDate!, [dd, '-', mm, '-', yyyy]);
      }
    } catch (e) {
      print('Exception - loan_list_screen - _seletToDate(): ' + e.toString());
    }
  }

  List<String> titleList = ['Rajesh Patel', 'Hari Bhavsar', 'Jenil Shah', 'Denil Prajapati', 'Raju Panchal', 'Samir Shah', 'Raja Patel'];
  List<String> subTitle = ['LOAN01', 'LOAN02', 'LOAN03', 'LOAN04', 'LOAN05', 'LOAN06', 'LOAN07'];
  List<String> loantype = ['Home Loan', 'Business Loan', 'Home Loan', 'Personal Loan', 'Home Loan', 'Loan  Loan', 'Home Loan'];
}
