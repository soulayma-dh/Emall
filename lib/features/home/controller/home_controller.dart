import 'package:get/get.dart';

class HomeController extends GetxController {
  var carouselCurrentIndex = 0.obs;

  void updatePageIndicator(int index) {
    carouselCurrentIndex.value = index;
  }
}
