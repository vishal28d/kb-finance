import 'package:credit_app/widget/appBarWidget.dart';
import 'package:credit_app/widget/baseRoute.dart';
import 'package:credit_app/widget/common_padding.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotificationScreen extends BaseRoute {
  NotificationScreen({a, o}) : super(a: a, o: o, r: 'Notification');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
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
        title: Text('Notifications'),
        centerTitle: true,
      ),
      body: CommonPadding(
          child: SingleChildScrollView(
        child: ListView.builder(
          itemCount: 6,
          shrinkWrap: true,
          itemBuilder: (BuildContext context, int index) {
            return Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 15, bottom: 5),
                  child: Card(
                      elevation: 1,
                      child: Theme(
                        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ExpansionTile(
                            children: [
                              Text(
                                'Description',
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                            ],
                            childrenPadding: EdgeInsets.all(8),
                            leading: Padding(
                              padding: EdgeInsets.only(top: 2, bottom: 2),
                              child: CircleAvatar(
                                radius: 30,
                                child: Icon(Icons.notifications),
                              ),
                            ),
                            title: Text(
                              'Title',
                              style: Theme.of(context).textTheme.titleLarge,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                      )),
                ),
              ],
            );
          },
        ),
      )),
    );
  }
}
