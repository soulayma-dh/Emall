import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emall/features/products/Models/product.dart';
import 'package:emall/features/products/service/product_service.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';


enum ProductType { simple, variable }
class ProductRepository extends GetxController {
  static ProductRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  // Upload dummy product data to Firebase Firestore and Storage
  Future<void> uploadDummyData(List<Product> products) async {
    try {
      // Initialize Firebase Storage service
      final storage = Get.put(FirebaseStorageService());

      // Loop through each product
      for (var product in products) {
        // Load thumbnail image data from assets
        final thumbnail = await storage.getImageDataFromAssets(product.thumbnail);

        // Upload thumbnail image and get its URL
        final url = await storage.uploadImageData(
          'Products/Images',
          thumbnail,
          product.thumbnail.toString(),
        );

        // Assign the URL to the product's thumbnail
        product.thumbnail = url;

        // Upload additional product images
        if (product.images != null && product.images!.isNotEmpty) {
          List<String> imagesUrl = [];

          for (var image in product.images!) {
            // Load image data from assets
            final assetImage = await storage.getImageDataFromAssets(image);

            // Upload image and get its URL
            final url = await storage.uploadImageData(
              'Products/Images',
              assetImage,
              image,
            );

            imagesUrl.add(url);
          }

          // Replace local image paths with uploaded URLs
          product.images!.clear();
          product.images!.addAll(imagesUrl);
        }

          //  Upload Variation Images (if product is variable) 
      if ( product.productType == ProductType.variable.toString()) {
        for (final variation in product.productVariations!) {
         

          final assetImage =
              await storage.getImageDataFromAssets(variation.image);

          final url = await storage.uploadImageData(
            'Products/Images',
            assetImage,
            variation.image,
          );

          // Replace asset path with the Storage URL in the variation.
          variation.image = url;
        }
      }

      // Persist Product in Firestore ----
      await _db.collection('Products').doc(product.id).set(product.toJson());
     
    }
  } on FirebaseException catch (e) {
    
    throw e.message!;
  } on Exception catch (e) {
    // Any other error (e.g., I/O, platform, network)
    final msg = 'Unexpected error while uploading dummy data: $e';
    if (kDebugMode) print(' $msg');
    throw msg;
  }
}

}