//flutter
import 'package:credit_app/controllers/splashController.dart';
import 'package:credit_app/widget/baseRoute.dart';
import 'package:flutter/material.dart';
//packages
import 'package:get/get.dart';

class SplashScreen extends BaseRoute {
  SplashScreen({a, o}) : super(a: a, o: o, r: 'SplashScreen');

  final SplashController customerController = Get.put(SplashController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
                radius: 120,
                backgroundColor: Colors.white.withOpacity(.30),
                child: Padding(
                  padding: const EdgeInsets.all(40.0),
                  child: Image.asset('assets/kb_finance_logo.png'),
                )),
            Padding(
              padding: EdgeInsets.only(top: 10),
              child: Text(
                'KB Finance',
                style: Theme.of(context).textTheme.displayMedium,
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('version 1.0'),
          ],
        ),
      ),
    );
  }
}
