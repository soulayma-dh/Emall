import 'package:get/get.dart';

class FilterController extends GetxController {
  var selectedCategory = ''.obs;
  var selectedGender = ''.obs;
  var selectedSize = ''.obs;
  var isPromo = false.obs;
  var isNew = false.obs;

  void resetFilters() {
    selectedCategory.value = '';
    selectedGender.value = '';
    selectedSize.value = '';
    isPromo.value = false;
    isNew.value = false;
  }

  void applyFilters() {
    print('Category: ${selectedCategory.value}');
    print('Gender: ${selectedGender.value}');
    print('Size: ${selectedSize.value}');
    print('Promo: ${isPromo.value}');
    print('New: ${isNew.value}');
  }
}
