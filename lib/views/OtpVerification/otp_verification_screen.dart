//flutter
import 'package:credit_app/controllers/otp_verification_controller.dart';
import 'package:credit_app/views/bottom_navigation_screen.dart';
import 'package:credit_app/widget/appBarWidget.dart';
import 'package:credit_app/widget/common_padding.dart';
import 'package:credit_app/widget/primary_button.dart';
import 'package:flutter/material.dart';
//models
import 'package:credit_app/widget/baseRoute.dart';
//packages
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';
// import 'package:pinput/pin_put/pin_put.dart';

class OtpVerificationScreen extends BaseRoute {
  OtpVerificationScreen({a, o}) : super(a: a, o: o, r: 'OtpVerificationScreen');

  final OtpVerificationController otpVerificationController = Get.find<OtpVerificationController>();
  BoxDecoration get _pinPutDecoration {
    return BoxDecoration(
      shape: BoxShape.rectangle,
      color: Color(0xffF4F5F7),
      borderRadius: BorderRadius.circular(15),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          title: Text('Phone Verification'),
          centerTitle: true,
        ),
        body: CommonPadding(
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
                        'OTP Verification',
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5.0),
                      child: Text(
                        'An authentication code has been sent to',
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ),
                    Text(
                      '9825098250',
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                  ],
                ),
              ),
              Padding(
                  padding: EdgeInsets.only(top: 20, left: 10, right: 10),
                  child: GetBuilder<OtpVerificationController>(builder: (controller) {
                    return Pinput(
                      onChanged: (value) => {},
                      focusedPinTheme: PinTheme(
                        textStyle: Theme.of(context).textTheme.displaySmall,
                        decoration: BoxDecoration(shape: BoxShape.rectangle, borderRadius: BorderRadius.circular(15), color: Theme.of(context).primaryColor),
                        constraints: BoxConstraints(maxWidth: 55, maxHeight: 55),
                      ),
                      defaultPinTheme: PinTheme(
                        textStyle: TextStyle(color: Colors.black),
                        decoration: BoxDecoration(shape: BoxShape.rectangle, borderRadius: BorderRadius.circular(15), color: Colors.grey.shade200),
                        constraints: BoxConstraints(maxWidth: 55, maxHeight: 55),
                      ),
                      autofocus: false,
                      showCursor: false,
                      submittedPinTheme: PinTheme(
                        textStyle: Theme.of(context).textTheme.displaySmall,
                        decoration: BoxDecoration(shape: BoxShape.rectangle, borderRadius: BorderRadius.circular(15), color: Theme.of(context).primaryColor),
                        constraints: BoxConstraints(maxWidth: 55, maxHeight: 55),
                      ),
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      onTap: () {},
                      controller: otpVerificationController.pinPutController,
                    );
                  })),
              Padding(
                padding: EdgeInsets.only(top: 25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "I didn't receive code. ",
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Text(
                            "Resend Code",
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 25),
                child: PrimaryTextButton(
                  text: "Verify Now",
                  voidCallback: () {
                    Get.to(
                        () => BottomNavigationScreen(
                              a: a,
                              o: o,
                            ),
                        routeName: "Home");
                  },
                ),
              )
            ],
          ),
        ));
  }
}
