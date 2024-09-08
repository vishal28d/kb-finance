//models
import 'package:credit_app/views/Profile/profile_entry_sreen.dart';
import 'package:credit_app/widget/appBarWidget.dart';
import 'package:credit_app/widget/baseRoute.dart';
import 'package:credit_app/widget/common_padding.dart';
import 'package:credit_app/widget/drawer_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
//packages
import 'package:get/get.dart';

class ProfileScreen extends BaseRoute {
  ProfileScreen({a, o}) : super(a: a, o: o, r: 'ProfileScreen');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerWidget(
        a: a,
        o: o,
      ),
      backgroundColor: Colors.grey[100],
      appBar: MyCustomAppBar(
        actions: [
          IconButton(
            onPressed: () {
              Get.to(() => ProfileEntryScreen(
                    a: a,
                    o: o,
                  ));
            },
            icon: Icon(
              Icons.edit,
            ),
          ),
        ],
        height: 80,
        appbarPadding: 0,
        title: Text('Profile'),
        centerTitle: true,
      ),
      body: CommonPadding(
          child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 15),
              child: Card(
                  child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 0),
                    child: Container(
                      margin: EdgeInsets.only(top: 0),
                      height: 180,
                      width: MediaQuery.of(context).size.width,
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 28),
                            child: CircleAvatar(
                              radius: 60,
                              child: CircleAvatar(
                                radius: 60,
                                backgroundColor: Theme.of(context).primaryColor,
                                child: CircleAvatar(
                                  backgroundColor: Colors.white,
                                  radius: 58,
                                  child: Icon(
                                    Icons.person,
                                    size: 70,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 25),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      'UserName',
                                      style: Theme.of(context).primaryTextTheme.headlineMedium,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              )),
            ),
            Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.phone,
                            color: Theme.of(context).primaryColor,
                            size: 22,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Text('Phone Number', style: Theme.of(context).textTheme.headlineSmall),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 05),
                        child: Text('9595959595', style: Theme.of(context).textTheme.bodyLarge),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: Divider(
                    color: Colors.grey,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.email,
                            color: Theme.of(context).primaryColor,
                            size: 22,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Text('Email Id', style: Theme.of(context).textTheme.headlineSmall),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 05),
                        child: Text('abc@gmail.com', style: Theme.of(context).textTheme.bodyLarge),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: Divider(
                    color: Colors.grey,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(
                            FontAwesomeIcons.idCard,
                            color: Theme.of(context).primaryColor,
                            size: 22,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Text('PAN Card', style: Theme.of(context).textTheme.headlineSmall),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 05),
                        child: Text('abc@gmail.com', style: Theme.of(context).textTheme.bodyLarge),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: Divider(
                    color: Colors.grey,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.cake,
                            color: Theme.of(context).primaryColor,
                            size: 22,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Text('Date of Birth', style: Theme.of(context).textTheme.headlineSmall),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 05),
                        child: Text('01-02-1996', style: Theme.of(context).textTheme.bodyLarge),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: Divider(
                    color: Colors.grey,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.credit_card_rounded,
                            color: Theme.of(context).primaryColor,
                            size: 22,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Text('Aadhar Card', style: Theme.of(context).textTheme.headlineSmall),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 05),
                        child: Text('5677121220541264', style: Theme.of(context).textTheme.bodyLarge),
                      )
                    ],
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
