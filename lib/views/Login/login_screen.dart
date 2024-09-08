//flutter
import 'package:credit_app/controllers/loginController.dart';
import 'package:credit_app/views/OtpVerification/otp_verification_screen.dart';
import 'package:credit_app/widget/appBarWidget.dart';
import 'package:credit_app/widget/common_padding.dart';
import 'package:credit_app/widget/custom_textformfield.dart';
import 'package:credit_app/widget/primary_button.dart';
import 'package:flutter/material.dart';
//models
import 'package:credit_app/widget/baseRoute.dart';
//packages
import 'package:get/get.dart';

class LoginScreen extends BaseRoute {
  LoginScreen({a, o}) : super(a: a, o: o, r: 'LoginScreen');

  final LoginController loginController = Get.find<LoginController>();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return Future.value(true);
      },
      child: Scaffold(
          appBar: MyCustomAppBar(
            leading: Icon(
              Icons.arrow_back_ios,
              size: 0,
            ),
            height: 80,
            appbarPadding: 0,
            title: Text('Sign in'),
            centerTitle: true,
          ),
          body: CommonPadding(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 59),
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.center,
                          child: Text(
                            'Login',
                            style: Theme.of(context).textTheme.headlineMedium,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 5.0),
                          child: Text(
                            'with your mobile number',
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 30),
                    child: Text(
                      'Mobile Number',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 8),
                    child: CustomTextFormField(
                      hintText: "Enter your mobile number",
                      textEditingController: loginController.mobileNumber,
                      obscureText: false,
                      key: key,
                      textInputType: TextInputType.number,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: PrimaryTextButton(
                      text: "Get OTP",
                      voidCallback: () {
                        Get.to(
                            () => OtpVerificationScreen(
                                  a: a,
                                  o: o,
                                ),
                            routeName: "OTP Verification");
                      },
                    ),
                  )
                ],
              ),
            ),
          )),
    );
  }
}
