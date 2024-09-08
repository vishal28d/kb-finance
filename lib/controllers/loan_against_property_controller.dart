//flutter
import 'dart:io';
import 'package:get/get.dart';

class LoanAgainstPropertyController extends GetxController {
  List<String> propetyTypeList = ["Fully Constructed - Apartment", "Fully Constructed - Individual House", "Under Constructed - Apartment", "Under Constructed - Individual House", "Only Plot Purchase", "Construction On Pre-owned Plot", "Plot Purchase and Construction"];
  int indexValue = 0.obs();

  List<String> relationList = ["Father", "Mother", "Sister/Brother", "Spouse"];
  List<String> employementTypeList = ["Salaried", "Self-employed", "Homemaker", "Unemployed", "Student", "Retired"];
  List<String> serviceList = ["Govt/PSU", "Private Listed/MNC", "Private Unlisted", "Partnership", "Others"];
  List<String> residenceTypeList = ["Rented", "Owned", "Leased"];
  List<String> employeNatureList = ["Permanent", "On Probation", "Contractual"];
  int maritalStatus = 1.obs();
  int isCoApplicant = 1.obs();
  int isTopUpLoanRequired = 2.obs();

  int loanType = 1.obs();
  int isCorrespondingAddressSame = 1.obs();
  int coApplicantMaritalStatus = 1.obs();
  dynamic propertyTypeVal;
  dynamic relationVal;
  dynamic employemenTypeVal;
  dynamic serviceTypeVal;
  dynamic employeNatureVal;
  dynamic residenceTypeVal;
  File? panCard;
  File? aadharCard;
  File? photographs;

  @override
  void onInit() async {
    super.onInit();
  }

  void setPropertyType(String name) {
    propertyTypeVal = name;
    update();
  }

  void setIndex(int index) {
    indexValue = index;
    update();
  }

  void setLoanType(int index) {
    loanType = index;
    update();
  }

  void setTopUpLoanRequired(int index) {
    isTopUpLoanRequired = index;
    update();
  }

  void setPanCard(File file) {
    panCard = file;
    update();
  }

  void setServiceType(String name) {
    serviceTypeVal = name;
    update();
  }

  void setResidenceType(String name) {
    residenceTypeVal = name;
    update();
  }

  void setAadharCard(File file) {
    aadharCard = file;
    update();
  }

  void setPhotographs(File file) {
    photographs = file;
    update();
  }

  void setEmployementType(String name) {
    employemenTypeVal = name;
    update();
  }

  void setEmployeNature(String name) {
    employeNatureVal = name;
    update();
  }

  void setMaritalStatus(int index) {
    maritalStatus = index;
    update();
  }

  void setRelation(String name) {
    relationVal = name;
    update();
  }

  void setCoApplicant(int index) {
    isCoApplicant = index;
    update();
  }

  void setCorrespondingAddress(int index) {
    isCorrespondingAddressSame = index;
    update();
  }

  void setCoApplicantMaritalStatus(int index) {
    coApplicantMaritalStatus = index;
    update();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
