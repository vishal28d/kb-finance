//flutter
import 'package:credit_app/controllers/business_loan_controller.dart';
import 'package:credit_app/views/BusinessLoan/upload_document_blscreen.dart';
import 'package:credit_app/widget/appBarWidget.dart';
import 'package:credit_app/widget/common_padding.dart';
import 'package:credit_app/widget/custom_dropdown.dart';
import 'package:credit_app/widget/custom_textformfield.dart';
import 'package:credit_app/widget/primary_button.dart';
import 'package:flutter/material.dart';
//controllers
import 'package:credit_app/controllers/splashController.dart';
//models
import 'package:credit_app/widget/baseRoute.dart';
//packages
import 'package:get/get.dart';

class PartnerListEntryBLScreen extends BaseRoute {
  PartnerListEntryBLScreen({a, o}) : super(a: a, o: o, r: 'PartnerListEntryBLScreen');

  final SplashController customerController = Get.put(SplashController());
  final BusinessLoanController businessLoanController = Get.find<BusinessLoanController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: MyCustomAppBar(
          height: 80,
          appbarPadding: 0,
          title: Text(''),
          centerTitle: true,
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(Icons.arrow_back_ios),
          ),
        ),
        bottomNavigationBar: CommonPadding(
          child: PrimaryTextButton(
            text: 'Next',
            voidCallback: () {
              // businessLoanController.setPartnerListName();
              // businessLoanController.setPartnerPanCardFiles();
              // businessLoanController.setPartnerAadharCardFiles();
              // businessLoanController.setPartnerPhotoFiles();

              Get.to(() => UploadDocumentBLScreen(
                    a: a,
                    o: o,
                  ));
            },
          ),
        ),
        body: CommonPadding(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  width: Get.width,
                  child: Padding(
                    padding: EdgeInsets.only(top: 15),
                    child: Text(
                      'Select number of Partners',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ),
                ),
                Padding(
                    padding: EdgeInsets.only(top: 8),
                    child: CustomDropDown(
                      hint: Text(
                        "Choose here",
                        style: Theme.of(context).inputDecorationTheme.hintStyle,
                      ),
                      list: businessLoanController.numberList,
                      onChanged: (selectedValue) {
                        businessLoanController.setNumberValForPartner(selectedValue.toString());
                        businessLoanController.setPartnerListController(int.parse(selectedValue));
                      },
                      val: businessLoanController.numberValForPartner,
                    )),
                GetBuilder<BusinessLoanController>(builder: (controller) {
                  return businessLoanController.numberValForPartner != null
                      ? ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: int.parse(businessLoanController.numberValForPartner.toString()),
                          itemBuilder: (BuildContext context, int index) {
                            return Column(
                              children: [
                                businessLoanController.numberValForPartner != null
                                    ? Container(
                                        width: Get.width,
                                        child: Padding(
                                          padding: EdgeInsets.only(top: 15),
                                          child: Text(
                                            'Fill the details for Partner ${index + 1}',
                                            style: Theme.of(context).primaryTextTheme.displayLarge,
                                          ),
                                        ),
                                      )
                                    : SizedBox(),
                                Container(
                                  width: Get.width,
                                  child: Padding(
                                    padding: EdgeInsets.only(top: 15),
                                    child: Text(
                                      'Name of Partner',
                                      style: Theme.of(context).textTheme.bodyLarge,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 8),
                                  child: CustomTextFormField(
                                    hintText: "Type here",
                                    textEditingController: businessLoanController.cPartnerNameList[index],
                                    obscureText: false,
                                  ),
                                ),
                                Container(
                                  width: Get.width,
                                  child: Padding(
                                    padding: EdgeInsets.only(top: 15),
                                    child: Text(
                                      'PAN Card of Partner',
                                      style: Theme.of(context).textTheme.bodyLarge,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 8),
                                  child: CustomTextFormField(
                                    hintText: "Type here",
                                    textEditingController: businessLoanController.cPartnerPanCardList[index],
                                    obscureText: false,
                                  ),
                                ),
                                Container(
                                  width: Get.width,
                                  child: Padding(
                                    padding: EdgeInsets.only(top: 15),
                                    child: Text(
                                      'Phone Number of Partner',
                                      style: Theme.of(context).textTheme.bodyLarge,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 8),
                                  child: CustomTextFormField(
                                    hintText: "Type here",
                                    textEditingController: businessLoanController.cPartnerPhoneNumberList[index],
                                    obscureText: false,
                                    textInputType: TextInputType.numberWithOptions(decimal: true, signed: true),
                                    maxLength: 10,
                                  ),
                                ),
                              ],
                            );
                          })
                      : SizedBox();
                })
              ],
            ),
          ),
        ));
  }
}
