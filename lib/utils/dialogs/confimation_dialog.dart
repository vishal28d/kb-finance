import 'package:flutter/material.dart';
//controllers
import 'package:credit_app/controllers/splashController.dart';
//models
import 'package:credit_app/widget/baseRoute.dart';
//packages
import 'package:get/get.dart';

class ConfirmationDialog extends BaseRoute {
  final String? title;
  final String? subTitle;
  final VoidCallback? onConfirm;

  ConfirmationDialog({a, o, this.title, this.subTitle, this.onConfirm}) : super(a: a, o: o, r: 'ConfirmationDialog2');

  final SplashController customerController = Get.put(SplashController());

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title!),
      content: Text(
        subTitle!,
      ),
      actionsAlignment: MainAxisAlignment.center,
      actions: [
        ElevatedButton(
            style: ButtonStyle(
                elevation: WidgetStateProperty.all(0),
                padding: WidgetStateProperty.all(
                  EdgeInsets.only(left: 40, right: 40),
                ),
                backgroundColor: WidgetStateProperty.all(Color(0xFFFE2121).withOpacity(0.1)),
                shadowColor: WidgetStateProperty.all(Colors.white),
                overlayColor: WidgetStateProperty.all(Colors.white),
                foregroundColor: WidgetStateProperty.all(Colors.red),
                textStyle: WidgetStateProperty.all(TextStyle(fontSize: 16, fontWeight: FontWeight.w700))),
            onPressed: () {
              Get.back();
            },
            child: Text(
              'No',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            )),
        ElevatedButton(
            style: ButtonStyle(
                elevation: WidgetStateProperty.all(0),
                padding: WidgetStateProperty.all(
                  EdgeInsets.only(left: 40, right: 40),
                ),
                backgroundColor: WidgetStateProperty.all(Theme.of(context).primaryColor),
                shadowColor: WidgetStateProperty.all(Colors.white),
                overlayColor: WidgetStateProperty.all(Colors.white),
                foregroundColor: WidgetStateProperty.all(Colors.white),
                textStyle: WidgetStateProperty.all(TextStyle(fontSize: 16, fontWeight: FontWeight.w700))),
            onPressed: onConfirm,
            child: Text('Yes', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold))),
      ],
    );
  }
}
