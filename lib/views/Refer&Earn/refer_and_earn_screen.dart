import 'package:credit_app/widget/appBarWidget.dart';
import 'package:credit_app/widget/baseRoute.dart';
import 'package:credit_app/widget/common_padding.dart';
import 'package:credit_app/widget/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReferralAndEarnScreen extends BaseRoute {
  ReferralAndEarnScreen({a, o}) : super(a: a, o: o, r: 'ReferralAndEarnScreen');

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
        title: Text('Referral Program'),
        centerTitle: true,
      ),
      body: CommonPadding(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 15),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        'REFER & EARN',
                        style: Theme.of(context).primaryTextTheme.displayLarge,
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CircleAvatar(
                          radius: 60,
                          backgroundColor: Theme.of(context).primaryColor,
                          child: CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 58,
                            backgroundImage: AssetImage('assets/reffer_img1.png'),
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        'Refer your friend and knowns to earnmore',
                        style: Theme.of(context).primaryTextTheme.displayMedium,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            width: Get.width / 3,
                            child: Column(
                              children: [
                                Align(
                                  alignment: Alignment.center,
                                  child: CircleAvatar(
                                    radius: 60,
                                    backgroundColor: Theme.of(context).primaryColor,
                                    child: CircleAvatar(
                                      backgroundColor: Colors.white,
                                      radius: 58,
                                      backgroundImage: AssetImage('assets/reffer_img2.png'),
                                    ),
                                  ),
                                ),
                                Center(
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 5),
                                    child: Text('you will get 1000 instant after sucessfull signup.', style: Theme.of(context).primaryTextTheme.displayMedium, textAlign: TextAlign.center),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: Get.width / 3,
                            child: Column(
                              children: [
                                Align(
                                  alignment: Alignment.center,
                                  child: CircleAvatar(
                                    radius: 60,
                                    backgroundColor: Theme.of(context).primaryColor,
                                    child: CircleAvatar(
                                      backgroundColor: Colors.white,
                                      radius: 58,
                                      backgroundImage: AssetImage('assets/reffer_img3.png'),
                                    ),
                                  ),
                                ),
                                Center(
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 5),
                                    child: Text(
                                      'You will get 5% from the earning of  the person you referred.',
                                      style: Theme.of(context).primaryTextTheme.displayMedium,
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 15),
                        child: ListTile(
                          title: Center(
                            child: Column(
                              children: [
                                Text(
                                  'YOUR REFER CODE IS ',
                                  style: Theme.of(context).textTheme.bodyLarge,
                                ),
                                Text(
                                  'FVA4',
                                  style: Theme.of(context).textTheme.displaySmall,
                                ),
                              ],
                            ),
                          ),
                          onTap: () {},
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Center(
                        child: Text(
                          'Ask your network to enter your referral code while signup to earn benifits of the refer and earn program.',
                          style: Theme.of(context).primaryTextTheme.displayMedium,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CommonPadding(
        child: PrimaryTextButton(
          text: "REFER",
          voidCallback: () {},
        ),
      ),
    );
  }
}
