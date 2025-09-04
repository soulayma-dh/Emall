class ProductVariationModel {
  final String id;
  String sku;
  String image;
  String? description;
  double price;
  double? salePrice;
  int stock;
  Map<String, String> attributeValues;

  ProductVariationModel({
    required this.id,
    this.sku = '',
    this.image = '',
    this.description = '',
    this.price = 0.0,
    this.salePrice,
    this.stock = 0,
    required this.attributeValues,
  });

  /// Create Empty func for clean code
  static ProductVariationModel empty() => ProductVariationModel(id: '', attributeValues: {});
 
 ///
 Map<String, dynamic> toJson() {
    return {
      'id': id,
      'sku': sku,
      'image': image,
      'description': description,
      'price': price,
      'salePrice': salePrice,
      'stock': stock,
      'attributeValues': attributeValues,
    };
  }
  /// Map Json oriented document snapshot from Firebase to Model
  factory ProductVariationModel.fromJson(Map<String, dynamic> document) {
    final json = document;
    if (json.isEmpty) return ProductVariationModel.empty();
    return ProductVariationModel(
      id: json['id'] ?? '',
      sku: json['sku'] ?? '',
      image: json['image'] ?? '',
      description: json['description'],
      price: (json['price'] ?? 0).toDouble(),
      salePrice: json['salePrice'] != null ? (json['salePrice']).toDouble() : null,
      stock: json['stock'] ?? 0,
      attributeValues: Map<String, String>.from(json['attributeValues'] ?? {}),
    );
  }



}



