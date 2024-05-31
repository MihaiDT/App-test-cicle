import 'package:lines/data/models/product.dart';

class UploadedProduct {
  final bool uploaded;

  final Product product;

  final bool prizeOrderCreated;

  UploadedProduct({
    required this.uploaded,
    required this.product,
    required this.prizeOrderCreated,
  });

  factory UploadedProduct.fromJson(Map<String, dynamic> json) {
    return UploadedProduct(
      prizeOrderCreated: json['prize_order_created'] ?? false,
      product: Product.fromJson(json['product']),
      uploaded: json['uploaded'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'uploaded': uploaded,
      'product': product.toJson(),
      'prize_order_created': prizeOrderCreated,
    };
  }

  @override
  String toString() {
    return 'UploadedProduct{uploaded: $uploaded, product: $product, prizeOrderCreated: $prizeOrderCreated}';
  }
}
