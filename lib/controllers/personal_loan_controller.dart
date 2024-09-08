//flutter
import 'dart:io';
import 'package:get/get.dart';

class PersonalLoanController extends GetxController {
  int indexValue = 0.obs();
  int gender = 1.obs();
  int maritalStatus = 1.obs();
  File? photo;
  File? panCard;
  File? aadharCard;
  File? electricityBill;
  File? companyIdCard;
  List<String> employementTypeList = ["Salaried", "Self Employed", "Homemaker", "Unemployed", "Student", "Retired"];
  List<String> workTypeList = [];
  List<String> nomineesList = ["Father", "Mother", "Brother", "Sister"];
  List<String> companyCategoryList = [];
  dynamic employementVal;
  dynamic companyCategoryVal;
  dynamic nomineeVal;
  dynamic workTypeVal;

  @override
  void onInit() async {
    super.onInit();
  }

  void setIndex(int index) {
    indexValue = index;
    update();
  }

  void setGender(int index) {
    gender = index;
    update();
  }

  void setMaritalStatus(int index) {
    maritalStatus = index;
    update();
  }

  void setPhoto(File file) {
    photo = file;
    update();
  }

  void setElectricityBill(File file) {
    electricityBill = file;
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
