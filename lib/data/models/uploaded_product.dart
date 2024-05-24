import 'package:lines/data/models/product.dart';

class UploadedProduct {
  final bool uploaded;

  final Product product;

  UploadedProduct({
    required this.uploaded,
    required this.product,
  });

  factory UploadedProduct.fromJson(Map<String, dynamic> json) {
    return UploadedProduct(
      uploaded: json['uploaded'],
      product: Product.fromJson(json['product']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'uploaded': uploaded,
      'product': product.toJson(),
    };
  }

  @override
  String toString() {
    return 'UploadedProduct{uploaded: $uploaded, product: $product}';
  }
}
