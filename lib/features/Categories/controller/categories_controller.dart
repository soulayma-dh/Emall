import 'package:emall/features/Categories/model/category.dart';
import 'package:emall/features/Categories/repository/categories_repository.dart';
import 'package:emall/utils/popups/loaders.dart';
import 'package:get/get.dart';

class CategoriesController extends GetxController {
  static CategoriesController get instance => Get.find();

  ///Variables
  final isLoading = false.obs;
  final _categoryRepository = Get.put(CategoriesRepository());
  RxList<CategoryModel> allCategories = <CategoryModel>[].obs;
  RxList<CategoryModel> featuredCategories = <CategoryModel>[].obs;
  @override
  void onInit() {
    fetchAllCategories();
    super.onInit();
  }

  /// Load categories
  Future<void> fetchAllCategories() async {
    try {
      isLoading.value = true;

      final categories = await _categoryRepository.getAllCategories();

      // Update the full categories list
      allCategories.assignAll(categories);

      // Filter featured categories
      featuredCategories.assignAll(allCategories
          .where((category) => category.isFeatured && category.parentId.isEmpty)
          .take(8));
    } catch (e) {
      Loaders.errorSnackBar(
        title: "On Fetch",
        message: e.toString(),
      );
    } finally {
      isLoading.value = false;
    }
  }
}
