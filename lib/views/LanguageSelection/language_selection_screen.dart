//flutter

import 'package:credit_app/l10n/l10n.dart';
import 'package:credit_app/provider/local_provider.dart';
import 'package:credit_app/widget/appBarWidget.dart';
import 'package:credit_app/widget/baseRoute.dart';
import 'package:credit_app/widget/common_padding.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:credit_app/utils/global.dart' as global;

class LanguageSelectionScreen extends BaseRoute {
  //a - analytics
  //o - observer
  LanguageSelectionScreen({a, o}) : super(a: a, o: o, r: 'LanguageSelectionScreen');

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<LocaleProvider>(context);
    var locale = provider.locale ?? Locale('en');
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
          title: Text('Languages'),
          centerTitle: true,
        ),
        body: CommonPadding(
          child: ListView.builder(
            itemCount: L10n.languageListName.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return RadioListTile(
                activeColor: Theme.of(context).primaryColor,
                value: L10n.all[index].languageCode,
                groupValue: global.languageCode,
                onChanged: (val) {
                  final provider = Provider.of<LocaleProvider>(context, listen: false);
                  locale = Locale(val!);
                  provider.setLocale(locale);
                  global.languageCode = locale.languageCode;
                },
                title: Text(L10n.languageListName[index], style: Theme.of(context).textTheme.bodyLarge),
              );
            },
          ),
        ));
  }
}
