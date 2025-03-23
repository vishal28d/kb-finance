//flutter
import 'package:get/get.dart';

class HomeController extends GetxController {
  int? selectedimg;
  int currentIndex = 0.obs();

  bool isLoanLoaded = false;

  @override
  void onInit() async {
    super.onInit();
  }

  void setImg(int img) {
    selectedimg = img;
    update();
  }

  void setCurrentIndex(int index) {
    currentIndex = index;
    update();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
