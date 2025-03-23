//flutter
import 'package:credit_app/controllers/permission_controller.dart';
import 'package:credit_app/views/Login/login_screen.dart';
import 'package:credit_app/widget/appBarWidget.dart';
import 'package:credit_app/widget/common_padding.dart';
import 'package:credit_app/widget/primary_button.dart';
import 'package:flutter/material.dart';
//models
import 'package:credit_app/widget/baseRoute.dart';
//packages
import 'package:get/get.dart';

class PermissionScreen extends BaseRoute {
  PermissionScreen({a, o}) : super(a: a, o: o, r: 'PermissionScreen');

  final PermissionController permissionController = Get.put(PermissionController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: MyCustomAppBar(
          height: 80,
          appbarPadding: 0,
          leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Icon(Icons.arrow_back_ios)),
          title: Text('Permissions'),
          centerTitle: true,
        ),
        bottomNavigationBar: CommonPadding(
          child: PrimaryTextButton(
            text: 'Next',
            voidCallback: () {
              Get.to(() => LoginScreen(
                    a: a,
                    o: o,
                  ));
            },
          ),
        ),
        body: Container(
          color: Color(0xffffffff),
          padding: EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 5, bottom: 5),
                  child: Column(
                    children: [
                      Container(
                        child: Column(
                          children: [
                            Container(
                              child: ListTile(
                                contentPadding: EdgeInsets.only(left: 8),
                                horizontalTitleGap: 8,
                                leading: CircleAvatar(
                                  backgroundColor: Theme.of(context).primaryColor,
                                  child: Icon(
                                    Icons.camera,
                                    color: Colors.white,
                                    size: 25,
                                  ),
                                  radius: 20,
                                ),
                                title: Text('Camera', style: Theme.of(context).textTheme.titleLarge),
                                subtitle: Text('This app needs camera access to take pictures for upload user profile photo', style: Theme.of(context).primaryTextTheme.displaySmall),
                                onTap: () {},
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(),
                Container(
                  margin: EdgeInsets.only(top: 5, bottom: 5),
                  child: Column(
                    children: [
                      Container(
                        child: Column(
                          children: [
                            Container(
                              child: ListTile(
                                contentPadding: EdgeInsets.only(left: 8),
                                horizontalTitleGap: 8,
                                leading: CircleAvatar(
                                  backgroundColor: Theme.of(context).primaryColor,
                                  child: Icon(
                                    Icons.storage,
                                    color: Colors.white,
                                    size: 25,
                                  ),
                                  radius: 20,
                                ),
                                title: Text('Storage', style: Theme.of(context).textTheme.titleLarge),
                                subtitle: Text('This app needs storage permissin for read and write internal and external data', textScaleFactor: 1, style: Theme.of(context).primaryTextTheme.displaySmall),
                                onTap: () {},
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(),
                Container(
                  margin: EdgeInsets.only(top: 5, bottom: 5),
                  child: Column(
                    children: [
                      Container(
                        child: Column(
                          children: [
                            Container(
                              child: ListTile(
                                contentPadding: EdgeInsets.only(left: 8),
                                horizontalTitleGap: 8,
                                leading: CircleAvatar(
                                  backgroundColor: Theme.of(context).primaryColor,
                                  child: Icon(
                                    Icons.contact_phone,
                                    color: Colors.white,
                                    size: 25,
                                  ),
                                  radius: 20,
                                ),
                                title: Text('Contact', style: Theme.of(context).textTheme.titleLarge),
                                subtitle: Text('This app needs contact permission to access device saved contact number', textScaleFactor: 1, style: Theme.of(context).primaryTextTheme.displaySmall),
                                onTap: () {},
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(),
                Container(
                  margin: EdgeInsets.only(top: 5, bottom: 5),
                  child: Column(
                    children: [
                      Container(
                        child: Column(
                          children: [
                            Container(
                              child: ListTile(
                                contentPadding: EdgeInsets.only(left: 8),
                                horizontalTitleGap: 8,
                                leading: CircleAvatar(
                                  backgroundColor: Theme.of(context).primaryColor,
                                  child: Icon(
                                    Icons.location_on,
                                    color: Colors.white,
                                    size: 25,
                                  ),
                                  radius: 20,
                                ),
                                title: Text('Location', style: Theme.of(context).textTheme.titleLarge),
                                subtitle: Text('This app needs Location permiss for factching user location', textScaleFactor: 1, style: Theme.of(context).primaryTextTheme.displaySmall),
                                onTap: () {},
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(),
                Container(
                  margin: EdgeInsets.only(top: 5, bottom: 5),
                  child: Column(
                    children: [
                      Container(
                        child: Column(
                          children: [
                            Container(
                              child: ListTile(
                                contentPadding: EdgeInsets.only(left: 8),
                                horizontalTitleGap: 8,
                                leading: CircleAvatar(
                                  backgroundColor: Theme.of(context).primaryColor,
                                  child: Icon(
                                    Icons.sms,
                                    color: Colors.white,
                                    size: 25,
                                  ),
                                  radius: 20,
                                ),
                                title: Text('SMS', style: Theme.of(context).textTheme.titleLarge),
                                subtitle: Text('This app needs sms permission for receiving the sms', textScaleFactor: 1, style: Theme.of(context).primaryTextTheme.displaySmall),
                                onTap: () {},
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
