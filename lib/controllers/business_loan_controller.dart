//flutter
import 'dart:io';
//packages
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
//views

class BusinessLoanController extends GetxController {
  // getxcontroller instance
  int indexValue = 0.obs();
  int gender = 1.obs();
  int loanType = 1.obs();
  int maritalStatus = 1.obs();
  File? photoOfPropIndi;
  File? panCard;
  File? aadharCard;
  File? electricityBill;
  File? companyIdCard;
  File? gstRegistration;
  List<File> partnerAadharCards = [];
  File? partnerAadharCard;
  File? panCardPartnershipFirm;
  List<File> partnerPanCards = [];
  File? partnerPanCard;
  List<File> photoOfPartners = [];
  File? photoOfPartner;
  File? partnershipDeed;
  File? registration;
  File? plBalanceSheet;
  File? panCardLimitedCompany;
  File? directorPanCard;
  List<File> directorPanCards = [];
  File? directorAadharCard;
  List<File> directorAadharCards = [];
  File? photoOfDirector;
  List<File> photoOfDirectors = [];
  List<String> partnerNameList = [];
  List<String> directorNameList = [];
  List<String> companyTypeList = ["Proprietor", "Partnership", "LLP", "Pvt.Ltd", "Not registered"];
  List<String> workTypeList = [];
  List<String> nomineesList = ["Father", "Mother", "Brother", "Sister"];
  List<String> numberList = ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12', '13', '14', '15', '16', '17', '18', '19', '20'];
  List<String> yearList = ["2017-2018", "2018-2019", "2019-2020", "2020-2021"];
  List<TextEditingController> cPartnerNameList = [];
  List<TextEditingController> cDirectorNameList = [];
  List<TextEditingController> cPartnerPhoneNumberList = [];
  List<TextEditingController> cPartnerPanCardList = [];
  List<TextEditingController> cDirectorPhoneNumberList = [];
  List<TextEditingController> cDirectorPanCardList = [];
  List<String> cityList = [];
  List<String> stateList = [];
  List<String> industryList = [];
  List<String> companyCategoryList = [];
  dynamic companyTypeVal;
  dynamic companyCategoryVal;
  dynamic nomineeVal;
  dynamic workTypeVal;
  dynamic industryVal;
  dynamic stateVal;
  dynamic cityVal;
  dynamic firstYearOfITReturnVal;
  dynamic numberValForPartner;
  dynamic numberValForDirector;
  dynamic secondYearOfITReturnVal;
  dynamic firstYearOfAuditReportVal;
  dynamic secondYearOfAuditReportVal;

  @override
  void onInit() async {
    super.onInit();
  }

  void setIndex(int index) {
    indexValue = index;
    update();
  }

  void setPartnerListName() {
    partnerNameList.clear();
    for (var i = 0; i < cPartnerNameList.length; i++) {
      partnerNameList.add(cPartnerNameList[i].text);
    }
    update();
  }

  void setPartnerPanCardFiles() {
    for (var i = 0; i < cPartnerNameList.length; i++) {
      partnerPanCards.add(partnerPanCard!);
    }
  }

  void setPartnerAadharCardFiles() {
    for (var i = 0; i < cPartnerNameList.length; i++) {
      partnerAadharCards.add(partnerAadharCard!);
    }
  }

  void setPartnerPhotoFiles() {
    for (var i = 0; i < cPartnerNameList.length; i++) {
      photoOfPartners.add(photoOfPartner!);
    }
  }

  void setDirectorPanCardFiles() {
    for (var i = 0; i < cDirectorNameList.length; i++) {
      directorPanCards.add(directorPanCard!);
    }
  }

  void setDirectorAadharCardFiles() {
    for (var i = 0; i < cDirectorNameList.length; i++) {
      directorAadharCards.add(directorAadharCard!);
    }
  }

  void setDirectorPhotoFiles() {
    for (var i = 0; i < cDirectorNameList.length; i++) {
      photoOfDirectors.add(photoOfDirector!);
    }
  }

  void setDirectorListName() {
    directorNameList.clear();
    for (var i = 0; i < cDirectorNameList.length; i++) {
      directorNameList.add(cDirectorNameList[i].text);
    }
    update();
  }

  void setCompanyType(String name) {
    companyTypeVal = name;
    update();
  }

  void setGender(int index) {
    gender = index;
    update();
  }

  void setPartnerListController(int selectedNumber) {
    cPartnerNameList.clear();
    cPartnerPanCardList.clear();
    cPartnerPhoneNumberList.clear();
    for (var i = 0; i < selectedNumber; i++) {
      cPartnerNameList.add(TextEditingController(text: ''));
      cPartnerPanCardList.add(TextEditingController(text: ''));
      cPartnerPhoneNumberList.add(TextEditingController(text: ''));
    }
  }

  void setDirectorListController(int selectedNumber) {
    cDirectorNameList.clear();
    cDirectorPanCardList.clear();
    cDirectorPhoneNumberList.clear();
    for (var i = 0; i < selectedNumber; i++) {
      cDirectorNameList.add(TextEditingController(text: ''));
      cDirectorPanCardList.add(TextEditingController(text: ''));
      cDirectorPhoneNumberList.add(TextEditingController(text: ''));
    }
  }

  void setLoanType(int index) {
    loanType = index;
    update();
  }

  void setMaritalStatus(int index) {
    maritalStatus = index;
    update();
  }

  void setNumberValForPartner(String number) {
    numberValForPartner = number;
    update();
  }

  void setNumberValForDirector(String number) {
    numberValForDirector = number;
    update();
  }

  void setPhotoOfPropIndi(File file) {
    photoOfPropIndi = file;
    update();
  }

  void setDirectorPanCard(File file, index) {
    directorPanCards[index] = file;
    update();
  }

  void setDirectorAadharCard(File file, int index) {
    directorAadharCards[index] = file;
    update();
  }

  void setGstRegistration(File file) {
    gstRegistration = file;
    update();
  }

  void setPartnerAadharCards(File file, int index) {
    partnerAadharCards[index] = file;
    update();
  }

  void setDirectorPhoto(File file, int index) {
    photoOfDirectors[index] = file;
    update();
  }

  void setpartnershipDeed(File file) {
    partnershipDeed = file;
    update();
  }

  void setPanCardLimitedCompany(File file) {
    panCardLimitedCompany = file;
    update();
  }

  void setElectricityBill(File file) {
    electricityBill = file;
    update();
  }

  void setPLBalanceSheet(File file) {
    plBalanceSheet = file;
    update();
  }

  void setRegistration(File file) {
    registration = file;
    update();
  }

  void setPanCardPartnershipFirm(File file) {
    panCardPartnershipFirm = file;
    update();
  }

  void setPhotoOfPartner(File file, index) {
    photoOfPartners[index] = file;
    update();
  }

  void setPartnerPanCard(File file, int index) {
    partnerPanCards[index] = file;
    update();
  }

  void setCompanyIdCard(File file) {
    companyIdCard = file;
    update();
  }

  void setAadharCard(File file) {
    aadharCard = file;
    update();
  }

  void setPanCard(File file) {
    panCard = file;
    update();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
