// ignore_for_file: must_be_immutable

//flutter
import 'package:credit_app/controllers/bottom_nav_controller.dart';
import 'package:credit_app/controllers/personal_loan_controller.dart';
import 'package:credit_app/views/bottom_navigation_screen.dart';
import 'package:credit_app/widget/appBarWidget.dart';
import 'package:credit_app/widget/common_padding.dart';
import 'package:credit_app/widget/custom_textformfield.dart';
import 'package:credit_app/widget/primary_button.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
//controllers
import 'package:credit_app/controllers/splashController.dart';
//models
import 'package:credit_app/widget/baseRoute.dart';
//packages
import 'package:get/get.dart';

class ProfileEntryScreen extends BaseRoute {
  ProfileEntryScreen({a, o}) : super(a: a, o: o, r: 'ProfileEntryScreen');

  final SplashController customerController = Get.put(SplashController());
  PersonalLoanController personalLoanController = Get.find<PersonalLoanController>();
  final BottomNavController bottomNavController = Get.find<BottomNavController>();
  DateTime? _selectedBirthdate;
  TextEditingController cBirthdate = new TextEditingController();
  int gender = 1;
  int maritalStatus = 1;
  Future _selectBirthdate(context) async {
    try {
      final DateTime? picked = await showDatePicker(
        lastDate: DateTime(2050),
        context: context,
        initialDate: _selectedBirthdate != null ? _selectedBirthdate! : DateTime.now(),
        firstDate: DateTime(1940),
      );
      if (picked != null && picked != DateTime(2000)) {
        _selectedBirthdate = picked;
        cBirthdate.text = formatDate(_selectedBirthdate!, [dd, '-', mm, '-', yyyy]);
      }
    } catch (e) {
      print('Exception - addCoupon - _selectBirthdate(): ' + e.toString());
    }
  }

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
          bottomNavigationBar: Padding(
            padding: EdgeInsets.only(bottom: 0),
            child: CommonPadding(
              child: PrimaryTextButton(
                text: 'Save',
                voidCallback: () {
                  Get.to(() => BottomNavigationScreen(
                        a: a,
                        o: o,
                      ));
                },
              ),
            ),
          ),
          appBar: MyCustomAppBar(
              height: 80,
              appbarPadding: 0,
              title: Text('Profile Update'),
              centerTitle: true,
              leading: IconButton(
                  onPressed: () {
                    Get.to(() => BottomNavigationScreen(
                          a: a,
                          o: o,
                        ));
                  },
                  icon: Icon(
                    Icons.arrow_back_ios,
                  ))),
          body: CommonPadding(
            child: SingleChildScrollView(child: GetBuilder<PersonalLoanController>(builder: (controller) {
              return Column(
                children: [
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
                      obscureText: false,
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
                      obscureText: false,
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
                      obscureText: false,
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
                      obscureText: false,
                    ),
                  ),
                  Container(
                    width: Get.width,
                    child: Padding(
                      padding: EdgeInsets.only(top: 15),
                      child: Text(
                        'Date of Birth',
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 8),
                    child: CustomTextFormField(
                      hintText: "Choose here",
                      textEditingController: cBirthdate,
                      obscureText: false,
                      readOnly: true,
                      onTap: () {
                        _selectBirthdate(context);
                      },
                    ),
                  ),
                ],
              );
            })),
          )),
    );
  }
}
