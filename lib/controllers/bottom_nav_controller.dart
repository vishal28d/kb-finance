//flutter
import 'package:get/get.dart';
//views

class BottomNavController extends GetxController {
  int currentIndex = 0.obs();
  bool home2Activated = true.obs();
  @override
  void onInit() async {
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void setHome2() {
    home2Activated = true;
    update();
  }

  void setHome() {
    home2Activated = false;
    update();
  }

  void setCurrentIndex(int index) {
    currentIndex = index;
    update();
  }
}
