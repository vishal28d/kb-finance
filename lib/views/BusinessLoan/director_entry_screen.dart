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

class DirectorListEntryBLScreen extends BaseRoute {
  DirectorListEntryBLScreen({a, o}) : super(a: a, o: o, r: 'DirectorListEntryBLScreen');

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
              businessLoanController.setDirectorListName();
              businessLoanController.setDirectorPanCardFiles();
              businessLoanController.setDirectorAadharCardFiles();
              businessLoanController.setDirectorPhotoFiles();
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
                      'Select number of Directors',
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
                        businessLoanController.setNumberValForDirector(selectedValue.toString());
                        businessLoanController.setDirectorListController(int.parse(selectedValue));
                      },
                      val: businessLoanController.numberValForDirector,
                    )),
                GetBuilder<BusinessLoanController>(builder: (controller) {
                  return businessLoanController.numberValForDirector != null
                      ? ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: int.parse(businessLoanController.numberValForDirector.toString()),
                          itemBuilder: (BuildContext context, int index) {
                            return Column(
                              children: [
                                businessLoanController.numberValForDirector != null
                                    ? Container(
                                        width: Get.width,
                                        child: Padding(
                                          padding: EdgeInsets.only(top: 15),
                                          child: Text(
                                            'Fill the detail for all Directors',
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
                                      'Name of Director',
                                      style: Theme.of(context).textTheme.bodyLarge,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 8),
                                  child: CustomTextFormField(
                                    hintText: "Type here",
                                    textEditingController: businessLoanController.cDirectorNameList[index],
                                    obscureText: false,
                                  ),
                                ),
                                Container(
                                  width: Get.width,
                                  child: Padding(
                                    padding: EdgeInsets.only(top: 15),
                                    child: Text(
                                      'PAN Card of Director',
                                      style: Theme.of(context).textTheme.bodyLarge,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 8),
                                  child: CustomTextFormField(
                                    hintText: "Type here",
                                    textEditingController: businessLoanController.cDirectorPanCardList[index],
                                    obscureText: false,
                                  ),
                                ),
                                Container(
                                  width: Get.width,
                                  child: Padding(
                                    padding: EdgeInsets.only(top: 15),
                                    child: Text(
                                      'Phone Number of Director',
                                      style: Theme.of(context).textTheme.bodyLarge,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 8),
                                  child: CustomTextFormField(
                                    hintText: "Type here",
                                    textEditingController: businessLoanController.cDirectorPhoneNumberList[index],
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
