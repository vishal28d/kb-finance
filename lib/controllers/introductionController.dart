import 'package:get/get.dart';

class IntroductionController extends GetxController {
  int? selectedPage;
  int currentIndex = 0.obs();

  @override
  void onInit() async {
    _init();
    super.onInit();
  }

  void setPage(int page) {
    selectedPage = page;
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

  _init() {}
}
