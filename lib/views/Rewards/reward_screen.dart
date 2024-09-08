// ignore_for_file: must_be_immutable

import 'package:credit_app/controllers/reward_controller.dart';
import 'package:credit_app/widget/appBarWidget.dart';
import 'package:credit_app/widget/baseRoute.dart';
import 'package:credit_app/utils/global.dart' as global;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scratcher/scratcher.dart';

class RewardScreen extends BaseRoute {
  RewardScreen({a, o}) : super(a: a, o: o, r: 'RewardScreen');

  final RewardController rewardController = Get.find<RewardController>();

  List<String> imagelist = [
    'assets/outerimage.png',
    'assets/outerimage.png',
    'assets/outerimage.png',
    'assets/outerimage.png',
    'assets/outerimage.png',
    'assets/outerimage.png',
    'assets/outerimage.png',
    'assets/outerimage.png',
    'assets/outerimage.png',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: MyCustomAppBar(
          leading: IconButton(
            onPressed: () {
              Get.back();
              // Get.back();
            },
            icon: Icon(
              Icons.arrow_back_ios,
              size: 20,
            ),
          ),
          height: 80,
          appbarPadding: 0,
          title: Text('Rewards'),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 25),
              child: Column(
                children: [
                  Text(
                    'Total Rewards',
                    style: Theme.of(context).textTheme.displaySmall,
                  ),
                  Text(
                    '1000',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ],
              ),
            ),
            Expanded(child: GetBuilder<RewardController>(builder: (controller) {
              return Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30)),
                  ),
                  margin: EdgeInsets.only(top: 25),
                  width: Get.width,
                  child: Padding(
                    padding: EdgeInsets.only(top: 15, left: 15, right: 15),
                    child: rewardController.imageList.length > 0
                        ? _rewardsListWidget(context)
                        : Center(
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 50),
                              child: Text(
                                'No Rewards',
                                style: Theme.of(context).primaryTextTheme.headlineMedium,
                              ),
                            ),
                          ),
                  ));
            }))
          ],
        ));
  }

  Widget cardScratcherDialog(context, int index) {
    return SimpleDialog(
      backgroundColor: Colors.white,
      children: [
        Scratcher(
            image: Image.asset('assets/outerimage.png'),
            brushSize: 60,
            threshold: 70,
            accuracy: ScratchAccuracy.low,
            color: Colors.transparent,
            onThreshold: () async {
              Get.back();
              rewardController.removeImage(index);
            },
            child: Container(
              alignment: Alignment.center,
              height: 250,
              width: MediaQuery.of(context).size.width,
              child: Text(
                "You won ${global.currencySymbol}5",
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            )),
      ],
    );
  }

  _rewardsListWidget(context) {
    return GetBuilder<RewardController>(builder: (controller) {
      return GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 5.0,
          children: List.generate(rewardController.imageList.length, (index) {
            return Center(
              child: GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) => cardScratcherDialog(context, index),
                    ).then((value) {});
                  },
                  child: Container(height: 165, width: Get.width / 2, child: Image.asset('${imagelist[index]}'))),
            );
          }));
    });
  }
}
