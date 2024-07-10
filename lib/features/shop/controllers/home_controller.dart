import 'package:get/get.dart';

class HomeController {
  static HomeController get isntance => Get.find();
  final carousalCurrentIndex = 0.obs;
  void updatePageIndicator(index) {
    carousalCurrentIndex.value = index;
  }
}
