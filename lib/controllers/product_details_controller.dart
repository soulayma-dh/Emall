import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  var selectedSize = 'M'.obs;
  var selectedColor = Colors.black.obs;
  var mainImage = 'assets/images/product2.jpg'.obs;

  var sizes = ['S', 'M', 'L', 'XL'].obs;
  var colors = [Colors.black, Colors.brown, Colors.red].obs;
  var productImages = [
    'assets/images/product2.jpg',
    'assets/images/product3.jpg',
  ].obs;
}
