import 'package:emall/controllers/product_details_controller.dart';
import 'package:emall/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';


class ProductDetailsPage extends StatelessWidget {
  const ProductDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ProductController controller = Get.put(ProductController());
    final screenHeight = MediaQuery.of(context).size.height;

    return SafeArea(
     
      child: Scaffold(
        
        appBar: AppBar(
          backgroundColor: Colors.white,
         leading: IconButton(onPressed: ()=> Get.back(), icon: Icon(Iconsax.arrow_left_copy)),
         actions: [
          IconButton(icon : Icon(Iconsax.heart), color: Colors.red, onPressed: (){},iconSize: 30,)
         ],
        ),
        body: Column(
          
          children: [
            // Image principale
            Obx(() => Container(
                  height: screenHeight * 0.4,
                  width: double.infinity,
                  margin: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 10,
                        offset: const Offset(0, 5),
                      ),
                    ],
                    image: DecorationImage(
                      image: AssetImage(controller.mainImage.value),
                      fit: BoxFit.cover,
                    ),
                  ),
                )),

            // Miniatures
            Obx(() => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Wrap(
                    spacing: 10,
                    children: controller.productImages.map((img) {
                      return GestureDetector(
                        onTap: () => controller.mainImage.value = img,
                        child: Obx(() => Container(
                              width: 60,
                              height: 60,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: controller.mainImage.value == img
                                      ? primaryColor
                                      : Colors.grey,
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                  image: AssetImage(img),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            )),
                      );
                    }).toList(),
                  ),
                )),

            // Info produit
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
                ),
                child: Obx(() => SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Modern Dress',
                              style: TextStyle(
                                  fontSize: 24, fontWeight: FontWeight.bold)),
                          const SizedBox(height: 10),
                          const Text(
                            'This modern dress is crafted with premium materials and designed to fit your daily style.',
                            style: TextStyle(fontSize: 16, color: Colors.grey),
                          ),
                          const SizedBox(height: 20),

                          const Text('Available Sizes',
                              style: TextStyle(fontWeight: FontWeight.w600)),
                          const SizedBox(height: 8),

                          // Tailles dynamiques
                          Row(
                            children: controller.sizes.map((size) {
                              final isSelected =
                                  controller.selectedSize.value == size;
                              return GestureDetector(
                                onTap: () =>
                                    controller.selectedSize.value = size,
                                child: Container(
                                  margin: const EdgeInsets.only(right: 10),
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16, vertical: 8),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: isSelected
                                            ? primaryColor
                                            : Colors.grey),
                                    color: isSelected
                                        ? primaryColor.withOpacity(0.1)
                                        : Colors.transparent,
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Text(
                                    size,
                                    style: TextStyle(
                                      color: isSelected
                                          ? primaryColor
                                          : Colors.black,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              );
                            }).toList(),
                          ),

                          const SizedBox(height: 20),
                          const Text('Available Colors',
                              style: TextStyle(fontWeight: FontWeight.w600)),
                          const SizedBox(height: 8),

                          // Couleurs dynamiques
                          Row(
                            children: controller.colors.map((color) {
                              final isSelected =
                                  controller.selectedColor.value == color;
                              return GestureDetector(
                                onTap: () =>
                                    controller.selectedColor.value = color,
                                child: Container(
                                  margin: const EdgeInsets.only(right: 10),
                                  width: 30,
                                  height: 30,
                                  decoration: BoxDecoration(
                                    color: color,
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: isSelected
                                          ? primaryColor
                                          : Colors.grey,
                                      width: isSelected ? 2 : 1,
                                    ),
                                  ),
                                ),
                              );
                            }).toList(),
                          ),

                          const SizedBox(height: 30),
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 14),
                                backgroundColor: primaryColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              onPressed: () {
                                // Ajouter au panier
                              },
                              child: const Text(
                                'Add to Cart',
                                style: TextStyle(
                                    fontSize: 18, color: Colors.white),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
