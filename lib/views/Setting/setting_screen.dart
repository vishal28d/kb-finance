import 'package:credit_app/views/AboutUs/about_us_screen.dart';
import 'package:credit_app/views/Faqs/faqs_screen.dart';
import 'package:credit_app/views/LanguageSelection/language_selection_screen.dart';
import 'package:credit_app/views/Notifications/notification_screen.dart';
import 'package:credit_app/views/PrivacyAndPolicy/privacy_policy_screen.dart';
import 'package:credit_app/views/TermAndCondition/term_condition_screen.dart';
import 'package:credit_app/widget/appBarWidget.dart';
import 'package:credit_app/widget/baseRoute.dart';
import 'package:credit_app/widget/common_padding.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
//packages
import 'package:get/get.dart';

class SettingScreen extends BaseRoute {
  SettingScreen({a, o}) : super(a: a, o: o, r: 'SettingScreen');

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
        title: Text('Settings'),
        centerTitle: true,
      ),
      body: CommonPadding(
          child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 15),
                  child: ListTile(
                    leading: Icon(
                      Icons.g_translate,
                      color: Theme.of(context).primaryColor,
                      size: 22,
                    ),
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Languages', style: Theme.of(context).textTheme.bodyLarge),
                        Icon(
                          Icons.arrow_forward_ios_sharp,
                          size: 20,
                          color: Colors.black,
                        )
                      ],
                    ),
                    onTap: () {
                      Get.to(() => LanguageSelectionScreen(
                            a: a,
                            o: o,
                          ));
                    },
                  ),
                ),
                Divider(
                  color: Colors.grey,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: ListTile(
                    leading: Icon(
                      FontAwesomeIcons.solidBell,
                      color: Theme.of(context).primaryColor,
                      size: 22,
                    ),
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Notifications', style: Theme.of(context).textTheme.bodyLarge),
                        Icon(
                          Icons.arrow_forward_ios_sharp,
                          size: 20,
                          color: Colors.black,
                        )
                      ],
                    ),
                    onTap: () {
                      Get.to(() => NotificationScreen(a: a, o: o));
                    },
                  ),
                ),
                Divider(
                  color: Colors.grey,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: ListTile(
                    leading: Icon(
                      FontAwesomeIcons.commentDollar,
                      color: Theme.of(context).primaryColor,
                      size: 22,
                    ),
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Privacy Policy', style: Theme.of(context).textTheme.bodyLarge),
                        Icon(
                          Icons.arrow_forward_ios_sharp,
                          size: 20,
                          color: Colors.black,
                        )
                      ],
                    ),
                    onTap: () {
                      Get.to(() => PrivacyPolicyScreen(
                            a: a,
                            o: o,
                          ));
                    },
                  ),
                ),
                Divider(
                  color: Colors.grey,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: ListTile(
                    leading: Icon(
                      // ignore: deprecated_member_use
                      FontAwesomeIcons.adjust,
                      color: Theme.of(context).primaryColor,
                      size: 22,
                    ),
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Terms & Condition', style: Theme.of(context).textTheme.bodyLarge),
                        Icon(
                          Icons.arrow_forward_ios_sharp,
                          size: 20,
                          color: Colors.black,
                        )
                      ],
                    ),
                    onTap: () {
                      Get.to(() => TermsAndConditionScreen(
                            a: a,
                            o: o,
                          ));
                    },
                  ),
                ),
                Divider(
                  color: Colors.grey,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: ListTile(
                    leading: Icon(
                      Icons.question_answer,
                      color: Theme.of(context).primaryColor,
                      size: 22,
                    ),
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('FAQs', style: Theme.of(context).textTheme.bodyLarge),
                        Icon(
                          Icons.arrow_forward_ios_sharp,
                          size: 20,
                          color: Colors.black,
                        )
                      ],
                    ),
                    onTap: () {
                      Get.to(() => FaqsScreen(
                            a: a,
                            o: o,
                          ));
                    },
                  ),
                ),
                Divider(
                  color: Colors.grey,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: ListTile(
                    leading: Icon(
                      FontAwesomeIcons.thumbsUp,
                      color: Theme.of(context).primaryColor,
                      size: 22,
                    ),
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Love the app? Rate us', style: Theme.of(context).textTheme.bodyLarge),
                        Icon(
                          Icons.arrow_forward_ios_sharp,
                          size: 20,
                          color: Colors.black,
                        )
                      ],
                    ),
                    onTap: () {},
                  ),
                ),
                Divider(
                  color: Colors.grey,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: ListTile(
                    leading: Icon(
                      // ignore: deprecated_member_use
                      FontAwesomeIcons.infoCircle,
                      color: Theme.of(context).primaryColor,
                      size: 22,
                    ),
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('About Us', style: Theme.of(context).textTheme.bodyLarge),
                        Icon(
                          Icons.arrow_forward_ios_sharp,
                          size: 20,
                          color: Colors.black,
                        )
                      ],
                    ),
                    onTap: () {
                      Get.to(() => AboutUsScreen(
                            a: a,
                            o: o,
                          ));
                    },
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
