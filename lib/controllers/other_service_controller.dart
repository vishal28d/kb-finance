//flutter
import 'package:get/get.dart';

class OtherServicesController extends GetxController {
  // getxcontroller instance
  List<String> employementTypeList = ["Salaried", "Self-employed", "Homemaker", "Unemployed", "Student", "Retired"];
  List<String> serviceList = ["Govt/PSU", "Private Listed/MNC", "Private Unlisted", "Partnership", "Others"];
  List<String> employeNatureList = ["Permanent", "On Probation", "Contractual"];
  dynamic employemenTypeVal;
  dynamic serviceTypeVal;
  dynamic employeNatureVal;

  @override
  void onInit() async {
    super.onInit();
  }

  void setEmployementType(String name) {
    employemenTypeVal = name;
    update();
  }

  void setServiceType(String name) {
    serviceTypeVal = name;
    update();
  }

  void setEmployeNature(String name) {
    employeNatureVal = name;
    update();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
