import 'package:lines/data/models/mission.dart';
import 'package:lines/data/models/product.dart';

class CurrentMissionsForProduct {
  final List<Mission> mission;
  final Product product;
  final String code;

  CurrentMissionsForProduct({
    required this.mission,
    required this.product,
    required this.code,
  });

  factory CurrentMissionsForProduct.fromJson(Map<String, dynamic> json) {
    return CurrentMissionsForProduct(
      mission: List<Mission>.from(
        json['missions'].map((x) => Mission.fromJson(x)),
      ),
      product: Product.fromJson(json['product']),
      code: json['code'],
    );
  }

  @override
  String toString() {
    return 'CurrentMissionsForProduct{currentMissionsForProduct: $mission, product: $product}';
  }
}
