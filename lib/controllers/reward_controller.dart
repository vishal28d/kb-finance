//flutter
import 'package:get/get.dart';

class RewardController extends GetxController {
  @override
  void onInit() async {
    super.onInit();
  }

  List<String> imageList = [
    'assets/outerimage.png',
    'assets/outerimage.png',
    'assets/outerimage.png',
    'assets/outerimage.png',
  ];
  void removeImage(int index) {
    imageList.removeAt(index);
    update();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
