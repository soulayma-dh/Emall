import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emall/features/products/Models/brand.dart';
import 'package:emall/features/products/Models/product_attribute_model.dart';
import 'package:emall/features/products/Models/product_variation_model.dart';

class Product {
  String id;
  int stock;
  String? sku;
  double price;
  String title;
  DateTime? date;
  double? salePrice;
  String thumbnail;
  bool? isFeatured;
  BrandModel? brand;
  String? description;
  String? categoryId;
  List<String>? images;
  String productType;
  List<ProductAttributeModel>? productAttributes;
  List<ProductVariationModel>? productVariations;

  Product({
    required this.id,
    required this.title,
    required this.stock,
    required this.price,
    required this.thumbnail,
    required this.productType,
    this.sku,
    this.brand,
    this.date,
    this.images,
    this.salePrice,
    this.isFeatured,
    this.categoryId,
    this.description,
    this.productAttributes,
    this.productVariations,
  });

  /// Create Empty func for clean code
  static Product empty() => Product(
      id: '', title: '', stock: 0, price: 0, thumbnail: '', productType: '');

  ///
  Map<String, dynamic> toJson() {
    return {
      'SKU': sku,
      'Title': title,
      'Stock': stock,
      'IsFeatured': isFeatured,
      'Price': price,
      'SalePrice': salePrice,
      'Thumbnail': thumbnail,
      'CategoryId': categoryId,
      'Description': description,
      'ProductType': productType,
      'Date': date,
      'Brand': brand?.toJson(),
      'Images': images,
      'ProductAttributes': productAttributes?.map((e) => e.toJson()).toList(),
      'ProductVariations': productVariations?.map((e) => e.toJson()).toList(),
    };
  }

  /// Map Json oriented document snapshot from Firebase to Model
  factory Product.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    return Product(
      id: document.id,
      sku: data['SKU'],
      title: data['Title'] ?? '',
      stock: data['Stock'] ?? 0,
      isFeatured: data['IsFeatured'] ?? false,
      price: double.parse((data['Price'] ?? 0.0).toString()),
      salePrice: double.parse((data['SalePrice'] ?? 0.0).toString()),
      thumbnail: data['Thumbnail'] ?? '',
      categoryId: data['CategoryId'] ?? '',
      description: data['Description'] ?? '',
      productType: data['ProductType'] ?? '',
      brand: BrandModel.fromJson(data['Brand']),
      images: data['Images'] != null ? List<String>.from(data['Images']) : [],
      productAttributes: (data['ProductAttributes'] as List<dynamic>)
          .map((e) => ProductAttributeModel.fromJson(e))
          .toList(),
      productVariations: (data['ProductVariations'] as List<dynamic>)
          .map((e) => ProductVariationModel.fromJson(e))
          .toList(),
    );
  }
}
