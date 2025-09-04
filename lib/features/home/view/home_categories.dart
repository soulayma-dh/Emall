import 'package:emall/common/components/gesture_tile.dart';
import 'package:emall/common/shimmers/shimmer_category.dart';
import 'package:emall/features/Categories/controller/categories_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Categories/view/subcategory_screen.dart';

class HomeCategories extends StatelessWidget {
  HomeCategories({super.key});
  final categoryController = Get.put(CategoriesController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (categoryController.isLoading.value) return CategoryShimmer();
      if (categoryController.featuredCategories.isEmpty) {
        return Center(
          child: Text(
            'No Data Found ',
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .apply(color: Colors.white),
          ),
        );
      }
      return SizedBox(
        height: 80,
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: ListView.builder(
            itemCount: categoryController.featuredCategories.length,
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            physics: ClampingScrollPhysics(),
            itemBuilder: (_, index) {
              final category = categoryController.featuredCategories[index];
              return GestureTile(
                title: category.name,
                textColor: Colors.white,
                imageColor: Colors.black,
                image: category.image,
                backgroundColor: Colors.white,
                onTap: () => Get.to(() => SubCategoryScreen()),
              );
            },
          ),
        ),
      );
    });
  }
}
