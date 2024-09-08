// ignore_for_file: must_be_immutable
//flutter
import 'package:credit_app/controllers/personal_loan_controller.dart';
import 'package:credit_app/views/PersonalLoan/more_basic_detail_entry_plscreen.dart';
import 'package:credit_app/widget/appBarWidget.dart';
import 'package:credit_app/widget/common_padding.dart';
import 'package:credit_app/widget/custom_dropdown.dart';
import 'package:credit_app/widget/custom_textformfield.dart';
import 'package:credit_app/widget/next_and_back_button.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
//controllers
import 'package:credit_app/controllers/splashController.dart';
//models
import 'package:credit_app/widget/baseRoute.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
//packages
import 'package:get/get.dart';
import 'package:page_view_indicators/linear_progress_page_indicator.dart';

class BasicDetailEntryPLScreen extends BaseRoute {
  BasicDetailEntryPLScreen({a, o}) : super(a: a, o: o, r: 'BasicDetailEntryPLScreen');

  final SplashController customerController = Get.put(SplashController());
  final PersonalLoanController personalLoanController = Get.find<PersonalLoanController>();

  final _pageController = PageController();
  DateTime? _selectedBirthdate;
  final _currentPageNotifier = ValueNotifier<int>(0);
  TextEditingController cBirthdate = new TextEditingController();

  List<String> titles = ['Profile Detail', 'Employee Detail', 'Loan Amount'];

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
      SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: Get.width,
              child: Padding(
                padding: EdgeInsets.only(top: 15),
                child: Text(
                  'Employment Type',
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
                  list: personalLoanController.employementTypeList,
                  val: personalLoanController.employementVal,
                  onChanged: (selectedValue) {
                    personalLoanController.employementVal = selectedValue.toString();
                  },
                )),
            Container(
              width: Get.width,
              child: Padding(
                padding: EdgeInsets.only(top: 15),
                child: Text(
                  'Monthly income',
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
                  'Other income',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 8),
              child: CustomTextFormField(
                prefixIcon: Icon(FontAwesomeIcons.rupeeSign, color: Theme.of(context).primaryColor, size: 15),
                hintText: "Type here",
                obscureText: false,
                textInputType: TextInputType.number,
              ),
            ),
          ],
        ),
      ),
      SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: Get.width,
              child: Padding(
                padding: EdgeInsets.only(top: 15),
                child: Text(
                  'Loan amount required',
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
          ],
        ),
      ),
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
              personalLoanController.setIndex(_currentPageNotifier.value);
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
      appBar: MyCustomAppBar(
        height: 80,
        appbarPadding: 0,
        title: Text('Personal Loan'),
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(Icons.arrow_back_ios)),
      ),
      body: GetBuilder<PersonalLoanController>(builder: (controller) {
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${titles[personalLoanController.indexValue]}',
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
              personalLoanController.setIndex(_currentPageNotifier.value);
            } else {
              Get.back();
            }
          },
          nextFunction: () {
            if (_currentPageNotifier.value != _items.length - 1) {
              _currentPageNotifier.value++;
              _pageController.animateToPage(_currentPageNotifier.value, curve: Curves.ease, duration: Duration(microseconds: 300));
              personalLoanController.setIndex(_currentPageNotifier.value);
            } else {
              Get.to(() => MoreBasicDetailEntryPLScreen(
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
