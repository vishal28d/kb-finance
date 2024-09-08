// ignore_for_file: must_be_immutable
//flutter
import 'package:credit_app/controllers/business_loan_controller.dart';
import 'package:credit_app/controllers/imageController.dart';
import 'package:credit_app/views/BusinessLoan/loan_detail_entry_for_transfer_blscreen.dart';
import 'package:credit_app/views/SanctionedDisbursal/sanctioned_disbursal_sreen.dart';
import 'package:credit_app/widget/appBarWidget.dart';
import 'package:credit_app/widget/baseRoute.dart';
import 'package:credit_app/widget/common_padding.dart';
import 'package:credit_app/widget/imageWidget.dart';
import 'package:credit_app/widget/primary_button.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
//packages
import 'package:get/get.dart';

class UploadPartnerDirectorDocumentsBLScreen extends BaseRoute {
  UploadPartnerDirectorDocumentsBLScreen({a, o}) : super(a: a, o: o, r: 'UploadPartnerDirectorDocumentsBLScreen');

  final BusinessLoanController businessLoanController = Get.put(BusinessLoanController());
  ImageControlller imageController = Get.find<ImageControlller>();
  imagePickerSheet(String imageName, context, int index) {
    return Get.bottomSheet(
        Container(
            decoration: BoxDecoration(color: Theme.of(context).primaryColor, borderRadius: BorderRadius.only(topLeft: Radius.circular(25), topRight: Radius.circular(25))),
            height: 180,
            width: Get.width,
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.only(top: 5),
                  child: Text(
                    'Select Image',
                    style: Theme.of(context).primaryTextTheme.headlineSmall,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10, left: 15, right: 15),
                  child: Card(
                    child: ListTile(
                      leading: Icon(
                        Icons.image,
                        size: 25,
                      ),
                      title: Text('Gallery'),
                      onTap: () async {
                        Get.back();
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10, left: 15, right: 15),
                  child: Card(
                    child: ListTile(
                      leading: Icon(Icons.camera, size: 25),
                      title: Text('Camera'),
                      onTap: () async {
                        Get.back();
                      },
                    ),
                  ),
                ),
              ],
            )),
        backgroundColor: Colors.transparent);
  }

  List<Widget> directorPanCardList(context) {
    List<Widget> list = [];

    for (var i = 0; i < businessLoanController.directorNameList.length; i++) {
      list.add(Column(
        children: [
          Container(
            width: Get.width,
            child: Padding(
              padding: EdgeInsets.only(top: 15),
              child: Text(
                'PAN Card of ${businessLoanController.directorNameList[i]}',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
          ),
          Padding(
              padding: EdgeInsets.only(top: 8),
              child: DottedBorder(
                strokeWidth: 1,
                color: Theme.of(context).primaryColor,
                child: GestureDetector(
                  onTap: () {
                    imagePickerSheet('Director PAN Card', context, i);
                  },
                  child: Container(
                    width: Get.width,
                    height: 250,
                    child: ImageWidget(
                      file: businessLoanController.directorPanCards[i],
                      name: 'Director PAN Card',
                    ),
                  ),
                ),
              )),
        ],
      ));
    }
    return list;
  }

  List<Widget> directorAadharCardList(context) {
    List<Widget> list = [];

    for (var i = 0; i < businessLoanController.directorNameList.length; i++) {
      list.add(Column(
        children: [
          Container(
            width: Get.width,
            child: Padding(
              padding: EdgeInsets.only(top: 15),
              child: Text(
                'Aadhar Card of ${businessLoanController.directorNameList[i]}',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
          ),
          Padding(
              padding: EdgeInsets.only(top: 8),
              child: DottedBorder(
                strokeWidth: 1,
                color: Theme.of(context).primaryColor,
                child: GestureDetector(
                  onTap: () {
                    imagePickerSheet('Director Aadhar Card', context, i);
                  },
                  child: Container(
                    width: Get.width,
                    height: 250,
                    child: ImageWidget(
                      file: businessLoanController.directorAadharCards[i],
                      name: 'Director Aadhar Card',
                    ),
                  ),
                ),
              )),
        ],
      ));
    }
    return list;
  }

  List<Widget> directorPhotoList(context) {
    List<Widget> list = [];

    for (var i = 0; i < businessLoanController.directorNameList.length; i++) {
      list.add(Column(
        children: [
          Container(
            width: Get.width,
            child: Padding(
              padding: EdgeInsets.only(top: 15),
              child: Text(
                'Photo of ${businessLoanController.directorNameList[i]}',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
          ),
          Padding(
              padding: EdgeInsets.only(top: 8),
              child: DottedBorder(
                strokeWidth: 1,
                color: Theme.of(context).primaryColor,
                child: GestureDetector(
                  onTap: () {
                    imagePickerSheet('Photo of Director', context, i);
                  },
                  child: Container(
                    width: Get.width,
                    height: 250,
                    child: ImageWidget(
                      file: businessLoanController.photoOfDirectors[i],
                      name: 'Photo of Director',
                    ),
                  ),
                ),
              )),
        ],
      ));
    }
    return list;
  }

  List<Widget> partnerPanCardList(context) {
    List<Widget> list = [];

    for (var i = 0; i < businessLoanController.partnerNameList.length; i++) {
      list.add(Column(
        children: [
          Container(
            width: Get.width,
            child: Padding(
              padding: EdgeInsets.only(top: 15),
              child: Text(
                'PAN Card of ${businessLoanController.partnerNameList[i]}',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
          ),
          Padding(
              padding: EdgeInsets.only(top: 8),
              child: DottedBorder(
                strokeWidth: 1,
                color: Theme.of(context).primaryColor,
                child: GestureDetector(
                  onTap: () {
                    imagePickerSheet('Partner PAN Card', context, i);
                  },
                  child: Container(
                    width: Get.width,
                    height: 250,
                    child: ImageWidget(
                      file: businessLoanController.partnerPanCards[i],
                      name: 'Partner PAN Card',
                    ),
                  ),
                ),
              )),
        ],
      ));
    }
    return list;
  }

  List<Widget> partnerAadharCardList(context) {
    List<Widget> list1 = [];

    for (var i = 0; i < businessLoanController.partnerNameList.length; i++) {
      list1.add(Column(
        children: [
          Container(
            width: Get.width,
            child: Padding(
              padding: EdgeInsets.only(top: 15),
              child: Text(
                'Aadhar Card of ${businessLoanController.partnerNameList[i]}',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
          ),
          Padding(
              padding: EdgeInsets.only(top: 8),
              child: DottedBorder(
                strokeWidth: 1,
                color: Theme.of(context).primaryColor,
                child: GestureDetector(
                  onTap: () {
                    imagePickerSheet('Partner Aadhar Card', context, i);
                  },
                  child: Container(
                    width: Get.width,
                    height: 250,
                    child: ImageWidget(
                      file: businessLoanController.partnerAadharCards[i],
                      name: 'Partner Aadhar Card',
                    ),
                  ),
                ),
              )),
        ],
      ));
    }
    return list1;
  }

  List<Widget> partnerPhotoList(context) {
    List<Widget> list1 = [];

    for (var i = 0; i < businessLoanController.partnerNameList.length; i++) {
      list1.add(Column(
        children: [
          Container(
            width: Get.width,
            child: Padding(
              padding: EdgeInsets.only(top: 15),
              child: Text(
                'Photo of ${businessLoanController.partnerNameList[i]}',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
          ),
          Padding(
              padding: EdgeInsets.only(top: 8),
              child: DottedBorder(
                strokeWidth: 1,
                color: Theme.of(context).primaryColor,
                child: GestureDetector(
                  onTap: () {
                    imagePickerSheet('Photo of partner', context, i);
                  },
                  child: Container(
                    width: Get.width,
                    height: 250,
                    child: ImageWidget(
                      file: businessLoanController.photoOfPartners[i],
                      name: 'Photo of Partner',
                    ),
                  ),
                ),
              )),
        ],
      ));
    }
    return list1;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: MyCustomAppBar(
          height: 80,
          appbarPadding: 0,
          title: Text('Upload Documents'),
          leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Icon(Icons.arrow_back_ios)),
        ),
        bottomNavigationBar: CommonPadding(child: GetBuilder<BusinessLoanController>(builder: (controller) {
          return PrimaryTextButton(
            text: 'Next',
            voidCallback: () {
              if (businessLoanController.loanType == 1) {
                Get.to(() => SanctionedDisbursalScreen(
                      a: a,
                      o: o,
                    ));
              } else {
                Get.to(() => LoanDetailEntryForTransferBLScreen(
                      a: a,
                      o: o,
                    ));
              }
            },
          );
        })),
        body: CommonPadding(
          child: SingleChildScrollView(child: GetBuilder<BusinessLoanController>(builder: (controller) {
            return Column(
              children: [
                businessLoanController.companyTypeVal == 'Partnership' || businessLoanController.companyTypeVal == 'LLP'
                    ? Container(
                        width: Get.width,
                        margin: const EdgeInsets.only(top: 15),
                        child: Text(
                          "All Partner's Detail",
                          style: Theme.of(context).primaryTextTheme.displayLarge,
                        ),
                      )
                    : SizedBox(),
                businessLoanController.companyTypeVal == 'Pvt.Ltd'
                    ? Container(
                        width: Get.width,
                        margin: const EdgeInsets.only(top: 15),
                        child: Text(
                          "All Director's Detail",
                          style: Theme.of(context).primaryTextTheme.displayLarge,
                        ),
                      )
                    : SizedBox(),
                businessLoanController.companyTypeVal == 'Partnership' || businessLoanController.companyTypeVal == 'LLP'
                    ? Column(
                        children: [
                          Column(
                            children: partnerPanCardList(context),
                          ),
                          Column(
                            children: partnerAadharCardList(context),
                          ),
                          Column(
                            children: partnerPhotoList(context),
                          ),
                        ],
                      )
                    : SizedBox(),
                businessLoanController.companyTypeVal == 'Pvt.Ltd'
                    ? Column(
                        children: [
                          Column(
                            children: directorPanCardList(context),
                          ),
                          Column(
                            children: directorAadharCardList(context),
                          ),
                          Column(
                            children: directorPhotoList(context),
                          ),
                        ],
                      )
                    : SizedBox(),
              ],
            );
          })),
        ));
  }
}
