// ignore_for_file: must_be_immutable
//flutter
import 'package:credit_app/controllers/business_loan_controller.dart';
import 'package:credit_app/views/businessLoan/more_basic_detail_entry_blscreen.dart';
import 'package:credit_app/widget/appBarWidget.dart';
import 'package:credit_app/widget/common_padding.dart';
import 'package:credit_app/widget/custom_dropdown.dart';
import 'package:credit_app/widget/custom_textformfield.dart';
import 'package:credit_app/widget/next_and_back_button.dart';
import 'package:date_format/date_format.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
//controllers
import 'package:credit_app/controllers/splashController.dart';
//models
import 'package:credit_app/widget/baseRoute.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
//packages
import 'package:get/get.dart';
import 'package:page_view_indicators/linear_progress_page_indicator.dart';

class BasicDetailEntryBLScreen extends BaseRoute {
  BasicDetailEntryBLScreen({a, o}) : super(a: a, o: o, r: 'BasicDetailEntryBLScreen');

  final SplashController customerController = Get.put(SplashController());

  final BusinessLoanController businessLoanController = Get.find<BusinessLoanController>();

  final _pageController = PageController();
  DateTime? _selectedBirthdate;
  final _currentPageNotifier = ValueNotifier<int>(0);
  TextEditingController cBirthdate = new TextEditingController();

  List<String> titles = [
    'Basic Detail',
    'Company Detail',
  ];

  @override
  Widget build(BuildContext context) {
    Future _selectBirthdate() async {
      try {
        final DateTime? picked = await showDatePicker(
          lastDate: DateTime(2050),
          context: context,
          initialDate: _selectedBirthdate != null ? _selectedBirthdate! : DateTime.now(),
          firstDate: DateTime(1940),
        );
        if (picked != null && picked != DateTime(2000)) {
          _selectedBirthdate = picked;
          cBirthdate.text = formatDate(_selectedBirthdate!, [yyyy, '-', mm, '-', dd]);
        }
      } catch (e) {
        print('Exception - addCoupon - _selectBirthdate(): ' + e.toString());
      }
    }

    final _items = [
      SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: Get.width,
              child: Padding(
                padding: EdgeInsets.only(top: 15),
                child: Text(
                  'Full Name (As per PAN)',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 8),
              child: CustomTextFormField(
                hintText: "First & last name",
                obscureText: false,
              ),
            ),
            Container(
              width: Get.width,
              child: Padding(
                padding: EdgeInsets.only(top: 15),
                child: Text(
                  'Date of birth',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 8),
              child: CustomTextFormField(
                hintText: "Select birthdate",
                textEditingController: cBirthdate,
                obscureText: false,
                // key: key,
                textInputType: TextInputType.number,
                readOnly: true,
                onTap: () {
                  _selectBirthdate();
                },
              ),
            ),
            Container(
              width: Get.width,
              child: Padding(
                padding: EdgeInsets.only(top: 15),
                child: Text(
                  'Enter your PAN',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 8),
              child: CustomTextFormField(
                hintText: "AMIPI2640G",
                obscureText: false,
              ),
            ),
          ],
        ),
      ),
      GetBuilder<BusinessLoanController>(builder: (controller) {
        return SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: Get.width,
                child: Padding(
                  padding: EdgeInsets.only(top: 15),
                  child: Text(
                    'Company Type',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ),
              ),
              Padding(
                  padding: EdgeInsets.only(top: 8),
                  child: CustomDropDown(
                    val: businessLoanController.companyTypeVal,
                    hint: Text(
                      "Choose here",
                      style: Theme.of(context).inputDecorationTheme.hintStyle,
                    ),
                    list: businessLoanController.companyTypeList,
                    onChanged: (selectedValue) {
                      businessLoanController.setCompanyType(selectedValue.toString());
                    },
                  )),
              Container(
                width: Get.width,
                child: Padding(
                  padding: EdgeInsets.only(top: 15),
                  child: Text(
                    'Select Industry',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ),
              ),
              Padding(
                  padding: EdgeInsets.only(top: 8),
                  child: CustomDropDown(
                    hint: Text(
                      "Choose here",
                      style: Theme.of(context).inputDecorationTheme.hintStyle,
                    ),
                    list: businessLoanController.industryList,
                    onChanged: (selectedValue) {
                      businessLoanController.industryVal = selectedValue.toString();
                    },
                    val: businessLoanController.industryVal,
                  )),
              Container(
                width: Get.width,
                child: Padding(
                  padding: EdgeInsets.only(top: 15),
                  child: Text(
                    'Annual sales/Turnover as per the ITR',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 8),
                child: CustomTextFormField(
                  prefixIcon: Icon(
                    FontAwesomeIcons.rupeeSign,
                    color: Theme.of(context).primaryColor,
                    size: 15,
                  ),
                  hintText: "Type here",
                  obscureText: false,
                  textInputType: TextInputType.number,
                ),
              ),
              Container(
                width: Get.width,
                child: Padding(
                  padding: EdgeInsets.only(top: 15),
                  child: Text(
                    'Company Name',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 8),
                child: CustomTextFormField(
                  hintText: "Type here",
                  obscureText: false,
                ),
              ),
              Container(
                width: Get.width,
                child: Padding(
                  padding: EdgeInsets.only(top: 15),
                  child: Text(
                    'Company State',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ),
              ),
              Padding(
                  padding: EdgeInsets.only(top: 8),
                  child: CustomDropDown(
                    hint: Text(
                      "Choose here",
                      style: Theme.of(context).inputDecorationTheme.hintStyle,
                    ),
                    list: businessLoanController.stateList,
                    onChanged: (selectedValue) {
                      businessLoanController.stateVal = selectedValue.toString();
                    },
                    val: businessLoanController.stateVal,
                  )),
              Container(
                width: Get.width,
                child: Padding(
                  padding: EdgeInsets.only(top: 15),
                  child: Text(
                    'Company Address',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 8),
                child: CustomTextFormField(
                  hintText: "Type here",
                  obscureText: false,
                ),
              ),
              Container(
                width: Get.width,
                child: Padding(
                  padding: EdgeInsets.only(top: 15),
                  child: Text(
                    'Company City',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ),
              ),
              Padding(
                  padding: EdgeInsets.only(top: 8),
                  child: CustomDropDown(
                    hint: Text(
                      "Choose here",
                      style: Theme.of(context).inputDecorationTheme.hintStyle,
                    ),
                    list: businessLoanController.cityList,
                    onChanged: (selectedValue) {
                      businessLoanController.cityVal = selectedValue.toString();
                    },
                    val: businessLoanController.cityVal,
                  )),
              businessLoanController.companyTypeVal == 'Partnership' || businessLoanController.companyTypeVal == 'LLP' || businessLoanController.companyTypeVal == 'Pvt.Ltd'
                  ? Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: DottedBorder(
                        color: Colors.black,
                        strokeWidth: 1,
                        child: Container(
                          padding: EdgeInsets.all(08),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(top: 3),
                                child: Text(
                                  'Person Detail',
                                  style: Theme.of(context).primaryTextTheme.displayLarge,
                                ),
                              ),
                              Container(
                                width: Get.width,
                                child: Padding(
                                  padding: EdgeInsets.only(top: 15),
                                  child: Text(
                                    'Name',
                                    style: Theme.of(context).textTheme.bodyLarge,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 8),
                                child: CustomTextFormField(
                                  hintText: "Type here",
                                ),
                              ),
                              Container(
                                width: Get.width,
                                child: Padding(
                                  padding: EdgeInsets.only(top: 15),
                                  child: Text(
                                    'Phone Number',
                                    style: Theme.of(context).textTheme.bodyLarge,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 8),
                                child: CustomTextFormField(
                                  hintText: "Type here",
                                ),
                              ),
                              Container(
                                width: Get.width,
                                child: Padding(
                                  padding: EdgeInsets.only(top: 15),
                                  child: Text(
                                    'Email',
                                    style: Theme.of(context).textTheme.bodyLarge,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 8),
                                child: CustomTextFormField(
                                  hintText: "Type here",
                                ),
                              ),
                              Container(
                                width: Get.width,
                                child: Padding(
                                  padding: EdgeInsets.only(top: 15),
                                  child: Text(
                                    'PAN Card',
                                    style: Theme.of(context).textTheme.bodyLarge,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 8),
                                child: CustomTextFormField(
                                  hintText: "Type here",
                                ),
                              ),
                              Container(
                                width: Get.width,
                                child: Padding(
                                  padding: EdgeInsets.only(top: 15),
                                  child: Text(
                                    'Aadhar Card',
                                    style: Theme.of(context).textTheme.bodyLarge,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 8),
                                child: CustomTextFormField(
                                  hintText: "Type here",
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  : SizedBox()
            ],
          ),
        );
      })
    ];
    _buildPageView() {
      return Container(
        height: Get.height - 220,
        width: Get.width,
        child: PageView.builder(
            physics: NeverScrollableScrollPhysics(),
            itemCount: _items.length,
            controller: _pageController,
            itemBuilder: (BuildContext context, int index) {
              return _items[index];
            },
            onPageChanged: (int index) {
              _currentPageNotifier.value = index;
              businessLoanController.setIndex(_currentPageNotifier.value);
            }),
      );
    }

    _buildLinearProgressIndicator() {
      return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) => LinearProgressPageIndicator(
          itemCount: _items.length,
          currentPageNotifier: _currentPageNotifier,
          progressColor: Theme.of(context).primaryColor,
          width: Get.width - 30,
          height: 5,
        ),
      );
    }

    return Scaffold(
      // resizeToAvoidBottomInset: false,
      appBar: MyCustomAppBar(
        height: 80,
        appbarPadding: 0,
        title: Text('Business Loan'),
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(Icons.arrow_back_ios)),
      ),
      body: GetBuilder<BusinessLoanController>(builder: (controller) {
        return CommonPadding(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 10),
                  width: Get.width,
                  height: 40,
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${titles[businessLoanController.indexValue]}',
                        style: Theme.of(context).primaryTextTheme.displaySmall,
                      ),
                      Container(width: Get.width, margin: EdgeInsets.only(top: 3, right: 10), child: _buildLinearProgressIndicator())
                    ],
                  ),
                ),
                _buildPageView()
              ],
            ),
          ),
        );
      }),

      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(bottom: 20),
        child: NextBackButton(
          backFunction: () {
            if (_currentPageNotifier.value != 0) {
              _currentPageNotifier.value--;
              _pageController.animateToPage(_currentPageNotifier.value, curve: Curves.ease, duration: Duration(milliseconds: 300));
              businessLoanController.setIndex(_currentPageNotifier.value);
            } else {
              Get.back();
            }
          },
          nextFunction: () {
            if (_currentPageNotifier.value != _items.length - 1) {
              _currentPageNotifier.value++;
              _pageController.animateToPage(_currentPageNotifier.value, curve: Curves.ease, duration: Duration(microseconds: 300));
              businessLoanController.setIndex(_currentPageNotifier.value);
            } else {
              Get.to(() => MoreBasicDetailEntryBLScreen(
                    a: a,
                    o: o,
                  ));
            }
          },
        ),
      ),
    );
  }
}
